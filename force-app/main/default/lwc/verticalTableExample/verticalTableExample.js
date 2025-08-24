import { LightningElement, track } from 'lwc';

    export default class CustomTable extends LightningElement {
        @track data = [
            { id: 1, column1: 'Value 1A', column2: 'Value 1B' },
            { id: 2, column1: 'Value 2A', column2: 'Value 2B' },
            // Add more data as needed
        ];
    }