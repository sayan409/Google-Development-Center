public class CollectionApexClasses 
{
    public static void howToUseList()
    {
        List<String> lst = new List<String>();
        lst.clear();
        lst.add('Java');
        lst.add('Apex');
        lst.add('C#');
        lst.add('Python');
        lst.add('Java');
        System.debug('lst='+lst);
        
        List<Integer> Integerlst = new List<Integer>();
        Integerlst.add(5);
        Integerlst.add(7);
        Integerlst.add(4);
        Integerlst.add(1);
        Integerlst.add(9);
        Integerlst.add(12);
        System.debug('Integerlst='+Integerlst);
        
        List<Integer> addingAllValues = new List<Integer>();
        addingAllValues.addAll(Integerlst);
        System.debug('addingAllValues=' +  addingAllValues);
    }
    public static void howToUseSet()
    {
        Set<String> stringSet = new Set<String>();
        stringSet.clear();
        stringSet.add('Java');
        stringSet.add('C#');
        stringSet.add('Apex');
        stringSet.add('Python');
        stringSet.add('Ruby');
        System.debug('stringSet='+stringSet);
        
        Set<Integer> IntegerSet = new Set<Integer>();
        IntegerSet.add(5);
        IntegerSet.add(5);
        IntegerSet.add(4);
        IntegerSet.add(1);
        IntegerSet.add(2);
        IntegerSet.add(2);
        System.debug('IntegerSet='+IntegerSet);
    }    
    public static void howToUseMap()
    {
        Map<Integer, String> myFirstMap = new Map<Integer, String>();
        myFirstMap.put(1, 'Java');
        myFirstMap.put(3, 'Apex');
        myFirstMap.put(2, 'C#');
        myFirstMap.put(5, 'C#');
        System.debug('myFirstMap=' + myFirstMap);
    }
}