public class fetchIDfromAccount 
{
	 public static void howToUseList()
      	{
         List<Account> lst= new List<Account>();
          lst=[SELECT ID FROM Account];
          System.debug('Account ID='+lst);
        }          
}