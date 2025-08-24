public class OpportunityEmailController {
    public static void sendEmail(List<Id> opportunityIds) {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        for (Id opportunityId : opportunityIds) {
            Opportunity opp = [SELECT Id, Name, AccountId FROM Opportunity WHERE Id = :opportunityId];

            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{'customer@example.com'});
            email.setSubject('Subject');
            email.setHtmlBody('Body');
            email.setTargetObjectId(opp.AccountId); // Assuming Contact__c is a lookup to Contact on Opportunity
            emailList.add(email);
        }

        Messaging.sendEmail(emailList);
    }
}