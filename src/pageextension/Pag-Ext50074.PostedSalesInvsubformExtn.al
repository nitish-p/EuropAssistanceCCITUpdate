pageextension 50074 "Posted SalesInv subformExtn" extends "Posted Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout 
        addafter("Return Reason Code")
        {
            field(Particulars; Rec.Particulars)
            {
                 ApplicationArea = All;
            }
        }
        addafter("Job No.")
        {
            field("Policy Month"; Rec."Policy Month")
            {
                 ApplicationArea = All;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Case No."; Rec."Case No.")
            {
                 ApplicationArea = All;
            }
            field(Comments; Rec.Comments)
            {
                 ApplicationArea = All;
            }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                Editable = false;
                 ApplicationArea = All;
            }

            field("Department Code"; Rec."Department Code")
            {
                 ApplicationArea = All;
            }
            field("Client Level Code"; Rec."Client Level Code")
            {
                 ApplicationArea = All;
            }
            field(Narration; Rec.Narration)
            {
                 ApplicationArea = All;
            }
        }

    }

    actions
    {
        // Add changes to page actions here

        addafter(Dimensions)
        {
            // action("Service Master")
            // {
            //     RunObject = Page 50001;
            //     RunPageLink = "Integration doc No"=FIELD("Integration Doc No"),
            //                       "Document Line No."=FIELD("Line No.");
            //     }
            // }Richa

        }

    }


    var
        myInt: Integer;
}