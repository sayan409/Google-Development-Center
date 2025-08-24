import { LightningElement, wire, api, track  } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class CreateAccount extends LightningElement {
    
handleSubmit(event) {
    event.preventDefault();
    const fields = event.detail.fields;
    fields.LastName = fields.Full_Name__c;
    console.log( 'Fields are -->'+ JSON.stringify( fields ) );
    this.template.querySelector('lightning-record-edit-form').submit(fields);
}
successHandler(event) {
    const evt = new ShowToastEvent({
        title: 'Success',
        message: 'Record Id: ' + event.detail.id,
        variant: 'success',
    });
    console.log('Record Id: '+ event.detail.id );
    this.dispatchEvent(evt);
}
handleCancel(event){
    var url = window.location.href; 
    var value = url.substr(0,url.lastIndexOf('/') + 1);
    window.history.back();
    return false;
}
handleError(event){
    const evt = new ShowToastEvent({
        title: 'Error!',
        message: event.detail.detail,
        variant: 'error',
        mode:'dismissable'
    });
    this.dispatchEvent(evt);
}
}