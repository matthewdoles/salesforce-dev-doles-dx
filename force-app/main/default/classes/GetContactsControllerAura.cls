public with sharing class GetContactsControllerAura {
    @AuraEnabled
    public static List<Contact> getServerContacts() {
        return [SELECT ID, Name, Email, Phone FROM Contact ORDER BY CreatedDate DESC LIMIT 10];
    }
}