public class AccountCustomController {

    public PageReference save() {
        update Account;
        return null;
    }
    
    private final Account account;
    
    public AccountCustomController() {
        account = [select id, name, site from Account where id=:ApexPages.currentPage().getParameters().get('id')];
    }
    public Account getAccount() {  
        return Account;
    }

}