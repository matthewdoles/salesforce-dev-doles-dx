public class AttachmentController {
	@auraEnabled
    public static void updatePicturePath(String recId) {
        ContentDocumentLink docLink = [select contentdocumentid from contentdocumentlink
                                       where linkedentityid = :recId order by id desc limit 1];
        ContentVersion ver = [SELECT Id FROM ContentVersion Where ContentDocumentId = :docLink.ContentDocumentId];
        Speaker__c speaker = [select id from Speaker__c where id = :recId];
        speaker.Picture_Path__c = '/sfc/servlet.shepherd/version/download/'+ ver.Id;
        upsert speaker;
    }
}