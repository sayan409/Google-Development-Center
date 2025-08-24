trigger AccountTrigger on Account (After insert) 
{
    CreateContactBasedOnAccCreation.accContact(Trigger.isAfter, Trigger.isInsert,  Trigger.New);
}