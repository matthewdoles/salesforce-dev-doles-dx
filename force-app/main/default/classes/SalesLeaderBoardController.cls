public with sharing class SalesLeaderBoardController {
    @AuraEnabled 
    public static List<SalesLeader> getSLDashboardData() {
        List<SalesLeader> listsalesleader = new List<SalesLeader>();
        Integer THIS_YEAR = System.date.today().year();
        Map<String, Decimal> mapUserIdByAmount = new Map<String, Decimal>();
        for (AggregateResult ag:[SELECT SUM(Amount) sum, OwnerId
                                 FROM Opportunity
                                 WHERE StageName = 'Closed Won'
                                 AND CALENDAR_YEAR(CloseDate) = :THIS_YEAR
                                 GROUP BY OwnerId
                                 ORDER BY SUM(Amount) DESC
                                 LIMIT 10]){
            mapUserIdByAmount.put((String)ag.get('OwnerId'), (Decimal)ag.get('sum'));
        }
        for (User u : [SELECT Id, Name, Email, FullPhotoUrl FROM User WHERE Id IN :mapUserIdByAmount.keySet()]) {
            SalesLeader sleader = new SalesLeader(u.Name, u.Email, u.Id, mapUserIdByAmount.get(u.Id), u.FullPhotoUrl);
            listsalesleader.add(sleader);
        }
        listsalesleader.sort();
        return listsalesleader;
    }
    @AuraEnabled
    public static List<Opportunity> getlistOpportunities(String OwnerId) {
        Integer THIS_YEAR = System.Date.today().year();

        return [SELECT Id, Name, Account.Name, CloseDate, Amount
                FROM Opportunity
                WHERE OwnerId = :OwnerId
                AND StageName = 'Closed Won'
                AND CALENDAR_YEAR(CloseDate) = :THIS_YEAR
                ORDER BY CloseDate DESC LIMIT 100];
    }
}