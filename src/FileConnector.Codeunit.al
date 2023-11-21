codeunit 60603 FileConnectorAJK
{
    Access = Internal;

    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean
    var
        IFileConnector: Interface IFileConnectorAJK;
    begin
        Success := SaveFile(FileName, FileContent, IFileConnector);
    end;

    procedure SaveFile(FileName: Text; FileContent: Text; IFileConnector: Interface IFileConnectorAJK) Success: Boolean
    begin
        Success := IFileConnector.SaveFile(FileName, FileContent);
    end;

    procedure GetFile(FileName: Text; IFileConnector: Interface IFileConnectorAJK) Content: Text
    begin
        Content := IFileConnector.GetFile(FileName);
    end;

    procedure DeleteFile(FileName: Text; IFileConnector: Interface IFileConnectorAJK) Success: Boolean
    begin
        Success := IFileConnector.DeleteFile(FileName);
    end;
}