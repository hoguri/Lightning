({
    doInit: function(component, event, helper) {
        var action = component.get("c.getAuraDefinitionBundleList");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.appList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})