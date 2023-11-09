pageextension 50054 "Fixed Asset List" extends "Fixed Asset List" 
{
    layout
    {
        // addafter("Control 17")
        // {
        //     field("Uploader Created";Rec."Uploader Created")
        //     {
        //     }
        // }
        addafter("Search Description")
        {
            field("Serial No.";Rec."Serial No.")
            {
                ApplicationArea =All;
            }
        }
    }
    actions
    {
        addafter(Register)
        {
            action("FA Register Custom")
            {
                Image = "Report";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = false;
                RunObject = Report "FA Report Custom";
            }
            action("Depr. Schedule for Comp. Act")
            {
                Image = "Report";
                ApplicationArea =All;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 16533;
            }
            action("FA UPLOADER LOG")
            {
                RunObject = Page "FA Uploader Stagging";
                ApplicationArea =All;
            }
        }
    }
}

