public class createOpportunityBasedOnAccount 
{
	public static void accountOpportunity(Boolean isAfter, Boolean isInsert, List<Account> newAcc)
    {
        if(isAfter == True && isInsert == True)
        {
            List<Opportunity> oppList = new List<Opportunity>();
            for(Account acc : newAcc)
            {
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.AccountId = acc.ID;
                opp.CloseDate = Date.today() + 10;
                opp.StageName = 'Prospecting';
                oppList.add(opp);
                System.debug('oppList='+oppList);
            }
           	if(!oppList.isempty()) // Checking if the list has records.
             { 
            	Insert oppList;	
        	 }
    	}
    }
}