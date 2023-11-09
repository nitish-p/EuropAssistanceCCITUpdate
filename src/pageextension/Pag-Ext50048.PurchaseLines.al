pageextension 50048 "Purchase Lines" extends "Purchase Lines" 
{
    layout
    {
        addafter("Amt. Rcd. Not Invoiced (LCY)")
        {
            field(Narration;Rec.Narration)
            {
                ApplicationArea = All;
            }
        }
    }
}

