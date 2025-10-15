import { LightningElement, track } from 'lwc';

export default class GsContactUs extends LightningElement {
    @track name = '';
    @track email = '';
    @track message = '';
    @track sent = false;

    handleChange(event) {
        const fld = event.target.dataset.field;
        this[fld] = event.target.value;
    }

    handleSend() {
        // In a real app, send to an Apex handler or Case creation.
        this.sent = true;
        // Clear after confirmation
        setTimeout(() => {
            this.name = '';
            this.email = '';
            this.message = '';
            this.sent = false;
        }, 3000);
    }
}
