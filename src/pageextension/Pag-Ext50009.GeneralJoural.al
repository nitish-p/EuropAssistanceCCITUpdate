pageextension 50009 GeneralJoural extends "General Journal"
{
    // Pallavi 01032017
    // borught department to front end
    layout
    {

        //Unsupported feature: Property Insertion (SubPageLink) on "Control 1900919607".

        addafter("Salespers./Purch. Code")
        {
            // field("Department Code"; Rec."Department Code")
            // {
            //     ApplicationArea = All;
            // }
        }
        addafter("Ship-to/Order Address Code")
        {
            field("Nature of Supply"; Rec."Nature of Supply")
            {
                Visible = false;
                ApplicationArea = All;
            }
            // field("GST Group Code";Rec."GST Group Code")
            // {
            //     Visible = false;
            // }
            // field("GST Group Type"; Rec."GST Group Type")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("GST Base Amount";Rec."GST Base Amount")
            // {
            //     Visible = false;
            // }
            // field("Total GST Amount";Rec."Total GST Amount")
            // {
            //     Visible = false;
            // }
            field("GST Place of Supply"; Rec."GST Place of Supply")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("GST Bill-to/BuyFrom State Code"; Rec."GST Bill-to/BuyFrom State Code")
            {
                ApplicationArea = All;
            }
            field("GST Ship-to State Code"; Rec."GST Ship-to State Code")
            {
                ApplicationArea = All;
            }
            // field("Location State Code"; Rec."Location State Code")
            // {
            //     ApplicationArea = All;
            // }
            // field("GST Customer Type"; Rec."GST Customer Type")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("GST Vendor Type";Rec."GST Vendor Type")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("HSN/SAC Code";Rec."HSN/SAC Code")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
        }
        addafter("Direct Debit Mandate ID")
        {
            field("Beneficiary Name"; Rec."Beneficiary Name")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Beneficiary Acc. No."; Rec."Beneficiary Acc. No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Beneficiary IFSC Code"; Rec."Beneficiary IFSC Code")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Narration; rec.Narration)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(Post)
        {
            Visible = true;
        }
        modify(PostAndPrint)
        {
            Visible = true;
        }


        //Unsupported feature: Code Insertion on "Comment(Action 68)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //var
        //ApprovalsMgmt: Codeunit "1535";
        //begin
        /*
        ApprovalsMgmt.GetApprovalComment(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (RunObject) on "Comment(Action 68)".


        //Unsupported feature: Property Deletion (RunPageLink) on "Comment(Action 68)".

    }
}

