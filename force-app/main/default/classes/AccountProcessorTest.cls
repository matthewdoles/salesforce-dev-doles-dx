@isTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest() {

        Account acc = new Account();
        acc.Name = 'Account Processor Test';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName ='Matthew';
        con.LastName ='Test';
        con.AccountId = acc.Id;
        insert con;
        
        set<Id> setAccId = new set<Id>();
        setAccId.add(acc.id);
        
        Test.startTest();
        AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account result = [select Number_of_Contacts__c from Account where id =  :acc.id limit 1];
        System.assertEquals (Integer.valueOf(result.Number_of_Contacts__c) ,1);
           
    }
    
}