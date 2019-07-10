trigger CustomerTriggerDebugging on Customer__c (before update) {
    List<Customer__c> customerList = new List<Customer__c>();
    for(Customer__c objCust:Trigger.new) {
        System.debug('objCust current value ' + objCust);
        if (objCust.Active__c == true) {
            objCust.Customer_Description__c = 'Updated for Debugging Test';
            System.debug('The records which has satisified the if-condition ' + objCust);
        }
    }
}