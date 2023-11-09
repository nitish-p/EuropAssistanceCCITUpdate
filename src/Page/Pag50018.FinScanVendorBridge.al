Page 50018 "Fin Scan Vendor Bridge"
{
    Editable = false;
    PageType = List;
    SourceTable = "Fin Scan Vendor Bridge";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Source Code"; rec."Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Record ID"; rec."Record ID")
                {
                    ApplicationArea = Basic;
                }
                field("Status Indicator"; rec."Status Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Record Type"; rec."Record Type")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Full Name"; rec."Full Name")
                {
                    ApplicationArea = Basic;
                }
                field("Address 1"; rec."Address 1")
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Address 3"; rec."Address 3")
                {
                    ApplicationArea = Basic;
                }
                field(City; rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("County / State"; rec."County / State")
                {
                    ApplicationArea = Basic;
                }
                field("Zip / Postcode"; rec."Zip / Postcode")
                {
                    ApplicationArea = Basic;
                }
                field(Country; rec.Country)
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Birth"; rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field("National ID"; rec."National ID")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Field 1"; rec."Additional Field 1")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Field 2"; rec."Additional Field 2")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Field 3"; rec."Additional Field 3")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Field 4"; rec."Additional Field 4")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Field 5"; rec."Additional Field 5")
                {
                    ApplicationArea = Basic;
                }
                field("Comment 1"; rec."Comment 1")
                {
                    ApplicationArea = Basic;
                }
                field("Comment 2"; rec."Comment 2")
                {
                    ApplicationArea = Basic;
                }
                field("Inserted On"; rec."Inserted On")
                {
                    ApplicationArea = Basic;
                }
                field(Exported; rec.Exported)
                {
                    ApplicationArea = Basic;
                }
                field("Input File Name"; rec."Input File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Screening Result"; rec."Screening Result")
                {
                    ApplicationArea = Basic;
                }
                field("Rollup File Name"; rec."Rollup File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Status Reason"; rec."Status Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Audit File Names"; rec."Audit File Names")
                {
                    ApplicationArea = Basic;
                }
                field("Dow Jones List ID"; rec."Dow Jones List ID")
                {
                    ApplicationArea = Basic;
                }
                field("Due Diligence Date"; rec."Due Diligence Date")
                {
                    ApplicationArea = Basic;
                }
                field("User License ID"; rec."User License ID")
                {
                    ApplicationArea = Basic;
                }
                field("User Name"; rec."User Name")
                {
                    ApplicationArea = Basic;
                }
                field("User Comments"; rec."User Comments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
    }

    var
        FileMgt: Codeunit "File Management";
        FileName: Text[250];
        OutFile: File;
        OutS: OutStream;
        // Xmlp: XmlPort UnknownXmlPort50018;//Naveen
        Destination: Text[100];
        FinalFileName: Text[100];
        GenLedSetup: Record "General Ledger Setup";
        InputFileName: Text[100];
        Dt: Text[2];
        FinScanVendorBridge: Record "Fin Scan Vendor Bridge";
        Vendor: Record Vendor;
        Month: Code[2];
        Day: Code[2];
        Yr: Code[4];
        FinScanBrd: Record "Fin Scan Vendor Bridge";
        LastEntryNo: Integer;
}

