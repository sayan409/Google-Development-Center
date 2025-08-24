@IsTest
private class AccountDatatableHandlerTest {

    @IsTest
    static void testGetAccounts() {
        // Create test data
        Account testAccount = new Account(Name='Test Account', Email__c='test@example.com', Phone='123-456-7890', Status__c='Won', AccountNumber='1234567890');
        insert testAccount;

        // Call the getAccounts() method
        List<Account> accounts = AccountDatatableHandler.getAccounts();

        // Verify that the returned list contains the test account
        System.assertEquals(1, accounts.size());
        System.assertEquals(testAccount.Id, accounts[0].Id);
        System.assertEquals(testAccount.Name, accounts[0].Name);
        System.assertEquals(testAccount.Email__c, accounts[0].Email__c);
        System.assertEquals(testAccount.Phone, accounts[0].Phone);
        System.assertEquals(testAccount.Status__c, accounts[0].Status__c);
        System.assertEquals(testAccount.AccountNumber, accounts[0].AccountNumber);
    }
}