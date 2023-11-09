Report 50023 "Payment Sheet"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payment Sheet.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.") order(ascending) where("Bal. Account Type" = const(Vendor));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(PostingDate_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Posting Date")
            {
            }
            column(DocumentDate_BankAccountLedgerEntry; "Bank Account Ledger Entry"."Document Date")
            {
            }
            column(Amount_BankAccountLedgerEntry; "Bank Account Ledger Entry".Amount)
            {
            }
            column(BankName; BankName)
            {
            }
            column(AccHolderName; AccHolderName)
            {
            }
            column(AccNo; AccNo)
            {
            }
            column(IFSC; IFSC)
            {
            }

            trigger OnAfterGetRecord()
            begin
                VendorCode := "Bank Account Ledger Entry"."Bal. Account No.";
                VendorBankAc.Reset;
                VendorBankAc.SetRange("Vendor No.", VendorCode);
                if VendorBankAc.FindFirst then begin
                    BankName := VendorBankAc.Address;
                    AccHolderName := VendorBankAc.Name;
                    AccNo := VendorBankAc."Bank Account No.";
                    IFSC := VendorBankAc."SWIFT Code";
                end;
            end;

            trigger OnPreDataItem()
            begin
                BankName := '';
                AccHolderName := '';
                AccNo := '';
                IFSC := '';
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
        Rec23: Record Vendor;
        BankName: Text[50];
        AccHolderName: Text[50];
        AccNo: Code[30];
        IFSC: Code[20];
        VendorCode: Code[20];
        VendorBankAc: Record "Vendor Bank Account";
}

