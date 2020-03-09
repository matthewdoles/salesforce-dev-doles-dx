@isTest
public class UnitOfWorkTest
{
    @isTest public static void challengeComplete() 
    {
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[]
            {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );

        for (Integer i = 0; i < 100; i++)
        {
            Account a = new Account(Name = 'Test' + i);
            uow.registerNew(a);

            for (Integer j = 0; j < 5; j++)
            {
                Contact c = new Contact(LastName = 'Test' + i + ' Contact' + j);
                uow.registerNew(c, Contact.AccountId, a);

                Note n = new Note(
                    Body = 'Test' + i + ' Note' + j,
                    Title = 'Test' + i + ' Note' + j
                );
                uow.registerNew(n, Note.ParentId, a);
            }
        }
        
        uow.commitWork();

        System.assertEquals(100, [SELECT Id from Account].size());
        System.assertEquals(500, [SELECT Id from Contact].size());
        System.assertEquals(500, [SELECT Id From Note].size());
    }
}
