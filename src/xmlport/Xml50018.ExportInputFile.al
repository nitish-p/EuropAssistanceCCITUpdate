XmlPort 50018 "Export Input File"
{
    Direction = Export;
    FieldDelimiter = '<None>';
    FieldSeparator = '|';
    FileName = 'InputFile.csv';
    Format = VariableText;
    TextEncoding = WINDOWS;

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
                }
                fieldelement(Record_ID;"Fin Scan Vendor Bridge"."Record ID")
                {
                }
                fieldelement(Status_Indicator;"Fin Scan Vendor Bridge"."Status Indicator")
                {
                }
                fieldelement(Record_Type;"Fin Scan Vendor Bridge"."Record Type")
                {
                }
                fieldelement(Gender;"Fin Scan Vendor Bridge".Gender)
                {
                }
                fieldelement(Full_Name;"Fin Scan Vendor Bridge"."Full Name")
                {
                }
                fieldelement(Address1;"Fin Scan Vendor Bridge"."Address 1")
                {
                }
                fieldelement(Address2;"Fin Scan Vendor Bridge"."Address 2")
                {
                }
                fieldelement(Address3;"Fin Scan Vendor Bridge"."Address 3")
                {
                }
                fieldelement(City;"Fin Scan Vendor Bridge".City)
                {
                }
                fieldelement(Country_State;"Fin Scan Vendor Bridge"."County / State")
                {
                }
                fieldelement(Zip_PostCode;"Fin Scan Vendor Bridge"."Zip / Postcode")
                {
                }
                fieldelement(Country;"Fin Scan Vendor Bridge".Country)
                {
                }
                fieldelement(Date_Of_Birth;"Fin Scan Vendor Bridge"."Date Of Birth")
                {
                }
                fieldelement(National_ID;"Fin Scan Vendor Bridge"."National ID")
                {
                }
                fieldelement(Additional_Field1;"Fin Scan Vendor Bridge"."Additional Field 1")
                {
                }
                fieldelement(Additional_Field2;"Fin Scan Vendor Bridge"."Additional Field 2")
                {
                }
                fieldelement(Additional_Field3;"Fin Scan Vendor Bridge"."Additional Field 3")
                {
                }
                fieldelement(Additional_Field4;"Fin Scan Vendor Bridge"."Additional Field 4")
                {
                }
                fieldelement(Additional_Field5;"Fin Scan Vendor Bridge"."Additional Field 5")
                {
                }
                fieldelement(Comment1;"Fin Scan Vendor Bridge"."Comment 1")
                {
                }
                fieldelement(Comment2;"Fin Scan Vendor Bridge"."Comment 2")
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
        Message('Exported Input File Successfully.');
    end;
}

