<aura:application description="LightningFormatDemo" extends="force:slds">
    <aura:attribute name="street" type="String"/>
    <aura:attribute name="city" type="String"/>
    <aura:attribute name="country" type="String"/>
    <aura:attribute name="province" type="String"/>
    <aura:attribute name="postalCode" type="String"/>

    <aura:attribute name="provinceOptions" type="List" default="[
        {'label' : 'California', 'value' : 'CA'},
        {'label' : 'Texas', 'value' : 'TX'},
        {'label' : 'Washington', 'value' : 'WA'},
        {'label' : 'Tennessee', 'value' : 'TN'},
    ]"/>
    <aura:attribute name="countryOptions" type="List" default="[
        {'label' : 'United States', 'value' : 'US'},
        {'label' : 'Japan', 'value' : 'JP'},
        {'label' : 'China', 'value' : 'CN'},
        {'label' : 'India', 'value' : 'IN'},
    ]"/>
    <aura:attribute name="salutationOptions" type="List" default="[
        {'label' : 'None', 'value' : 'None'},
        {'label' : 'Mr.', 'value' : 'Mr.'},
        {'label' : 'Ms.', 'value' : 'Ms.'},
        {'label' : 'Mrs.', 'value' : 'Mrs.'},
        {'label' : 'Dr.', 'value' : 'Dr.'},
        {'label' : 'Prof.', 'value' : 'Prof.'},
    ]"/>

    <aura:attribute name="fields" type="List" default="['firstName', 'lastName']"/>
    <aura:attribute name="firstName" type="String"/>
    <aura:attribute name="middleName" type="String"/>
    <aura:attribute name="lastName" type="String"/>
    <aura:attribute name="informalName" type="String"/>
    <aura:attribute name="suffix" type="String"/>
    <aura:attribute name="salutation" type="String"/>

    <lightning:layout  verticalAlign="center" horizontalAlign="center" multipleRows="true">
    <lightning:layoutItem flexibility="auto" padding="around-small" size="6">
        <lightning:inputAddress aura:id="myAddress"
                                addressLabel="Address"
                                streetLabel="Street" street="{!v.street}"
                                cityLabel="City" city="{!v.city}"
                                countryLabel="Country" country="{!v.countryOptions}"
                                provinceLabel="State"   province="{!v.stateOptions}"
                                postalCodeLabel="Postal Code" postalCode="{!v.postalCode}"/>
        <lightning:layoutItem flexibility="auto" padding="around-small" size="6">
            Formatted Address: <lightning:formattedAddress street="{!v.street}"
                                                           city="{!v.city}"
                                                           country="{!v.country}"
                                                           province="{!v.province}"
                                                           postalCode="{!v.postalCode}"/>
        </lightning:layoutItem>
        <lightning:layoutItem flexibility="auto" padding="around-small" size="6">
            <lightning:inputName
                    aura:id="myname"
                    label="Contact Name"
                    firstName="{!v.firstName}"
                    middleName="{!v.middleName}"
                    lastName="{!v.lastName}"
                    informalName="{!v.informalName}"
                    suffix="{!v.suffix}"
                    salutation="{!v.salutation}"
                    options="{!v.salutationOptions}"
                    fieldsToDisplay="{!v.fields}"
            />
        </lightning:layoutItem>
        <lightning:layoutItem flexibility="auto" padding="around-small" size="6">
            Formatted Name : <lightning:formattedName
                    firstName="{!v.firstName}"
                    middleName="{!v.middleName}"
                    lastName="{!v.lastName}"
                    informalName="{!v.informalName}"
                    suffix="{!v.suffix}"
                    salutation="{!v.salutation}"
            />
        </lightning:layoutItem>


    </lightning:layoutItem>
    </lightning:layout>

</aura:application>