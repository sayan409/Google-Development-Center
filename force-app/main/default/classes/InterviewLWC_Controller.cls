public class InterviewLWC_Controller {
	@AuraEnabled(cacheable=true)
	Public static List<Account>  getAccountData(String accId){
		return [SELECT Id, Name FROM Account WHERE Id = :accId];
		
	}
}