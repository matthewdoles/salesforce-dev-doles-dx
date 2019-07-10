<aura:application description="QuickContacts">
    <link href="/resource/bootstrap/" rel="stylesheet" />
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <a href="#" class="navbar-brand">Lightning Contacts</a>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <c:SearchBarQuickContacts />
                <c:ContactListQuickContacts />
            </div>
            <div class="col-sm-8">
                <c:ContactDetailsQuickContacts/>
            </div>
        </div>
    </div>
</aura:application>