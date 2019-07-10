trigger SimpleTrigger on Account (after insert) 
{
    //create correspoding contact record
    List<Contact> listContacts = new List<Contact>();
    for (Account a:Trigger.new)
    {
        Contact c = new Contact();
        c.LastName = a.Name;
        listContacts.add(c);
    }
    insert listContacts;
}