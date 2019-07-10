public class CustomerTriggerHelperSOQLGovenorLimitFix 
{

    public static void isAfterUpdateCall(List<Customer__c> customerList, 
    Map<id, Customer__c> oldMapCustomer, Map<id, Customer__c> newMapCustomer) 
    {
        createInvoiceReocrds(customerList, oldMapCustomer);
        updateInvoiceDesc(customerList, newMapCustomer);
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
    
    public static void updateInvoiceDesc(List<Customer__c> customerList, Map<id, Customer__c> newMapCustomer) 
    {
        List<Customer__c> customerListWithInvoice = [select id, name, (select id, name, description__c from Invoices__r) from Customer__c where Id IN:newMapCustomer.keySet()];
      
        List<Invoice__c> invoiceToUpdate = new List<Invoice__c>();
        List<Invoice__c> invoiceList = customerListWithInvoice[0].Invoices__r;
        for (Invoice__c objInv:invoiceList )
        {
            objInv.Description__c = 'OK To Pay';
            invoiceToUpdate.add(objInv);
        }
        update invoiceToUpdate;
    
    }
}