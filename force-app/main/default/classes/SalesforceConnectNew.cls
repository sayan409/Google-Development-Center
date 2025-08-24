public with sharing class SalesforceConnectNew{
    @AuraEnabled(cacheable=true)
	public static void getLeadFromIntegrationOrg()
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:TestExternalAPI/services/apexrest/leads');
        request.setMethod('GET');
       	request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        System.debug('Response --> '+response.getStatusCode());
        if(response.getStatusCode() == 200) 
        {
            /*List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Object result: results)
            {
                Map<String, Object> leadProps=(Map<String, Object>) result;
                System.debug('Lead Name --> '+leadProps.get('Name')+' - Company --> '+leadProps.get('Company'));
            }*/
            System.debug('Response --> '+response.getBody());
        }
    }
}