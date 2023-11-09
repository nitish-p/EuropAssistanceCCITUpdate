XmlPort 50017 "IMPS Error log"
{
    Direction = Export;
    //Encoding = UTF8;
    FileName = 'ErrorLog.csv';
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement("B2B Monthwise Client Invoicing";"B2B Monthwise Client Invoicing")
            {
                XmlName = 'IMPSimport';
                fieldelement(IMPSReferenceNo;"B2B Monthwise Client Invoicing"."Entry No.")
                {
                }
                fieldelement(RequestId;"B2B Monthwise Client Invoicing"."Case ID")
                {
                }
                fieldelement(TransactionDate;"B2B Monthwise Client Invoicing"."Client Name")
                {
                }
                fieldelement(TransactionType;"B2B Monthwise Client Invoicing"."Invoicing Month")
                {
                }
                fieldelement(TransactionInfo;"B2B Monthwise Client Invoicing"."Amount For Policies")
                {
                }
                fieldelement(RemitterMobileNumber;"B2B Monthwise Client Invoicing"."NAV Dealer Code")
                {
                }
                fieldelement(RemitterMMID;"B2B Monthwise Client Invoicing"."NAV Dealer Name")
                {
                }
                fieldelement(RemitterName;"B2B Monthwise Client Invoicing"."Start Date")
                {
                }
                fieldelement(BeneficiaryName;"B2B Monthwise Client Invoicing"."End Date")
                {
                }
                fieldelement(BeneMerchantMobileNumber;"B2B Monthwise Client Invoicing"."Invoice Pdf")
                {
                }
                fieldelement(BeneMerchantMMID;"B2B Monthwise Client Invoicing".Particulars)
                {
                }
                fieldelement(PaymentRefNumber;"B2B Monthwise Client Invoicing"."Active Policies")
                {
                }
                fieldelement(MCC;"B2B Monthwise Client Invoicing"."Client Id")
                {
                }
                fieldelement(Amount;"B2B Monthwise Client Invoicing"."Dealer Id")
                {
                }
                fieldelement(DebitAccounNumber;"B2B Monthwise Client Invoicing"."Dealer Code")
                {
                }
                fieldelement(CreditAccountNumber;"B2B Monthwise Client Invoicing"."Posted Invoice No.")
                {
                }
                fieldelement(Status;"B2B Monthwise Client Invoicing"."Posted Invoice Amount")
                {
                }
                fieldelement(MSPID;"B2B Monthwise Client Invoicing"."Digital Invoice")
                {
                }
                fieldelement(ResponseCode;"B2B Monthwise Client Invoicing"."Transaction Type")
                {
                }
                fieldelement(Description;"B2B Monthwise Client Invoicing"."Invoice Posted")
                {
                }
                fieldelement(ReversalFlag;"B2B Monthwise Client Invoicing"."Posting Date")
                {
                }
                /*fieldelement(RemitterAccountNumber;"B2B Monthwise Client Invoicing".Field22)
                {
                }
                fieldelement(BeneficiaryAccountNumber;"B2B Monthwise Client Invoicing".Field23)
                {
                }
                fieldelement(BeneIFSC;"B2B Monthwise Client Invoicing".Field24)
                {
                }
                fieldelement(TransactionCurrency;"B2B Monthwise Client Invoicing".Field25)
                {
                }
                fieldelement(ErrorDescription;"B2B Monthwise Client Invoicing".Field29)
                {
                }*///Naveen
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

    local procedure ValidatedRawData(CASEID: Code[250])
    var
        RawUpdateLog: Record "Raw Update Log";
        FoundError: Boolean;
        RawUpdateLog2: Record "Raw Update Log";
    begin
    end;
}

