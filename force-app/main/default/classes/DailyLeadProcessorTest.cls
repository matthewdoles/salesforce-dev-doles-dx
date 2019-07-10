@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    @isTest
    static void test() {
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            Lead l = new Lead(firstname='firstname' + i, lastname='lastname' + i, company='test company' + i);
            leads.add(l);         
        }
        insert leads;    
         
        Test.startTest();
        String jobId = System.schedule('Schedule Jobs Apex Test', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();


    }
}