({
    doInit: function (component, event, helper) {
        helper.getAccountList(component);
    },
    deleteAccount: function (component, event, helper) {
        event.preventDefault();
        var accountName = event.target.getElementsByClassName('account-name')[0].value;
        confirm('Delete the ' + accountName + ' account? (Testing purposes only, will not delete!)');
    }
})