public class DMLOperations 
{
	public static void insertMethod()
    {
        Account acc = new Account();
        acc.Name = 'DML Insert Operation';
        acc.AccountNumber = '9866';
        acc.Active__c = 'True';
        Insert acc;
        System.debug('Account Inserted');
        System.debug('Account Id: '+acc.Id);
       /*
        
        Account acc1 = new Account();
        acc1.Name = 'DML Insert Operation 1';
        acc1.AccountNumber = '9866';
        acc1.Active__c = 'True';
        Insert acc1;
        System.debug('Account Inserted');
        
        Account acc2 = new Account();
        acc2.Name = 'DML Insert Operation 2';
        acc2.AccountNumber = '9866';
        acc2.Active__c = 'True';
        Insert acc2;
        System.debug('Account Inserted');
    }
    
    //To make code Shorter
   
    public static void insertMethod2()
    {
        List<Account> AccountsToBeCreated = new List<Account>();
        Account acc = new Account();
        acc.Name = 'DML Insert Operation 4';
        acc.AccountNumber = '9866';
        acc.Active__c = 'True';
        AccountsToBeCreated.add(acc);
        
        Account acc1 = new Account();
        acc1.Name = 'DML Insert Operation 5';
        acc1.AccountNumber = '9866';
        acc1.Active__c = 'True';
        AccountsToBeCreated.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'DML Insert Operation 6';
        acc2.AccountNumber = '9866';
        acc2.Active__c = 'True';
        AccountsToBeCreated.add(acc2);
       
        
        if(!AccountsToBeCreated.isEmpty())
        {
            Insert AccountsToBeCreated;
        } */
        
    }
}