query 50100 "Top 10 Customers"
{
    QueryType = Normal;
    Caption = 'Top 10 Customers';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
            column(City; City)
            {

            }
            column(Balance; Balance)
            {

            }
            column(SalesAmount; Amount)
            {

            }
            filter(SalesAmountFilter; Amount)
            {
                // Example filter to show only customers with sales amount greater than 1000
                // Filter = '>1000';
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}