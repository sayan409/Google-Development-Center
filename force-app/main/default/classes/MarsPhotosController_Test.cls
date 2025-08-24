@isTest
private class MarsPhotosController_Test {
    
    @isTest
    static void testGetMarsPhotos() {
        // Positive test case with valid inputs
        Test.startTest();
        MarsPhotosController.getPhotosWrap result = MarsPhotosController.getMarsPhotos(100, 'FHAZ');
        Test.stopTest();
        System.assert(result.photos.size() > 0);
        
        // Negative test case with invalid inputs
        Test.startTest();
        MarsPhotosController.getPhotosWrap result2 = MarsPhotosController.getMarsPhotos(-100, 'INVALID_CAMERA');
        Test.stopTest();
        System.assert(result2.photos.size() == 0);
    }
}