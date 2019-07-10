trigger myAccountTrigger2 on Account (before insert) 
{
    if(Trigger.isInsert)
    {
        for(Account a:Trigger.new)
        {
            System.assertEquals('Matthew', a.Name);
            System.assertEquals('12345678', a.AccountNumber);
            System.assertEquals(100, a.NumberOfEmployees);
            System.assertEquals(200, a.AnnualRevenue);
        }
    }
}