codeunit 60603 FileConnectorAJK
{
    Access = Internal;

    var
        FileConnectorSetupAJK: Record FileConnectorSetupAJK;
        SetupRead: Boolean;

    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean
    var
        IFileConnector: Interface IFileConnectorAJK;
    begin
        IFileConnector := GetFileConnector();
        Success := IFileConnector.SaveFile(FileName, FileContent);
    end;

    procedure GetFile(FileName: Text) Content: Text
    var
        IFileConnector: Interface IFileConnectorAJK;
    begin
        IFileConnector := GetFileConnector();
        Content := IFileConnector.GetFile(FileName);
    end;

    procedure DeleteFile(FileName: Text) Success: Boolean
    var
        IFileConnector: Interface IFileConnectorAJK;
    begin
        IFileConnector := GetFileConnector();
        Success := IFileConnector.DeleteFile(FileName);
    end;

    local procedure GetFileConnector() IFileConnector: Interface IFileConnectorAJK
    var
        DropboxConnectorAJK: Codeunit DropboxConnectorAJK;
        GoogleDriveConnectorAJK: Codeunit GoogleDriveConnectorAJK;
        SharePointConnectorAJK: Codeunit SharePointConnectorAJK;
    begin
        if not SetupRead then begin
            FileConnectorSetupAJK.Get;
            SetupRead := true;
        end;

        case FileConnectorSetupAJK.Connector of
            FileConnectorSetupAJK.Connector::Dropbox:
                IFileConnector := DropboxConnectorAJK;
            FileConnectorSetupAJK.Connector::GoogleDrive:
                IFileConnector := GoogleDriveConnectorAJK;
            FileConnectorSetupAJK.Connector::SharePoint:
                IFileConnector := SharePointConnectorAJK;
            else
                OnGetFileConnector(IFileConnector);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetFileConnector(var IFileConnector: Interface IFileConnectorAJK)
    begin
    end;
}