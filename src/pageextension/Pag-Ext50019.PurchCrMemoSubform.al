pageextension 50019 "Purch. Cr. Memo Subform" extends "Purch. Cr. Memo Subform"
{
    // Surya 22-05-17 Addedt fields to frnt end  "Gen. Bus. Posting Group","Gen. Prod. Posting Group","Service Tax Group","Service Tax Registration No.","Service Tax Amount"
    // TDS related fields
    // prdp 21122017
    // added fields Service ID & Service Date to front end
    layout
    {
        modify("Total Amount Excl. VAT")
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify("Total VAT Amount")
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify("Total Amount Incl. VAT")
        {
            Visible = false;
            ApplicationArea = All;
        }


        //Unsupported feature: Code Modification on "Control 300.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateSaveShortcutDimCode(3,ShortcutDimCode[3]);
        */
        //end;


        //Unsupported feature: Code Modification on "Control 302.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateSaveShortcutDimCode(4,ShortcutDimCode[4]);
        */
        //end;


        //Unsupported feature: Code Modification on "Control 304.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateSaveShortcutDimCode(5,ShortcutDimCode[5]);
        */
        //end;


        //Unsupported feature: Code Modification on "Control 306.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateSaveShortcutDimCode(6,ShortcutDimCode[6]);
        */
        //end;


        //Unsupported feature: Code Modification on "Control 308.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateSaveShortcutDimCode(7,ShortcutDimCode[7]);
        */
        //end;


        //Unsupported feature: Code Modification on "Control 310.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateSaveShortcutDimCode(8,ShortcutDimCode[8]);
        */
        //end;


        //Unsupported feature: Code Modification on "RefreshTotals(Control 15).OnDrillDown".

        //trigger OnDrillDown()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
        DocumentTotals.PurchaseUpdateTotalsControls(
          Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
          TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
        */
        //end;
        // addafter("")
        // {
        //     // field("TDS Nature of Deduction";Rec."TDS Nature of Deduction")
        //     // {
        //     // }
        //     // field("TDS Amount";Rec."TDS Amount")
        //     // {
        //     // }
        // }
        // addafter("Control 54")
        // {
        // field("GST Credit";Rec."GST Credit")
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
        // field("HSN/SAC Code";Rec."HSN/SAC Code")
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
        // field(Exempted;Exempted)
        // {
        //     Visible = false;
        // }
        //}
        addafter("Gen. Prod. Posting Group")
        {
            // field("Gen. Bus. Posting Group";Rec."Gen. Bus. Posting Group")
            // {
            // }
            // field("Gen. Prod. Posting Group";Rec."Gen. Prod. Posting Group")
            // {
            // }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
            field("Case No."; Rec."Case No.")
            {
                ApplicationArea = All;
            }
            field("Vehicle Identification No."; Rec."Vehicle Identification No.")
            {
                ApplicationArea = All;
            }
            field(Narration; Rec.Narration)
            {
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
            field("Employee Code"; Rec."Employee Code")
            {
                ApplicationArea = All;
            }
            field("Service ID"; Rec."Service ID")
            {
                ApplicationArea = All;
            }
            // field("Service Tax Group";Rec."Service Tax Group")
            // {
            // }
            // field("Service Tax Base";Rec."Service Tax Base")
            // {
            // }
            // field("Service Tax Amount";Rec."Service Tax Amount")
            // {
            // }
            // field("Service Tax Registration No.";Rec."Service Tax Registration No.")
            // {
            // }
            field("Service Date"; Rec."Service Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(DeferralSchedule)
        {
            action("Detailed GST")
            {
                Caption = 'Detailed GST';
                ApplicationArea = All;
                Image = ServiceTax;
                RunObject = Page "Detailed GST Entry Buffer";
                RunPageLink = "Transaction Type" = FILTER(Purchase),
                              "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("Document No."),
                              "Line No." = FIELD("Line No.");
            }
        }
    }


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TypeChosen := HasTypeToFillMandatotyFields;
    IF PurchHeader.GET("Document Type","Document No.") THEN;

    DocumentTotals.PurchaseUpdateTotalsControls(Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
      TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    DocumentTotals.PurchaseUpdateTotalsControls(
      Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
      TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    CLEAR(DocumentTotals);
    */
    //end;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        ValidateSaveShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;
}

