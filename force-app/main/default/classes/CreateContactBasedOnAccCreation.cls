public class CreateContactBasedOnAccCreation 
{
	public static void accContact(Boolean isAfter, Boolean isInsert, List<Account> newAcc)
    {
        if(isAfter == True && isInsert == True) // we can also add Trigger. without passing the parameters
        {
        List<Contact> conList = new List<Contact>();
        for(Account acc : newAcc) 							// Obtaining the list of Account records from trigger.new.
        	{
            Contact con = new Contact(); 						// Creating a contact instance.  
            con.LastName = acc.Name + ' Contact'; 				// Creating contact record for each account
            con.AccountId = acc.ID; 							// Mapping contact torespective Account.
            con.Phone = acc.Phone; 
            conList.add(con); 
        	
                System.debug('conList='+conList);
        	}

             if(!conList.isempty()) // Checking if the list has records.
             { 
            	Insert conList;	
             }
         }
      }
}