trigger myAccountTrigger on Account (before delete)     
{
    if (Trigger.isBefore) 
    {
        if (Trigger.isDelete)
        {
            for (Account a:Trigger.old)
            {
                if (a.Name != 'OkToDelete')
                {
                    a.addError('You cannot delete this account record');
                }
            }
        }
    }
}