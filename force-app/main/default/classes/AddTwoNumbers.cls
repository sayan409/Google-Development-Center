public class AddTwoNumbers
{
   public static void addTwoNumbers()
    {
      Integer firstNumber, secNumber, Sum;
        firstNumber= 25;
        secNumber= 5;
        Sum= firstNumber + secNumber;
        System.debug('------' + Sum);  
    }
     public static void howToUseStringVariable()
     {
         String allCourse, firstCourse, secCourse;
         firstCourse = 'Java';
         secCourse = 'Apex';
         allCourse = firstCourse + secCourse;
         System.debug('----FirstCourse=' +firstCourse);
         System.debug('----SecCourse=' +secCourse);
         System.debug('----AllCourse=' +allCourse);
      
     }
    public static void fetchAccID()
      	{
          List<Account> lst= new List<Account>();
          lst=[SELECT ID FROM Account];
          System.debug('Account ID='+lst);
        } 
}