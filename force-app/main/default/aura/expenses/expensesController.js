({

    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getExpenses");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.expenses", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    clickCreate : function(component, event, helper) {
        var validExpense = component.find('expenseform').reduce(function(validSoFar, inputCmp) {
            inputCmp.shopHelpMesageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if (validExpense) {
            var newExpense = component.get("v.newExpense");
            console.log("Create expense: " + JSON.strigify(newExpense));
            helper.createExpense(component, newExpense);
        }
	}
})