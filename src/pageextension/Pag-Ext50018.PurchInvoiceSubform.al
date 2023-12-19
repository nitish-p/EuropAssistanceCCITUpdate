pageextension 50018 "Purch. Invoice Subform" extends "Purch. Invoice Subform"
{
    // pallavi 16012017
    // added action service master
    // pradip 21012017
    // added field "Service Tax Group" to front end
    // Pallavi 25012017
    // added property -Purchase Doc No=FIELD(Integration Doc No),Purchase Doc Line No=FIELD(Line No.)
    // prdp 01022017
    // added two fields Integration Doc No & CASE no. to front end
    // prdp 03022017
    // added field <Gen. Prod. Posting Group> to front end
    // prdp 07022017
    // added field "TDS Amount"to front end
    // prdp 14062017
    // added new field Narration to front end
    // prdp 18092017
    // added ffield Policy no, VRN no & VIN No to front end
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


        //Unsupported feature: Code Modification on "RefreshTotals(Control 7).OnDrillDown".

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
        addbefore("GST Assessable Value")
        {
            field("Project Name"; Rec."Project Name")
            {
                ApplicationArea = All;
            }
        }
        addafter("Act Applicable")
        {
            // field("Service Tax Group";Rec."Service Tax Group")
            // {
            //     ApplicationArea = All;
            // }
            // field("Service Tax Base";Rec."Service Tax Base")
            // {
            //     ApplicationArea = All;
            // }
            // field("Service Tax Amount";Rec."Service Tax Amount")
            // {
            //     ApplicationArea = All;
            // }
            // field("eCESS % on TDS";Rec."eCESS % on TDS")
            // {
            //     ApplicationArea = All;
            // }
        }
        addafter("Qty. Assigned")
        {
            // field("Custom Duty Amount";Rec."Custom Duty Amount")
            // {
            //     ApplicationArea = All;
            // }
            // field("GST Credit";Rec."GST Credit")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("GST Group Code";Rec."GST Group Code")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("GST Group Type";Rec."GST Group Type")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("HSN/SAC Code";Rec."HSN/SAC Code")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("GST Base Amount";Rec."GST Base Amount")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("Total GST Amount";Rec."Total GST Amount")
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
            // field("TDS Base Amount";Rec."TDS Base Amount")
            // {
            //     ApplicationArea = All;
            // }
            // field("TDS %";Rec."TDS %")
            // {
            //     ApplicationArea = All;
            // }
            // field("TDS Amount";Rec."TDS Amount")
            // {
            //     ApplicationArea = All;
            // }
            // field("TDS Category";Rec."TDS Category")
            // {
            //     ApplicationArea = All;
            // }
            // field(Exempted;Rec.Exempted)
            // {
            //     Visible = false;
            //     ApplicationArea = All;
            // }
        }
        addafter("Document No.")
        {
            field("Case No."; Rec."Case No.")
            {
                ApplicationArea = All;
            }
            // field("Gen. Prod. Posting Group";Rec."Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
            field("Policy No."; Rec."Policy No.")
            {
                ApplicationArea = All;
            }
            field("VRN No."; Rec."VRN No.")
            {
                ApplicationArea = All;
            }
            // field("Assessee Code";Rec."Assessee Code")
            // {
            //     Editable = true;
            //     ApplicationArea = All;
            // }
            field(Narration; Rec.Narration)
            {
                ApplicationArea = All;
            }
            field("Vehicle Identification No."; Rec."Vehicle Identification No.")
            {
                ApplicationArea = All;
            }
            // field("Department Code"; Rec."Department Code")
            // {
            //     ApplicationArea = All;
            // }
            // field("Client Level Code"; Rec."Client Level Code")
            // {
            //     ApplicationArea = All;
            // }
            // field("Employee Code"; Rec."Employee Code")
            // {
            //     ApplicationArea = All;
            // }
        }
        addafter("Line No.")
        {
            field("Service ID"; Rec."Service ID")
            {
                ApplicationArea = All;
            }
            field("Service Date"; Rec."Service Date")
            {
                ApplicationArea = All;
            }
            field("NAV Customer"; Rec."NAV Customer")
            {
                Editable = false;
                ApplicationArea = All;
            }
            // field("Gen. Bus. Posting Group";Rec."Gen. Bus. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
            // field("Surcharge %";Rec."Surcharge %")
            // {
            //     ApplicationArea = All;
            // }
            // field("Surcharge Amount";Rec."Surcharge Amount")
            // {
            //     ApplicationArea = All;
            // }
        }
    }
    actions
    {
        addafter("BOM Level")
        {
            action("Service MAster")
            {
                RunObject = Page "Document Wise Service Master";
                ApplicationArea = All;
                RunPageLink = "Purchase Doc No" = FIELD("Integration Doc No"),
                              "Purchase Doc Line No" = FIELD("Line No.");
            }
        }
        addafter(DeferralSchedule)
        {
            action("Detailed GST")
            {
                Caption = 'Detailed GST';
                ApplicationArea = All;
                Image = ServiceTax;
                // RunObject = Page "Detailed GST Entry Buffer";
                // RunPageLink = "Transaction Type"=FILTER(Purchase),
                //               "Document Type"=FIELD("Document Type"),
                //               "Document No."=FIELD("Document No."),
                //               "Line No."=FIELD("Line No.");
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

