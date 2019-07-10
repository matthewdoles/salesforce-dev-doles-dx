trigger CustomerTriggerMultipleEvents on Customer__c (after update, after insert) 
{
    if (trigger.isAfter && trigger.isUpdate) 
    {
        CustomerTriggerHelperSOQLGovenorLimitFix.isAfterUpdateCall(Trigger.new, Trigger.oldMap, Trigger.newMap);
    }    
    
    //after insert code here
}