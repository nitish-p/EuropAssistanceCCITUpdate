pageextension 50073 "Sales Cr Memo Sub Extn" extends "Sales Cr. Memo Subform"
{
    layout
    {
        // Add changes to page layout here
        //Richa

        addafter("Deferral Code")
        {
            field("Invoice Type"; Rec."Invoice Type")
            {
                Visible = false;
                 ApplicationArea = All;
            }
        }
        addafter(ShortcutDimCode8)
        {
            //  field("Gen. Prod. Posting Group";rec."Gen. Prod. Posting Group")
            // {
            // }
            field(Narration; rec.Narration)
            {
                 ApplicationArea = All;
            }
            field(Comments; rec.Comments)
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
        addafter(Dimensions)
        {
            action("Service Master")
                {
                    RunObject = Page 50001;
                                    RunPageLink = "Credit Memo Doc No"=FIELD("Integration Doc No"),
                                  "Credit Memo Line No"=FIELD("Line No.");
                }
        }
        addafter("Detailed Tax")
        {
            action("Detailed GST")
                {
                    Caption = 'Detailed GST';
                    Image = ServiceTax;
                    RunObject = Page 16412;
                                    RunPageLink = "Transaction Type"=FILTER(Sales),
                                  "Document Type"=FIELD("Document Type"),
                                  "Document No."=FIELD("Document No."),
                                  "Line No."=FIELD("Line No.");
                }
        }
        */
    }

    var
        myInt: Integer;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        ValidateSaveShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;
}