import { LightningElement, track } from 'lwc';
import sendSMS from '@salesforce/apex/SMSApiCallout.sendSMS';

export default class SmsApiCallout extends LightningElement {
    @track un = 'isms';
    @track pwd = 'isms123';
    @track dstno = '6012xxxxxxxx';
    @track msg = 'Hi Vivek, This is a test Message';
    @track type = 1;
    @track agreedterm = 'YES';
    @track sendid = 61000;
    @track responseMessage;
    @track errorMessage;

    handleInputChange(event) {
        const { name, value } = event.target;
        this[name] = value;
        console.log('this[name] : ',this[name]);
    }

    handleSendSMS() {
        sendSMS({
            un: this.un,
            pwd: this.pwd,
            dstno: this.dstno,
            msg: this.msg,
            type: this.type,
            agreedterm: this.agreedterm,
            sendid: this.sendid
        })
        .then(result => {
            this.responseMessage = result;
            console.log('responseMessage : ',this.responseMessage);
            this.errorMessage = null;
        })
        .catch(error => {
            this.responseMessage = null;
            console.log('responseMessage : null',);
            this.errorMessage = error.body.message || 'Unknown error';
        });
    }
}