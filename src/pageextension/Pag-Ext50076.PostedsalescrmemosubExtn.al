pageextension 50076 "Posted sales cr memo sub Extn" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shortcut Dimension 2 Code")
        {
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                 ApplicationArea = All;
            }
            field(Comments; Rec.Comments)
            {
                 ApplicationArea = All;
            }
            field("Case No."; Rec."Case No.")
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
        //Richa
        /*
        addlast(processing)
        {
            action("Service Master")
            {
                RunObject = Page 50001;
                RunPageLink = "Credit Memo Doc No" = FIELD("Integration Doc No"),
                                  "Credit Memo Line No" = FIELD("Line No.");
            }
        }
        */
    }


    var
        myInt: Integer;
        
}