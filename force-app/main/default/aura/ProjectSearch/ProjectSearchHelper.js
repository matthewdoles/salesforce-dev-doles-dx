({
    loadProjects: function(component){

        var action = component.get("c.getProjects");
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.projects", response.getReturnValue());
                console.log(response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    loadDeliverables : function (component, event, helper) {
        var action = component.get("c.getDeliverables");
        console.log(component.get("v.selectedProjectId"));
        action.setParams({projectId : component.get("v.selectedProjectId")});
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.deliverables", response.getReturnValue());
                console.log(response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    }

})