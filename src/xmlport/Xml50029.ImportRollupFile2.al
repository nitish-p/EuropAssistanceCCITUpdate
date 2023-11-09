XmlPort 50029 "Import Rollup File2"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = '|';
    FileName = 'Dummy.txt';
    Format = VariableText;
    UseRequestPage = false;

    schema
    {
        textelement(InputFIle)
        {
            tableelement("Dealer Refund";"Dealer Refund")
            {
                XmlName = 'FinScanVendorBridge';
                fieldelement(Source_Code;"Dealer Refund"."Entry No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Record_ID;"Dealer Refund"."Case ID")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Full_Name;"Dealer Refund".Type)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Country;"Dealer Refund"."Document No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(National_ID;"Dealer Refund"."Account No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Comment1;"Dealer Refund".Amount)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Comment2;"Dealer Refund"."Bal. Account No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Screening_Result;"Dealer Refund"."External Document No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(National_Tax_No;"Dealer Refund".Narration)
                {
                    MinOccurs = Zero;
                }
                fieldelement(DUNS_Number;"Dealer Refund"."Beneficiary Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Industry_Code;"Dealer Refund"."Beneficiary Account No")
                {
                    MinOccurs = Zero;
                }
                fieldelement("Duplicates-Chain_ID";"Dealer Refund"."Beneficiary IFSC Code")
                {
                    MinOccurs = Zero;
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


        Message('Imported Rollup File Successfully.');
    end;

    var
        Vendor: Record Vendor;
        FinScanBrd: Record "Fin Scan Vendor Bridge";
        LastEntryNo: Integer;
        VendorCode: Code[30];
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
       /* SMTPSetup: Record "SMTP Mail Setup";
        SMTPMail: Codeunit UnknownCodeunit400;
        ServerInstance: Record "Server Instance";*///Naveen
        EmailUserName: Text[20];
        SmtpEmail: Text[100];
        VendorPostGrp: Record "Vendor Posting Group";
        CompInfo: Record "Company Information";
}

