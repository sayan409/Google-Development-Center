public class UsingSwitchCase 
{
	public static void scoreCard()
    {
        Integer scoreCard=70;
        
        switch on scoreCard
        {
            when 90
            {
                system.debug('You Are Qualified');
            }
            when 70
            {
                system.debug('You Are Qualified But work Harder');
            }
            when else 
            {
                system.debug('You Are Not Qualified');
            }
        }
    }
}