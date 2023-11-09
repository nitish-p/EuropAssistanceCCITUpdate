pageextension 50027 "Posted Purch. Invoice Subform" extends "Posted Purch. Invoice Subform" 
{
    // Pallavi 17012017
    // created action service master for showing document wise service master
    // prdp 01022017
    // added field CASE No to front end
    // prdp 07022017
    // added field "TDS Amount"to front end
    // prdp 19122017
    // added field Narration to front end
    layout
    {
        addafter("Indirect Cost %")
        {
            field("Integration Doc No";Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
        }
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
                 ApplicationArea = All;
                Visible = false;
            }
            field("GST Group Type";Rec."GST Group Type")
            {
                 ApplicationArea = All;
                Visible = false;
            }
            field("HSN/SAC Code";Rec."HSN/SAC Code")
            {
                Editable = false;
                 ApplicationArea = All;
                Visible = false;
            }
            // field("GST Base Amount";Rec."GST Base Amount")
            // {
            //     Visible = false;
            //      ApplicationArea = All;
            // }
            // field("Total GST Amount";Rec."Total GST Amount")
            // {
            //     Visible = false;
            //     ApplicationArea = All;

            // }
            field(Exempted;rec.Exempted)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
        addafter("Job No.")
        {
            field("Project Name";Rec."Project Name")
            {
                ApplicationArea = All;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            // field("TDS Amount";Rec."TDS Amount")
            // {
            //     ApplicationArea = All;
            // }
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
            field(Narration;rec.Narration)
            {
                ApplicationArea = All;
            }
            // field("TDS Nature of Deduction";Rec."TDS Nature of Deduction")
            // {
            // }
            field("Case No.";Rec."Case No.")
            {
                ApplicationArea = All;
            }
            field("Policy No.";Rec."Policy No.")
            {
                ApplicationArea = All;
            }
            field("VRN No.";Rec."VRN No.")
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
                RunPageLink = "Purchase Doc No"=FIELD("Integration Doc No"),
                              "Purchase Doc Line No"=FIELD("Line No.");
            }
        }
       // moveafter(ItemReceiptLines;"Action 1902067004")
    }
}

