global class CustomerProcessingBatch implements Database.Batchable<sObject> {
    
    global string[]email = new string[] {'matteddied@gmail.com'};
        
    //start
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        return Database.getQueryLocator('select id, name, customer_status__c, customer_description__c from Customer__c where Active__c=true');
            
    }
    
    //execute
    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        
        List<Customer__c> updatedCustomerList = new List<Customer__c>();
        for (sObject objScope:scope) 
        {
            Customer__c newObjScope = (Customer__c)objSCope;
            newObjScope.Customer_Description__c = 'Updated via Batch Job';
            newObjScope.Customer_Status__c = 'Paid';
            updatedCustomerList.add(newObjScope);
        }
        if (updatedCustomerList != null && updatedCustomerList.size() > 0) {
            Database.update(updatedCustomerList);
            System.debug('Records are successfully updated ' + updatedCustomerList);
        }
    }
    
    //finally
    global void finish(Database.BatchableContext BC) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        AsyncApexJob a = [select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById, 
         a.CompletedDate from AsyncApexJob a where id=:BC.getJobId()];
        System.debug('Job Id: ' + BC.getJobId());
        
        mail.setToAddresses(email);
        mail.setReplyTo('matthew.doles@salesforce.com');
        mail.setSenderDisplayName('Apex Batch Processing Module');
        mail.setSubject('Batch Processing ' + a.status);
        mail.setPlainTextBody('The Batch Apex Job proccessed ' + a.TotalJobItems + ' batches with ' 
                              + a.NumberOfErrors + ' failures. Job Items processed: ' + a.JobItemsProcessed);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        
    }
}