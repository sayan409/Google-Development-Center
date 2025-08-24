public class LeadCreatedEmailToTheOwner 
{
	public static void NewLeadEmailNotification(Boolean isAfter, Boolean isInsert, List<Lead> newLead)
    {
        if(isAfter == True && isInsert == True)
        {
            List<Lead> ownerDetails = new List<Lead>();
            ownerDetails = [Select Id, owner.email, Name From Lead where Id IN: newLead];
            
            List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
            for(Lead l : ownerDetails)
            {
                
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();			
                List<String> emails = new List<String>();
                emails.add(l.owner.email);
                message.toAddresses = emails;
                message.subject = 'New Lead Has Been Created. The Name Of The Lead is: '+ l.Name;
                message.plainTextBody = 'This is a new lead '+ l.Name;
                messages.add(message);   
            }
            
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            
        }
    }
        
}