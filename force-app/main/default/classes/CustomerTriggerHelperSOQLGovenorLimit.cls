public class CustomerTriggerHelperSOQLGovenorLimit 
{

    public static void isAfterUpdateCall(List<Customer__c> customerList, 
    Map<id, Customer__c> oldMapCustomer) 
    {
        createInvoiceReocrds(customerList, oldMapCustomer);
        updateInvoiceDesc(customerList);
    }
    
    public static void createInvoiceReocrds(List<Customer__c> customerList,
    Map<id, Customer__c>oldMapCustomer) 
    {
        List<Invoice__c> invoiceList = new List<Invoice__c>();
        for (Customer__c objCustomer:customerList) 
        {
            if (objCustomer.Customer_Status__c == 'Active' 
            && oldMapCustomer.get(objCustomer.id).Customer_Status__c == 'Inactive') 
            {
                Invoice__c objInvoice = new Invoice__c();
                objInvoice.Status__c = 'Pending';
                objInvoice.Customer__c = objCustomer.id;
                InvoiceList.add(objInvoice);
            }
        }
        insert invoiceList;
    }
    
    public static void updateInvoiceDesc(List<Customer__c> customerList) 
    {
        for(Customer__c objCustomer:customerList)
        {
            //This query will fire for the number of records customer list has and will hit the governor limit when records are more than 100 
            List<Invoice__c> invoiceList = [select id, name, Description__c from Invoice__c where Customer__c=:objCustomer.id];
            for (Invoice__c objInvoice:invoiceList)
            {
                objInvoice.Description__c = 'Update via trigger';
                //Update invoice, this will also hit the governor limit for DML if large number(150) of records are processed
                update objInvoice; 
            }
        }
    }
}