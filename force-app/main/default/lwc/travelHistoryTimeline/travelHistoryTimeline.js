import { LightningElement, track } from 'lwc';
import { RefreshEvent } from "lightning/refresh";

export default class TravelHistory extends LightningElement {
    @track travelHistory = [
        { id: 1, date: 'Tuesday, 7/23/24', location: 'POMPANO BEACH, FL', timestamp: '4:00 PM' },
        { id: 2, date: '', location: 'POMPANO BEACH, FL', timestamp: '7:13 PM' },
        { id: 3, date: '', location: 'POMPANO BEACH, FL', timestamp: '7:38 PM' },
        { id: 4, date: '', location: 'FORT LAUDERDALE, FL', timestamp: '11:33 PM' },
        { id: 5, date: 'Wednesday, 7/24/24', location: 'MEMPHIS, TN', timestamp: '9:23 AM' },
        { id: 6, date: '', location: 'MEMPHIS, TN', timestamp: '3:38 AM' },
        { id: 7, date: 'Thursday, 7/25/24', location: 'ATLANTA, GA', timestamp: '12:12 AM' },
        { id: 8, date: '', location: 'DECATUR, GA', timestamp: '7:58 AM' },
        { id: 9, date: '', location: 'DECATUR, GA', timestamp: '9:17 AM' }
    ];

    @track isloading = false;

    handleRefresh() {
        this.isloading = true;
        console.log('Refresh Clicked');
        setTimeout(() => {
            console.log('Loading Timeout');
            this.dispatchEvent(new RefreshEvent());
            this.isloading = false;
        }, 3000); //delay is in milliseconds 

    }
}