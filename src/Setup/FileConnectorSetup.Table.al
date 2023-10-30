table 60600 FileConnectorSetupAJK
{
    Caption = 'File Connector Setup';

    fields
    {
        field(1; Code; Code[10]) { }
        field(2; Connector; Option)
        {
            OptionMembers = Dropbox,GoogleDrive,SharePoint;
            OptionCaption = 'Dropbox,Google Drive,SharePoint';
        }
    }
}