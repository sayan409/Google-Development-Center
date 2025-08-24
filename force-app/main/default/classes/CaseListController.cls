public class CaseListController {

    private Id AccountId;

    public CaseListController() {
    }

    public List<Case> getCases() {
        return [SELECT Id, CaseNumber, Priority, CreatedDate
              FROM Case
              WHERE Status = 'Open'
              AND AccountId = '0015j000013CqNnAAK'];
    }

    public void setAccountId(Id accountId) {
        this.AccountId = accountId;
    }

    public Id getAccountId() {
        return this.AccountId;
    }
}