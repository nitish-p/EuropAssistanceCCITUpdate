XmlPort 50032 "ICICI UTR Upld"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = '|';
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(ExportBankFIle)
        {
            tableelement("ICICI UTR Data";"ICICI UTR Data")
            {
                XmlName = 'ICICIUTR';
                fieldelement(DebitAccNo;"ICICI UTR Data"."Debit Acc. No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneficiaryAcNo;"ICICI UTR Data"."Beneficiary A/c No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneficiaryName;"ICICI UTR Data"."Beneficiary Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Amount;"ICICI UTR Data".Amount)
                {
                    MinOccurs = Zero;
                }
                fieldelement(PayMod;"ICICI UTR Data"."Payment Mod")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Date;"ICICI UTR Data".Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(IFSC;"ICICI UTR Data"."IFSC Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PayableLocName;"ICICI UTR Data"."Payable Location Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PrintLoaction;"ICICI UTR Data"."Print Location Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneMobileNo;"ICICI UTR Data"."Bene Mobile No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneEmailId;"ICICI UTR Data"."Bene Email Id")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneAdd1;"ICICI UTR Data"."Bene Add 1")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneAdd2;"ICICI UTR Data"."Bene Add 2")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneAdd3;"ICICI UTR Data"."Bene Add 3")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BeneAdd4;"ICICI UTR Data"."Bene Add 4")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AddDetails1;"ICICI UTR Data"."Add details 1")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AddDetails2;"ICICI UTR Data"."Add details 2")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AddDetails3;"ICICI UTR Data"."Add details 3")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AddDetails4;"ICICI UTR Data"."Add details 4")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AddDetails5;"ICICI UTR Data"."Add details 5")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Remarks;"ICICI UTR Data".Remarks)
                {
                    MinOccurs = Zero;
                }
                fieldelement(PaymentRefNo;"ICICI UTR Data"."Payment Ref. No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Status;"ICICI UTR Data".Status)
                {
                    MinOccurs = Zero;
                }
                fieldelement(LiquidationDate;"ICICI UTR Data"."Liquidation Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(CustomerRefNo;"ICICI UTR Data"."Customer Ref. No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(InstrumentRefNo;"ICICI UTR Data"."Instrument Ref. No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(InstrumentNo;"ICICI UTR Data"."Instrument No.")
                {
                    MinOccurs = Zero;
                }
                textelement(UTRNO)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    "ICICI UTR Data"."File Name":=currXMLport.Filename;
                end;
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
        //MESSAGE('UTR Updated');
    end;

    trigger OnPreXmlPort()
    begin
        //rec50012.DELETEALL;
    end;

    var
        BankAcc: Record "Bank Account";
        VLE: Record "Vendor Ledger Entry";
        VendorBankAcc: Record "Vendor Bank Account";
        recVendor: Record Vendor;
        BankAccLedEntry: Record "Bank Account Ledger Entry";
        rec50012: Record "ICICI UTR Data";
        CRLF: Text[2];
}

