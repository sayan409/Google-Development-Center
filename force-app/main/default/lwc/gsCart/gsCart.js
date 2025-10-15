import { LightningElement, track } from 'lwc';
import getGoogleShopPricebookId from '@salesforce/apex/GS_CartService.getGoogleShopPricebookId';
import placeOrder from '@salesforce/apex/GS_CartService.placeOrder';

export default class GsCart extends LightningElement {
    @track items = [];
    @track placing = false;
    @track quoteName = '';
    @track notes = '';
    @track toast = { variant: 'base', message: '' };
    currency = 'USD';

    connectedCallback() {
        // Listen for add-to-cart bubbling from gsProducts
        this.template.addEventListener('addtocart', this.handleAddFromProducts.bind(this));
        // initialize PB for currency display if needed
        getGoogleShopPricebookId().then(() => {
            // No-op; using item.currencyIsoCode for formatting
        }).catch(e => {
            this.showToast('error', this.normalizeError(e));
        });
    }

    get toastClass() {
        return `slds-notify slds-notify_alert slds-theme_${this.toast.variant} slds-m-bottom_medium`;
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
            return new Intl.NumberFormat(undefined, { style: 'currency', currency: currencyIsoCode || this.currency }).format(amount || 0);
        } catch (e) {
            return `${currencyIsoCode || ''} ${amount || 0}`;
        }
    }

    // Event from gsProducts
    handleAddFromProducts(evt) {
        const item = evt.detail;
        const existing = this.items.find(i => i.pricebookEntryId === item.pricebookEntryId);
        if (existing) {
            existing.quantity += item.quantity || 1;
            existing.displaySubtotal = this.formatCurrency(existing.unitPrice * existing.quantity, existing.currencyIsoCode);
            this.items = [...this.items];
        } else {
            const entry = {
                ...item,
                displayPrice: this.formatCurrency(item.unitPrice, item.currencyIsoCode),
                displaySubtotal: this.formatCurrency(item.unitPrice * (item.quantity || 1), item.currencyIsoCode)
            };
            this.items = [...this.items, entry];
        }
        this.showToast('success', 'Item added to cart');
    }

    handleQtyChange(event) {
        const pbeId = event.target.dataset.pbe;
        const qty = parseInt(event.target.value, 10);
        const idx = this.items.findIndex(i => i.pricebookEntryId === pbeId);
        if (idx >= 0) {
            this.items[idx].quantity = isNaN(qty) || qty <= 0 ? 1 : qty;
            this.items[idx].displaySubtotal = this.formatCurrency(this.items[idx].unitPrice * this.items[idx].quantity, this.items[idx].currencyIsoCode);
            this.items = [...this.items];
        }
    }

    handleRemove(event) {
        const pbeId = event.target.dataset.pbe;
        this.items = this.items.filter(i => i.pricebookEntryId !== pbeId);
    }

    handleClear() {
        this.items = [];
    }

    handleQuoteName(e) {
        this.quoteName = e.target.value;
    }

    handleNotes(e) {
        this.notes = e.target.value;
    }

    get total() {
        return this.items.reduce((sum, i) => sum + (i.unitPrice * i.quantity), 0);
    }

    get totalDisplay() {
        const currency = this.items[0]?.currencyIsoCode || this.currency;
        return this.formatCurrency(this.total, currency);
    }

    handlePlaceOrder = async () => {
        if (!this.items.length) {
            this.showToast('error', 'Cart is empty');
            return;
        }
        this.placing = true;
        try {
            const req = {
                items: this.items.map(i => ({
                    pricebookEntryId: i.pricebookEntryId,
                    product2Id: i.product2Id,
                    name: i.name,
                    unitPrice: i.unitPrice,
                    quantity: i.quantity,
                    currencyIsoCode: i.currencyIsoCode
                })),
                cartName: this.quoteName,
                notes: this.notes
            };
            const resp = await placeOrder({ req });
            this.showToast('success', `Order placed. Quote ${resp.quoteNumber || resp.quoteId} created.`);
            // Clear cart after placement
            this.items = [];
            this.quoteName = '';
            this.notes = '';
        } catch (e) {
            this.showToast('error', this.normalizeError(e));
        } finally {
            this.placing = false;
        }
    };

    showToast(variant, message) {
        this.toast = { variant, message };
        // Auto clear toast
        clearTimeout(this._toastTimer);
        this._toastTimer = setTimeout(() => {
            this.toast = { variant: 'base', message: '' };
        }, 3000);
    }
}
