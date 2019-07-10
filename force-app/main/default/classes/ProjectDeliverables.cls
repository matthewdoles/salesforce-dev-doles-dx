public with sharing class ProjectDeliverables {
    @AuraEnabled
    public static List<Deliverable__c> getDeliverables(String projectId) {
        return [SELECT Name, Start_Date__c, Due_Date__c FROM Deliverable__c WHERE Project__c = :projectId ORDER BY Start_Date__c ASC];
    }
}