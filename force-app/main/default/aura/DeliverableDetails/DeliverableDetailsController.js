({
    onDeliverableSelected : function (component, event, helper) {
        console.log("Hi");
        var deliverableId = event.getParam("deliverableId");
        component.set("v.deliverableId", deliverableId);
        component.find("deliverableRecord").reloadRecord();
        console.log(deliverableId);
    }
})