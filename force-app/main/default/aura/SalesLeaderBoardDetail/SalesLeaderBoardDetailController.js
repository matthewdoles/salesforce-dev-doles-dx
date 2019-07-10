({
    shopOppModal : function (component, event, helper) {
        helper.toggleClass(component, 'backdrop', 'slds-backdrop--');
        helper.toggleClass(component, 'modaldialog', 'slds-fade-in-');
        helper.getOpportunityList(component.event);
    },
    hideModal : function (component, event, helper) {
        helper.toggleClassInverse(component, 'backdrop', 'slds-backdrop--');
        helper.toggleClassInverse(component, 'modaldialog', 'slds-fade-in-');
    }
})