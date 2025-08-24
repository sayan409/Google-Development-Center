public class YouTubeApiCallout {

    // Replace 'YOUR_API_KEY' with your actual API key
    private static final String API_KEY = 'AIzaSyCgh-eIQ7KLUBL1B58Jrly1InUp0yyBWtM';
    private static final String channelId = 'UCWjBC-CbI6V7lKvU4nfBnEA';
    @AuraEnabled(cacheable=true)
    public static String getPlaylists() {
        String endpoint = 'https://www.googleapis.com/youtube/v3/playlists?key=' + API_KEY + '&channelId=' + channelId;

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            System.debug('Response Body: ' + response.getBody());
System.debug('Status Code: ' + response.getStatusCode());

            return response.getBody();
        } else {
            // Handle error response
            return 'Error: ' + response.getStatusCode() + ' - ' + response.getStatus();
        }
    }
    @AuraEnabled(cacheable=true)
    public static String getActivities() {
        String endpoint = 'https://www.googleapis.com/youtube/v3/activities?key=' + API_KEY;

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            system.debug('response---->'+response);
            return response.getBody();
        } else {
            // Handle error response
            system.debug('errorCode---->'+response.getStatusCode());
            return 'Error: ' + response.getStatusCode() + ' - ' + response.getStatus();
        }
    }
}