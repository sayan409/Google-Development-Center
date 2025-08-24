public class AttachmentController {
    // List to hold attachments
    public List<AttachmentWrapper> attachments { get; set; }
    
    public AttachmentController() {
        attachments = new List<AttachmentWrapper>();
        attachments.add(new AttachmentWrapper());
    }

    // Method to handle adding a new attachment row
    public void addAttachment() {
        attachments.add(new AttachmentWrapper());
    }

    // Method to handle file upload
    public PageReference handleFileUpload() {
        List<Attachment> newAttachments = new List<Attachment>();
        
        for (AttachmentWrapper wrapper : attachments) {
            if (wrapper.attachmentBody != null) {
                Attachment newAttachment = new Attachment();
                newAttachment.Name = wrapper.attachmentName;
                newAttachment.Body = wrapper.attachmentBody;
                newAttachment.ContentType = wrapper.attachmentContentType;
                newAttachments.add(newAttachment);
            }
        }
        
        insert newAttachments;
        
        // Reset attachments list
        attachments = new List<AttachmentWrapper>();
        attachments.add(new AttachmentWrapper());
        
        return null; // or navigate to another page
    }

    // Wrapper class for Attachment
    public class AttachmentWrapper {
        public String attachmentName { get; set; }
        public Blob attachmentBody { get; set; }
        public String attachmentContentType { get; set; }
    }
}