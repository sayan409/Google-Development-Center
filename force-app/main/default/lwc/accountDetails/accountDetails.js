import { LightningElement, api } from 'lwc';

export default class AccountDetails extends LightningElement {

    @api recordId;
    
    handleClick(event){
        eval("$A.get('e.force:refreshView').fire();");
    }
}