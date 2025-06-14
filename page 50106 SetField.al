page 50106 SetField
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
                field("Yes or No"; YesorNo)
                {
                    ApplicationArea = All;
                    Caption = 'Yes or No';
                    ToolTip = 'Select Yes or No to set the field value.';
                    Editable = true; // Allow user to change the value
                }
                field("Net Change"; Customer."Net Change")
                {
                    ApplicationArea = All;
                    Caption = 'Net Change';
                    ToolTip = 'Displays the net change for the customer.';
                    Editable = false; // This field is calculated and should not be editable
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CalculateField)
            {
                ApplicationArea = All;
                Caption = 'Calculate Field';
                Image = Calculate;
                ToolTip = 'Calculate the field value based on the current record.';

                trigger OnAction()
                begin
                    // Logic to calculate the field value
                    if (Customer.Find('-') = true) then
                        repeat
                            Customer.CalcFields(Balance, "Net Change");
                        until Customer.Next() = 0;
                    Message('Net Change %1', Customer.Balance)

                end;
            }

            action(AutoCalculate)
            {
                ApplicationArea = All;
                Caption = 'Auto Calculate';
                Image = Calculate;
                ToolTip = 'Automatically calculate the field value based on the current record.';

                trigger OnAction()
                begin
                    // Logic to auto calculate the field value
                    Customer.SetAutoCalcFields(Balance, "Net Change");
                    if (Customer.Find('-') = true) then
                        repeat
                        //Write your logic here to auto calculate the field
                        until Customer.Next() = 0;
                    Message('Net Change %1', Customer.Balance);
                end;
            }
        }
    }

    var
        Customer: Record Customer;
        YesorNo: Boolean;
}