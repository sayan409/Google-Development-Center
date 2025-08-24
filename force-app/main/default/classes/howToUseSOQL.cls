public class howToUseSOQL 
{
	public static void learnSOQL()
    {
        //To fetch only one data from lead because by taking variable we can only store one data at a time 
        Lead varLead = [SELECT id,name,phone FROM lead ORDER BY Name DESC LIMIT 1];
        system.debug('varLead='+varLead);
    }
    
    public static void learnSOQLquery()
    {
        //trying to fetch multiple values by taking list.        
        List<Account> acc = [SELECT ID,Name,AccountNumber FROM Account];
        system.debug('acc--'+acc);
    }
    
    
    
     public static void LearnforEachLoop()
     {														
         List<Account> acc = [SELECT Name, AccountNumber, (SELECT ID, Name FROM Contacts) FROM Account];
         
        
         //Declearing new Var to store details of each acc and check one by one
        
         For(Account accountVar: acc)
         {
             //Checking Name = 'SOQL Test'
             
             if(accountVar.name == 'SOQL Test')
             {
                 System.debug('We Have Found The Data');
             }
         }
         System.debug('--acc='+acc);
     }
     public static void updateOperation()
     {
        //Declearing new Var to store details of each acc and check one by one
         
         List<Account> acc = [SELECT Name, AccountNumber, (SELECT ID, Name FROM Contacts) FROM Account];
        
         For(Account accountVar: acc)
         {
             //Checking Name = 'SOQL Test'
             
             if(accountVar.name == 'SOQL Test')
             {
                 System.debug('We Have Found The Data');
               
                 //Checking Account Number is Null Or Not 
                 
                 if(accountVar.AccountNumber == Null)
                 {
                     accountVar.AccountNumber = '12345';
                     Update accountVar;
                     // Account No Updated
                 }
             }
         } 
     }
    
    //To Avoid govorner limit we should not put Any Insert, Update And Delete Functions in between a For Loop//
    
    public static void updateOperation2()
    {
        //Declearing new list Var to store details of each acc and check one by one
         
         List<Account> acc = [SELECT Name, AccountNumber, (SELECT ID, Name FROM Contacts) FROM Account];
        
        //Declearing one more variable to Store Data to be Updated
        
        List<Account> recordNeedsToBeUpdated = new List<Account>();
        
         For(Account accountVar: acc)
         {
             //Checking Name = 'SOQL Test'
             
             if(accountVar.name == 'SOQL Test')
             {
                 System.debug('We Have Found The Data');
               
                 //Checking Account Number is Null Or Not 
                 
                 if(accountVar.AccountNumber == Null)
                 {
                     accountVar.AccountNumber = '12345';
                     
                     //To add all the updated data one by one 
                    
                     recordNeedsToBeUpdated.add(accountVar);
                    
                 }
             }
         }
        	Update recordNeedsToBeUpdated;
    }
     public static void deleteOperation()
     {
         List<Account> recordNeedsToBeDeleted = new List<Account>();
         recordNeedsToBeDeleted = [SELECT ID, Name FROM Account WHERE Name = 'SOQL Test' and AccountNumber = '12345'];
         System.debug('recordNeedsToBeDeleted--'+recordNeedsToBeDeleted);
         Delete recordNeedsToBeDeleted;
     }
}