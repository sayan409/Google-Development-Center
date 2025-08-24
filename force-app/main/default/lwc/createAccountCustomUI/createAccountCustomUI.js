import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class CreateAccountCustomUI extends NavigationMixin(LightningElement) {
    @track isModalOpen = true;
    @track isLoading = true;


    submitHandler(event) {
        event.preventDefault();
        const fields = event.detail.fields;
        console.log( 'Fields are -->'+ JSON.stringify( fields ));
        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }
    successHandler(event) {
        const toast = new ShowToastEvent({
            title: 'Account Created Successfully!',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        console.log('Record Id: '+ event.detail.id );
        this.isLoading = false;
        this.isModalOpen = false;
        this.dispatchEvent(toast);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
              recordId: event.detail.id,
              objectApiName: 'Account',
              actionName: 'view',
            },
          });
    }

    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
        window.history.back();
    }

}