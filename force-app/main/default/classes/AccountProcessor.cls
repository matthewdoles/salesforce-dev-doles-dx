public class AccountProcessor {
    
    @future
    public static void countContacts(Set<id> setId) {
        List<Account> accounts = [select id, Number_of_Contacts__c, (select id from contacts) from Account where id IN :setId ];
        for (Account acct:accounts) {
            List<Contact> listContacts = acct.Contacts;
            acct.Number_of_Contacts__c = listContacts.size();
        }
        update accounts;
    }
}