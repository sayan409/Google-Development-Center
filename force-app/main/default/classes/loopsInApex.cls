public class loopsInApex 
{
	public static void doWhileLoop()
    {
        Integer count = 1;

        do 
        {
            System.debug(count);
            count++;
        } 
        	while (count < 11);
    }
    public static void whileLoop()
    {
        Integer count = 1;

			while (count < 11) 
            {
    		System.debug(count);
    		count++;
			}
    }
    public static void TraditionalforLoop()
    {
        for (Integer i = 0; i < 10; i++) 
        {
    	System.debug(i+1);
		}
    }
    public static void listOrSetIterationforLoop()
    {
        Integer[] myInts = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
            
        for (Integer i : myInts) 
        {
            System.debug(i);
        }
     }
    
}