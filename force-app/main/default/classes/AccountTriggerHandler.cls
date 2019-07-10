public class AccountTriggerHandler {
    
    public static void CreateAccounts(List<Account> accounts) {
        
        List<Account> updatedAccounts = new List<Account>();
        for (Account account : accounts) {
            account.ShippingState = account.BillingState;
            updatedAccounts.add(account);
        }
    }
}