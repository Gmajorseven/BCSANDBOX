pageextension 50107 recxrec extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage()
    begin
        Message('On open page (Before modify), the address is: %1 ', Rec."Address");
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Message('On modify record, the address is: %1 ', Rec."Address");
        Message('On modify record, the previous address was: %1 ', xRec."Address");
    end;
}