import { LightningElement, track } from 'lwc';

export default class Hello_conditional_surprise extends LightningElement {
    @track areDetailsVisible = false;
    handleChange(event) {
        this.areDetailsVisible = event.target.checked;
    }
}