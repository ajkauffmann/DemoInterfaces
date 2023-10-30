page 60600 FileConnectorSetupAJK
{
    PageType = Card;
    Caption = 'File Connector Setup';
    SourceTable = FileConnectorSetupAJK;
    InsertAllowed = false;
    DeleteAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            field(Connector; Rec.Connector) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SaveFile)
            {
                Caption = 'Save File';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FileConnectorAJK: Codeunit FileConnectorAJK;
                begin
                    FileConnectorAJK.SaveFile('Test.txt', 'Hello World!', Rec.Connector);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}