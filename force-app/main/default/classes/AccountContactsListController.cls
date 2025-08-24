public with sharing class AccountContactsListController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getAccountContactsByAccountId(Id accountId) {
        return [SELECT Id, Name FROM Contact WHERE AccountId = :accountId];
    }
}