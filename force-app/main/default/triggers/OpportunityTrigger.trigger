trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update, before delete, after delete) 
{
	if(Trigger.isBefore && Trigger.isInsert)
    {
        system.debug('---This Will Fire Only On Before Insert'); 
        system.debug('Trigger.New'+Trigger.New);
        system.debug('Trigger.Old'+Trigger.Old);
        system.debug('Trigger.newMap'+ Trigger.newMap);
        system.debug('Trigger.oldMap'+ Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isInsert)
    {
        system.debug('---This Will Fire Only On After Insert');
        system.debug('Trigger.New'+Trigger.New);
        system.debug('Trigger.Old'+Trigger.Old);
        system.debug('Trigger.newMap'+ Trigger.newMap);
        system.debug('Trigger.oldMap'+ Trigger.oldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        system.debug('---This Will Fire Only On Before Update');
        system.debug('Trigger.New'+Trigger.New);
        system.debug('Trigger.Old'+Trigger.Old);
        system.debug('Trigger.newMap'+ Trigger.newMap);
        system.debug('Trigger.oldMap'+ Trigger.oldMap);
    }
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        system.debug('---This Will Fire Only On After Update');
        system.debug('Trigger.New'+Trigger.New);
        system.debug('Trigger.Old'+Trigger.Old);
        system.debug('Trigger.newMap'+ Trigger.newMap);
        system.debug('Trigger.oldMap'+ Trigger.oldMap);
    }
    if(Trigger.isBefore && Trigger.isDelete)
    {
        system.debug('---This Will Fire Only On Before Delete');
        system.debug('Trigger.New'+Trigger.New);
        system.debug('Trigger.Old'+Trigger.Old);
    }
    if(Trigger.isAfter && Trigger.isDelete)
    {
        system.debug('---This Will Fire Only On After Delete');
        system.debug('Trigger.New'+Trigger.New);
        system.debug('Trigger.Old'+Trigger.Old);
    }
    
}