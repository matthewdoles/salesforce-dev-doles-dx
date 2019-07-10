@isTest
public class AddPrimaryContactTest {

    @isTest
    static void test() {
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 50; i++) {
            Account a = new Account(name='test ' + i, billingstate='NY');
            accounts.add(a);         
        }
        for(Integer i = 0; i < 50; i++) {
            Account a = new Account(name='test ' + i, billingstate='CA');
            accounts.add(a);         
        }
        insert accounts;
        
         Contact con = new Contact();
         con.FirstName='first name';
         con.LastName ='last name';
         insert con;
         String state = 'CA';
         
         AddPrimaryContact apc = new AddPrimaryContact(con, state);
         Test.startTest();
         System.enqueueJob(apc);
         Test.stopTest();

    }
    
}