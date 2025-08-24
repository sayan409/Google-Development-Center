public class caseTriggerHandler 
{
	public static Map<String, String> findTheContactNumber(List<Id> conIds)
    {
        Map<String, String> contactIdContactNumberMap = new Map<String, String>();
        List<Contact> conList = new List<Contact>();
        conList = [Select Id, phone, name From Contact where Id IN: conIds];
        for(Contact con: conList)
        {
            contactIdContactNumberMap.put(con.name, con.phone);
        }
        return contactIdContactNumberMap;
    }
    
    public static void updateContactInfoInCase(Boolean isBefore, Boolean isInsert, Boolean isUpdate, List<Case> newCases)
    {
       	List<Id> conIds = new List<Id>();
        Map<String, String> contactNameWithNewContactNumberMap = new Map<String, String>();
        if(isBefore == true)
        {
            if(isInsert == true || isUpdate == true)
            {
                for(Case c: newCases)
                {
                    conIds.add(c.ContactId);
                }
                contactNameWithNewContactNumberMap = findTheContactNumber(conIds);
                system.debug('--contactNameWithNewContactNumberMap='+contactNameWithNewContactNumberMap);
                for(Case c: newCases)
                {
                    c.Contact_info__c = contactNameWithNewContactNumberMap.get(c.ContactId);
                }
                
            }
        }
    }
}