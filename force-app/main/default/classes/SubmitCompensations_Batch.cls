global class SubmitCompensations_Batch implements Database.Batchable<sObject>{
 
    global Database.QueryLocator start(Database.BatchableContext BC){
     	String query = 'SELECT Name, Submitted__c, CreatedDate FROM Compensation__c';	
        return Database.getQueryLocator(query);
     }
     
     global void execute(Database.BatchableContext BC, List<Compensation__c> l_comp){
         for(Compensation__c comp : l_comp){
             Integer daysDifference  = (system.today()).daysBetween(Date.valueOf(comp.CreatedDate));
             if(comp.Submitted__c == False && daysDifference > 2){
                 comp.Submitted__c = True;
             }
             update comp;
         }
     }
     
     global void finish(Database.BatchableContext BC){
     }
     
}