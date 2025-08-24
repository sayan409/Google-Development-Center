import { LightningElement, api, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountDatatableHandler.getAccounts';
import { NavigationMixin } from 'lightning/navigation';
const columns = [
    {
        label: 'Account Name', fieldName: 'Name', type: 'url',
        typeAttributes: {
            label: { fieldName: 'id' }
        }
    },
    { label: 'Account Number', fieldName: 'AccountNumber'},
    { label: 'Phone', fieldName: 'Phone' },
    { label: 'Email', fieldName: 'Email__c' },
    { label: 'Status', fieldName: 'Status__c' },

];
export default class AccountDataTable extends NavigationMixin(LightningElement) {
    
    
    accDetails = [];
    columns = columns;
    //@track isLoading = true;

    connectedCallback() {
        getAccounts()
        .then(result=>{
            this.accDetails = result;
            console.log('accDetails-------->', this.accDetails);
            //this.isLoading = false;
        });
        
        
    }

    selectedAccount(event) {
        this.accountId = event.target.getAttribute("data-id");
        console.log('Selected accountId : ',this.accountId);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.accountId,
                objectApiName: 'Account',
                actionName: 'view',
            },
        });
    }

}