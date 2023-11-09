Page 50053 "Bank Acc Led Entry"
{
    PageType = List;
    Permissions = TableData "Bank Account Ledger Entry"=rimd;
    SourceTable = "Bank Account Ledger Entry";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account No.";rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amount";rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Amount (LCY)";rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Acc. Posting Group";rec."Bank Acc. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Our Contact Code";rec."Our Contact Code")
                {
                    ApplicationArea = Basic;
                }
                field("User ID";rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Source Code";rec."Source Code")
                {
                    ApplicationArea = Basic;
                }
                field(Open;rec.Open)
                {
                    ApplicationArea = Basic;
                }
                field(Positive;rec.Positive)
                {
                    ApplicationArea = Basic;
                }
                field("Closed by Entry No.";rec."Closed by Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Closed at Date";rec."Closed at Date")
                {
                    ApplicationArea = Basic;
                }
                field("Journal Batch Name";rec."Journal Batch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reason Code";rec."Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bal. Account Type";rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bal. Account No.";rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction No.";rec."Transaction No.")
                {
                    ApplicationArea = Basic;
                }
                field("Statement Status";rec."Statement Status")
                {
                    ApplicationArea = Basic;
                }
                field("Statement No.";rec."Statement No.")
                {
                    ApplicationArea = Basic;
                }
                field("Statement Line No.";rec."Statement Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Debit Amount";rec."Debit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Credit Amount";rec."Credit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Debit Amount (LCY)";rec."Debit Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Credit Amount (LCY)";rec."Credit Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No.";Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed;rec.Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reversed by Entry No.";rec."Reversed by Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed Entry No.";rec."Reversed Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Check Ledger Entries";rec."Check Ledger Entries")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
            //    field("Location Code";rec."Location Code")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //Naveen
                field("Cheque No.";rec."Cheque No.")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date";rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field("Stale Cheque";rec."Stale Cheque")
                {
                    ApplicationArea = Basic;
                }
                field("Stale Cheque Expiry Date";rec."Stale Cheque Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Stale Date";rec."Cheque Stale Date")
                {
                    ApplicationArea = Basic;
                }
                field("Generate XML_IMPS";rec."Generate XML_IMPS")
                {
                    ApplicationArea = Basic;
                }
                field(Narration;rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field("Batch Reference";rec."Batch Reference")
                {
                    ApplicationArea = Basic;
                }
                field(Success;rec.Success)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference";rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Generate XML_NEFT";rec."Generate XML_NEFT")
                {
                    ApplicationArea = Basic;
                }
                field("Batch Refrence NEFT";rec."Batch Refrence NEFT")
                {
                    ApplicationArea = Basic;
                }
                field("Success NEFT";rec."Success NEFT")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Refrence NEFT";rec."Payment Refrence NEFT")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Field";rec."Bank Field")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Field NEFT";rec."Bank Field NEFT")
                {
                    ApplicationArea = Basic;
                }
                field("Fail To Success";rec."Fail To Success")
                {
                    ApplicationArea = Basic;
                }
                field(Succeeded;rec.Succeeded)
                {
                    ApplicationArea = Basic;
                }
                field(Export;rec.Export)
                {
                    ApplicationArea = Basic;
                }
                field(Exported;rec.Exported)
                {
                    ApplicationArea = Basic;
                }
                field("File Returned";rec."File Returned")
                {
                    ApplicationArea = Basic;
                }
                field("CSV File Name";rec."CSV File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Exported Date";rec."Exported Date")
                {
                    ApplicationArea = Basic;
                }
                field("Export No.";rec."Export No.")
                {
                    ApplicationArea = Basic;
                }
                field(Identifier;rec.Identifier)
                {
                    ApplicationArea = Basic;
                }
                field("Refrence No.";rec."Refrence No.")
                {
                    ApplicationArea = Basic;
                }
                field("Return Pay Ref No";rec."Return Pay Ref No")
                {
                    ApplicationArea = Basic;
                }
                field(Status;rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Integration Doc No";rec."Integration Doc No")
                {
                    ApplicationArea = Basic;
                }
                field("Integrated Invoice Type";rec."Integrated Invoice Type")
                {
                    ApplicationArea = Basic;
                }
                field("UTR No.";rec."UTR No.")
                {
                    ApplicationArea = Basic;
                }
                field("File Name";rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Status Code";rec."Payment Status Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Status";rec."Payment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Sent To Middleware";rec."Sent To Middleware")
                {
                    ApplicationArea = Basic;
                }
                field("Inserted On";rec."Inserted On")
                {
                    ApplicationArea = Basic;
                }
                field(Select;rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("Payment File Name";rec."Payment File Name")
                {
                    ApplicationArea = Basic;
                }
                field("File Exported On";rec."File Exported On")
                {
                    ApplicationArea = Basic;
                }
                field("File No.";rec."File No.")
                {
                    ApplicationArea = Basic;
                }
                field("Suggsted Payment";rec."Suggsted Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Mode";rec."Payment Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Date Credited in Bank";rec."Date Credited in Bank")
                {
                    ApplicationArea = Basic;
                }
                field("GST Payment";rec."GST Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Base Payment";rec."Base Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Total Payment";rec."Total Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Icici Payment Status";rec."Icici Payment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Ref. No.";rec."Customer Ref. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name";rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Code";rec."Dealer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary Name";rec."Beneficiary Name")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary Acc. No.";rec."Beneficiary Acc. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary IFSC Code";rec."Beneficiary IFSC Code")
                {
                    ApplicationArea = Basic;
                }
                field("Date Cancelled in Bank";rec."Date Cancelled in Bank")
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

