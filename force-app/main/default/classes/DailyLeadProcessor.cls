global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [select id, leadsource from lead where leadsource=null];
        
        if (!leads.isEmpty()) {
            for (Lead lead : leads) {
                lead.LeadSource = 'Dreamforce';
            }
            update leads;
        }
    }

}