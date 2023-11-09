Report 50106 "Delete Sales Inv11"
{
    Permissions = TableData "Sales Header" = rimd,
                  TableData "Sales Line" = rimd;
    ProcessingOnly = true;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("Document Type" = filter(Invoice));
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_1000000001; 1000000001)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Sales Line".Delete;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Message('Doc No : %1', "Sales Header"."No.");
                "Sales Header".Delete;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        Message('Done...');
    end;
}

