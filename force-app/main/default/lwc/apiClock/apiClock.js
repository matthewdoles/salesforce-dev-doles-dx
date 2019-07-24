import { LightningElement, api, track } from 'lwc';

export default class ApiClock extends LightningElement {
    @track timestamp = new Date();
    
    @api
    refresh() {
        this.timestamp = new Date();
    }
}