pageextension 50017 "PurchaseOrderSub" extends "Purchase Order Subform"
{
    // prdp 21122017
    // added fields Service ID & Service Date to front end
    // Nitish ccit
    // added fields related to surcharge
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


        //Unsupported feature: Code Modification on "RefreshTotals(Control 11).OnDrillDown".

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
        // addafter("Control 102")
        // {
        //     field("TDS Base Amount";Rec."TDS Base Amount")
        //     {
        //     }
        //     field("TDS %";Rec."TDS %")
        //     {
        //     }
        //     field("TDS Nature of Deduction";Rec."TDS Nature of Deduction")
        //     {
        //     }
        //     field("TDS Amount";Rec."TDS Amount")
        //     {
        //     }
        //     field("TDS Category";Rec."TDS Category")
        //     {
        //     }
        // }
        // addafter("Control 54")
        // {
        //     field("Custom Duty Amount";Rec."Custom Duty Amount")
        //     {
        //     }
        //     field("GST Credit";Rec."GST Credit")
        //     {
        //         Visible = false;
        //     }
        //     field("GST Group Code";Rec."GST Group Code")
        //     {
        //         Visible = false;
        //     }
        //     field("GST Group Type";Rec."GST Group Type")
        //     {
        //         Visible = false;
        //     }
        //     field("HSN/SAC Code";Rec."HSN/SAC Code")
        //     {
        //         Visible = false;
        //     }
        //     field(Exempted;Exempted)
        //     {
        //         Visible = false;
        //     }
        //     field("GST Base Amount";Rec."GST Base Amount")
        //     {
        //         Visible = false;
        //     }
        //     field("Total GST Amount";Rec."Total GST Amount")
        //     {
        //         Visible = false;
        //     }
        //     field("GST Jurisdiction Type";Rec."GST Jurisdiction Type")
        //     {
        //         Visible = false;
        //     }
        //     field("BCD Amount";Rec."BCD Amount")
        //     {
        //     }
        //     field("CIF Amount";Rec."CIF Amount")
        //     {
        //     }
        //}
        addafter(ShortcutDimCode8)
        {
            field("Service ID"; Rec."Service ID")
            {
                ApplicationArea = All;
            }
            field("Service Date"; Rec."Service Date")
            {
                ApplicationArea = All;
            }
            field(Narration; rec.Narration)
            {
                ApplicationArea = All;
            }
            // field("Surcharge %";Rec."Surcharge %")
            // {
            // }
            // field("Surcharge Amount";Rec."Surcharge Amount")
            // {
            // }
        }
    }
    actions
    {
        addbefore("F&unctions")
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
    IF PurchHeader.GET("Document Type","Document No.") THEN;

    DocumentTotals.PurchaseUpdateTotalsControls(Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
      TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF PurchHeader.GET("Document Type","Document No.") THEN;

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
    TypeChosen := HasTypeToFillMandatotyFields;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    TypeChosen := HasTypeToFillMandatotyFields;
    CLEAR(DocumentTotals);
    */
    //end;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        ValidateSaveShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;
}

