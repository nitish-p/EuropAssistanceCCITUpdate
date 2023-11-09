pageextension 50089 VendorCard extends "Vendor Card"
{
    layout
    {
        modify("No.")
        {
            Editable = false;
        }
        modify(Name)
        {
            Editable = false;
        }
        addafter("Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
        addafter("Responsibility Center")
        {
            field("Uploader Vendor"; Rec."Uploader Vendor")
            {
                ApplicationArea = All;

            }
            field("Reject Reason"; Rec."Reject Reason")
            {
                ApplicationArea = All;
                Editable = false;
            }

            field(Verification; rec.Verification)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("PLS Id"; rec."Easy Auto Vendor Code")
            {
                Caption = 'PLS Id';
                Editable = false;
                ApplicationArea = All;
            }
            field("Date Of Incorporation"; rec."Date Of Incorporation")
            {
                ApplicationArea = All;
            }
            field(Type; rec.Type)
            {
                ApplicationArea = All;
            }
            field("Dealer Client Name"; rec."Dealer Client Name")
            {
                ApplicationArea = All;
            }
            group("Fin Scan Related")
            {
                field("Source Code"; rec."Source Code")
                {
                    ApplicationArea = All;
                }
                field("Status-Indicator"; rec."Status-Indicator")
                {
                    ApplicationArea = All;
                }
                field("Record Type"; rec."Record Type")
                {
                    ApplicationArea = All;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("Date Of Birth"; rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field("Payee Type"; rec."Payee Type")
                {
                    ApplicationArea = All;
                }
            }
        }
        addafter("P.A.N. Reference No.")
        {
            field("TRC No."; Rec."TRC No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Associated Enterprises")
        {
            field("Regd. GST Reistration No."; rec."Commissioner's Permission No.")
            {
                Caption = 'Regd. GST Reistration No.';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}