page 50103 "Unary and Binary Operator"
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
                field(Number1; Number1)
                {
                    ApplicationArea = All;
                    Caption = 'Unary Value';
                    trigger OnValidate()
                    begin
                        // Validate the first number for unary operations
                        if Number1 < 0 then
                            Error('Unary value must be non-negative.');
                    end;
                }
                field(Number2; Number2)
                {
                    ApplicationArea = All;
                    Caption = 'Binary Value';
                }
                field(Result; Result)
                {
                    ApplicationArea = All;
                    Caption = 'Result';
                    ToolTip = 'Result of the unary or binary operation.';
                    Editable = false; // Result field is read-only
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UnaryOp)
            {
                ApplicationArea = All;
                Caption = 'Unary Operation';
                ToolTip = 'Perform a unary operation on the first number.';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := -Number1; // Example unary operation (negation)
                    Message('Unary Operation Result: %1', Result);
                end;
            }
            action(BinaryOp)
            {
                ApplicationArea = All;
                Caption = 'Binary Operation';
                ToolTip = 'Perform a binary operation on the two numbers.';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := Number1 + Number2; // Example binary operation (addition)
                    Message('Binary Operation Result: %1', Result);
                end;
            }

        }
    }

    var
        Number1: Integer;
        Number2: Integer;
        Result: Integer;
}