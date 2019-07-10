({
    onSearch : function (component, event, helper) {
        var projectId = event.getParam("projectId");
        component.set("v.recordId", projectId);
        component.find("projectRecord").reloadRecord();
    }
})