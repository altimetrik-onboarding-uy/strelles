public abstract class TestCompensationDataFactory {
	//Compensation creation
    public static List<Compensation__c> createCompensations(Integer numberOfCompensations) {
        List<Compensation__c> compensations = new List<Compensation__c>();
        for (Integer i = 0 ; i < numberOfCompensations ; i++) {
            String location = rLocation();
            Compensation__c comp = new Compensation__c(RecordTypeId = rRecordType(),
        											  	Name = 'Test Comp' + i,
                                                       	Contact__c = '0033h000001shV0AAI',
                                                        Location__c = location,
                                                        Office__c = rOffice(location),
                                                        Job_Category__c = 'Junior',
                                                        Description__c = 'Desc Comp' + i );
            compensations.add(comp);
        }
      return compensations;
            
    }
    
    public static String rRecordType(){
        String recordType = '';
        Integer randomNumber = Integer.valueof((Math.random() * 2));
        switch on randomNumber {
            when 0 {
                recordType = '0123h000000H5sIAAS';
            }
            when 1 {
                recordType = '0123h000000H5smAAC';
            }
            when 2{
                recordType = '0123h000000H5sNAAS';
            }
        }  
 		system.debug('Record Type Generated'+ recordType);
        return recordType;
    }
    
    public static String rLocation(){
        String location = '';
        Integer randomNumber = Integer.valueof((Math.random() * 2));
        switch on randomNumber {
            when 0 {
                location = 'India';
            }
            when 1 {
                location = 'Uruguay';
            }
            when 2{
                location = 'US';
            }
        }
        
        return location;
    }
    
    public static String rOffice(String sLocation){
        String office = '';
        switch on sLocation {
            when 'India' {
                office = 'Chennai';
            }
            when 'Uruguay' {
                office = 'MVD WTC 2';
            }
            when 'US'{
                office = 'Michigan';
            }
        }
        return office;
    }

}