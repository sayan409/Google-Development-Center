public class AccountDatatableHandler {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        List<Account> accounts = [SELECT Id, Name, Email__c, Phone, Status__c, AccountNumber FROM Account];
        return accounts;
    }
}