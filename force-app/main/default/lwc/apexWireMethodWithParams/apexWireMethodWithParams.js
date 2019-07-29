import { LightningElement, track, wire } from 'lwc';
import findContacts from '@salesforce/apex/ContactController.findContacts';

const DELAY = 300;

export default class ApexWireMethodWithParams extends LightningElement {
    @track searchKey = '';

    @wire(findContacts, { searchKey: '$searchKey' })
    contacts;

    handleKeyChange(event) {
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }
}