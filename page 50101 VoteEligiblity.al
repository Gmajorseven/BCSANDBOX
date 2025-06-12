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

    actions
    {
        area(Processing)
        {
            action(TryforLoop)
            {
                ApplicationArea = All;
                Caption = 'Try For Loop';
                trigger OnAction()
                begin
                    Tryfor();
                end;
            }

            action(TryforDowntoLoop)
            {
                ApplicationArea = All;
                Caption = 'Try For Downto Loop';
                trigger OnAction()
                begin
                    Tryfordownto();
                end;
            }
            action(TryforeachLoop)
            {
                ApplicationArea = All;
                Caption = 'Try Foreach Loop';
                trigger OnAction()
                begin
                    Tryforeach();
                end;
            }
            action(TrywhileLoop)
            {
                ApplicationArea = All;
                Caption = 'Try While Loop';
                trigger OnAction()
                begin
                    Trywhile();
                end;
            }
            action(TryrepeatLoop)
            {
                ApplicationArea = All;
                Caption = 'Try Repeat Loop';
                trigger OnAction()
                begin
                    Tryrepeat();
                end;
            }
        }
    }
    local procedure Tryfor()
    begin
        total := 0;
        for intCount := 1 to 5 do
            total := total + 3;
        Message('Total is: %1', total);
    end;

    local procedure Tryfordownto()
    begin
        sales[1] := 100;
        sales[2] := 200;
        sales[3] := 300;
        sales[4] := 400;
        sales[5] := 500;

        totalSales := 0;
        for intCount1 := 5 downto 1 do
            totalSales := totalSales + sales[intCount1];
        Message('Total Sales is: %1', totalSales);

    end;

    local procedure Tryforeach()
    begin
        stringList.Add('Foo Bar');
        stringList.Add('Visual Studio Code');
        stringList.Add('Notepad++');
        stringList.Add('Vim');
        foreach stringItem in stringList do begin
            index := index + 1;
            Message('Item %1: %2', index, stringItem);
        end;
    end;

    local procedure Trywhile()
    var
        index: Integer;
        totalSales: Integer;
        sales: array[5] of Integer;
    begin
        index := 0;
        totalSales := 0;
        sales[1] := 100;
        sales[2] := 200;
        sales[3] := 300;
        sales[4] := 400;
        sales[5] := 500;
        while index < 5 do begin
            totalSales := totalSales + sales[index + 1];
            index := index + 1;
        end;
        Message('Total Sales is: %1', totalSales);
    end;

    local procedure Tryrepeat()
    var
        index: Integer;
        totalSales: Integer;
        sales: array[5] of Integer;
    begin
        sales[1] := 100;
        sales[2] := 200;
        sales[3] := 300;
        sales[4] := 400;
        sales[5] := 500;
        repeat
            index := index + 1;
            totalSales := totalSales + sales[index];
        until index = 5;
        Message('Total Sales is: %1', totalSales);
    end;

    var
        age: Integer;
        text001: Label ' You are not eligible to vote.';
        text002: Label ' You are eligible to vote.';
        total: Integer;
        intCount: Integer;
        intCount1: Integer;
        totalSales: Integer;
        sales: array[5] of Integer;

        stringList: List of [Text[100]];
        stringItem: Text[100];

        index: Integer;
}