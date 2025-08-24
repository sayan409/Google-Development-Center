import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Controller from '@salesforce/apex/MarsPhotosController.getMarsPhotos'; //Apex Class



const Columns = [
    {
        label: 'Id', fieldName: 'id',
        typeAttributes: {
            label: { fieldName: 'Id' }
        }
    },
    { label: 'Camera Name', fieldName: 'camera.full_name' },
    { label: 'Earth Date', fieldName: 'earth_date' },
    { label: 'Rover Name', fieldName: 'rover.name' },
    { label: 'Rover Landing Date', fieldName: 'rover.landing_date' },
    { label: 'Rover Launch Date', fieldName: 'rover.launch_date' },
    { label: 'Rover Status', fieldName: 'rover.status' },
    {
        label: 'Image URL', fieldName: 'img_src', type: 'url',
        typeAttributes: {
            label: {
                fieldName: 'img_src'
            }
        }
    },

];


export default class MarsRoverPhotosViewer extends LightningElement {
    @api solRec = '';
    @api camRec = '';

    @track isLoading = true;
    @track isTableData = false;

    Column = Columns;
    data;
    initialRecords;
    error;



    get cameraOptions() {
        return [
            { label: 'Front Hazard Avoidance Camera', value: 'FHAZ' },
            { label: 'Rear Hazard Avoidance Camera', value: 'RHAZ' },
            { label: 'Mast Camera', value: 'MAST' },
            { label: 'Chemistry and Camera Complex', value: 'CHEMCAM' },
            { label: 'Mars Hand Lens Imager', value: 'MAHLI' },
            { label: 'Mars Descent Imager', value: 'MARDI' },
            { label: 'Navigation Camera', value: 'NAVCAM' },
            { label: 'Panoramic Camera', value: 'PANCAM' },
            { label: 'Miniature Thermal Emission Spectrometer (Mini-TES)', value: 'MINITES' },
        ];
    }

    handleCamChanges(event) {
        this.camRec = event.target.value;
        console.log('Selected Camera------>' + this.camRec);
    }
    handleSolChanges(event) {
        this.solRec = event.target.value;
        console.log('Selected SOL------>' + this.solRec);
    }
    handleInput() {
        Controller({
            a_sol: this.solRec,
            a_camera: this.camRec
        }).then(result => {
            this.isTableData =true;
            console.log('result------------>' + JSON.stringify(result));
            this.data = result.photos;
            this.initialRecords = result.photos;
            console.log('Response Data------------>' + this.data);
            console.log('initialRecords------------>' + this.initialRecords);
            const toastmessage = new ShowToastEvent({
                title: 'Here we go...!',
                message: 'Yahoooo!! One step closer to the Mars, Rover Data Retrieved.......☻',
                variant: 'success'
            });
            
            
            this.dispatchEvent(toastmessage);
            this.isLoading = false;
        }).catch(error => {
            this.error = error.message;
            console.log('Catch Error : ',this.error);
        });

    }


    handleSearch(event) {
        const searchKey = event.target.value.toLowerCase();
 
        if (searchKey) {
            this.data = this.initialRecords;
 
            if (this.data) {
                let searchRecords = [];
 
                for (let record of this.data) {
                    let valuesArray = Object.values(record);
 
                    for (let val of valuesArray) {
                        console.log('val is ' + val);
                        let strVal = String(val);
 
                        if (strVal) {
 
                            if (strVal.toLowerCase().includes(searchKey)) {
                                searchRecords.push(record);
                                break;
                            }
                        }
                    }
                }
 
                console.log('Matched Accounts are ' + JSON.stringify(searchRecords));
                this.data = searchRecords;
            }
        } else {
            this.data = this.initialRecords;
        }
    }



    selectedImageURL(event) {
        const url = event.currentTarget.dataset.url;
        window.open(url, '_blank');
    }
}