page 50104 "List and Dictionary"
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
            action(List)
            {
                ApplicationArea = All;
                Caption = 'List Example';
                trigger OnAction()
                var
                    EmployeeNames: List of [Text[50]];
                    EmployeeAges: List of [Integer];
                begin
                    EmployeeNames.Add('John Doe');
                    EmployeeNames.Add('Jane Smith');
                    EmployeeNames.Add('Alice Johnson');
                    EmployeeAges.Add(30);
                    EmployeeAges.Add(25);
                    EmployeeAges.Add(28);

                    Message('Employee Names: %1', EmployeeNames.Get(2));
                end;
            }
            action(Dictionary)
            {
                ApplicationArea = All;
                Caption = 'Dictionary Example';
                trigger OnAction()
                var
                    EmployeeDict: Dictionary of [Code[50], Integer];
                begin
                    EmployeeDict.Add('John Doe', 30);
                    EmployeeDict.Add('Jane Smith', 25);
                    EmployeeDict.Add('Alice Johnson', 28);

                    if EmployeeDict.ContainsKey('Jane Smith') then
                        Message('Jane Smith is %1 years old.', EmployeeDict.Get('Jane Smith'))
                    else
                        Message('Jane Smith not found in the dictionary.');
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
        myInt: Integer;
}