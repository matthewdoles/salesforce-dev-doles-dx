trigger CustomerAfterUpdateTriggerWithHelper on Customer__c (after update) 
{
    CustomerTriggerHelper.createInvoiceRecords(Trigger.new, Trigger.oldMap);
}