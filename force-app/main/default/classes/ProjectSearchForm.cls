public with sharing class ProjectSearchForm {
    @AuraEnabled
    public static List<Project__c> getProjects() {
        return [SELECT Id, Name FROM Project__c ORDER BY Name];
    }
    @AuraEnabled
    public static List<Deliverable__c> getDeliverables(String projectId) {
        return [SELECT Name, Start_Date__c, Due_Date__c FROM Deliverable__c WHERE Project__c = :projectId ORDER BY Start_Date__c ASC];
    }
    @AuraEnabled
    public Static Integer getHeaderWidth(String projectId) {
        Project__c project = getProject(projectId);
        Date startDate = project.Start_Date__c;
        Date endDate = project.End_Date__c;

        Date firstDate = startDate.toStartOfMonth();
        Date lastDate = endDate.addMonths(1).toStartofMonth().addDays(-1);

        Integer numberOfMonths = getNumberofMonths(firstDate, lastDate);

        Integer headerWidth = 100 / numberOfMonths;
        return headerWidth;
    }
    @AuraEnabled
    public Static List<String> getMonths(String projectId) {
        Project__c project = [SELECT Id, Name, Start_Date__c, End_Date__c FROM Project__c WHERE Id = :projectId];
        Date startDate = project.Start_Date__c;
        Date endDate = project.End_Date__c;

        Date firstDate = startDate.toStartOfMonth();
        Date lastDate = endDate.addMonths(1).toStartofMonth().addDays(-1);
        Integer numberOfMonths = getNumberofMonths(firstDate, lastDate);

        List<String> months = new List<String>();
        List<String> monthNames = new List<String>{
                '', 'Jan.', 'Feb.', 'Mar', 'Apr.', 'May', 'Jun.',
                'Jul.', 'Aug.', 'Sept.', 'Oct.', 'Nov.', 'Dec.'
        };
        for (Integer i = 0; i < numberOfMonths; i++) {
            String month = monthNames.get(firstDate.month());
            months.add(month);
            System.debug(months.get(i));
            firstDate = firstDate.addMonths(1);
        }
        return months;
    }
    public Static Project__c getProject(String projectId) {
        return [SELECT Id, Name, Start_Date__c, End_Date__c FROM Project__c WHERE Id = :projectId];
    }
    public Static Integer getNumberofMonths(Date firstDate, Date lastDate) {
        return firstDate.monthsBetween(lastDate) + 1;
    }
    @AuraEnabled
    public static List<String> getGanttItem(String projectId, String deliverableId, Integer iteration) {
        Project__c project = getProject(projectId);
        Date startDate = project.Start_Date__c;
        Date endDate = project.End_Date__c;

        Date firstDate = startDate.toStartOfMonth();
        Date lastDate = endDate.addMonths(1).toStartofMonth().addDays(-1);
        Integer projectDuration = firstDate.daysBetween(lastDate);
        System.debug(projectDuration);

        List<String> colors = new List<String>{'lightgreen', 'lightskyblue', 'lightcoral', 'mediumpurple', 'lightgray'};
        List<Deliverable__c> deliverables =  [SELECT Name, Start_Date__c, Due_Date__c FROM Deliverable__c WHERE Id = :deliverableId ];

        List<String> ganttItem = new List<String>();
        for (Integer i = 0; i < deliverables.size(); i++) {
            Date deliverableStartDate = deliverables[i].Start_Date__c;
            Date deliverableDueDate = deliverables[i].Due_Date__c;

            String color = colors[math.mod(iteration, 5)];

            Double deliverableDuration = deliverableStartDate.daysBetween(deliverableDueDate);
            Double ganttItemWidth = (deliverableDuration * 100) / projectDuration;
            System.debug(deliverableDuration);

            Double daysSinceProjectStart = firstDate.daysBetween(deliverableStartDate);
            Double ganttItemLeftMargin = (daysSinceProjectStart * 100) / projectDuration;


            ganttItem.add(deliverables[i].Id);
            ganttItem.add(deliverables[i].Name);
            ganttItem.add(String.valueOf(deliverableStartDate.format()));
            ganttItem.add(String.valueOf(deliverableDueDate.format()));
            ganttItem.add(color);
            ganttItem.add(String.valueOf(ganttItemWidth));
            ganttItem.add(String.valueOf(ganttItemLeftMargin));

        }
        return ganttItem;

    }

}