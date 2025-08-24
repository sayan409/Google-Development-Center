public class SMSApiCallout {
    @AuraEnabled
    public static String sendSMS(String un, String pwd, String dstno, String msg, Integer type, String agreedterm, String sendid) {
        
        String endpoint = 'http://www.isms.com.my/isms_send.php';
        String urlParameters = '*un=' + EncodingUtil.urlEncode(un, 'UTF-8') + '&*pwd=' + EncodingUtil.urlEncode(pwd, 'UTF-8') +
            '&dstno=' + EncodingUtil.urlEncode(dstno, 'UTF-8') + '&*msg=' + EncodingUtil.urlEncode(msg, 'UTF-8') +
            '&type=' + type + '&*agreedterm=' + EncodingUtil.urlEncode(agreedterm, 'UTF-8') +
            '&*sendid=' + EncodingUtil.urlEncode(sendid, 'UTF-8');
        
        endpoint += '?' + urlParameters;
        System.debug('endpoint--------->'+endpoint);
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        // Set request parameters
        String requestBody = '*un=' + un + '&*pwd=' + pwd + '&dstno=' + dstno + '&*msg=' + msg +
            '&type=' + type + '&*agreedterm=' + agreedterm + '&*sendid=' + sendid;
        request.setBody(requestBody);
        
        try {
            // Send the request
            Http http = new Http();
            HttpResponse response = http.send(request);
            
            // Process the response
            if (response.getStatusCode() == 200) {
                System.debug('response--------->'+response.getBody());
                // Successful response, return the response body
                return response.getBody();
            } else {
                // Handle specific error codes
                Integer errorCode = response.getStatusCode();
                System.debug('errorCode--------->'+errorCode);
                return handleError(errorCode);
                
            }
        } catch (Exception e) {
            System.debug('Exception--------->'+e);
            // Handle unknown errors
            return handleError(-1000);
        }
    }
    
    private static String handleError(Integer errorCode) {
        // Map error codes to descriptions
        Map<Integer, String> errorMap = new Map<Integer, String>{
            -1000 => 'UNKNOWN ERROR',
                -1001 => 'AUTHENTICATION FAILED',
                -1002 => 'ACCOUNT SUSPENDED / EXPIRED',
                -1003 => 'IP NOT ALLOWED',
                -1004 => 'INSUFFICIENT CREDITS',
                -1005 => 'INVALID SMS TYPE',
                -1006 => 'INVALID BODY LENGTH (1-900)',
                -1007 => 'INVALID HEX BODY',
                -1008 => 'MISSING PARAMETER',
                -1009 => 'INVALID DESTINATION NUMBER',
                -1012 => 'INVALID MESSAGE TYPE',
                -1013 => 'INVALID TERM AND AGREEMENT'
                };
                    
                    // Return the corresponding error description
                    if (errorMap.containsKey(errorCode)) {
                        return errorMap.get(errorCode);
                    } else {
                        return 'UNKNOWN ERROR';
                    }
    }
}