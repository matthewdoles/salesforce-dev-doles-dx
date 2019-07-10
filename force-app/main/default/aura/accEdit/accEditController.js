({
    handleSaveRecord : function (component, event, helper) {
        component.find("accountRecord").saveRecord($A.getCallback(function (SaveResult) {
            if (SaveResult.state === "SUCCESS" || SaveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (SaveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (SaveResult.state === "ERROR") {
                var errMsg = "";
                // saveResult.error is an array of errors,
                // so collect all errors into one message
                for (var i = 0; i < SaveResult.error.length; i++) {
                    errMsg += SaveResult.error[i].message + "\n";
                }
                cmp.set("v.recordSaveError", errMsg);
            } else {
                console.log('Unknown problem, state: ' + SaveResult.state + ', error: ' + JSON.stringify(SaveResult.error));
            }

        }));
    }
})