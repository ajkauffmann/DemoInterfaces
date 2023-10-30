codeunit 60601 DropboxConnectorAJK
{
    Access = Internal;
    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean
    begin
        Message('File %1 saved to Dropbox', FileName);
    end;

    procedure GetFile(FileName: Text) Content: Text
    begin
        Message('File %1 retrieved from Dropbox', FileName);
    end;

    procedure DeleteFile(FileName: Text) Success: Boolean
    begin
        Message('File %1 deleted from Dropbox', FileName);
    end;
}