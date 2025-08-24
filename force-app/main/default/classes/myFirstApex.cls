public class myFirstApex{
    public static void sumOfNumbers(){
        Integer firstNumber, secondNumber, sum;
        firstNumber = 25;
        secondNumber = 5;
        sum = firstNumber + secondNumber;
        System.debug('Sum of the numbers: '+sum);           
    }
    public static void howToUseConditions(){
        string Str1;
        integer int1, int2, sum;
        Str1 = 'Addition';
        
        int1 = 25;
        int2 = 5;
        
        if(Str1 == 'Addition'){
            sum = int1 + int2;
            System.debug('Sum of the numbers: '+sum);
            Str1 = 'Substraction';
            
            if(Str1 == 'Substraction'){
                sum = int1 - int2;
                System.debug('Substraction of the numbers: '+sum);
            }
        }
        else{
            System.debug('Str1 is not having the needed value');
        }  
    }
    
    public static void howtoPassParameters(Integer firstNumber, Integer secondNumber){
        Integer sum;
        sum = firstNumber + secondNumber;
        System.debug('Sum of the numbers From Parameter: '+sum); 
    }
    
    
    //Check Duplicate Lead 
    
  
    
    public Static List<String> dupChecka(String Name, String Phone, String Email, String Status, String DateOfBirth){
        List<Lead> leadList = new List<Lead>();
        leadList = [SELECT Id, Name, Phone, Email, Status, Date_of_Birth__c FROM Lead WHERE Phone =: Phone AND Email =: Email LIMIT 2];
        Set<String> set1 = new Set<String>{'Paris', 'Paris'};
            System.debug('set1' +set1);
        
        
        list<String> SuccessMessage;
        list<String> ErrorMessage;
        List<String> ExceptionMessage;
        
        try{
            if(leadList.isEmpty()){        //leadList.isEmpty() --> leadList == null
                Lead lead = new Lead();
                lead.LastName = Name;
                lead.Phone = Phone;
                lead.Email = Email;
                lead.Date_of_Birth__c = Date.ValueOf(DateOfBirth);
                lead.Status = Status;
                
                insert lead;
                SuccessMessage.Add('Record Successfully Created: '+ lead.Id); // listName.add()
                return SuccessMessage; 
            }
            else{
                for(Lead duplead: leadList){
                    ErrorMessage.Add(duplead.Name);
                }
                return ErrorMessage;
            }
        }
        catch(exception e){
            ExceptionMessage.add(e.getMessage());
            System.debug('An Exception Occured'+e);
            return ExceptionMessage;
        }
        
    }
    
}