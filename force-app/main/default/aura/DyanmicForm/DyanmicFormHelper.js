({
    doInit : function (component, event, helper) {
        var dynamicFormInput = [
            ["Lightning:input", {
                "label" : "Text Field",
                "name" : "TextField",
                "aura:id" : "dynamicFormId"
            }],
            ["Lightning:input", {
                "type" : "search",
                "label" : "search",
                "name" : "search",
                "aura:id" : "dynamicFormId"
            }],
            ["Lightning:input", {
                "type" : "checkbox",
                "label" : "Red",
                "name" : "red",
                "aura:id" : "dynamicFormId"
            }]
        ];
        $A.createComponents(dynamicFormInput, function (components, status, errorMessage) {
            if (status === "SUCCESS") {
                var formBody = component.get("v.dynamicForm");
                components.forEach(function (element) {
                    formBody.push(element);
                    console.log(element);
                });
                component.set("v.dynamicForm", formBody);
            }
            else if (status === "INCOMPLETE") {
                console.log("Error in creating components")
            }
            else if (status === "ERROR") {
                console.log("Error: " + errorMessage);
            }
        });
    }
})