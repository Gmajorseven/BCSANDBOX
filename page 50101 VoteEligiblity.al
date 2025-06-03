page 50101 VoteEligiblity
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
                field(Age; age)
                {
                    ApplicationArea = All;
                    Caption = 'Enter Your Age';
                    ToolTip = 'Enter your age to check voting eligibility.';
                    trigger OnValidate()
                    begin
                        if age <= 18 then
                            Message(text001)
                        else
                            Message(text002);
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
        text001: Label ' You are not eligible to vote.';
        text002: Label ' You are eligible to vote.';
}