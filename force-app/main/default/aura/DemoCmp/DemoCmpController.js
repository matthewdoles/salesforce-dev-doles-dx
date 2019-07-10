({
    handleClick : function(component, event, helper) {
        console.log("component.getElement() : " , component.find("div1").getElement());
        var div = component.find("div1").getElement();
        for(var i=0; i<div.childNodes.length; i++) {
            console.log(div.childNodes[i].outerHTML);
            console.log(div.childNodes[i].className);
        }
    }
})