({
    editEmp : function(component, event) {
		var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({"recordId": event.getSource().get("v.value")});
        editRecordEvent.fire();
    },
    
    submitByEvent : function(component, event){
        var compEvents = component.getEvent("compensationEvent");
        var compensation = component.get("v.compensation");
   	 	var addingSelected = component.find("checkbox").get("v.value");
     	compEvents.setParams({"compensation": compensation,  "flag":addingSelected});		
		compEvents.fire();
	}
})