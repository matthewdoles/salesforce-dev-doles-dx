public with sharing class ContactController {

    @AuraEnabled
    public static List<Contact> findAll() {
        return [SELECT id, name, phone FROM Contact LIMIT 50];
    }

    @AuraEnabled
    public static List<Contact> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        return [SELECT id, name, phone FROM Contact WHERE name LIKE :name LIMIT 50];
    }

    @AuraEnabled
    public static Contact findById(String contactId) {
        return [SELECT id, name, title, phone, mobilephone, Account.Name
        FROM Contact WHERE Id = :contactId];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id, Name, Title, Phone, Email, Picture__c FROM Contact WHERE Picture__c != null LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, Name, Title, Phone, Email, Picture__c FROM Contact WHERE Name LIKE :key AND Picture__c != null LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact(){
        return [SELECT Id, Name, Title, Phone, Email, Picture__c FROM Contact LIMIT 1];
    }

    @AuraEnabled
    public static List<Contact> getContacts(){
        throw new AuraHandledException('Forced error');
        //return [SELECT FirstName, LastName, Email FROM Contact];
    }
}