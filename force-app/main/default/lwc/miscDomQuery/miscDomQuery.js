import { LightningElement, track } from 'lwc';

export default class MiscDomQuery extends LightningElement {
    @track selection;

    handleCheckboxChange() {
        const checked = Array.from(
            this.template.querySelectorAll('lightning-input')
        )
        .filter(element => element.checked)
        .map(element => element.label);
        
        this.selection = checked.join(', ')
    }
}