<aura:application description="LightningLayoutApp" extends="force:slds">
    <lightning:layout horizontalAlign="start" multipleRows="true">
        <lightning:layoutItem padding="around-small" flexibility="auto"
                              size="12" smallDeviceSize="6" mediumDeviceSize="4" largeDeviceSize="3">
            <lightning:card title="1">
                <p class="slds-p-horizontal_small">Card 1</p>
            </lightning:card>
        </lightning:layoutItem>
        <lightning:layoutItem padding="around-small" flexibility="auto"
                              size="12" smallDeviceSize="6" mediumDeviceSize="4" largeDeviceSize="3">
            <lightning:card title="2">
                <p class="slds-p-horizontal_small">Card 2</p>
            </lightning:card>
        </lightning:layoutItem>
        <lightning:layoutItem padding="around-small" flexibility="auto"
                              size="12" smallDeviceSize="6" mediumDeviceSize="4" largeDeviceSize="3">
            <lightning:card title="3">
                <p class="slds-p-horizontal_small">Card 3</p>
            </lightning:card>
        </lightning:layoutItem>
        <lightning:layoutItem padding="around-small" flexibility="auto"
                              size="12" smallDeviceSize="6" mediumDeviceSize="4" largeDeviceSize="3">
            <lightning:card title="4">
                <p class="slds-p-horizontal_small">Card 4</p>
            </lightning:card>
        </lightning:layoutItem>
    </lightning:layout>
</aura:application>