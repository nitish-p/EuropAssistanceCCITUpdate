Report 50103 UpdateGSTAmt1
{
    Permissions = TableData "Cust. Ledger Entry"=rimd;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Cust. Ledger Entry";"Cust. Ledger Entry")
        {
            DataItemTableView = where("Document Type"=filter(Invoice|"Credit Memo"),"Posting Date"=filter('01/01/22..23/02/22'));
            RequestFilterFields = "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //MESSAGE('%1',"Cust. Ledger Entry"."Document No.");
                GSTAmt:=0;
                TaxableAmt := 0;
                  GSTLedgerEntry.Reset;
                  GSTLedgerEntry.SetRange("Document No.","Cust. Ledger Entry"."Document No.");
                  if GSTLedgerEntry.FindSet then repeat
                    GSTAmt:=GSTAmt+GSTLedgerEntry."GST Amount";
                  until GSTLedgerEntry.Next = 0;

                  "Cust. Ledger Entry"."GST Amount" := (-1)*GSTAmt;


                 if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."document type"::Invoice then
                 begin
                    RecSIH.Reset;
                    RecSIH.SetRange(RecSIH."No.","Cust. Ledger Entry"."Document No.");
                    if RecSIH.FindFirst then
                    begin
                       RecSIH.CalcFields(Amount);
                       TaxableAmt := RecSIH.Amount;
                    end;
                 end else if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."document type"::"Credit Memo" then
                 begin
                    RecSCMH.Reset;
                    RecSCMH.SetRange(RecSCMH."No.","Cust. Ledger Entry"."Document No.");
                    if RecSCMH.FindFirst then
                    begin
                       RecSCMH.CalcFields(Amount);
                       TaxableAmt := RecSCMH.Amount;
                    end;
                 end;
                  "Cust. Ledger Entry"."Taxable Value" := TaxableAmt;
                  //MESSAGE('%1  %2',"Cust. Ledger Entry"."GST Amount","Cust. Ledger Entry"."Taxable Value");
                  "Cust. Ledger Entry".Modify;
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
        Message('Done....');
    end;

    var
        GSTAmt: Decimal;
        TaxableAmt: Decimal;
        GSTLedgerEntry: Record "GST Ledger Entry";
        RecSIH: Record "Sales Invoice Header";
        RecSCMH: Record "Sales Cr.Memo Header";
}

