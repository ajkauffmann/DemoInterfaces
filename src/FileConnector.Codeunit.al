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
    begin
        if not SetupRead then begin
            FileConnectorSetupAJK.Get;
            SetupRead := true;
        end;

        IFileConnector := FileConnectorSetupAJK.Connector;
    end;
}