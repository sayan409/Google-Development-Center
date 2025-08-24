public class DMLOperations1 
{
	public static void insertMethod1()
    {	
        List<RecordType> recordTypeList = new List<RecordType>();
        recordTypeList =  [SELECT Id, SobjectType FROM RecordType WHERE SobjectType ='Account' LIMIT 1 OFFSET 1];
        system.debug('recordTypeList: '+recordTypeList);
        
        Account acc = new Account();
        acc.LastName = 'DML Insert Operation';
        acc.AccountNumber = '9866';
        acc.Active__c = 'True';
        acc.RecordTypeId = recordTypeList[0].Id;
        undelete acc;
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