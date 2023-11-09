pageextension 50014 SalesOrderSubForm extends "Sales Order Subform"
{
    // Pallavi 15012017
    // added action service master
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


        //Unsupported feature: Code Insertion on "Control 82".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        UpdateForm(TRUE);
        */
        //end;


        //Unsupported feature: Code Insertion on "Control 84".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        UpdateForm(TRUE);
        */
        //end;


        //Unsupported feature: Code Insertion on "Control 86".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        UpdateForm(TRUE);
        */
        //end;


        //Unsupported feature: Code Insertion on "Control 88".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        UpdateForm(TRUE);
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


        //Unsupported feature: Code Modification on "RefreshTotals(Control 61).OnDrillDown".

        //trigger OnDrillDown()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
        DocumentTotals.SalesUpdateTotalsControls(
          Rec,TotalSalesHeader,TotalSalesLine,RefreshMessageEnabled,
          TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,CurrPage.EDITABLE,VATAmount);
        */
        //end;
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
            // field("GST Jurisdiction Type";Rec."GST Jurisdiction Type")
            // {
            //     Visible = false;
            // }
            field("Invoice Type"; Rec."Invoice Type")
            {
                Visible = false;
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
                RunObject = Page "Document Wise Service Master";
                 ApplicationArea = All;
                RunPageLink = "Document No." = FIELD("Document No."),
                              "Document Line No." = FIELD("Line No.");
            }
        }
        addbefore("F&unctions")
        {
            action("Detailed GST")
            {
                Caption = 'Detailed GST';
                 ApplicationArea = All;
                Image = ServiceTax;
                RunObject = Page "Detailed GST Entry Buffer";
                RunPageLink = "Transaction Type" = FILTER(Sales),
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
    IF SalesHeader.GET("Document Type","Document No.") THEN;

    DocumentTotals.SalesUpdateTotalsControls(Rec,TotalSalesHeader,TotalSalesLine,RefreshMessageEnabled,
      TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,CurrPage.EDITABLE,VATAmount);

    TypeChosen := HasTypeToFillMandatotyFields;
    SetLocationCodeMandatory;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF SalesHeader.GET("Document Type","Document No.") THEN;

    DocumentTotals.SalesUpdateTotalsControls(
      Rec,TotalSalesHeader,TotalSalesLine,RefreshMessageEnabled,
    #4..7
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


    //Unsupported feature: Code Modification on "ShipmentDateOnAfterValidate(PROCEDURE 19068710)".

    //procedure ShipmentDateOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (Reserve = Reserve::Always) AND
       ("Outstanding Qty. (Base)" <> 0) AND
       ("Shipment Date" <> xRec."Shipment Date")
    THEN BEGIN
      CurrPage.SAVERECORD;
      AutoReserve;
      CurrPage.UPDATE(FALSE);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    END ELSE
      CurrPage.UPDATE(TRUE);
    */
    //end;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        ValidateSaveShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;
}

