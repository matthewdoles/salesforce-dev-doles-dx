public class MyControllerExtension {
    private final Account acct;
    public MyControllerExtension(ApexPages.StandardController controller) {
        this.acct = (Account)controller.getRecord();
    }
    
    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
}