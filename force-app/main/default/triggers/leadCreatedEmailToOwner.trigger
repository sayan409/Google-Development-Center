trigger leadCreatedEmailToOwner on Lead (After insert) 
{
	LeadCreatedEmailToTheOwner.NewLeadEmailNotification(Trigger.isAfter, Trigger.isInsert, Trigger.New);
}