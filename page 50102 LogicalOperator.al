page 50102 LogicalOperator
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
                field(Subj1; Subj1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Subject 1';
                }
                field(Subj2; Subj2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Subject 2';
                }
                field(Subj3; Subj3)
                {
                    ApplicationArea = All;
                    ToolTip = 'Subject 3';
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Result)
            {
                ApplicationArea = All;
                Caption = 'Calculate Result';
                ToolTip = 'Calculate the result based on the logical operation of the subjects.';
                Image = Calculate;

                trigger OnAction()
                var
                    LogicalOperator: Code[10];
                begin
                    LogicalOperator := 'OR'; // Example operator, can be changed to OR or NOT
                    case LogicalOperator of
                        'AND':
                            if (Subj1 > 0) and (Subj2 > 0) and (Subj3 > 0) then
                                result := 'All True'
                            else
                                result := 'Not All True';
                        'OR':
                            if (Subj1 > 0) or (Subj2 > 0) or (Subj3 > 0) then
                                result := 'At Least One True'
                            else
                                result := 'None True';
                        'NOT':
                            if not ((Subj1 > 0) or (Subj2 > 0) or (Subj3 > 0)) then
                                result := 'All False'
                            else
                                result := 'Some True';
                        else
                            result := 'Unknown Operator';
                    end;
                    Message('Result: %1', result);
                end;
            }
        }
    }

    var
        Subj1: Integer;
        Subj2: Integer;
        Subj3: Integer;
        result: Text[100];
}