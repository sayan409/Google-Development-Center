import { LightningElement, track } from 'lwc';



export default class MyFirstLwc extends LightningElement {

@track isLoading = false;

@track name = null;
@track Name ='Sayan';
@track Name1 = 'Sanku';
handleChange() {
    this.isLoading = true;
    if (this.name === this.Name) {
        this.name = this.Name1;
        this.isLoading = false;
    } else {
        this.name = this.Name;
        this.isLoading = false;
    }
    console.log('OUTPUT : ', this.name);
}



}