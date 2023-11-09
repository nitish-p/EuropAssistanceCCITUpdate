Page 50059 "GL ENTRIES PAGE"
{
    PageType = List;
    Permissions = TableData "G/L Entry" = rimd;
    SourceTable = "G/L Entry";
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
                field("G/L Account No."; rec."G/L Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Bal. Account No."; rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; rec."Global Dimension 2 Code")
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
                field("System-Created Entry"; rec."System-Created Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Prior-Year Entry"; rec."Prior-Year Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount"; rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Business Unit Code"; rec."Business Unit Code")
                {
                    ApplicationArea = Basic;
                }
                field("Journal Batch Name"; rec."Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reason Code"; rec."Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Posting Type"; rec."Gen. Posting Type")
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
                field("Bal. Account Type"; rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction No."; rec."Transaction No.")
                {
                    ApplicationArea = Basic;
                }
                field("Debit Amount"; rec."Debit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Credit Amount"; rec."Credit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; rec."External Document No.")
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
                field("No. Series"; rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Area Code"; rec."Tax Area Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Liable"; rec."Tax Liable")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Group Code"; rec."Tax Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Use Tax"; rec."Use Tax")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Additional-Currency Amount"; rec."Additional-Currency Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Add.-Currency Debit Amount"; rec."Add.-Currency Debit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Add.-Currency Credit Amount"; rec."Add.-Currency Credit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Close Income Statement Dim. ID"; rec."Close Income Statement Dim. ID")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Code"; rec."IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed; rec.Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reversed by Entry No."; rec."Reversed by Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed Entry No."; rec."Reversed Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Name"; rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Prod. Order No."; rec."Prod. Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("FA Entry Type"; rec."FA Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("FA Entry No."; rec."FA Entry No.")
                {
                    ApplicationArea = Basic;
                }
                //    field("Tax Amount";rec."Tax Amount")
                //     {
                //         ApplicationArea = Basic;
                //     }
                //     field("Location Code";rec."Location Code")
                //     {
                //         ApplicationArea = Basic;
                //     }
                //     field("Tax Type";rec."Tax Type")
                //     {
                //         ApplicationArea = Basic;
                //     }
                //Naveen
                field(Narration; rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Date"; rec."Invoice Date")
                {
                    ApplicationArea = Basic;
                }
                field("GST Amount"; rec."GST Amount")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Amount"; rec."TDS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Original Posting Date"; rec."Original Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reverse Transaction"; rec."Reverse Transaction")
                {
                    ApplicationArea = Basic;
                }
                field("Reference Invoice Number"; rec."Reference Invoice Number")
                {
                    ApplicationArea = Basic;
                }
                field("EA Transaction Type"; rec."EA Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code"; rec."Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Client Level Dimension"; rec."Client Level Dimension")
                {
                    ApplicationArea = Basic;
                }
                field("Case No."; rec."Case No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor PAN No."; rec."Vendor PAN No.")
                {
                    ApplicationArea = Basic;
                }
                field("PO Number"; rec."PO Number")
                {
                    ApplicationArea = Basic;
                }
                field("PO Date"; rec."PO Date")
                {
                    ApplicationArea = Basic;
                }
                field("Billing Type"; rec."Billing Type")
                {
                    ApplicationArea = Basic;
                }
                field("UTR No."; rec."UTR No.")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Ref. No."; rec."Customer Ref. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Date Credited in Bank"; rec."Date Credited in Bank")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Code"; rec."Dealer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Integration Document No"; rec."Integration Document No")
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

