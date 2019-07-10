trigger CustomerTrigger on Customer__c (after update) {
    List<Invoice__c> invoiceList = new List<Invoice__c>();
    for (Customer__c objCustomer:Trigger.new)
    {
        if (objCustomer.Customer_Status__c == 'Active')
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