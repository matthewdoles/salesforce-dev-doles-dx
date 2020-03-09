global with sharing class CaseService 
{
    global static void closeCases(Set<Id> caseIds, String closeReason) 
    {
        if (caseIds == null || caseIds.size() == 0)
        {
            throw new CaseServiceException('No cases specified.');
        }

        if (closeReason == null)
        {
            throw new CaseServiceException('Clase closed reason not specified.');
        }

        List<Case> cases = [SELECT Status, Reason FROM Case WHERE Id IN :caseIds];
        List<Case> casesToUpdate = new List<Case>();
        for(Case c : cases)
        {
            c.Status = 'Closed';
            c.Reason = closeReason;
            casesToUpdate.add(c);
        }

        SavePoint sp = Database.setSavePoint();
        if (casesToUpdate.size() > 0)
        {
            try
            {
                update casesToUpdate;
            } 
            catch (Exception e)
            {
                Database.rollback(sp);
                throw e;
            }
        }
    }
    public class CaseServiceException extends Exception {} 
}