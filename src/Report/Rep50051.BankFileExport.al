Report 50051 "Bank File Export"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank File Export.rdl';
    Permissions = TableData "Bank Account Ledger Entry" = rimd;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.") order(ascending) where(Select = const(true));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(DebitAcNo; DebitAcNo)
            {
            }
            column(BeneficiaryAcNo; BeneficiaryAcNo)
            {
            }
            column(BeneficiaryName; BeneficiaryName)
            {
            }
            column(Amount_BankAccountLedgerEntry; "Bank Account Ledger Entry".Amount)
            {
            }
            column(PayMod; PayMod)
            {
            }
            column(DATE1; Format(DATE1))
            {
            }
            column(IFSC; IFSC)
            {
            }
            column(AddDetails5; AddDetails5)
            {
            }
            column(Remarks; Remarks)
            {
            }
            column(AddDetails4; AddDetails4)
            {
            }

            trigger OnAfterGetRecord()
            begin

                DebitAcNo := '';
                BeneficiaryAcNo := '';
                BeneficiaryName := '';
                PayMod := '';
                DATE1 := 0D;
                IFSC := '';
                AddDetails4 := 0;
                AddDetails5 := '';
                Remarks := '';


                BankAcc.Reset;
                BankAcc.SetRange("No.", 'BANK0001');
                if BankAcc.FindFirst then begin
                    DebitAcNo := BankAcc."Bank Account No.";
                end;


                VLE.Reset;
                VLE.SetRange(VLE."Document Type", VLE."document type"::Payment);
                VLE.SetRange("Transaction No.", "Bank Account Ledger Entry"."Transaction No.");
                if VLE.FindFirst then begin

                    VendorBankAcc.Reset;
                    VendorBankAcc.SetRange("Vendor No.", VLE."Vendor No.");
                    VendorBankAcc.SetRange("Default Account", true);
                    if VendorBankAcc.FindFirst then begin
                        BeneficiaryAcNo := VendorBankAcc."Bank Account No.";
                        BeneficiaryName := VendorBankAcc.Name;
                        IFSC := VendorBankAcc."SWIFT Code";
                    end;

                    if CopyStr(IFSC, 1, 4) = 'ICIC' then begin
                        PayMod := 'I';
                    end else begin
                        if Abs("Bank Account Ledger Entry".Amount) > 100000 then begin
                            PayMod := 'N';
                        end;
                        if Abs("Bank Account Ledger Entry".Amount) <= 100000 then begin
                            PayMod := 'M';
                        end;
                    end;


                    DATE1 := "Bank Account Ledger Entry"."Posting Date";
                    AddDetails5 := VLE."Vendor No.";
                    recVendor.Reset;
                    recVendor.SetRange("No.", VLE."Vendor No.");
                    if recVendor.FindFirst then begin
                        Remarks := recVendor.Name;
                    end;

                end;

                AddDetails4 := "Bank Account Ledger Entry"."Entry No.";
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
        BankAccLedEntry.Reset;
        BankAccLedEntry.SetRange(Select, true);
        if BankAccLedEntry.FindSet then
            repeat
                BankAccLedEntry.Select := false;
                BankAccLedEntry.Modify;
            until BankAccLedEntry.Next = 0;
    end;

    var
        BankAcc: Record "Bank Account";
        VLE: Record "Vendor Ledger Entry";
        VendorBankAcc: Record "Vendor Bank Account";
        DebitAcNo: Text[30];
        BeneficiaryAcNo: Text[30];
        BeneficiaryName: Text[100];
        Amount: Text;
        PayMod: Text[1];
        DATE1: Date;
        IFSC: Code[20];
        AddDetails5: Text[20];
        Remarks: Text[100];
        recVendor: Record Vendor;
        BankAccLedEntry: Record "Bank Account Ledger Entry";
        AddDetails4: Integer;
}

