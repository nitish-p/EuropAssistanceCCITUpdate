XmlPort 50019 "Import Rollup File"
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
            tableelement("Fin Scan Vendor Bridge";"Fin Scan Vendor Bridge")
            {
                XmlName = 'FinScanVendorBridge';
                SourceTableView = sorting("Entry No.") order(ascending);
                fieldelement(Source_Code;"Fin Scan Vendor Bridge"."Source Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Record_ID;"Fin Scan Vendor Bridge"."Record ID")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Full_Name;"Fin Scan Vendor Bridge"."Full Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Country;"Fin Scan Vendor Bridge".Country)
                {
                    MinOccurs = Zero;
                }
                fieldelement(National_ID;"Fin Scan Vendor Bridge"."National ID")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Comment1;"Fin Scan Vendor Bridge"."Comment 1")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Comment2;"Fin Scan Vendor Bridge"."Comment 2")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Screening_Result;"Fin Scan Vendor Bridge"."Screening Result")
                {
                    MinOccurs = Zero;
                }
                fieldelement(National_Tax_No;"Fin Scan Vendor Bridge"."National Tax No")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DUNS_Number;"Fin Scan Vendor Bridge"."DUNS Number")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Industry_Code;"Fin Scan Vendor Bridge"."Industry Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement("Duplicates-Chain_ID";"Fin Scan Vendor Bridge"."Duplicates Chain ID")
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    FinScanBrd.Reset;
                    FinScanBrd.SetCurrentkey("Entry No.");
                    FinScanBrd.Ascending(true);
                    FinScanBrd.SetFilter("Entry No.",'<>%1',0);
                    if FinScanBrd.FindLast then begin
                      LastEntryNo:=FinScanBrd."Entry No."+1;
                    end else begin
                      LastEntryNo:=1;
                    end;

                    "Fin Scan Vendor Bridge"."Entry No.":=LastEntryNo;
                    "Fin Scan Vendor Bridge"."Inserted On":=CurrentDatetime;
                    "Fin Scan Vendor Bridge"."Rollup File Name":=currXMLport.Filename;
                    "Fin Scan Vendor Bridge".Type:="Fin Scan Vendor Bridge".Type::Rollup;

                    Vendor.Reset;
                    Vendor.SetRange("Record ID","Fin Scan Vendor Bridge"."Record ID");
                    if Vendor.FindFirst then begin

                      Vendor."Rollup File Name":=currXMLport.Filename;
                      Vendor."Last Rollup Updated On":=CurrentDatetime;
                      Vendor.Validate("Screening Result","Fin Scan Vendor Bridge"."Screening Result");
                      Vendor."National Tax No":="Fin Scan Vendor Bridge"."National Tax No";
                      Vendor."DUNS Number":="Fin Scan Vendor Bridge"."DUNS Number";
                      Vendor."Industry Code":="Fin Scan Vendor Bridge"."Industry Code";
                      Vendor."Duplicates Chain ID":="Fin Scan Vendor Bridge"."Duplicates Chain ID";
                      Vendor.Modify;

                    end;
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


        //MESSAGE('Imported Rollup File Successfully.');
    end;

    var
        Vendor: Record Vendor;
        FinScanBrd: Record "Fin Scan Vendor Bridge";
        LastEntryNo: Integer;
        VendorCode: Code[30];
        //GenJnlPost: Codeunit "Gen. Jnl.-Post";//Naveen
        // SMTPSetup: Record "SMTP Mail Setup";//Naveen
        // SMTPMail: Codeunit UnknownCodeunit400;//naveen
        // ServerInstance: Record "Server Instance";//Naveen
        EmailUserName: Text[20];
        SmtpEmail: Text[100];
        VendorPostGrp: Record "Vendor Posting Group";
        CompInfo: Record "Company Information";
}

