trigger CustomerAfterUpdateTrigger on Customer__c (after update) 
{
    List <Invoice__c> invoiceList = new List<Invoice__c>();
    for(Customer__c objCustomer:Trigger.new)
    {
        // check if the current status is active and previos status was inactive
        if (objCustomer.Customer_Status__c == 'Active' && trigger.oldMap.get(objCustomer.id).Customer_Status__c == 'Inactive')
        {
            Invoice__c objInvoice = new Invoice__c();
            objInvoice.Status__c = 'Pending';
            objInvoice.Customer__c = objCustomer.id;
            objInvoice.Description__c = 'Record created through trigger.';
            invoiceList.add(objInvoice);
        } 
    }
    insert invoiceList;
}