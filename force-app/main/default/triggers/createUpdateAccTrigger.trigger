trigger createUpdateAccTrigger on Account (after insert, after update) {
	CreateUpdateAccTriggerController.updateAcc(trigger.isInsert, trigger.isUpdate, trigger.new);
}