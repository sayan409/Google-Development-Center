public with sharing class JobController {
  @AuraEnabled(cacheable=true)
  public static List<Job__c> getJobList() {
    return [SELECT Id, Name, Title__c, Description__c, Location__c, Salary__c, Company__c FROM Job__c];
  }
}