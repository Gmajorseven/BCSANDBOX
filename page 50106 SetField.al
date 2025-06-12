page 50106 SetField
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    // layout
    // {
    //     area(Content)
    //     {
    //         group(GroupName)
    //         {
    //             field(Name; NameSource)
    //             {

    //             }
    //         }
    //     }
    // }

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
}