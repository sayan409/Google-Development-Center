/* 
 Integration Developed By Ramrezu Mukherjee.
*/
global class MarsPhotosController {
    //Wrapper Class
    public class getPhotosWrap{
        @AuraEnabled
        public List<cls_photos> photos;
    }
    
    //public cls_photos[] photos;
    class cls_photos {
        @AuraEnabled
        public Integer id;	//669
        @AuraEnabled
        public Integer sol;	//100
        @AuraEnabled
        public cls_camera camera;
        @AuraEnabled
        public String img_src;	//http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/00100/opgs/edr/fcam/FRA_406374643EDR_F0050178FHAZ00301M_.JPG
        @AuraEnabled
        public String earth_date;	//2012-11-16
        @AuraEnabled
        public cls_rover rover;
    }
    class cls_camera {
        @AuraEnabled
        public Integer id;	//20
        @AuraEnabled
        public String name;	//FHAZ
        @AuraEnabled
        public Integer rover_id;	//5
        @AuraEnabled
        public String full_name;	//Front Hazard Avoidance Camera
    }
    class cls_rover {
        @AuraEnabled
        public Integer id;	//5
        @AuraEnabled
        public String name;	//Curiosity
        @AuraEnabled
        public String landing_date;	//2012-08-06
        @AuraEnabled
        public String launch_date;	//2011-11-26
        @AuraEnabled
        public String status;	//active
    }
    
    private static String NASA_API_KEY = NasaAiKey__c.getValues('keyValue').Key__c; //Custom Setting
    //private static final String ENDPOINT ='https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key='+NASA_API_KEY'&sol='+a_sol ; //ENDPOINT
    
    @AuraEnabled(cacheable=true)
    public static getPhotosWrap getMarsPhotos(Integer a_sol, String a_camera) {        
        System.debug('a_sol-->' +a_sol);
        system.debug('a_camera---> ' +a_camera);
       // system.debug('a_page---> ' +a_page);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String ENDPOINT = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key='+NASA_API_KEY+'&sol='+a_sol+'&camera='+a_camera;
        String fullUrlEndPoint = ENDPOINT.replace('null', '');
        request.setEndpoint(fullUrlEndPoint);
        System.debug('ENDPOINT------>'+fullUrlEndPoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String resBody = response.getBody();
        System.debug('resBody--->'+resBody);
        //if (response.getStatusCode() == 200) {
            getPhotosWrap photosWrap = (getPhotosWrap) JSON.deserialize(response.getBody(),getPhotosWrap.class); 
            System.debug('photosWrap----->'+photosWrap);
       // }
        return photosWrap;
    }
}