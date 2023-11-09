pageextension 50040 "Order Address List" extends "Order Address List"
{
    Caption = 'PLS Id Mapping';
    layout
    {
        addbefore(Code)
        {
            field("Vendor No."; Rec."Vendor No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

