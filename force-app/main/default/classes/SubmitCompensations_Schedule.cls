global class SubmitCompensations_Schedule implements Schedulable {

    global void execute(SchedulableContext SC){
        SubmitCompensations_Batch SCB = new SubmitCompensations_Batch();
        ID batchprocessid = Database.executeBatch(SCB);     
    }

}