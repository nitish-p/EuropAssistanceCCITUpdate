pageextension 50005 GeneralLedgerEntries extends "General Ledger Entries"
{
    // prdp 20022017
    // added field "Dimension Set ID" to front end
    // prdp 28022017
    // added field "Source No." to front end
    // prdp 28022017
    // added code for source no description
    // prdp 11052019
    // added code to update department code on OnOpenPage()
    // Priyanka 17072019
    // Added Field "Document Date" to front end

    //Unsupported feature: Property Insertion (Permissions) on ""General Ledger Entries"(Page 20)".

    layout
    {
        addafter("Document Type")
        {
            field("Transaction No."; Rec."Transaction No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Document No.")
        {
            // field("Tax Type";Rec."Tax Type")
            // {
            //     Visible = false;
            // }
        }
        addafter(Amount)
        {
            field("Integration Document No"; Rec."Integration Document No")
            {
                ApplicationArea = All;
            }
            // field("Source No.";Rec."Source No.")
            // {
            // }
            field(SourceNoDescription; SourceNoDescription)
            {
                ApplicationArea = All;
            }
        }
        addafter("Bal. Account No.")
        {
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
                ApplicationArea = All;
            }
        }
        addafter("FA Entry No.")
        {
            // field("Dimension Set ID";Rec."Dimension Set ID")
            // {
            // }
            field("Business Line"; Rec."Global Dimension 1 Code")
            {
                Caption = 'Business Line';
                ApplicationArea = All;
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = All;
            }
            field("Client Level Dimension"; Rec."Client Level Dimension")
            {
                ApplicationArea = All;
            }
            field("Employee Code"; Rec."Employee Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Entry No.")
        {
            // field("External Document No.";Rec."External Document No.")
            // {
            // }
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;
            }
            field("Invoice Date"; invoidate)
            {
                ApplicationArea = All;
            }
            field(Narration; Rec.Narration)

            {

                ApplicationArea = All;

            }
            field(Comment; Rec.Comment)
            {
                ApplicationArea = all;
            }
            field("Case No."; Rec."Case No.")
            {
                ApplicationArea = All;
            }
            field("Vendor PAN No."; Rec."Vendor PAN No.")
            {
                ApplicationArea = All;
            }
            // field("GST Amount";Rec."GST Amount")
            // {
            //     Caption = 'Invoice GST';
            //     Editable = false;
            // }
            field("TDS Amount"; Rec."TDS Amount")
            {
                Caption = 'Invoice TDS';
                Editable = false;
                ApplicationArea = All;
            }
            field("PO Number"; Rec."PO Number")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("PO Date"; Rec."PO Date")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Billing Type"; Rec."Billing Type")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("UTR No."; Rec."UTR No.")
            {
                ApplicationArea = All;
            }
            field("Customer Ref. No."; Rec."Customer Ref. No.")
            {
                ApplicationArea = All;
            }
            field("Date Credited in Bank"; Rec."Date Credited in Bank")
            {
                ApplicationArea = All;
            }
            field("Dealer ID"; Rec."Dealer Code")
            {
                ApplicationArea = All;
            }

        }

    }
    actions
    {


        //Unsupported feature: Code Insertion (VariableCollection) on "GLDimensionOverview(Action 50).OnAction".

        //trigger (Variable: GLEntriesDimensionOverview)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "GLDimensionOverview(Action 50).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PAGE.RUN(PAGE::"G/L Entries Dimension Overview",Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF ISTEMPORARY THEN BEGIN
          GLEntriesDimensionOverview.SetTempGLEntry(Rec);
          GLEntriesDimensionOverview.RUN;
        END ELSE
          PAGE.RUN(PAGE::"G/L Entries Dimension Overview",Rec);
        */
        //end;
        addafter(DocsWithoutIC)
        {
            action("Transfer WIP to FA")
            {
                Visible = WIPtoFA;
                ApplicationArea = All;
            }
        }

    }
    trigger OnAfterGetRecord()
    begin
        SourceNoDescription := '';

        IF Rec."Source Type" <> 0 THEN BEGIN

            IF Rec."Source No." <> '' THEN BEGIN

                IF rec."Source Type" = 1 THEN BEGIN
                    Cust.GET(rec."Source No.");
                    SourceNoDescription := Cust.Name;
                END;

                IF rec."Source Type" = 2 THEN BEGIN
                    Vend.GET(rec."Source No.");
                    SourceNoDescription := Vend.Name;
                END;

                IF rec."Source Type" = 3 THEN BEGIN
                    BankAcc.GET(rec."Source No.");
                    SourceNoDescription := BankAcc.Name;
                END;

                IF rec."Source Type" = 4 THEN BEGIN
                    FA.GET(rec."Source No.");
                    SourceNoDescription := FA.Description;
                END;
                //Naveen---CCIT
                if salesinvHead.Get(rec."Document No.") then begin//Flow Field
                    IntegrationDoc := salesinvHead."Integration Doc No";
                end;
                if salesinvHead.Get(rec."Document No.") then begin//Flow Field
                    invoidate := salesinvHead."Invoice Date";
                end;
                //Naveen--CCIt
                if PurchInvHead.Get(rec."Document No.") then begin//Flow Field
                    IntegrationDoc := PurchInvHead."Integration Doc No";
                end;
                if PurchInvHead.Get(rec."Document No.") then begin//Flow Field
                    invoidate := PurchInvHead."Invoice Date";
                end;
                PL.Reset();
                pl.SetRange("Document No.", Rec."Document No.");
                pl.SetFilter("No.", '<>%1', '');
                if PL.FindFirst() then begin
                    Narrati := PL.Narration;
                end;

                // GLEntry.RESET;
                // GLEntry.SETRANGE("Document No.", purchinvLine."Document No.");
                // IF GLEntry.FINDFIRST THEN BEGIN
                //     GLEntry2.RESET;
                //     GLEntry2.SETRANGE("Document No.", purchinvLine."Document No.");
                //     GLEntry2.SETRANGE("Document Type", purchinvLine."Document Type"::Invoice);
                //     IF GLEntry2.FINDFIRST THEN
                //         Narrati := GLEntry2.Narration;
                // END

            END;
        END;

        DimensionValue := '';
        DimensionName := '';
        Rec480.RESET;
        Rec480.SETRANGE(Rec480."Dimension Set ID", Rec."Dimension Set ID");
        IF Rec480.FINDFIRST THEN BEGIN
            DimensionValue := Rec480."Dimension Code";
            DimensionName := Rec480."Dimension Name";
        END;

        /*
          Rec1480.RESET;
        //Rec1480.SETRANGE(Rec1480."Dimension Set ID","Dimension Set ID");
        Rec1480.SETRANGE(Rec1480."Dimension Value Code",Rec480."Dimension Value Code");
        IF Rec1480.FINDFIRST THEN BEGIN
          DimensionName := Rec1480."Dimension Value Name";
        END;
        
        END;
        
        */


        WIPtoFA := FALSE;
        IF rec."G/L Account No." = '212401' THEN
            WIPtoFA := TRUE;

    end;

    var
        GLEntriesDimensionOverview: Page "G/L Entries Dimension Overview";

    var
        SourceNoDescription: Text[100];
        GLEntry: Record "G/L Entry";
        GLEntry2: Record "G/L Entry";
        Cust: Record Customer;
        Rec480: Record "Dimension Set Entry";
        Vend: Record Vendor;
        PL: Record "Purchase Line";
        PurchInvHead: Record "Purch. Inv. Header";
        salesinvHead: Record "Sales Invoice Header";
        invoidate: Date;
        Narrati: Text[250];
        salesinvline: Record "Sales Invoice Line";
        purchinvLine: Record "Purch. Inv. Line";
        IntegrationDoc: Code[30];
        BankAcc: Record "Bank Account";
        FA: Record "Fixed Asset";
        //  Rec480: Record "480";
        DimensionValue: Code[20];
        DimensionName: Text[30];
        //  Rec1480: Record "480";
        ShortcutDimCode: array[8] of Code[20];
        GenLedEntry: Record "General Ledger Setup";
        // GLE: Record "17";
        // DimensionSetEntry: Record "480";
        // "Invoice Date": Date;
        // PurchInvHdr: Record "122";
        // GLEntry2: Record "17";
        // GLEntry3: Record "17";
        // PurchCrMemoLine: Record "125";
        // PurchInvLine: Record "123";
        WIPtoFA: Boolean;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    SourceNoDescription:='';

    IF "Source Type" <> 0 THEN BEGIN

      IF "Source No." <> '' THEN BEGIN

      IF "Source Type" = 1 THEN BEGIN
        Cust.GET("Source No.");
        SourceNoDescription:=Cust.Name;
      END;

      IF "Source Type" = 2 THEN BEGIN
        Vend.GET("Source No.");
        SourceNoDescription:=Vend.Name;
      END;

      IF "Source Type" = 3 THEN BEGIN
        BankAcc.GET("Source No.");
        SourceNoDescription:=BankAcc.Name;
      END;

      IF "Source Type" = 4 THEN BEGIN
        FA.GET("Source No.");
        SourceNoDescription:=FA.Description;
      END;

    END;
    END;

    DimensionValue := '';
    DimensionName := '';
    Rec480.RESET;
    Rec480.SETRANGE(Rec480."Dimension Set ID","Dimension Set ID");
    IF Rec480.FINDFIRST THEN BEGIN
      DimensionValue := Rec480."Dimension Code";
      DimensionName := Rec480."Dimension Name";
    END;
    {
      Rec1480.RESET;
    //Rec1480.SETRANGE(Rec1480."Dimension Set ID","Dimension Set ID");
    Rec1480.SETRANGE(Rec1480."Dimension Value Code",Rec480."Dimension Value Code");
    IF Rec1480.FINDFIRST THEN BEGIN
      DimensionName := Rec1480."Dimension Value Name";
    END;

    END;
    }

    WIPtoFA:=FALSE;
    IF "G/L Account No." = '212401' THEN
    WIPtoFA:=TRUE;
    */
    //end;
}

