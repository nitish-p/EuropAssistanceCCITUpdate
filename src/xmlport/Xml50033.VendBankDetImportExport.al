XmlPort 50033 "Vend Bank Det. Import/Export"
{
    Direction = Both;
    FileName = 'BankDetails.csv';
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(ImportExportVendorBankAccount)
        {
            tableelement("Vendor Bank Account";"Vendor Bank Account")
            {
                XmlName = 'VendorBankAccount';
                fieldelement(VendorNo;"Vendor Bank Account"."Vendor No.")
                {
                    FieldValidate = yes;
                    MinOccurs = Once;
                }
                fieldelement(BeneficiaryName;"Vendor Bank Account".Name)
                {
                    FieldValidate = yes;
                    MinOccurs = Once;
                }
                textelement(BankAccountNo)
                {
                    MinOccurs = Once;
                }
                fieldelement(IFSCCode;"Vendor Bank Account"."SWIFT Code")
                {
                    FieldValidate = yes;
                    MinOccurs = Once;
                }
                fieldelement(DefaultAccount;"Vendor Bank Account"."Default Account")
                {
                    MinOccurs = Zero;
                }
                textelement(VendorName)
                {
                    MinOccurs = Zero;
                }
                textelement(VendPostGrp)
                {
                    MinOccurs = Zero;
                }

                trigger OnAfterGetRecord()
                begin
                    GenLedSetup.Get('');
                    BankAccountNo:=GenLedSetup."Special Char"+"Vendor Bank Account"."Bank Account No.";

                    recVendor.Reset;
                    recVendor.SetRange("No.","Vendor Bank Account"."Vendor No.");
                    if recVendor.FindFirst then begin
                      VendPostGrp:=recVendor."Vendor Posting Group";
                      VendorName:=recVendor.Name;
                    end;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    "Vendor Bank Account"."Bank Account No.":=BankAccountNo;
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

        Message('Done');
    end;

    var
        BankAcc: Record "Bank Account";
        VLE: Record "Vendor Ledger Entry";
        VendorBankAcc: Record "Vendor Bank Account";
        recVendor: Record Vendor;
        BankAccLedEntry: Record "Bank Account Ledger Entry";
        GenLedSetup: Record "General Ledger Setup";
}

