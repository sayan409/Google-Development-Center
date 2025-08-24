trigger LeadTrigger on Lead (before insert, before update, after insert, after update) 
{
	LeadTriggerHandler.checkLeadData(Trigger.isBefore, Trigger.isInsert,  Trigger.New);
}