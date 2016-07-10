public with sharing class LightningAppListController {
    @AuraEnabled
    public static List<AuraDefinitionBundle> getAuraDefinitionBundleList() {
        List<AuraDefinition> adList = [SELECT Id, AuraDefinitionBundleId
                                       FROM AuraDefinition
                                       WHERE DefType = 'APPLICATION'];

        List<String> adbIdList = new List<String>();
        for (AuraDefinition ad : adList) {
            adbIdList.add(ad.AuraDefinitionBundleId);
        }

        List<AuraDefinitionBundle> adbList = [SELECT Id, ApiVersion, Description, DeveloperName,
                                              Language, MasterLabel, NamespacePrefix
                                              FROM AuraDefinitionBundle
                                              WHERE Id IN :adbIdList
                                              ORDER BY DeveloperName];
        return adbList;
    }
}