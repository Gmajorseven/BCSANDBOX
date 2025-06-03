page 50100 ArithmeticOperators
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
                field("Nubmer 1"; Number1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the first number.';
                }
                field("Number 2"; Number2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the second number.';
                }
                field(Result; Result)
                {
                    ApplicationArea = All;
                    ToolTip = 'Result of the arithmetic operation.';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Addition)
            {
                ApplicationArea = All;
                Caption = 'Addition';
                Image = Add;

                trigger OnAction()
                begin
                    Result := Number1 + Number2;
                end;
            }
            action(Subtraction)
            {
                ApplicationArea = All;
                Caption = 'Subtraction';
                Image = Subtract;

                trigger OnAction()
                begin
                    Result := Number1 - Number2;
                end;
            }
            action(Multiplication)
            {
                ApplicationArea = All;
                Caption = 'Multiplication';
                Image = Multiply;

                trigger OnAction()
                begin
                    Result := Number1 * Number2;
                end;
            }
            action(Division)
            {
                ApplicationArea = All;
                Caption = 'Division';
                Image = Divide;

                trigger OnAction()
                begin
                    if Number2 <> 0 then
                        Result := Number1 / Number2
                    else
                        Message('Cannot divide by zero.');
                end;
            }
            action(Modulus)
            {
                ApplicationArea = All;
                Caption = 'Modulus';
                Image = Modulus;

                trigger OnAction()
                begin
                    if Number2 <> 0 then
                        Result := Number1 mod Number2
                    else
                        Message('Cannot perform modulus with zero.');
                end;
            }
            action(Reset)
            {
                ApplicationArea = All;
                Caption = 'Reset';
                Image = Reset;

                trigger OnAction()
                begin
                    Number1 := 0;
                    Number2 := 0;
                    Result := 0;
                end;
            }
            action(Exit)
            {
                ApplicationArea = All;
                Caption = 'Exit';
                Image = Close;

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        Number1: Decimal;
        Number2: Decimal;
        Result: Decimal;
}
