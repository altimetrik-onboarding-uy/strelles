@isTest
public class customCompensationTableController_Test {
		@isTest
    	static void fetchCompensation() {
             System.assertEquals(customCompensationTableController.fetchCompensation(),null);
   	 	}
    
        @isTest
        static void fetchCompensationTypeEmpty(){
            System.assertEquals(customCompensationTableController.fetchCompensationType(''),null);
        }
    
        @isTest
    	static void fetchCompensationType(){
        System.assertEquals(customCompensationTableController.fetchCompensationType('Salary'),null);
    	}

}