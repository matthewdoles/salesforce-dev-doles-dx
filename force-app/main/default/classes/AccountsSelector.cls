public class AccountsSelector extends fflib_SObjectSelector
{
    public List<Schema.SObjectField> getSObjectFieldList()
    {
        return new List<Schema.SObjectField>
        {
            Account.AnnualRevenue,
            Account.Description,
            Account.Name 
        };
    }

    public Schema.SObjectType getSObjectType()
    {
        return Account.sObjectType;
    }

    public List<Account> selectById(Set<Id> idSet)
    {
        return (List<Account>) selectSObjectsById(idSet);
    }
}