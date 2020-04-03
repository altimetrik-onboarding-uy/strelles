public class customCompensationTableController {
        @AuraEnabled
    public static Compensation__c[] fetchCompensation(){
        Compensation__c[] compReturn = new Compensation__c[]{};
        compReturn =  [SELECT Contact__r.Id, Contact__r.Name, Contact__r.Birthdate, Job_Category__c, RecordType.Name, Amount__c, Location__c, 
                       Office__c, Submitted__c, Status__c FROM Compensation__c];
        return compReturn ;
    }

    @AuraEnabled
    public static Compensation__c[] fetchCompensationType(String sRecordType){
      System.debug('The value is: ' + sRecordType);

       // Return all compensation when no search term
        sRecordType = sRecordType.trim();
        if (sRecordType == '') {
           return fetchCompensation();
        }
        // Prepare query paramters
        sRecordType = '%'+ sRecordType +'%';
        // Execute search query
        return [SELECT Contact__r.Id, Contact__r.Name, Contact__r.Birthdate, Job_Category__c, RecordType.Name, Amount__c, 
                Location__c, Office__c, Submitted__c, Status__c FROM Compensation__c WHERE RecordType.Name LIKE :sRecordType];
    }
 }