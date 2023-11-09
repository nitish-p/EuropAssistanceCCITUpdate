page 50023 "Bank Payment Rejected Invoice"
{
    Caption = 'Bank Payment Rejected Invoice List';
    DataCaptionFields = "Vendor No.";
    DeleteAllowed = false;
    ApplicationArea = All;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Vendor Ledger Entry";
    SourceTableView = SORTING("Entry No.")
                      ORDER(Descending)
                      WHERE("Document Type" = CONST(Invoice),
                            "Integrated Invoice Type" = FILTER(<> ''),
                            Open = CONST(true),
                            "Payment Status Code" = FILTER('DF' | 'CR' | 'CF'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Message to Recipient"; Rec."Message to Recipient")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Original Amount"; Rec."Original Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Original Amt. (LCY)"; Rec."Original Amt. (LCY)")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Remaining Amt. (LCY)"; Rec."Remaining Amt. (LCY)")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Editable = false;
                    StyleExpr = StyleTxt;
                    ApplicationArea = All;
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Pmt. Disc. Tolerance Date"; Rec."Pmt. Disc. Tolerance Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Original Pmt. Disc. Possible"; Rec."Original Pmt. Disc. Possible")
                {
                    ApplicationArea = All;
                }
                field("Remaining Pmt. Disc. Possible"; Rec."Remaining Pmt. Disc. Possible")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Max. Payment Tolerance"; Rec."Max. Payment Tolerance")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Open; rec.Open)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("On Hold"; Rec."On Hold")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Reversed; Rec.Reversed)
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Exported to Payment File"; Rec."Exported to Payment File")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("GST on Advance Payment"; Rec."GST on Advance Payment")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                    ApplicationArea = All;
                }
                field("GST Reverse Charge"; Rec."GST Reverse Charge")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Caption = 'Vendor Name';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                // field(Narration;Rec.Narration)
                // {
                //       ApplicationArea = All;
                // }
                field("Reference Invoice Number"; Rec."Reference Invoice Number")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Integration Document No"; Rec."Integration Document No")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
                {
                    ApplicationArea = All;
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("UTR No."; Rec."UTR No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Payment Status Code"; Rec."Payment Status Code")
                {
                    ApplicationArea = All;
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action("Applied E&ntries")
                {
                    ApplicationArea = All;
                    Caption = 'Applied E&ntries';
                    Image = Approve;
                    RunObject = Page 62;
                    RunPageOnRec = true;
                    Scope = Repeater;
                }
                action(Dimensions)
                {
                    ApplicationArea = All;
                    AccessByPermission = TableData 348 = R;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        //   ShowDimensions;
                    end;
                }
                action("Detailed &Ledger Entries")
                {
                    Caption = 'Detailed &Ledger Entries';
                    Image = View;
                    ApplicationArea = All;
                    RunObject = Page "Detailed Vendor Ledg. Entries";
                    RunPageLink = "Vendor Ledger Entry No." = FIELD("Entry No."),
                                  "Vendor No." = FIELD("Vendor No.");
                    RunPageView = SORTING("Vendor Ledger Entry No.", "Posting Date");
                    Scope = Repeater;
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Narration)
                {
                    Caption = 'Narration';
                    Image = Description;
                    ApplicationArea = All;
                    RunObject = Page "Posted Narration";
                    RunPageLink = "Entry No." = FILTER(0),
                                  "Transaction No." = FIELD("Transaction No.");
                }
                action("Line Narration")
                {
                    Caption = 'Line Narration';
                    ApplicationArea = All;
                    Image = LineDescription;
                    RunObject = Page "Posted Narration";
                    RunPageLink = "Entry No." = FIELD("Entry No."),
                                  "Transaction No." = FIELD("Transaction No.");
                }
                action("Print Voucher")
                {
                    Caption = 'Print Voucher';
                    Ellipsis = true;
                    Image = PrintVoucher;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        GLEntry: Record "G/L Entry";
                    begin
                        GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                        GLEntry.SETRANGE("Document No.", Rec."Document No.");
                        GLEntry.SETRANGE("Posting Date", Rec."Posting Date");
                        IF GLEntry.FIND('-') THEN
                            REPORT.RUNMODAL(REPORT::"Posted Voucher", TRUE, TRUE, GLEntry);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                Visible = false;
                action(ActionApplyEntries)
                {
                    Caption = 'Apply Entries';
                    Image = ApplyEntries;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+F11';

                    trigger OnAction()
                    var
                        VendLedgEntry: Record "Vendor Ledger Entry";
                        VendEntryApplyPostEntries: Codeunit "VendEntry-Apply Posted Entries";
                    begin
                        VendLedgEntry.COPY(Rec);
                        VendEntryApplyPostEntries.ApplyVendEntryFormEntry(VendLedgEntry);
                        Rec := VendLedgEntry;
                        CurrPage.UPDATE;
                    end;
                }
                // separator()
                // {
                // }
                action(UnapplyEntries)
                {
                    Caption = 'Unapply Entries';
                    Ellipsis = true;
                    Image = UnApply;
                    ApplicationArea = All;
                    Scope = Repeater;

                    trigger OnAction()
                    var
                        VendEntryApplyPostedEntries: Codeunit "VendEntry-Apply Posted Entries";
                    begin
                        VendEntryApplyPostedEntries.UnApplyVendLedgEntry(Rec."Entry No.");
                    end;
                }
                // separator()
                // {

                // }
                action(ReverseTransaction)
                {
                    Caption = 'Reverse Transaction';
                    Ellipsis = true;
                    ApplicationArea = All;
                    Image = ReverseRegister;
                    Scope = Repeater;

                    trigger OnAction()
                    var
                        ReversalEntry: Record "Reversal Entry";
                    begin
                        CLEAR(ReversalEntry);
                        IF Rec.Reversed THEN
                            ReversalEntry.AlreadyReversedEntry(Rec.TABLECAPTION, Rec."Entry No.");
                        IF Rec."Journal Batch Name" = '' THEN
                            ReversalEntry.TestFieldError;
                        Rec.TESTFIELD(Rec."Transaction No.");
                        ReversalEntry.ReverseTransaction(Rec."Transaction No.");
                    end;
                }
                group(IncomingDocument)
                {
                    Caption = 'Incoming Document';
                    Image = Documents;

                    action(IncomingDocCard)
                    {
                        Caption = 'View Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;
                        ApplicationArea = All;
                        //The property 'ToolTip' cannot be empty.
                        //ToolTip = '';
                        Visible = false;

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            IncomingDocument.ShowCard(Rec."Document No.", Rec."Posting Date");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData 130 = R;
                        Caption = 'Select Incoming Document';
                        Enabled = NOT HasIncomingDocument;
                        ApplicationArea = All;
                        Image = SelectLineToApply;
                        //The property 'ToolTip' cannot be empty.
                        //ToolTip = '';
                        Visible = false;

                        trigger OnAction()
                        var
                            IncomingDocument: Record "Incoming Document";
                        begin
                            // IncomingDocument.SelectIncomingDocumentForPostedDocument(Rec."Document No.",Rec."Posting Date");//Nav
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        Caption = 'Create Incoming Document from File';
                        Ellipsis = true;
                        Enabled = NOT HasIncomingDocument;
                        Image = Attach;
                        ApplicationArea = All;
                        //The property 'ToolTip' cannot be empty.
                        //ToolTip = '';
                        Visible = false;

                        trigger OnAction()
                        var
                            IncomingDocumentAttachment: Record "Incoming Document Attachment";
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromPostedDocument(Rec."Document No.", Rec."Posting Date");
                        end;
                    }
                }
            }
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Scope = Repeater;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.RUN;
                end;
            }
            action("Show Posted Document")
            {
                Caption = 'Show Posted Document';
                Image = Document;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Return';

                trigger OnAction()
                begin
                    // ShowDoc
                end;
            }
            action("Files Attached")
            {
                Image = Links;
                Promoted = true;
                ApplicationArea = All;
                RunObject = Page 50014;
                RunPageLink = URL2 = FIELD("Document No.");
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        IncomingDocument: Record "Incoming Document";
    begin
    end;

    trigger OnAfterGetRecord()
    begin
        StyleTxt := Rec.SetStyle;
        VendName := '';
        RecVendor.RESET;
        RecVendor.SETRANGE("No.", Rec."Vendor No.");
        IF RecVendor.FINDFIRST THEN BEGIN
            VendName := RecVendor.Name;
        END;
    end;

    var
        Navigate: Page Navigate;
        StyleTxt: Text;
        HasIncomingDocument: Boolean;
        VendName: Text[100];
        RecVendor: Record Vendor;
        RecordLink: Record "Record Link";
}

