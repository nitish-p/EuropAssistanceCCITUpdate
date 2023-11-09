Report 50014 "PLS Id wise Bank Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PLS Id wise Bank Details.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Order Address"; "Order Address")
        {
            RequestFilterFields = "Vendor No.", "Code";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(VendorNo_OrderAddress; "Order Address"."Vendor No.")
            {
            }
            column(Code_OrderAddress; "Order Address".Code)
            {
            }
            column(LastPaymentDate; Format(LastPaymentDate))
            {
            }
            column(LastPaymentDocNo; LastPaymentDocNo)
            {
            }
            column(Name_OrderAddress; "Order Address".Name)
            {
            }
            dataitem("Vendor Bank Account"; "Vendor Bank Account")
            {
                DataItemLink = "Vendor No." = field("Vendor No.");
                column(ReportForNavId_1000000004; 1000000004)
                {
                }
                column(VendorNo_VendorBankAccount; "Vendor Bank Account"."Vendor No.")
                {
                }
                column(Code_VendorBankAccount; "Vendor Bank Account".Code)
                {
                }
                column(Name_VendorBankAccount; "Vendor Bank Account".Name)
                {
                }
                column(BankAccountNo_VendorBankAccount; "Vendor Bank Account"."Bank Account No.")
                {
                }
                column(SWIFTCode_VendorBankAccount; "Vendor Bank Account"."SWIFT Code")
                {
                }
                column(DefaultAccount_VendorBankAccount; "Vendor Bank Account"."Default Account")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                LastPaymentDate := 0D;
                LastPaymentDocNo := '';
                recVendledEntry.Reset;
                recVendledEntry.SetCurrentkey("Vendor No.", "Posting Date", "Currency Code");
                recVendledEntry.Ascending(true);
                recVendledEntry.SetRange("Vendor No.", "Order Address"."Vendor No.");
                recVendledEntry.SetRange(recVendledEntry."Document Type", recVendledEntry."document type"::Payment);
                if recVendledEntry.FindLast then begin
                    LastPaymentDate := recVendledEntry."Posting Date";
                    LastPaymentDocNo := recVendledEntry."Document No.";
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
        recVendledEntry: Record "Vendor Ledger Entry";
        LastPaymentDate: Date;
        LastPaymentDocNo: Code[20];
}

