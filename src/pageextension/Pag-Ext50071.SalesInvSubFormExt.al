pageextension 50071 "Sales Inv SubForm Ext" extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bin Code")
        {
            field("Policy Month"; Rec."Policy Month")
            {
                ShowMandatory = true;
                ApplicationArea = All;
            }
        }
        addafter("TCS Nature of Collection")
        {
            field(Particulars; rec.Particulars)
            {
                ApplicationArea = All;
            }
        }
        addafter("Deferral Code")
        {
            // field("GST Place of Supply";Rec."GST Place of Supply")
            // {
            //     Visible = false;
            // }
            // field("GST Group Code";Rec."GST Group Code")
            // {
            //     Visible = false;
            // }
            // field("GST Group Type";Rec."GST Group Type")
            // {
            //     Visible = false;
            // }
            // field("GST Base Amount";Rec."GST Base Amount")
            // {
            //     Visible = false;
            // }
            // field("Total GST Amount";Rec."Total GST Amount")
            // {
            //     Visible = false;
            // }
            // field("HSN/SAC Code";Rec."HSN/SAC Code")
            // {
            //     Visible = false;
            // }
            field("Invoice Type"; Rec."Invoice Type")
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
        addafter("Line No.")
        {
            // field("Service Tax Group";Rec."Service Tax Group")
            // {
            // }
            // field("Gen. Prod. Posting Group";Rec."Gen. Prod. Posting Group")
            // {
            // }
            // field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
            // field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
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
                ApplicationArea = All;
                Editable = true;
            }
            // field("GST Jurisdiction Type";Rec."GST Jurisdiction Type")
            // {
            // }
            // field(Narration; Rec.Narration)
            // {
            // }
        }

    }

    actions
    {
        // Add changes to page actions here
        addafter(Dimensions)
        {
            action("Service Master")
            {
                ApplicationArea = All;
                RunObject = Page "Document Wise Service Master";
                RunPageLink = "Integration doc No" = FIELD("Integration Doc No"),
                                  "Document Line No." = FIELD("Line No.");
            }
        }
        addafter("Item &Tracking Lines")
        {
            action("Detailed GST")
            {
                ApplicationArea = All;
                Caption = 'Detailed GST';
                Image = ServiceTax;
                RunObject = Page "Detailed GST Entry Buffer";
                RunPageLink = "Transaction Type" = FILTER(Sales),
                                  "Document Type" = FIELD("Document Type"),
                                  "Document No." = FIELD("Document No."),
                                 "Line No." = FIELD("Line No.");
            }
        }

    }

    var
        myInt: Integer;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        ValidateSaveShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;

}