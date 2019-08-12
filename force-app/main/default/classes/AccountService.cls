public with sharing class AccountService {
    public Account createAccount(String accountName, String accountNumber, String tickerSymbol) {
        Account newAccount = new Account(
            Name = accountName,
            accountNumber = accountNumber,
            TickerSymbol = tickerSymbol
        );
        return newAccount;
    }
}