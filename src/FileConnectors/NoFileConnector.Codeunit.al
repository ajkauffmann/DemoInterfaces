codeunit 60604 NoFileConnectorAJK implements IFileConnectorAJK
{
    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean;
    begin
        Error('Not implemented');
    end;

    procedure GetFile(FileName: Text) Content: Text;
    begin
        Error('Not implemented');
    end;

    procedure DeleteFile(FileName: Text) Success: Boolean;
    begin
        Error('Not implemented');
    end;
}