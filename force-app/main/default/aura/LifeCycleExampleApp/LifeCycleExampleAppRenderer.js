({
    render : function (component, event, helper) {
        var ret = this.superRender();
        console.log('Inside render Function');
        console.log('Step2');
        console.log('DOM ELEMENT IN render...' + component.find("example").getElement());
        console.log(ret);
        return ret;
    },
    rerender : function (component, event, helper) {
        this.superRerender();
        console.log('Inside render Function');
        console.log('Step2');
    },
    afterRender : function (component, event, helper) {
        console.log('Inside afterRender Function');
        console.log('Step3');
        console.log('COMPONENT IN afterRender...' + component.find("example"));
        console.log('DOM ELEMENT IN afterRender...' + component.find("example").getElement());
    },
    unrender : function (component, event, helper) {
        this.superUnrender();
    }
})