trigger caseTrigger on Case (before insert, before update) 
{
	caseTriggerHandler.updateContactInfoInCase(Trigger.isBefore, Trigger.isInsert, Trigger.isUpdate, Trigger.new);
}