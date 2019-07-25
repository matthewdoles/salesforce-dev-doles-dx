import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';

export default class PubsubSearchBar extends LightningElement {
    @wire(CurrentPageReference) pageref;
    
    handleKeyChange(event) {
        fireEvent(this.pageref, 'searchKeyChange', event.target.value);
    }
}