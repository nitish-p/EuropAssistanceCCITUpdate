Page 50049 "FA Uploader Stagging"
{
    Editable = false;
    PageType = List;
    SourceTable = "FA Uploader Stagging";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Selection"; rec."Code Selection")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee"; rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
                field("FA Class Code"; rec."FA Class Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Subclass Code"; rec."FA Subclass Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Location Code"; rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Block Code"; rec."FA Block Code")
                {
                    ApplicationArea = Basic;
                }
                field("Gen.Prod.Posting Gruop"; rec."Gen.Prod.Posting Gruop")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Vendor No."; rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Under Maintenance"; rec."Under Maintenance")
                {
                    ApplicationArea = Basic;
                }
                field("Depreciation Book Code"; rec."Depreciation Book Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Posting Group"; rec."FA Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Depreciation Method"; rec."Depreciation Method")
                {
                    ApplicationArea = Basic;
                }
                field("Depreciation stating Date"; rec."Depreciation stating Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Depreciation Years"; rec."No. Of Depreciation Years")
                {
                    ApplicationArea = Basic;
                }
                field("Warranty Date"; rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field("File name"; rec."File name")
                {
                    ApplicationArea = Basic;
                }
                field("Error description"; rec."Error description")
                {
                    ApplicationArea = Basic;
                }
                field("Process In Error"; rec."Process In Error")
                {
                    ApplicationArea = Basic;
                }
                field("Row number"; rec."Row number")
                {
                    ApplicationArea = Basic;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Imported Date"; rec."Imported Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Time"; rec."Imported Time")
                {
                    ApplicationArea = Basic;
                }
                field("Imported By"; rec."Imported By")
                {
                    ApplicationArea = Basic;
                }
                field("NAV No."; rec."NAV No.")
                {
                    ApplicationArea = Basic;
                }
                field("Uploader Created"; rec."Uploader Created")
                {
                    ApplicationArea = Basic;
                }
                field(Validated; rec.Validated)
                {
                    ApplicationArea = Basic;
                }
                field(CaseID; rec.CaseID)
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
            action("FA UPLOADER")
            {
                ApplicationArea = Basic;
                Image = import;
                Promoted = true;
                //RunObject = XMLport UnknownXMLport50043;//Naveen
            }
        }
    }
}

