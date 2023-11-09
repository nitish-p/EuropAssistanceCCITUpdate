XmlPort 50031 "ICICI UTR Upload"
{
    Direction = Export;
    FieldSeparator = '<TAB>';
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(ExportBankFIle)
        {
            tableelement(Integer;Integer)
            {
                XmlName = 'Integer';
                textelement(DebitAccNo)
                {
                }
                textelement(BeneficiaryAcNo)
                {
                }
                textelement(BeneficiaryName)
                {
                }
                textelement(Amount)
                {
                }
                textelement(PayMod)
                {
                }
                textelement(Date)
                {
                }
                textelement(IFSC)
                {
                }
                textelement(PrintLoaction)
                {
                }
                textelement(BeneMobileNo)
                {
                }
                textelement(BeneEmailId)
                {
                }
                textelement(BeneAdd1)
                {
                }
                textelement(BeneAdd2)
                {
                }
                textelement(BeneAdd3)
                {
                }
                textelement(BeneAdd4)
                {
                }
                textelement(AddDetails1)
                {
                }
                textelement(AddDetails2)
                {
                }
                textelement(AddDetails3)
                {
                }
                textelement(AddDetails4)
                {
                }
                textelement(AddDetails5)
                {
                }
                textelement(Remarks)
                {
                }
                textelement(PaymentRefNo)
                {
                }
                textelement(Status)
                {
                }
                textelement(LiquidationDate)
                {
                }
                textelement(CustomerRefNo)
                {
                }
                textelement(InstrumentRefNo)
                {
                }
                textelement(InstrumentNo)
                {
                }
                textelement(UTRNO)
                {
                }
            }
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

    trigger OnPostXmlPort()
    begin
        Message('UTR Uploaded');
    end;

    var
        BankAcc: Record "Bank Account";
        VLE: Record "Vendor Ledger Entry";
        VendorBankAcc: Record "Vendor Bank Account";
        recVendor: Record Vendor;
        BankAccLedEntry: Record "Bank Account Ledger Entry";
}

