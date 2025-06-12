pageextension 50107 CustomerCardExt extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Processing)
        {
            action(ShowAddress)
            {
                ApplicationArea = All;
                Caption = 'Show Address';
                ToolTip = 'Display the customer address.';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Message('Customer Address: %1', Rec."Address");
                end;
            }

            action(FindCustomer)
            {
                ApplicationArea = All;
                Caption = 'Find Customer';
                ToolTip = 'Find a customer by number.';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    CustomerNo: Code[20];
                begin
                    CustomerNo := Rec."No.";
                    if CustomerRecord.Get(CustomerNo) then
                        Message(text001, CustomerRecord.Name)
                    else
                        Message(text002);
                end;
            }

            action(CountCustomers)
            {
                ApplicationArea = All;
                Caption = 'Count Customers';
                ToolTip = 'Count the number of customers.';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    count := CustomerRecord.Count();
                    Message('Total number of customers: %1', count);
                end;
            }
        }
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

    var
        CustomerRecord: Record Customer;
        text001: Label 'Record found: %1';
        text002: Label 'Record not found';
        count: Integer;
}