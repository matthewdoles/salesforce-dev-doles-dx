({
	packItem : function(component, event, helper) {
		component.set("v.packed__c", true);
        event.getSource().set('v.disabled', true);

	}
})