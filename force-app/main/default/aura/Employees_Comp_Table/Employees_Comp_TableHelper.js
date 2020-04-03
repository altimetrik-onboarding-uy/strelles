({
	doInit : function(component,event) {
	var action = component.get("c.fetchCompensation");
        action.setCallback(this, function(response){
      	var state = response.getState();
        if (state === "SUCCESS"){
            component.set("v.allCompensations", response.getReturnValue());
        }else if (state === "ERROR"){
            var errors = response.getError();
            if(errors){
                if(errors[0]){
                    console.log("Error message: " + errors[0].message);
                }
            }else{
                console.log("Unknown error");
            	}
        	}
        });
        $A.enqueueAction(action);
	},
    
     onChange: function (component,event) {
    	var action = component.get("c.fetchCompensationType");
        action.setParams({sRecordType: component.find('select').get('v.value')});
    	action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS" ) {
            component.set("v.allCompensations", response.getReturnValue());
        }else if (state === "ERROR"){
            var errors = response.getError();
            if(errors){
                if(errors[0]){
                    console.log("Error message: " + errors[0].message);
                }
            }else{
                console.log("Unknown error");
            	}
        	}
    	});
         $A.enqueueAction(action);
	},
    
    editEmp : function(component, event) {
		var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({"recordId": event.getSource().get("v.value")});
        editRecordEvent.fire();
    }
   
})