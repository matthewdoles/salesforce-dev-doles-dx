public class SalesLeader implements Comparable{
    @AuraEnabled
    public String fullName {get;set;}
    @AuraEnabled
    public String email {get;set;}
    @AuraEnabled
    public String userId {get;set;}
    @AuraEnabled
    public Decimal netSales {get;set;}
    @AuraEnabled
    public String photoURL {get;set;}

    public SalesLeader(String fullName, String email, String userId, Decimal netSales, String photoURL) {
        this.fullName = fullName;
        this.email = email;
        this.userId = userId;
        this.netSales = netSales;
        this.photoURL = photoURL;
    }

    public Integer compareTo(Object compareTo) {
        SalesLeader compareToNetRevenue = (SalesLeader)compareTo;
        if (netSales == compareToNetRevenue.netSales) return 0;
        if (netSales < compareToNetRevenue.netSales) return 1;
        return -1;
    }

}