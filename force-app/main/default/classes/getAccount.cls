public class getAccount {
    public Static void getAccountMethod(){
        List<Account> accList = new List<Account>();
        accList = [Select Id, Name, Phone, Status__c From Account Where Name = 'Get Cloudy'];
        
        System.debug('Account Name:---------> '+accList);
        
        List<Account> iteratedAccounts = new List<Account>();
        String ErrMsg= 'Oops!! Sorry dont find any accounts';
        For(Account accFor: accList){
            
            If(accFor.Phone =='775-555-5309' && accfor.Status__c =='Los')
            {
                iteratedAccounts.add(accFor);
            }          
            else if(accFor.Phone =='775-555-5309' && accfor.Status__c =='Wo')
            {
                iteratedAccounts.add(accFor);
            }
            else{
                System.debug('Error Msg'+ErrMsg);
            }
            System.debug('iteratedAccounts-->'+iteratedAccounts);
        }
    }
}