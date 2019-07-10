({
    onDeliverableSelected : function (component, event, helper) {
        console.log(component.get('v.ganttItem').Id);
        var deliverableSelected = $A.get("e.c:DeliverableSelected");
        var deliverableId = component.get('v.ganttItem').Id;
        console.log(deliverableId);
        deliverableSelected.setParams({
            "deliverableId": deliverableId

        });
        deliverableSelected.fire();
    }
})