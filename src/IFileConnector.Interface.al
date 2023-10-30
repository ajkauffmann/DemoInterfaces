interface IFileConnectorAJK
{
    procedure SaveFile(FileName: Text; FileContent: Text) Success: Boolean
    procedure GetFile(FileName: Text) Content: Text
    procedure DeleteFile(FileName: Text) Success: Boolean
}