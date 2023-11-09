Page 50029 "Custom Bank Acc. Ledger"
{
    Caption = 'Bank Acc Led Entry for Bank File';
    DataCaptionFields = "Bank Account No.";
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData "Bank Account Ledger Entry" = rm;
    SourceTable = "Bank Account Ledger Entry";
    SourceTableView = sorting("Entry No.")
                      order(descending)
                      where("Bank Account No." = const('BANK0001'),
                            "Document Type" = const(Payment),
                            "Bal. Account Type" = const(Vendor),
                            "Source Code" = filter(<> 'REVERSAL'));
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Select; rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Account No."; rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                /*   field("Stale Cheque";rec."Stale Cheque")
                   {
                       ApplicationArea = Basic;
                       Visible = false;
                   }
                   field("Stale Cheque Expiry Date";rec."Stale Cheque Expiry Date")
                   {
                       ApplicationArea = Basic;
                       Visible = false;
                   }
                   field("Cheque Stale Date";rec."Cheque Stale Date")
                   {
                       ApplicationArea = Basic;
                       Visible = false;
                   }*/
                //Naveen
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Our Contact Code"; rec."Our Contact Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount (LCY)"; rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Remaining Amount"; rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Bal. Account Type"; rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Bal. Account No."; rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Open; rec.Open)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("User ID"; rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Source Code"; rec."Source Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Reason Code"; rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Reversed; rec.Reversed)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Reversed by Entry No."; rec."Reversed by Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Reversed Entry No."; rec."Reversed Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                /*  field("Location Code";rec."Location Code")
                  {
                      ApplicationArea = Basic;
                      Visible = false;
                  }*/
                //Naveen
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Narration; rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field(Success; rec.Success)
                {
                    ApplicationArea = Basic;
                }
                field("Fail To Success"; rec."Fail To Success")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Succeeded; rec.Succeeded)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Integrated Invoice Type"; rec."Integrated Invoice Type")
                {
                    ApplicationArea = Basic;
                }
                /* field("Cheque No.";rec."Cheque No.")
                 {
                     ApplicationArea = Basic;
                 }*/
                //Naveen
                field("Payment Status Code"; rec."Payment Status Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Status"; rec."Payment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Sent To Middleware"; rec."Sent To Middleware")
                {
                    ApplicationArea = Basic;
                }
                field("UTR No."; rec."UTR No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment File Name"; rec."Payment File Name")
                {
                    ApplicationArea = Basic;
                }
                field("File Exported On"; rec."File Exported On")
                {
                    ApplicationArea = Basic;
                }
                field("File No."; rec."File No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
            }
            action("&Navigate")
            {
                ApplicationArea = Basic;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.Run;
                end;
            }
            group("Bank File Export")
            {
                Caption = 'Bank File Export';
            }
            action("Select All")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    // prdp +++
                    if not Confirm('Do you want Select all lines ?', false)
                      then
                        exit;

                    BankAccLedEntry.Reset;
                    BankAccLedEntry.CopyFilters(Rec);
                    BankAccLedEntry.Copyfilter("Document No.", BankAccLedEntry."Document No.");
                    if BankAccLedEntry.FindSet then
                        repeat
                            BankAccLedEntry.Select := true;
                            BankAccLedEntry.Modify;
                        until BankAccLedEntry.Next = 0;
                    // prdp ---
                end;
            }
            action("Deselect All")
            {
                ApplicationArea = Basic;
                Image = UnApply;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    // prdp +++
                    if not Confirm('Do you want Deselect all lines ?', false)
                      then
                        exit;

                    BankAccLedEntry.Reset;
                    BankAccLedEntry.CopyFilters(Rec);
                    BankAccLedEntry.Copyfilter("Document No.", BankAccLedEntry."Document No.");
                    BankAccLedEntry.SetRange(Select, true);
                    if BankAccLedEntry.FindSet then
                        repeat
                            BankAccLedEntry.Select := false;
                            BankAccLedEntry.Modify;
                        until BankAccLedEntry.Next = 0;
                    // prdp ---
                end;
            }
            action("Export Bank File")
            {
                ApplicationArea = Basic;
                Image = Export;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    BankAccLedEntry.Reset;
                    BankAccLedEntry.SetRange(Select, true);
                    if not BankAccLedEntry.FindFirst then begin
                        Error('Not a single line is selected to export');
                    end;

                    Report.Run(50051);
                end;
            }
        }
    }

    trigger OnClosePage()
    begin
        BankAccLedEntry.Reset;
        BankAccLedEntry.SetRange(Select, true);
        if BankAccLedEntry.FindSet then
            repeat
                BankAccLedEntry.Select := false;
                BankAccLedEntry.Modify;
            until BankAccLedEntry.Next = 0;
    end;

    trigger OnOpenPage()
    begin
        BankAccLedEntry.Reset;
        BankAccLedEntry.SetRange(Select, true);
        if BankAccLedEntry.FindSet then
            repeat
                BankAccLedEntry.Select := false;
                BankAccLedEntry.Modify;
            until BankAccLedEntry.Next = 0;
    end;

    var
        Navigate: Page Navigate;
        Text16500: label 'Bank Ledger Entry can be marked as stale only after %1. ';
        Text16501: label 'The cheque has already been marked stale.';
        Text16502: label 'Financially stale check %1 to %2 %3';
        BankAccLedEntry: Record "Bank Account Ledger Entry";
}

