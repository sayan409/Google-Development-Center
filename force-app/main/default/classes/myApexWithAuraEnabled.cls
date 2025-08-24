public class myApexWithAuraEnabled {
    @AuraEnabled(cacheable=true)
    public Integer getMethod1(){
        integer A = 2;
        integer B = 2;
        integer Sum = A+B;
        system.debug('Sum of Integers: '+Sum);
        return Sum;
    }
    public Integer getMethod2(){
        Integer C = 2;
        return C;
    }
    
}