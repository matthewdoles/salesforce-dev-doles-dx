({
    doInit : function (component, event, helper) {
        helper.onInit(component, event, helper);
    },

    onSearch : function (component, event, helper) {
        var projectId = event.getParam("projectId");
        component.set("v.recordId", projectId);
        component.find("projectRecord").reloadRecord();

        helper.onInit(component, event, helper);

    }
})