trigger OpportunityBasedOnAccountTrigger on Account (After Insert) 
{
    createOpportunityBasedOnAccount.accountOpportunity(Trigger.isAfter, Trigger.isInsert,  Trigger.New);
}