codeunit 60602 GoogleDriveConnectorAJK
{
    Access = Internal;
    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean
    begin
        Message('File %1 saved to Google Drive', FileName);
    end;

    procedure GetFile(FileName: Text) Content: Text
    begin
        Message('File %1 retrieved from Google Drive', FileName);
    end;

    procedure DeleteFile(FileName: Text) Success: Boolean
    begin
        Message('File %1 deleted from Google Drive', FileName);
    end;
}