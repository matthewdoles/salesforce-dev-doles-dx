import { LightningElement, wire, track } from 'lwc';
import {ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord} from 'lightning/uiRecordApi';
import getAccoutList from '@salesforce/apex/AccountController.getAccountList';
import { reduceErrors } from 'c/lds_utils';

export default class Lds_delete_record extends LightningElement {
    @track accounts;
    @track error;

    // wire apex result so ir can be refreshed programmatically
    wiredAccountResult;

    @wire(getAccoutList)
    wiredAccounts(result) {
        this.wiredAccountResult = result;
        if (result.data) {
            this.accounts = result.data;
            this.error = undefined;
        } 
        else if (result.error) {
            this.error = result.error;
            this.accounts = undefined;
        }
    }
    deleteAccount(event) {
        const recordId = event.target.dataset.recordid;
        deleteRecord(recordId)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account deleted',
                        variant: 'success'
                    })
                );
                return refreshApex(this.wiredAccountResult);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting record',
                        message: reduceErrors(error).join(', '),
                        variant: 'error'
                    })
                );
            });
    }
}