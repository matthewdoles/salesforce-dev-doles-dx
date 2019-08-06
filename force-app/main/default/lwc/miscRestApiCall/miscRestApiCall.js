import { LightningElement, track } from 'lwc';
const QUERY_URL =
    'https://www.googleapis.com/books/v1/volumes?langRestrict=en&q=';

export default class MiscRestApiCall extends LightningElement {
    @track searchKey = 'Harry Potter';
    @track books;
    @track error;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
    }

    handleSearchClick() {
        fetch(QUERY_URL + this.searchKey)
            .then(response => {
                if (!response.ok) {
                    this.error = response;
                }
                return response.json();
            })
            .then(jsonResponse => {
                this.books = jsonResponse;
            })
            .catch(error => {
                this.error = error;
                this.books = undefined;
            });
    }
}