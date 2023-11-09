Report 50065 "PLS Id Data"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PLS Id Data.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Order Address"; "Order Address")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(VendorNo_OrderAddress; "Order Address"."Vendor No.")
            {
            }
            column(Code_OrderAddress; "Order Address".Code)
            {
            }
            column(Name_OrderAddress; "Order Address".Name)
            {
            }
            column(VendorType; VendorType)
            {
            }
            column(GSTVendor; GSTVendor)
            {
            }
            column(GSTRegNo; GSTRegNo)
            {
            }
            column(PANNo; PANNo)
            {
            }
            column(BankAccNo; BankAccNo)
            {
            }
            column(IFSCCode; IFSCCode)
            {
            }
            column(BeneficiaryName; BeneficiaryName)
            {
            }
            column(BillingAddress; BillingAddress)
            {
            }

            trigger OnAfterGetRecord()
            begin

                VendorType := '';
                GSTVendor := '';
                GSTRegNo := '';
                PANNo := '';
                BankAccNo := '';
                IFSCCode := '';
                BeneficiaryName := '';
                BillingAddress := '';

                recVendor.Reset;
                recVendor.SetRange("No.", "Order Address"."Vendor No.");
                if recVendor.FindFirst then begin
                    VendorType := recVendor."Vendor Invoice Type";
                    if recVendor."GST Vendor Type" = recVendor."gst vendor type"::Registered then begin
                        GSTVendor := 'Yes';
                        GSTRegNo := recVendor."GST Registration No.";
                    end else begin
                        GSTVendor := 'No';
                    end;
                    PANNo := recVendor."P.A.N. No.";
                    BillingAddress := recVendor.Address + ',' + recVendor."Address 2"
                end;

                VendBankAcc.Reset;
                VendBankAcc.SetRange("Vendor No.", "Order Address"."Vendor No.");
                VendBankAcc.SetRange("Default Account", true);
                if VendBankAcc.FindFirst then begin
                    BankAccNo := VendBankAcc."Bank Account No.";
                    IFSCCode := VendBankAcc."SWIFT Code";
                    BeneficiaryName := VendBankAcc.Name;
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
        VendorType: Code[20];
        GSTVendor: Text[3];
        GSTRegNo: Code[15];
        PANNo: Code[10];
        BankAccNo: Code[30];
        IFSCCode: Code[20];
        BeneficiaryName: Text[100];
        BillingAddress: Text[500];
        recVendor: Record Vendor;
        VendBankAcc: Record "Vendor Bank Account";
}

