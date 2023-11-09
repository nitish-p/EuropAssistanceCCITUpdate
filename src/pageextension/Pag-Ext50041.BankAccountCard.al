pageextension 50041 "Bank Account Card" extends "Bank Account Card"
{
    // prdp 30012017
    // added new field IFSC Code to frnot end
    layout
    {
        addafter(Blocked)
        {
            field("E-collection Bank Account"; Rec."E-collection Bank Account")
            {
                ApplicationArea = All;
            }
        }
    }
}

