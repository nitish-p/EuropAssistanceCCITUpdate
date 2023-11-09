pageextension 50025 "Posted Purchase Rcpt. Subform" extends "Posted Purchase Rcpt. Subform"
{
    // Pallavi 17012017
    // created action service master for showing document wise service master
    layout
    {
        addafter("Lead Time Calculation")
        {
            field("GST Credit"; Rec."GST Credit")
            {
                Editable = false;
                Visible = false;
            }
            field("GST Group Code"; Rec."GST Group Code")
            {
                Editable = false;
                Visible = false;
            }
            field("GST Group Type"; Rec."GST Group Type")
            {
                Visible = false;
            }
            field("HSN/SAC Code"; Rec."HSN/SAC Code")
            {
                Editable = false;
                Visible = false;
            }
            // field("GST Base Amount";Rec."GST Base Amount")
            // {
            //     Visible = false;
            // }
            // field("Total GST Amount";Rec."Total GST Amount")
            // {
            //     Visible = false;
            // }
            field(Exempted; rec.Exempted)
            {
                Visible = false;
            }
        }
    }
    actions
    {
        addafter(Dimensions)
        {
            action("Service Mster")
            {
                RunObject = Page "Document Wise Service Master";
                RunPageLink = "Integration doc No" = FIELD("Integration Doc No");
                // "Document Line No."=FIELD("Line No."");//Naveen
            }
        }
    }
}

