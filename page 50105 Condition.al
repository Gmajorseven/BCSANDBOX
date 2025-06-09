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
                                Message('Invalid age entered.');
                        end;
                    end;
                }
            }
        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }

    var
        age: Integer;
}