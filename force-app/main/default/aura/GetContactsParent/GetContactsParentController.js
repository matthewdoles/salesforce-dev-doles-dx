({
    fetchContacts : function (component, event, helper) {
        var childCmp = component.find("child");
        childCmp.getContacts(function (result) {
            console.log("Callback for aura:method was executed");
            console.log("result: " + result);
            component.set("v.ContactList", result);
        });
    }
})