public class testApexInt {
    public static List<Contact> getCons(String accId){
        List<Contact> conList = new List<Contact>();
        conList = [Select Id, FirstName, LastName, Email, CreatedDate From Contact  WHERE AccountId =: accId ORDER BY CreatedDate DESC LIMIT 10];
        return conList;
    }
}