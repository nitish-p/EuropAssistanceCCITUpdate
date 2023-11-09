pageextension 50038 "Ship-to Address List" extends "Ship-to Address List" 
{
    layout
    {
        addafter(Address)
        {
            field("Customer No.";Rec."Customer No.")
            {
                ApplicationArea = All;
            }
            field("GST Registration No.";Rec."GST Registration No.")
            {
                ApplicationArea = All;
            }
            field(State;rec.State)
            {
                ApplicationArea = All;
            }
        }
    }
}

