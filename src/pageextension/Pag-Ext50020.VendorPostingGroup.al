pageextension 50020 VendorPostingGroup extends "Vendor Posting Groups"
{
    layout
    {
        addafter("Payment Disc. Credit Acc.")
        {
            field("Source Code"; Rec."Source Code")
            {
                Editable = false;
            }
            field("Alert Receiver E-mai ID"; Rec."Alert Receiver E-mai ID")
            {
                Editable = false;
            }
            field("Receiver First Name"; Rec."Receiver First Name")
            {
                Editable = false;
            }
            field("Receiver Last Name"; Rec."Receiver Last Name")
            {
                Editable = false;
            }
        }
    }
}

