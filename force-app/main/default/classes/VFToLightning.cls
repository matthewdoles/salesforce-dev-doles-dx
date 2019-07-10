public with sharing class VFToLightning {
    public String getSalesforceDomain() {
        return System.Url.getSalesforceBaseUrl().getHost().substringBefore('--');
    }
}