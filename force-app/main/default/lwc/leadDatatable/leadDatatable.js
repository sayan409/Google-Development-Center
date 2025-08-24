import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getLeads from '@salesforce/apex/getLeadData.getLead';

const columns = [
		{ label: 'Id', fieldName: 'Id' },
		{ label: 'Name', fieldName: 'Name', type: 'url',
		 typeAttributes: {
				 label: { fieldName: 'id' }
		 }
		},
		{ label: 'Mobile', fieldName: 'MobilePhone' },
		{ label: 'Email', fieldName: 'Email' },
		{ label: 'Lead Status', fieldName: 'Status' }
];
export default class LeadDatatable extends NavigationMixin(LightningElement) {
		
		columnsList = columns;
		dataList = [];
		@track isLoading = true;

		connectedCallback() {
				getLeads()
						.then(result => {
						this.dataList = result;
						console.log('dataList-------->', this.dataList);
						
						if(this.dataList != null)
						{
								this.isLoading = false;
								console.log('Loading Disabled')
								
						}
						else{
								console.log('No Lead Found');
								alert('No Lead Found');
						}
						

				});
		}
		selectedLead(event) {
				this.leadId = event.target.getAttribute("data-id");
				console.log('leadId: ',this.leadId);
				this[NavigationMixin.Navigate]({
						type: 'standard__recordPage',
						attributes: {
								recordId: this.leadId,
								objectApiName: 'Lead',
								actionName: 'view',
						},
				});
		}
}