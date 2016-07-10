({
    doInit: function(component, event, helper) {
        if ($A.lockerService) {
            component.set("v.isEnabled", $A.lockerService.isEnabled());
        } else {
            component.set("v.isEnabled", true);
        }
    }
})