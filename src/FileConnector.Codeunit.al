codeunit 60603 FileConnectorAJK
{
    Access = Internal;

    var
        FileConnectorSetupAJK: Record FileConnectorSetupAJK;
        SetupRead: Boolean;

    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean
    var
        DropboxConnectorAJK: Codeunit DropboxConnectorAJK;
        GoogleDriveConnectorAJK: Codeunit GoogleDriveConnectorAJK;
        SharePointConnectorAJK: Codeunit SharePointConnectorAJK;
        IsHandled: Boolean;
    begin
        OnBeforeSaveFile(FileName, FileContent, Success, IsHandled);
        if IsHandled then
            exit;

        GetSetup();
        case FileConnectorSetupAJK.Connector of
            FileConnectorSetupAJK.Connector::Dropbox:
                Success := DropboxConnectorAJK.SaveFile(FileName, FileContent);
            FileConnectorSetupAJK.Connector::GoogleDrive:
                Success := GoogleDriveConnectorAJK.SaveFile(FileName, FileContent);
            FileConnectorSetupAJK.Connector::SharePoint:
                Success := SharePointConnectorAJK.SaveFile(FileName, FileContent);
        end;
    end;

    procedure GetFile(FileName: Text) Content: Text
    var
        DropboxConnectorAJK: Codeunit DropboxConnectorAJK;
        GoogleDriveConnectorAJK: Codeunit GoogleDriveConnectorAJK;
        SharePointConnectorAJK: Codeunit SharePointConnectorAJK;
        IsHandled: Boolean;
    begin
        OnBeforeGetFile(FileName, Content, IsHandled);
        if IsHandled then
            exit;

        GetSetup();
        case FileConnectorSetupAJK.Connector of
            FileConnectorSetupAJK.Connector::Dropbox:
                Content := DropboxConnectorAJK.GetFile(FileName);
            FileConnectorSetupAJK.Connector::GoogleDrive:
                Content := GoogleDriveConnectorAJK.GetFile(FileName);
            FileConnectorSetupAJK.Connector::SharePoint:
                Content := SharePointConnectorAJK.GetFile(FileName);
        end;
    end;

    procedure DeleteFile(FileName: Text) Success: Boolean
    var
        DropboxConnectorAJK: Codeunit DropboxConnectorAJK;
        GoogleDriveConnectorAJK: Codeunit GoogleDriveConnectorAJK;
        SharePointConnectorAJK: Codeunit SharePointConnectorAJK;
        IsHandled: Boolean;
    begin
        OnBeforeDeleteFile(FileName, Success, IsHandled);
        if IsHandled then
            exit;

        GetSetup();
        case FileConnectorSetupAJK.Connector of
            FileConnectorSetupAJK.Connector::Dropbox:
                Success := DropboxConnectorAJK.DeleteFile(FileName);
            FileConnectorSetupAJK.Connector::GoogleDrive:
                Success := GoogleDriveConnectorAJK.DeleteFile(FileName);
            FileConnectorSetupAJK.Connector::SharePoint:
                Success := SharePointConnectorAJK.DeleteFile(FileName);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSaveFile(FileName: Text; FileContent: Text; var Success: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetFile(FileName: Text; Content: Text; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDeleteFile(FileName: Text; var Success: Boolean; var IsHandled: Boolean)
    begin
    end;


    local procedure GetSetup()
    begin
        if not SetupRead then begin
            FileConnectorSetupAJK.Get;
            SetupRead := true;
        end;
    end;
}