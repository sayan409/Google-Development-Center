import { LightningElement, track, wire, api } from 'lwc';
import getApexData from '@salesforce/apex/InterviewLWC_Controller.getAccountData';
const columnsList = [
    
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' }
    

];


export default class InterviwLwc extends LightningElement {

    columnsList = columnsList;
    @api recordId;
    @track AccData = [];
    @track error;



    @wire(getApexData, { accId: '$recordId' })
    wiredData({ error, data }) {

        console.log('recordId : ',this.recordId);
      if (data) {
        console.log('Data', data);
        this.AccData = data;
      } else if (error) {
         console.error('Error:', error);
         this.error = error;
      }
    }
    
    


}