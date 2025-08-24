public class arrayInApex 
{
	public static void stringArraylist()
    {
        String [] arrayOfLanguages = new List<String>();

		//Adding elements in Array
		
		arrayOfLanguages.add('Java');
		arrayOfLanguages.add('C#');
		arrayOfLanguages.add('Apex');
		arrayOfLanguages.add('Javascript');
		arrayOfLanguages.add('Python');
		arrayOfLanguages.add('dotNet');

		for (Integer i = 0; i<arrayOfLanguages.size(); i++) 
        	{
  			//Print all the elements in Array
   			system.debug('Values In Array: '+arrayOfLanguages[i]);
        	
			}
        //To Show Indivisual Index From An Array
        System.debug('Value at Index 3 is :'+arrayOfLanguages[3]);
    }
   public static void integerArraylist()
    {
        Integer [] integerArraylist = new List<Integer>();
        
        integerArraylist.add(5);
        integerArraylist.add(7);
        integerArraylist.add(9);
        integerArraylist.add(11);
        integerArraylist.add(2);
        integerArraylist.add(6);
        
        for (Integer i = 0; i<integerArraylist.size(); i++)
       	 {
            System.debug('Values In Array: '+integerArraylist[i]);
         }
      System.debug('Value at Index 5 is :'+integerArraylist[5]);
    } 
}