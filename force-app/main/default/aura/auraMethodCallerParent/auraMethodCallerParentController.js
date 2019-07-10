({
    callAuraMethod : function (component, event, helper) {
        var childCmp = component.find("child");
        var param = {'name' : 'Mohith'};
        var auraMethodResult = childCmp.sampleMethod("1", param);
        console.log("auraMethodResult: " + auraMethodResult);
    }
})