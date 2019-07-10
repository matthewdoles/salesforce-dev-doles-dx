({
    doInit : function (component, event, helper) {
        var vfOrigin = "https://" + component.get("v.vfHost");
        window.addEventListener("message", function (ev) {
            if (ev.origin !== vfOrigin) {
                console.log(ev.origin);
                return ;
            }
            console.log(ev.data);
        }, false);
    }
})