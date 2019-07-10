({
   onInit : function (component, event, helper) {
        var action = component.get("c.getDeliverables");
        console.log(component.get("v.recordId"));
        action.setParams({projectId : component.get("v.recordId")});
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                var deliverables = [];
                deliverables = deliverables.concat(response.getReturnValue());
                console.log(deliverables);
                component.set("v.deliverables", deliverables);
                var ganttItems = [];
                for (var i = 0; i <deliverables.length; i++) {
                    var actionGanttItems = component.get("c.getGanttItem");
                    actionGanttItems.setParams({projectId : component.get("v.recordId"), deliverableId : deliverables[i].Id, iteration : i});
                    actionGanttItems.setCallback(this,function(response){
                        var state = response.getState();
                        if (state === "SUCCESS"){
                            var item = response.getReturnValue();
                            ganttItems.push({
                                Id: item[0],
                                Name: item[1],
                                Start_Date__c: item[2],
                                Due_Date__c: item[3],
                                color : item[4],
                                width : item[5],
                                leftMargin: item[6]
                            });
                            console.log(ganttItems);
                            component.set("v.ganttItems", ganttItems);
                        }
                        else {
                            console.log("Failed with state: " + state);
                        }
                    });
                    $A.enqueueAction(actionGanttItems);
                }
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);

       var actionHeaderMonth = component.get("c.getHeaderWidth");
       console.log(component.get("v.recordId"));
       actionHeaderMonth.setParams({projectId : component.get("v.recordId")});
       actionHeaderMonth.setCallback(this,function(response){
           var state = response.getState();
           if (state === "SUCCESS"){
               component.set("v.ganttHeaderWidth", response.getReturnValue());
               console.log(response.getReturnValue());
           }
           else {
               console.log("Failed with state: " + state);
           }
       });
       $A.enqueueAction(actionHeaderMonth);

       var actionMonths = component.get("c.getMonths");
       console.log(component.get("v.recordId"));
       actionMonths.setParams({projectId : component.get("v.recordId")});
       actionMonths.setCallback(this,function(response){
           var state = response.getState();
           if (state === "SUCCESS"){
               component.set("v.ganttHeaderMonths", response.getReturnValue());
               console.log(response.getReturnValue());
           }
           else {
               console.log("Failed with state: " + state);
           }
       });
       $A.enqueueAction(actionMonths);

    }
})