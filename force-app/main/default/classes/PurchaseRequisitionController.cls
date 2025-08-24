public class PurchaseRequisitionController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchKey) {
        return [SELECT Id, Name FROM Account WHERE Name LIKE :('%' + searchKey + '%') LIMIT 5];
    }

    @AuraEnabled
    public static String createPurchaseRequisition(String requisitionData) {
        // Deserialize the input JSON data
        Map<String, Object> deserializedData = (Map<String, Object>)JSON.deserializeUntyped(requisitionData);
        List<Object> rowsList = (List<Object>)deserializedData.get('rows');

        // Create a new Purchase Requisition record
        Purchase_Requisition__c purchaseRequisition = new Purchase_Requisition__c();
        insert purchaseRequisition;

        // Create related records for each row
        for (Object rowObject : rowsList) {
            Map<String, Object> row = (Map<String, Object>)rowObject;

            String product = (String)row.get('product');
            String quantity = (String)row.get('quantity');
            String unitPrice = (String)row.get('unitPrice');
            String priority = (String)row.get('priority');
            String priorityReason = (String)row.get('priorityReason');

            // Check if the product exists as an Account
            Account account;
            try {
                account = [SELECT Id,Name FROM Account WHERE Name = :product LIMIT 1];
            } catch (Exception e) {
                account = null;
            }
            if (account == null) {
                // Create a new Account if not found
                account = new Account(
                    Name = product,
                    RecordTypeId = '0125j000000qKphAAE'
                    );
                insert account;
            }

            // Create a new related record
            Purchase_Requisition__c item = new Purchase_Requisition__c(
                Product__c = account.Name,
                Product_Lookup__c = account.Id,
                Quantity__c = quantity,
                Unit_Price__c = unitPrice,
                Priority__c = priority
            );
            insert item;
        }

        return 'Success';
    }
}