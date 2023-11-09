Page 50044 "Vendor Uploader Log"
{
    Editable = false;
    PageType = List;
    SourceTable = "Vendor Upload Stagging";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor Name";rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("General Business Posting Group";rec."General Business Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group";rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor PAN No.";rec."Vendor PAN No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor GST Registration No.";rec."Vendor GST Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Bank Account Name";rec."Vendor Bank Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account Number";rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("IFSC Code";rec."IFSC Code")
                {
                    ApplicationArea = Basic;
                }
                field(Address;rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor State Code";rec."Vendor State Code")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No.";rec."Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("File name";rec."File name")
                {
                    ApplicationArea = Basic;
                }
                field("Row number";rec."Row number")
                {
                    ApplicationArea = Basic;
                }
                field(CaseID;rec.CaseID)
                {
                    ApplicationArea = Basic;
                }
                field(Validated;rec.Validated)
                {
                    ApplicationArea = Basic;
                }
                field(Status;rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Flag;rec.Flag)
                {
                    ApplicationArea = Basic;
                }
                field("Error description";rec."Error description")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Created On";rec."Vendor Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Created By Uploader";rec."Vendor Created By Uploader")
                {
                    ApplicationArea = Basic;
                }
                field("Nav Vendor Code";rec."Nav Vendor Code")
                {
                    ApplicationArea = Basic;
                }
                field("Nav Vendor Status";rec."Nav Vendor Status")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Time";rec."Imported Time")
                {
                    ApplicationArea = Basic;
                }
                field("Imported By";rec."Imported By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Vendor Template")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin
                    Xmlport.Run(50041,false,true);
                    Codeunit.Run(50021)
                end;
            }
        }
    }
}

