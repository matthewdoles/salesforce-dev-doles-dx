({
    onChange : function(component, event, helper) {
        console.log(component.get("v.DateTimeInput"));
        var dateInput = component.get("v.DateTimeInput");
        var selectedFormat = component.find("select").get("v.value");
        var output = $A.localizationService.formatDate(dateInput, selectedFormat);
        component.set("v.output", output);
    }
})