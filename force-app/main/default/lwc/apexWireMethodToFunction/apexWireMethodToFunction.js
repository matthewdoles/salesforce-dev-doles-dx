import { LightningElement, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class ApexWireMethodToFunction extends LightningElement {
    @track contacts;
    @track error;

    @wire(getContactList) 
    wireContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        }
        else if(error) {
            this.contacts = undefined;
            this.error = error;
        }
    }
}