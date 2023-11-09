pageextension 50053 "Fixed Asset Card" extends "Fixed Asset Card"
{
    layout
    {
        modify("No.")
        {
            Editable = (Rec."No." = '');
        }
        modify(DepreciationEndingDate)
        {
            Editable = false;
        }
        // addafter("Control 30")
        // {
        //     field("Uploader Created";Rec."Uploader Created")
        //     {
        //     }
        // }
        // addafter("Control 1280006")
        // {
        //     field("GST Group Code";Rec."GST Group Code")
        //     {
        //     }
        //     field("GST Credit";Rec."GST Credit")
        //     {
        //     }
        //     field("HSN/SAC Code";Rec."HSN/SAC Code")
        //     {
        //     }
        // }
    }
}

