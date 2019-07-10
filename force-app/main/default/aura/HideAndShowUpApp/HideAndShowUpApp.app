<aura:application description="HideAndShowUpApp" extends="force:slds">
    <div class="spinner" aura:id="spinner">
        <lightning:spinner alternativeText="Loading" />
    </div>
    <lightning:button label="Toggle" variant="brand" class="btn" onclick="{! c.handleClick }"/>
</aura:application>