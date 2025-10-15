public with sharing class GS_CartService {
    public class CartItem {
        @AuraEnabled public Id pricebookEntryId;
        @AuraEnabled public Id product2Id;
        @AuraEnabled public String name;
        @AuraEnabled public Decimal unitPrice;
        @AuraEnabled public Integer quantity;
        @AuraEnabled public String currencyIsoCode;
    }
    public class PlaceOrderRequest {
        @AuraEnabled public List<CartItem> items;
        @AuraEnabled public String cartName; // Optional user-defined cart/quote name
        @AuraEnabled public String notes; // Optional
    }
    public class PlaceOrderResponse {
        @AuraEnabled public Id quoteId;
        @AuraEnabled public String quoteNumber;
        @AuraEnabled public String message;
    }

    @AuraEnabled(cacheable=true)
    public static Id getGoogleShopPricebookId() {
        return GS_ProductService.ensureActiveGoogleShopPricebook();
    }

    @AuraEnabled
    public static PlaceOrderResponse placeOrder(PlaceOrderRequest req) {
        if (req == null || req.items == null || req.items.isEmpty()) {
            throw new AuraHandledException('Cart is empty.');
        }

        // Ensure community user context
        User u = [SELECT Id, ContactId FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        if (u.ContactId == null) {
            throw new AuraHandledException('Logged-in user must have a Contact to place an order.');
        }
        Contact c = [SELECT Id, AccountId FROM Contact WHERE Id = :u.ContactId LIMIT 1];
        if (c.AccountId == null) {
            throw new AuraHandledException('The Contact must be related to an Account.');
        }

        Id pbId = GS_ProductService.ensureActiveGoogleShopPricebook();

        // Validate all PBEs exist in the same PB and gather pricing
        Set<Id> pbeIds = new Set<Id>();
        for (CartItem ci : req.items) {
            pbeIds.add(ci.pricebookEntryId);
        }
        Map<Id, PricebookEntry> pbeById = new Map<Id, PricebookEntry>([
            SELECT Id, Product2Id, UnitPrice, Pricebook2Id, Product2.Name
            FROM PricebookEntry
            WHERE Id IN :pbeIds
        ]);
        for (CartItem ci : req.items) {
            PricebookEntry pbe = pbeById.get(ci.pricebookEntryId);
            if (pbe == null) {
                throw new AuraHandledException('Invalid PricebookEntry: ' + String.valueOf(ci.pricebookEntryId));
            }
            if (pbe.Pricebook2Id != pbId) {
                throw new AuraHandledException('Cart contains items from a different Price Book.');
            }
            if (ci.quantity == null || ci.quantity <= 0) {
                throw new AuraHandledException('Quantity must be greater than zero for ' + pbe.Product2.Name);
            }
        }

        // Create Quote
        Quote q = new Quote();
        q.Name = String.isBlank(req.cartName) ? 'Google Shop Quote' : req.cartName;
        q.ContactId = c.Id;
        q.Pricebook2Id = pbId;
        q.Status = 'Draft';
        q.Description = req.notes;
        insert q;

        // Create QuoteLineItems
        List<QuoteLineItem> qlis = new List<QuoteLineItem>();
        for (CartItem ci : req.items) {
            PricebookEntry pbe = pbeById.get(ci.pricebookEntryId);
            QuoteLineItem qli = new QuoteLineItem();
            qli.QuoteId = q.Id;
            qli.PricebookEntryId = pbe.Id;
            qli.Quantity = ci.quantity;
            qli.UnitPrice = pbe.UnitPrice;
            qli.Discount = 0;
            qlis.add(qli);
        }
        insert qlis;

        PlaceOrderResponse resp = new PlaceOrderResponse();
        resp.quoteId = q.Id;
        resp.quoteNumber = q.QuoteNumber;
        resp.message = 'Quote created successfully.';
        return resp;
    }
}
