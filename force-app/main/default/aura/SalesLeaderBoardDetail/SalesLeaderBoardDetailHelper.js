({
    toggleClass : function (component, componentId, className) {
        var modal = component.find(componentId);
        $A.util.removeClass(modal, className + 'hide');
        $A.util.addClass(modal, className+ 'open')
    },
    toggleClassInverse : function (component, componentId, className) {
        var modal = component.find(componentId);
        $A.util.addClass(modal, className + 'hide');
        $A.util.removeClass(modal, className+ 'open')
    },
    getOpportunityList : function (component, event) {
        var action = component.get("c.getlistOpportunities");
        var self = this;
        var ownerId = event.getParam("userId");
        console.log(ownerId);
        action.setParams({
            "OwnerId" : ownerId
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            console.log('STATE' + response.getState());
            if (state === "SUCCESS" && component.isValid()) {
                component.set("v.lstopss"). response.getReturnValue();
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors){
                } else {
                }
            }
        });
        $A.enqueueAction(action);
    }
})