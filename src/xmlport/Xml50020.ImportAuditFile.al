XmlPort 50020 "Import Audit File"
{
    Direction = Import;
    FieldDelimiter = '<None>';
    FieldSeparator = '|';
    Format = VariableText;

    schema
    {
        textelement(InputFIle)
        {
            tableelement("Fin Scan Vendor Bridge";"Fin Scan Vendor Bridge")
            {
                XmlName = 'FinScanVendorBridge';
                SourceTableView = sorting("Entry No.") order(ascending) where(Exported=const(false));
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
                fieldelement(Scannin_Reason;"Fin Scan Vendor Bridge"."Status Reason")
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
                fieldelement(Dow_Jones_List_ID;"Fin Scan Vendor Bridge"."Dow Jones List ID")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Due_Diligence_Date;"Fin Scan Vendor Bridge"."Due Diligence Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(User_License_ID;"Fin Scan Vendor Bridge"."User License ID")
                {
                    MinOccurs = Zero;
                }
                fieldelement(User_Name;"Fin Scan Vendor Bridge"."User Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(User_Comments;"Fin Scan Vendor Bridge"."User Comments")
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
                    "Fin Scan Vendor Bridge".Type:="Fin Scan Vendor Bridge".Type::Audit;
                    "Fin Scan Vendor Bridge"."Audit File Names":=currXMLport.Filename;

                    Vendor.Reset;
                    Vendor.SetRange("Record ID","Fin Scan Vendor Bridge"."Record ID");
                    if Vendor.FindFirst then begin

                      Vendor."Status Reason":="Fin Scan Vendor Bridge"."Status Reason";
                      Vendor."Audit File Name":=currXMLport.Filename;
                      Vendor."Last Audit Updated On":=CurrentDatetime;
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
        //MESSAGE('Imported Audit File Successfully.');
    end;

    var
        Vendor: Record Vendor;
        FinScanBrd: Record "Fin Scan Vendor Bridge";
        LastEntryNo: Integer;
        VendorCode: Code[20];
}

