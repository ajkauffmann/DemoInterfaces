enum 60600 FileConnectorAJK implements IFileConnectorAJK
{
    Extensible = true;
    DefaultImplementation = IFileConnectorAJK = NoFileConnectorAJK;
    value(0; None) { }
    value(1; Dropbox)
    {
        Implementation = IFileConnectorAJK = DropboxConnectorAJK;
    }
    value(2; GoogleDrive)
    {
        Caption = 'Google Drive';
        Implementation = IFileConnectorAJK = GoogleDriveConnectorAJK;
    }
    value(3; SharePoint)
    {
        Implementation = IFileConnectorAJK = SharePointConnectorAJK;
    }
}