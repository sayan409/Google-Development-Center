trigger PreventAccountDelete on Account (before delete) {
    if (Trigger.isBefore && Trigger.isDelete) {
        System.debug('Trigger.old: '+Trigger.old);
        for (Account acc : Trigger.old) {
                acc.addError('Deleting this Account record is not allowed.');
        }
    }
}