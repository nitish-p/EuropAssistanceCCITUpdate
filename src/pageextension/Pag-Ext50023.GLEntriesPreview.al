pageextension 50023 "G/L Entries Preview" extends "G/L Entries Preview" 
{
    layout
    {
        addafter("FA Entry No.")
        {
            field(Narration;Rec.Narration)
            {
            }
        }
    }
}

