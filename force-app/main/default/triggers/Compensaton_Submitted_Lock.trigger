trigger Compensaton_Submitted_Lock on Compensation__c (before update, before delete) {

    for(Compensation__c comp : trigger.new){
        if(comp.Status__c == 'SUBMITTED'){
            if(Trigger.isUpdate){
               comp.addError('One Submitted field cannot be updated');  
            }
            if(Trigger.isDelete){
               comp.addError('One Submitted field cannot be deleted');  
            }
         
        }
  
	}
}