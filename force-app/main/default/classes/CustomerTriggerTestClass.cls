@isTest
private class CustomerTriggerTestClass {
    static testMethod void myUnitTest() {
        Customer__c objCust = new Customer__c();
        objCust.Name = 'Test Customer';
        objCust.Customer_Status__c = 'Inactive';
        insert objCust;
        
        Test.startTest();
        objCust.Customer_Status__c = 'Active';
        update objCust;
        Test.stopTest();
        
        //see if our epxected is equal to actual
        List<Invoice__c> invList = [select id, customer__c from Invoice__c where customer__c = :objCust.id];
        System.assertEquals(1, invList.size());
    }
}