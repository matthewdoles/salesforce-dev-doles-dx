<aura:application description="TreeViewDemo" extends="force:slds">
    <aura:handler name="init" value="{!this}" action="{!c.onInit}"/>
    <aura:attribute name="gridColumns" type="List"/>
    <aura:attribute name="gridData" type="Object"/>
    <aura:attribute name="gridExpandedRows" type="Object"/>
    <lightning:treeGrid columns="{!v.gridColumns}" data="{!v.gridData}"
                        expandedRows="{!v.gridExpandedRows}" keyField="name"
                        aura:id="mytree"/>
</aura:application>