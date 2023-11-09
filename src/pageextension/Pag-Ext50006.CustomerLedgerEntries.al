pageextension 50006 CustomerLedgerEntries extends "Customer Ledger Entries"
{
    // prdp 02022017
    // added new field Comments to front end
    // prdp 08032017
    // added field "Dimension Set ID" to front end
    // added code for customer name
    // prdp 14062017
    // added code for cust name added same field to front end
    layout
    {
        addafter("Entry No.")
        {
            field("Closed by Entry No."; Rec."Closed by Entry No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Payment Method Code")
        {
            field("GST Amount"; Rec."GST Amount")
            {
                ApplicationArea = All;
            }
            field("Taxable Value"; Rec."Taxable Value")
            {
                ApplicationArea = All;
            }
        }
        // addafter("Control 22")
        // {
        //     field("HSN/SAC Code";Rec."HSN/SAC Code")
        //     {
        //     }
        // }
        // addafter("Control 290")
        // {
        //     field("External Document No.";Rec."External Document No.")
        //     {
        //     }
        // }
        addafter("Direct Debit Mandate ID")
        {
            field(Comments; rec.Comments)
            {
                Editable = false;
                ApplicationArea = All;
            }
            // field("Customer Name";CustName)
            // {
            // }
            field(Narration; rec.Narration)
            {
                ApplicationArea = All;
            }
            field("Customer Invoice No."; CustInvNo)
            {
                ApplicationArea = All;
            }
            field("Integration Doc No."; Rec."Integration Doc No.")
            {
                ApplicationArea = All;
            }
            field("Reference Invoice Number"; Rec."Reference Invoice Number")
            {
                ApplicationArea = All;
            }
            field("Dealer ID"; Rec."Dealer Code")
            {
                ApplicationArea = All;
            }
            field("EA Transaction Type"; Rec."EA Transaction Type")
            {
                ApplicationArea = All;
            }
        }
        //  moveafter("Control 1";Rec."Control 30")
    }

    var
        CustName: Text[100];
        // RecCust: Record "18";
        // SalesInvHdr: Record "112";
        IntDocNo: Code[35];
        CustInvNo: Code[35];


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StyleTxt := SetStyle;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    StyleTxt := SetStyle;
    CustName:='';
    RecCust.RESET;
    RecCust.SETRANGE("No.","Customer No.");
    IF RecCust.FINDFIRST THEN BEGIN
      CustName:=RecCust.Name;
    END;

    IntDocNo:='';
    CustInvNo:='';
    SalesInvHdr.RESET;
    SalesInvHdr.SETRANGE("No.","Document No.");
    IF SalesInvHdr.FINDFIRST THEN BEGIN
      IF IntDocNo = '' THEN BEGIN
      IntDocNo:=SalesInvHdr."Integration Doc No";
        CustInvNo:=SalesInvHdr."Customer Invoice No.";
      END;
    END;
    */
    //end;
}

