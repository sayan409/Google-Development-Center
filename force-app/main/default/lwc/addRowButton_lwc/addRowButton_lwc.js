import { LightningElement, track } from 'lwc';

export default class AddRowComponent extends LightningElement {
    @track rows = [];
    rowId = 0;

    addRow() {
        this.rowId++;
        this.rows = [
            ...this.rows,
            {
                id: this.rowId,
                field1: '',
                field2: ''
            }
        ];
    }

    handleFieldChange(event) {
        const rowId = event.target.dataset.id;
        const fieldName = event.target.dataset.field;
        const fieldValue = event.target.value;

        // Find the row to update
        const rowIndex = this.rows.findIndex(row => row.id === parseInt(rowId, 10));
        if (rowIndex !== -1) {
            this.rows[rowIndex] = {
                ...this.rows[rowIndex],
                [fieldName]: fieldValue
            };
            this.rows = [...this.rows]; // Trigger reactivity
        }
    }
}