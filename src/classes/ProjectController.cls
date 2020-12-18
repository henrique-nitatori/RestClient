@RestResource(urlMapping = '/api/account')
global with sharing class ProjectController {

    @HttpPost
    global static List<Account__c> create(BossAccount bossAccount) {
        AccountTransformer accountTransformer = new AccountTransformer();
        AccountRepository accountRepository = new AccountRepository();

        List<Account__c> accounts = new List<Account__c>{
            accountTransformer.toAccount(bossAccount)
        };

        return accountRepository.create(accounts);
    }

}

