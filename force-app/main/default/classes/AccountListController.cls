public class AccountListController {
    
    public ApexPages.StandardSetController accts {
        get {
            if (accts == null) {
                accts = new ApexPages.StandardSetController(Database.getQueryLocator([select name, accountnumber from account]));
            }
            return accts ;
        }
        set;
    }
    public List<Account> getAccounts() {
        return (List<Account>)accts.getRecords();
    }


}