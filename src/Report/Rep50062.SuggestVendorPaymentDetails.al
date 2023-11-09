Report 50062 "Suggest Vendor Payment Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Suggest Vendor Payment Details.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("ICICI UTR Data"; "ICICI UTR Data")
        {
            DataItemTableView = sorting("Entry No.") order(descending) where("Add details 4" = filter(<> ''), Status = filter(<> ''));
            RequestFilterFields = "Add details 4";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Adddetails4_ICICIUTRData; "ICICI UTR Data"."Add details 4")
            {
            }
            column(Date_ICICIUTRData; CancelledDate)
            {
            }
            column(LiquidationDate_ICICIUTRData; "ICICI UTR Data"."Liquidation Date")
            {
            }
            column(Status_ICICIUTRData; "ICICI UTR Data".Status)
            {
            }
            column(VendorName_BankAccountLedgerEntry; VendorName)
            {
            }
            column(PostingDate_BankAccountLedgerEntry; Format(PostingDate))
            {
            }
            column(Amount_BankAccountLedgerEntry; PaymentAmt)
            {
            }
            column(BalAccountNo_BankAccountLedgerEntry; VendorCode)
            {
            }

            trigger OnAfterGetRecord()
            begin


                VendorCode := '';
                VendorName := '';
                PaymentAmt := 0;
                PostingDate := 0D;
                EntryNumber := 0;
                CancelledDate := '';

                if "ICICI UTR Data"."Add details 4" <> '' then begin
                    Evaluate(EntryNumber, "ICICI UTR Data"."Add details 4");
                end;

                if UpperCase("ICICI UTR Data".Status) = 'CANCELLED' then begin
                    CancelledDate := "ICICI UTR Data".Date;
                end;

                recBALE.Reset;
                recBALE.SetRange(recBALE."Document Type", recBALE."document type"::Payment);
                recBALE.SetRange("Entry No.", EntryNumber);
                recBALE.SetRange("Bank Account No.", 'BANK0001');
                if recBALE.FindFirst then begin
                    VendorCode := recBALE."Bal. Account No.";
                    VendorName := recBALE."Vendor Name";
                    PaymentAmt := Abs(recBALE.Amount);
                    PostingDate := recBALE."Posting Date";
                end;
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

    var
        VendorCode: Code[20];
        VendorName: Text;
        PaymentAmt: Decimal;
        PostingDate: Date;
        EntryNumber: Integer;
        recBALE: Record "Bank Account Ledger Entry";
        CancelledDate: Text;
}

