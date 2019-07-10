// bad example of bulk update (DML statement in for loop)
trigger CustomerStatusTrigger on Customer__c (after update) 
{
    for (Customer__c objCust:Trigger.new)
    {
        //check current and old status of customer
        if(objCust.Customer_Status__c == 'Active' && Trigger.oldMap.get(objCust.id).Customer_Status__c == 'Inactive')
        {
            Invoice__c objInvoice = new Invoice__c();
            objInvoice.Status__c = 'Pending';
            objInvoice.Customer__c = objCust.id;
            insert objInvoice;
        }
    }
}