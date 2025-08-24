public class classForLead {
    Public static void updatingCompany(){
        
        List<Lead> leadlist = New List<Lead>();
        leadlist = [Select Id,Name,Company from Lead Where Name = 'Test'];
        system.debug('leadlist'+leadlist);
        For(Lead l:leadlist){
            l.Company = 'QWEERTTU';
            
        }
        Update leadlist;
    }

}