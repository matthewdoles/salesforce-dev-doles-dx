trigger BatchApexErrorTrigger on BatchApexErrorEvent(after insert) {
    
    List<BatchLeadConvertErrors__c> errors = new List<BatchLeadConvertErrors__c>();
    
    for(BatchApexErrorEvent error : trigger.new) {
        BatchLeadConvertErrors__c  blcr = new BatchLeadConvertErrors__c ();
        blcr.AsyncApexJobId__c = error.AsyncApexJobId;
        blcr.Records__c = error.JobScope;
        blcr.StackTrace__c = error.StackTrace;     
        errors.add(blcr);    
    }
    
    if(errors.size() > 0){
        insert errors;
    }
}