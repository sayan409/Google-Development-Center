public class whatIsVoid 
{
	public static Integer letsTestVoidMethod(Integer firstNumber, Integer secNumber)
    {
        Integer sum = firstNumber + secNumber;
        return sum;
    }
    public static void useReturnValues()
    {
        Integer useTheValue = letsTestVoidMethod(2, 3);
        system.debug('--useTheValue--'+useTheValue);
    }
}