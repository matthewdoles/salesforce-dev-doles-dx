/**
 * Created by Matthew on 6/8/2019.
 */

import {LightningElement, track} from 'lwc';

export default class HelloWebComponent extends LightningElement {
    @track greeting = 'Trailblazer';
    handleGreetingChange(event) {
        this.greeting = event.target.value;
    }
    currentDate = new Date().toDateString();
    get capitalizedGreeting() {
        return `Hello ${this.greeting.toUpperCase()}!`;
    }
}