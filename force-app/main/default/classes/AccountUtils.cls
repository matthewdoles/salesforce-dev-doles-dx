public class AccountUtils {
    
    public static List<Account> accountsByState(String state) {
        
        List<Account> accounts = new List<Account>([select id, name from account where billingstate=:state]);
        
        return accounts;
        
    }
}