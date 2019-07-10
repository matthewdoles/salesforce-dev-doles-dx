({
    onInit : function (component, event, helper) {
        helper.loadProjects(component);
    },
    handleProjectSelect : function (component, event, helper) {
        if (component.find("projectSelect").get("v.value") !== "") {
            component.set("v.selectedProjectId", component.find("projectSelect").get("v.value"));
        }
        else {
            component.set("v.selectedProjectId", null);
        }
        console.log(component.get("v.selectedProjectId"));
        component.find("projectRecord").reloadRecord();
        helper.loadDeliverables(component);
        console.log(component.get("v.deliverables"));
    },
    onSearch : function (component, event, helper) {

        var submitFormData = $A.get("e.c:ProjectSearchSubmit");
        var projectId = component.get("v.selectedProjectId");

        submitFormData.setParams({
            "projectId": projectId,
        });
        submitFormData.fire();
    }

})