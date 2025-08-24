public class ConditionalIfElse 
{
    public static void ScoreCard()
    {
        Integer Score = 90;
        
        	if (Score>80 && Score<=90)
            {
                System.debug('You are Qualified with A');
            }
      		else if (Score>90 && Score<=100)
            {
                System.debug('You are Qualified with A++');
            }
        	else
            {
                System.debug('You are Not Qualified');
            }
    }
}