pageextension 50029 "Posted Purch. Cr. Memo Subform" extends "Posted Purch. Cr. Memo Subform" 
{
    // Pallavi 17012017
    // created action service master for showing document wise service master
    layout
    {
        addafter("Allow Invoice Disc.")
        {
            field("GST Credit";Rec."GST Credit")
            {
                Editable = false;
                Visible = false;
                ApplicationArea = All;
            }
            field("GST Group Code";Rec."GST Group Code")
            {
                Editable = false;
                Visible = false;
                ApplicationArea = All;
            }
            field("GST Group Type";Rec."GST Group Type")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("HSN/SAC Code";Rec."HSN/SAC Code")
            {
                Editable = false;
                Visible = false;
                ApplicationArea = All;
            }
            // field("GST Base Amount";Rec."GST Base Amount")
            // {
            //     Visible = false;
            // }
            // field("Total GST Amount";Rec."Total GST Amount")
            // {
            //     Visible = false;
            // }
        }
        addafter("Job No.")
        {
            field(Narration;Rec.Narration)
            {
                ApplicationArea = All;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Department Code";Rec."Department Code")
            {
                ApplicationArea = All;
            }
            field("Client Level Code";Rec."Client Level Code")
            {
                ApplicationArea = All;
            }
            field("Employee Code";Rec."Employee Code")
            {
                ApplicationArea = All;

            }
            field("Case No.";Rec."Case No.")
            {
                ApplicationArea = All;
            }
            field("Service ID";Rec."Service ID")
            {
                ApplicationArea = All;
            }
            field("Service Date";Rec."Service Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Dimensions)
        {
            action("Service Master")
            {
                ApplicationArea = All;
                RunObject = Page "Document Wise Service Master";
                RunPageLink = "Integration doc No"=FIELD("Integration Doc No"),
                              "Document Line No."=FIELD("Line No.");
            
            }
        }
       // moveafter(ItemReturnShipmentLines;"Action 1901555704")
    }
}

