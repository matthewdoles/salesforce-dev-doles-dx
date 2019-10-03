public with sharing class AccountHandler {
    public static void insertAccount(Integer numAccts) {
        List<Account> addAccounts = new List<Account>();
        Integer n = 0;
        while(n < numAccts) {
            Account a = new Account();
            a.Name = 'Acme Inc ' + n;
            a.AccountNumber = 'A000' + n;
            addAccounts.add(a);
            n++;
        }
        insert addAccounts;
    }
}