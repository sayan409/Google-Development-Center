// LeadCreationController.cls
public with sharing class LeadCreationControllerAura {
    @AuraEnabled
    public static string createLead(String firstName, String lastName, String company, String phone, String email) {
        Lead newLead = new Lead();
        newLead.RecordTypeId = '0125j000000hE4wAAE';
        newLead.FirstName = firstName;
        newLead.LastName = lastName;
        newLead.Full_Name__c = firstName + ' ' +lastName;
        newLead.Company = company;
        newLead.Phone = phone;
        newLead.Email = email;
        insert newLead;
        return newLead.id;
    }
    
}