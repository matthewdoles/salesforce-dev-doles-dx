public class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String state; 
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
    
        List<Account> accounts = [select id, name, billingstate, (select id, firstname, lastname from contacts) from account where billingstate = :state limit 200];
        List<Contact> newContacts = new List<Contact>();
        
        for (Account account : accounts) {
            Contact cont = contact.clone(false, false, false, false);
            cont.AccountId = account.id;
            newContacts.add(cont);
        }
        if (newContacts.size() > 0) {        
            insert newContacts;
        }
    }
}