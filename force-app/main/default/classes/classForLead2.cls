public class classForLead2 
{
    public static void updatingDescription()
    {
        
        List<Lead> leadlist = New List<Lead>();
        leadlist = [Select Id,Status,Description from Lead];
        System.debug('leadlist='+leadlist);
        
        for(Lead s:leadlist)
        	{
            if (s.Status == 'Open - Not Contacted')
                
                s.Description = 'Please Contact';
                
            System.debug('Changed Leads:'+[SELECT ID,Name,Status FROM Lead WHERE Status = 'Open - Not Contacted']);
       		}
		Update leadlist;
        System.debug('Description Updated To "Please Contact" For All "Open - Not Contacted" Leads');
	}  
}