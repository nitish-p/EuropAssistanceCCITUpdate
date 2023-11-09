Report 50076 "Auto Knockoff CLE Credit"
{
    Permissions = TableData "Cust. Ledger Entry" = rimd;
    ProcessingOnly = true;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            CalcFields = "Remaining Amount";
            DataItemTableView = sorting("Posting Date") order(ascending) where("Document Type" = filter(Invoice), "Remaining Amount" = filter(<> 0));
            RequestFilterFields = "Customer No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //MESSAGE('1--%1',"Cust. Ledger Entry"."Customer No.");
                RemAmt := Abs("Cust. Ledger Entry"."Remaining Amount");
                while RemAmt <> 0 do begin
                    RecCustLedEntry.Reset();
                    RecCustLedEntry.SetCurrentkey("Posting Date");
                    RecCustLedEntry.SetRange("Document Type", RecCustLedEntry."document type"::"Credit Memo");
                    RecCustLedEntry.SetRange("Customer No.", "Cust. Ledger Entry"."Customer No.");
                    RecCustLedEntry.SetRange(Open, true);
                    RecCustLedEntry.CalcFields("Remaining Amount");
                    RecCustLedEntry.SetFilter("Remaining Amount", '<>%1', 0);
                    RecCustLedEntry.SetFilter("Applies-to ID", '%1', '');
                    RecCustLedEntry.SetRange("Posting Date", 20160101D, 20210331D);
                    if RecCustLedEntry.Find('-') then begin
                        //MESSAGE('2--%1',RecCustLedEntry."Document No.");
                        RecCustLedEntry.CalcFields("Remaining Amount");
                        RecCustLedEntry."Applies-to ID" := UserId;
                        if Abs("Cust. Ledger Entry"."Remaining Amount") > Abs(RecCustLedEntry."Remaining Amount") then begin
                            RecCustLedEntry."Amount to Apply" := -1 * Abs(RecCustLedEntry."Remaining Amount");
                            RemAmt := RemAmt - Abs(RecCustLedEntry."Remaining Amount");
                        end else begin
                            RecCustLedEntry."Amount to Apply" := -1 * Abs("Cust. Ledger Entry"."Remaining Amount");
                            RemAmt := RemAmt - Abs("Cust. Ledger Entry"."Remaining Amount");
                        end;

                        RecCustLedEntry.Modify;

                    end else begin

                        //CustEntryApplyPostEntries.ApplyCustEntryFormEntry2("Cust. Ledger Entry","Application Date");//--Naveen
                        CurrReport.Skip;
                    end;

                end;
                //CustEntryApplyPostEntries.ApplyCustEntryFormEntry2("Cust. Ledger Entry","Application Date");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Application Date : "; "Application Date")
                {
                    ApplicationArea = Basic;
                }
            }
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
        Message('Done....');
    end;

    trigger OnPreReport()
    begin
        if "Application Date" = 0D then
            Error('Please enter Application Date');
    end;

    var
        CustEntryApplyPostEntries: Codeunit "CustEntry-Apply Posted Entries";
        RecCLE: Record "Cust. Ledger Entry";
        RecCLE1: Record "Cust. Ledger Entry";
        RemAmt: Decimal;
        RecCustLedEntry: Record "Cust. Ledger Entry";
        "Application Date": Date;
}

