public class getLeadData {
@AuraEnabled()
public static List<Lead> getLead(){
List<Lead> leadList = [SELECT Id, Name, MobilePhone, Email, Status FROM Lead];
return leadList;
}
}