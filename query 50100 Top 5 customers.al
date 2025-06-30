query 50100 "Top 5 Customers"
{
    QueryType = Normal;
    Caption = 'Top 5 Customers';
    TopNumberOfRows = 5;
    OrderBy = descending(Sales__LCY_Sum);
    QueryCategory = 'Customer List';

    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {

            filter(Posting_Date; "Posting Date")
            {
                Caption = 'Posting Date';
            }
            column(Customer_No; "Customer No.")
            {
                Caption = 'Customer No.';
            }
            column(Customer_Name; "Customer Name")
            {
                Caption = 'Customer Name';
            }
            column(Sales__LCY_Sum; "Sales (LCY)")
            {
                Method = Sum;

            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}