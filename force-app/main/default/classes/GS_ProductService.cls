public with sharing class GS_ProductService {
    public class ProductDTO {
        @AuraEnabled public Id productId;
        @AuraEnabled public String name;
        @AuraEnabled public String code;
        @AuraEnabled public String family;
        @AuraEnabled public String description;
        @AuraEnabled public Decimal unitPrice;
        @AuraEnabled public String currencyIsoCode;
        @AuraEnabled public Id pricebookEntryId;
        @AuraEnabled public String imageUrl;
    }

    private static final String GOOGLE_SHOP_PB_NAME = 'Google Shop Price Book';

    @AuraEnabled(cacheable=true)
    public static Id ensureActiveGoogleShopPricebook() {
        Pricebook2 pb = [SELECT Id, IsActive FROM Pricebook2 WHERE Name = :GOOGLE_SHOP_PB_NAME LIMIT 1];
        if (pb != null) {
            if (!pb.IsActive) {
                pb.IsActive = true;
                update pb;
            }
            return pb.Id;
        }
        // Create if not exists
        Pricebook2 newPb = new Pricebook2(Name = GOOGLE_SHOP_PB_NAME, IsActive = true, Description = 'Price Book for Google Shop site');
        insert newPb;
        return newPb.Id;
    }

    @AuraEnabled(cacheable=true)
    public static List<ProductDTO> getAvailableProducts() {
        Id pbId = ensureActiveGoogleShopPricebook();
        // Query active PBE tied to active Product2
        List<PricebookEntry> entries = [
            SELECT Id, UnitPrice, Product2Id,
                   Product2.Name, Product2.ProductCode, Product2.Family, Product2.Description,
                   Product2.IsActive
            FROM PricebookEntry
            WHERE Pricebook2Id = :pbId AND IsActive = true AND Product2.IsActive = true
            ORDER BY Product2.Name ASC
            LIMIT 500
        ];
        List<ProductDTO> outList = new List<ProductDTO>();
        for (PricebookEntry pbe : entries) {
            ProductDTO d = new ProductDTO();
            d.productId = pbe.Product2Id;
            d.name = pbe.Product2.Name;
            d.code = pbe.Product2.ProductCode;
            d.family = pbe.Product2.Family;
            d.description = pbe.Product2.Description;
            d.unitPrice = pbe.UnitPrice;
            d.currencyIsoCode = 'USD'; // Default currency
            d.pricebookEntryId = pbe.Id;
            d.imageUrl = ''; // No image URL field available
            outList.add(d);
        }
        return outList;
    }
}
