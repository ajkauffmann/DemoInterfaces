codeunit 60600 SharePointConnectorAJK
{
    Access = Internal;
    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean
    begin
        Message('File %1 saved to SharePoint', FileName);
    end;

    procedure GetFile(FileName: Text) Content: Text
    begin
        Message('File %1 retrieved from SharePoint', FileName);
    end;

    procedure DeleteFile(FileName: Text) Success: Boolean
    begin
        Message('File %1 deleted from SharePoint', FileName);
    end;
}