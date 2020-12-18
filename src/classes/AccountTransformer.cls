/**
 @author Henrique Nitatori
 */

public class AccountTransformer {

    public Account__c toAccount(BossAccount bossAccount) {
        return new Account__c(
            clientFirstName__c = bossAccount.clientFirstName,
            clientLastName__c = bossAccount.clientLastName,
            clientDocument__c = bossAccount.clientDocument,
            balance__c = bossAccount.balance
        );
    }

}