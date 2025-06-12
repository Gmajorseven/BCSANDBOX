page 50105 Condition
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(age; age)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the age.';
                    Editable = true;
                    trigger OnValidate()
                    begin
                        case age of
                            0 .. 17:
                                Message('You are a minor.');
                            18 .. 64:
                                Message('You are an adult.');
                            65 .. 120:
                                Message('You are a senior citizen.');
                            else
                                Error('Invalid age entered.');
                        end;
                    end;
                }
                field("Customer No."; customerNo)
                {
                    ApplicationArea = All;
                    TableRelation = Customer."No.";
                    ToolTip = 'Select a customer.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowCustomer)
            {
                ApplicationArea = All;
                Caption = 'Show Customer';
                ToolTip = 'Display customer details based on the selected customer number.';
                trigger OnAction()
                var
                    CustomerRecord: Record Customer;
                begin
                    if CustomerRecord.Get(customerNo) then begin
                        Message('Customer: %1', CustomerRecord.Name);
                    end else
                        Message('Customer not found.');
                end;
            }
        }
    }

    var
        age: Integer;
        customerNo: Code[20];
}