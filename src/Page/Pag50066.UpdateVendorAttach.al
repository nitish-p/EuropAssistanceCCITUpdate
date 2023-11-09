Page 50066 "Update Vendor Attach."
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Vendor Bridge";
    SourceTableView = where("Nav Vendor Code"=filter(<>''),
                            "Vendor Code"=filter(<>''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("CASE ID";rec."CASE ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor Code";rec."Vendor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor Name";rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor Payment Type";rec."Vendor Payment Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Dealer Client Name";rec."Dealer Client Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PAN;rec.PAN)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Authorized PAN";rec."Authorized PAN")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GST;rec.GST)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("BANK Document";rec."BANK Document")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Aadhar;rec.Aadhar)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID Proof";rec."ID Proof")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Licence Document";rec."Licence Document")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(getKyc;rec.getKyc)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

