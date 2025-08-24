import { LightningElement, wire } from 'lwc';
import getJobList from '@salesforce/apex/JobController.getJobList';
const column = [
  {
        label: 'Job Title', fieldName: 'Title__c',
        typeAttributes: {
            label: { fieldName: 'Id' }
        }
    },
    { label: 'Job Description', fieldName: 'Description__c' },
    { label: 'Job Location', fieldName: 'Location__c' },
    { label: 'Job Salary', fieldName: 'Salary__c' },
    { label: 'Job Company', fieldName: 'Company__c' },
];
export default class RecruitmentApp extends LightningElement {
  jobList;
  column = column;


/* Method 1 */
  @wire(getJobList)
  wiredJobList({ error, data }) {
    if (data) {
      this.jobList = data;
    } else if (error) {
      console.error(error);
    }
  }
 handleRowAction(event) {
 
         const orderNumber = event.detail.action.orderNumber;
         const row = event.detail.row;
         switch (orderNumber) {
             case 'view':
                 this[NavigationMixin.Navigate]({
                     type: 'standard__recordPage',
                     attributes: {
                         recordId: row.Id,
                         actionName: 'view'
                     }
                 });
                 break;
             case 'edit':
                 this[NavigationMixin.Navigate]({
                     type: 'standard__recordPage',
                     attributes: {
                         recordId: row.Id,
                         actionName: 'edit'
                     }
                 });
                 break;
             default:
         }
     }

/* Method 2 */
/* connectedCallback() {
  getJobList()
  .then(data=>{
    this.jobList=data;
    console.log('data------>'+JSON.stringify(data))
  }).catch(error=>{
    alert('error');
    console.log('error : ',error);
  })
} */

}