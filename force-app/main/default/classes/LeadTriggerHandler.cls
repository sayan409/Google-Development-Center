public class LeadTriggerHandler 
{
	public static void checkLeadData(Boolean isBefore, Boolean isInsert, List<Lead> newLeads)
    {
        system.debug('isBefore-'+isBefore); 
        system.debug('isInsert-'+isInsert);
        system.debug('newLeads-'+newLeads);
    }
}