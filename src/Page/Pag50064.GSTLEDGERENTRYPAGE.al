Page 50064 "GST LEDGER ENTRY PAGE"
{
    PageType = List;
    Permissions = TableData "GST Ledger Entry" = rimd;
    SourceTable = "GST Ledger Entry";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Type"; rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field("GST Base Amount"; rec."GST Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Source Type"; rec."Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source No."; rec."Source No.")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Source Code"; rec."Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Reason Code"; rec."Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Group Type"; rec."Purchase Group Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction No."; rec."Transaction No.")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("GST Component Code"; rec."GST Component Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST on Advance Payment"; rec."GST on Advance Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Reverse Charge"; rec."Reverse Charge")
                {
                    ApplicationArea = Basic;
                }
                field("GST Amount"; rec."GST Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Factor"; rec."Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed; rec.Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reversed Entry No."; rec."Reversed Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed by Entry No."; rec."Reversed by Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(UnApplied; rec.UnApplied)
                {
                    ApplicationArea = Basic;
                }
                field("Entry Type"; rec."Entry Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

