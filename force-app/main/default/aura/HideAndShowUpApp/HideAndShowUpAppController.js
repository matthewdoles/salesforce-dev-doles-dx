({
    handleClick : function (component, event, helper) {
        var spinner = component.find("spinner");
        console.log(spinner);
        $A.util.toggleClass(spinner, "toggle");
    }
})