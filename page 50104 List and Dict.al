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
                    EmployeeDict: Dictionary of [Integer, Text[50]];
                    EmployeeAges: Dictionary of [Integer, Integer];
                    i: Integer;
                    name: Text[50];
                    age: Integer;
                begin
                    EmployeeDict.Add(1, 'John Doe');
                    EmployeeDict.Add(2, 'Jane Smith');
                    EmployeeDict.Add(3, 'Alice Johnson');
                    EmployeeDict.Add(4, 'Bob Brown');
                    EmployeeDict.Add(5, 'Charlie White');
                    EmployeeDict.Add(6, 'Diana Green');
                    EmployeeDict.Add(7, 'Eve Black');
                    EmployeeDict.Add(8, 'Frank Blue');
                    EmployeeAges.Add(1, 30);
                    EmployeeAges.Add(2, 25);
                    EmployeeAges.Add(3, 28);
                    EmployeeAges.Add(4, 35);
                    EmployeeAges.Add(5, 40);
                    EmployeeAges.Add(6, 22);
                    EmployeeAges.Add(7, 29);
                    EmployeeAges.Add(8, 31);

                    for i := 1 to EmployeeDict.Count() do begin
                        name := EmployeeDict.Get(i);
                        age := EmployeeAges.Get(i);
                        Message('Employee %1 is %2 years old', name, age);
                    end;
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