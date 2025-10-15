import { LightningElement, track, wire } from 'lwc';
import getAvailableProducts from '@salesforce/apex/GS_ProductService.getAvailableProducts';

export default class GsProducts extends LightningElement {
    @track loading = true;
    @track error;
    @track products = [];
    qtyByPbe = {};

    @wire(getAvailableProducts)
    wiredProducts({ data, error }) {
        if (data) {
            // Map in a computed displayPrice string to avoid CallExpression in template
            this.products = data.map(p => ({
                ...p,
                displayPrice: this.formatCurrency(p.unitPrice, p.currencyIsoCode)
            }));
            this.error = undefined;
        } else if (error) {
            this.error = this.normalizeError(error);
            this.products = [];
        }
        this.loading = false;
    }

    normalizeError(error) {
        if (!error) return 'Unknown error';
        if (Array.isArray(error.body)) {
            return error.body.map(e => e.message).join(', ');
        } else if (error.body && typeof error.body.message === 'string') {
            return error.body.message;
        }
        return typeof error === 'string' ? error : JSON.stringify(error);
    }

    formatCurrency(amount, currencyIsoCode) {
        try {
            return new Intl.NumberFormat(undefined, { style: 'currency', currency: currencyIsoCode || 'USD' }).format(amount || 0);
        } catch (e) {
            return `${currencyIsoCode || ''} ${amount || 0}`;
        }
    }

    handleQtyChange(event) {
        const pbeId = event.target.dataset.pbe;
        const val = parseInt(event.target.value, 10);
        this.qtyByPbe[pbeId] = isNaN(val) || val <= 0 ? 1 : val;
    }

    handleAddToCart(event) {
        const pbeId = event.target.dataset.pbe;
        const product = this.products.find(p => p.pricebookEntryId === pbeId);
        const qty = this.qtyByPbe[pbeId] || 1;

        const detail = {
            pricebookEntryId: product?.pricebookEntryId,
            product2Id: product?.productId,
            name: product?.name,
            unitPrice: product?.unitPrice,
            quantity: qty,
            currencyIsoCode: product?.currencyIsoCode
        };
        this.dispatchEvent(new CustomEvent('addtocart', { detail, bubbles: true, composed: true }));
    }
}
