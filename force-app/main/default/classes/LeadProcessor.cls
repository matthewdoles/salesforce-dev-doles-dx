global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT id, LeadSource FROM Lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> leads) {
        
        List<Lead> newLeads = new List<Lead>();
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
            newLeads.add(lead);
        }
        update newLeads;
            
    }
    global void finish(Database.BatchableContext bc) {
    
    }
    
}