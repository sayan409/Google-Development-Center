public class createUpdateAccTriggerController {
    public static void updateAcc(Boolean isInsert, Boolean isUpdate, List<Account> accList){
        
        //List to store the newly created records
        List<Opportunity> newOppList = new List<Opportunity>();
        List<Task> newTaskList = new List<Task>();
        
        if(isInsert == true){
            //Create Opp on Account Creation
            for(Account newAcc: accList){
                Opportunity opp = new Opportunity();
                opp.Name = newAcc.LastName + ' Opportunity';
                opp.StageName = 'Prospect';
                opp.CloseDate = Date.today();
                opp.AccountId = newAcc.Id;
                newOppList.add(opp);
                System.debug('newOppList---->'+newOppList);
            }
            if(!newOppList.isEmpty()){
                insert newOppList;
                System.debug('newOppList---->'+newOppList);
            }
            
            //Create Task on Account Creation
            
            for(Account newAcc: accList){
                Task task = new Task();
                task.Subject = newAcc.LastName + ' Task';
                task.Description = 'Prospect';
                task.ActivityDate = Date.today();
                task.Priority = 'High';
                task.WhatId = newAcc.Id;
                newTaskList.add(task);
                System.debug('newTaskList---->'+newTaskList);
            }
            if(!newTaskList.isEmpty()){
                insert newTaskList;
                System.debug('newTaskList---->'+newTaskList);
            }
        }
        
        if(isUpdate == true){
            // Update Opportunity Name
            List<Opportunity> oppToUpdate = [SELECT Id, Name, AccountId, Account.LastName FROM Opportunity WHERE AccountId = :accList LIMIT 1];
            for (Opportunity opp : oppToUpdate) {
                opp.Name = opp.Account.LastName + ' Opportunity';
            }
            update oppToUpdate;
            
            // Update Task Subject
            List<Task> taskToUpdate = [SELECT Id, Subject, WhatId, What.LastName FROM Task WHERE WhatId = :accList LIMIT 1];
            for (Task task : taskToUpdate) {
                task.Subject = task.What.LastName + ' Task';
            }
            update taskToUpdate;
        } 
    }
}