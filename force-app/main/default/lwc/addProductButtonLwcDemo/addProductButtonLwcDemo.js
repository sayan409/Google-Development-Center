import { LightningElement, track } from 'lwc';
import createPurchaseRequisition from '@salesforce/apex/PurchaseRequisitionController.createPurchaseRequisition';
import searchAccounts from '@salesforce/apex/PurchaseRequisitionController.searchAccounts';




export default class DynamicForm extends LightningElement {
    @track rows = [
        { id: 1, product: '', quantity: '', unitPrice: '', priority: '', productSuggestions: [] }
    ];
    rowIdCounter = 2;

    priorityOptions = [
        { label: '❗ Low', value: 'Low' },
        { label: '🙂 Medium', value: 'Medium' },
        { label: '👌 High', value: 'High' }
    ];

    handleInputChange(event) {
        console.log('handleInputChange Fired');
        const { id, field } = event.target.dataset;
        const value = event.target.value;
        this.rows = this.rows.map(row => {
            if (row.id === parseInt(id, 10)) {
                return { ...row, [field]: value };
            }
            return row;
        });

        console.log(`Row ID: ${id}, Field: ${field}, Value: ${value}`);
    }

    handleProductChange(event) {
        console.log('handleProductChange Fired');
        this.handleInputChange(event);
        const { id } = event.target.dataset;
        const row = this.rows.find(row => row.id === parseInt(id, 10));
        row.productSuggestions = [];
    }

    handleProductSearch(event) {
        console.log('handleProductSearch Fired');
        const { id } = event.target.dataset;
        const searchKey = event.target.value;

        if (searchKey.length >= 1) {
            searchAccounts({ searchKey })
                .then(result => {
                    this.rows = this.rows.map(row => {
                        if (row.id === parseInt(id, 10)) {
                            return { ...row, productSuggestions: result };
                        }
                        return row;
                    });
                })
                .catch(error => {
                    console.error('Error fetching account suggestions:', error);
                });
        } else {
            this.rows = this.rows.map(row => {
                if (row.id === parseInt(id, 10)) {
                    return { ...row, productSuggestions: [] };
                }
                return row;
            });
        }

        console.log(`handle Product Current rows: ${JSON.stringify(this.rows)}`);
    }

    selectProduct(event) {
         console.log('selectProduct Fired');
        const { id, value } = event.target.dataset;
        this.rows = this.rows.map(row => {
            if (row.id === parseInt(id, 10)) {
                return { ...row, product: value, productSuggestions: [] };
            }
            return row;
        });
        console.log(`select Product Current rows: ${JSON.stringify(this.rows)}`);
    }

    addRow() {
        this.rows = [
            ...this.rows,
            { id: this.rowIdCounter++, product: '', quantity: '', unitPrice: '', priority: '', priorityReason: '', productSuggestions: [] }
        ];
        console.log(`New row added. Current rows: ${JSON.stringify(this.rows)}`);
    }

    handleSubmit() {
        console.log('handleSubmit Fired');
        const formData = {
            rows: this.rows.map(row => {
                const { productSuggestions, ...rest } = row;
                return rest;
            })
        };
        console.log('Form Data:', JSON.stringify(formData));

        // Serialize the formData to a JSON string
        const serializedFormData = JSON.stringify(formData);

        // Call Apex method to create Purchase Requisition
        createPurchaseRequisition({ requisitionData: serializedFormData })
            .then(result => {
                console.log('Purchase Requisition created successfully:', result);
                // Handle success (e.g., show a success message, clear the form, etc.)
            })
            .catch(error => {
                console.error('Error creating Purchase Requisition:', error);
                // Handle error (e.g., show an error message)
            });
    }
}