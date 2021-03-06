import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import findContacts from '@salesforce/apex/ContactController.findContacts';
import { registerListener, unregisterAllListeners, fireEvent } from 'c/pubsub';

export default class PubsubContactList extends LightningElement {
    searchKey = '';
    @wire(CurrentPageReference) pageRef;
    @wire(findContacts, { searchKey: '$searchKey' })contacts;

    connectedCallback() {
        registerListener('searchKeyChange', this.handleSearchKeyChange, this);
    }
    disconnectedCallback() {
        unregisterAllListeners(this);
    }
    handleSearchKeyChange(searchKey) {
        this.searchKey = searchKey;
    }
    handleContactSelect(event) {
        fireEvent(this.pageRef, 'contactSelected', event.target.contact.Id);
    }
}