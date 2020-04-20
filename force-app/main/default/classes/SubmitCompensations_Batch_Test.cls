@isTest
public class SubmitCompensations_Batch_Test {

    @isTest
    public static void testIt(){
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
        
        Test.startTest();
        SubmitCompensations_Batch SCB = new SubmitCompensations_Batch();
        Id batchId = Database.executeBatch(SCB);
        Test.stopTest();
    }
}