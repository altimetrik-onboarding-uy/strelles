@isTest
private class SubmitCompensations_Schedule_Test {
 // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
 public static String schedule = '0 21 10 * * ?';
    
	@testSetup
    static void setup(){
        List<Compensation__c> comp_list = new List<Compensation__c>();
        Compensation__c comp1 = new Compensation__c();
        comp1.RecordTypeId = '0123h000000H5smAAC';
        comp1.Name = 'Test Comp1';
        comp1.Contact__c = '0033h000001shV0AAI';
        comp1.Location__c = 'India';
        comp1.Office__c = 'Chennai';
        comp1.Job_Category__c = 'Junior';
        comp1.Description__c = 'Desc Comp1';
        comp_list.add(comp1);
        
        insert comp_list;
    }
    
    static testmethod void testSubmitCompensations_ScheduleJob(){
    	Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',schedule,new SubmitCompensations_Schedule());         
        Test.stopTest();
        
    }
    
}