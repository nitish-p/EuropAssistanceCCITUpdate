Page 50045 VLE
{
    PageType = List;
    Permissions = TableData "Vendor Ledger Entry"=rimd;
    SourceTable = "Vendor Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";rec."Vendor No.")
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
                    Editable = true;
                }
                field("Remaining Amount";rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Original Amt. (LCY)";rec."Original Amt. (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amt. (LCY)";rec."Remaining Amt. (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Amount (LCY)";rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase (LCY)";rec."Purchase (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Inv. Discount (LCY)";rec."Inv. Discount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor No.";rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group";rec."Vendor Posting Group")
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
                field("Purchaser Code";rec."Purchaser Code")
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
                field("On Hold";rec."On Hold")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Doc. Type";rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Doc. No.";rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                }
                field(Open;rec.Open)
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Pmt. Discount Date";rec."Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                }
                field("Original Pmt. Disc. Possible";rec."Original Pmt. Disc. Possible")
                {
                    ApplicationArea = Basic;
                }
                field("Pmt. Disc. Rcd.(LCY)";rec."Pmt. Disc. Rcd.(LCY)")
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
                field("Closed by Amount";rec."Closed by Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to ID";rec."Applies-to ID")
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
                field("Closed by Amount (LCY)";rec."Closed by Amount (LCY)")
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
                field("External Document No.";rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Closed by Currency Code";rec."Closed by Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Closed by Currency Amount";rec."Closed by Currency Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Adjusted Currency Factor";rec."Adjusted Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field("Original Currency Factor";rec."Original Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field("Original Amount";rec."Original Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filter";rec."Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Pmt. Disc. Possible";rec."Remaining Pmt. Disc. Possible")
                {
                    ApplicationArea = Basic;
                }
                field("Pmt. Disc. Tolerance Date";rec."Pmt. Disc. Tolerance Date")
                {
                    ApplicationArea = Basic;
                }
                field("Max. Payment Tolerance";rec."Max. Payment Tolerance")
                {
                    ApplicationArea = Basic;
                }
                field("Accepted Payment Tolerance";rec."Accepted Payment Tolerance")
                {
                    ApplicationArea = Basic;
                }
                field("Accepted Pmt. Disc. Tolerance";rec."Accepted Pmt. Disc. Tolerance")
                {
                    ApplicationArea = Basic;
                }
                field("Pmt. Tolerance (LCY)";rec."Pmt. Tolerance (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Amount to Apply";rec."Amount to Apply")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Code";rec."IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
                field("Applying Entry";rec."Applying Entry")
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
                field(Prepayment;rec.Prepayment)
                {
                    ApplicationArea = Basic;
                }
                field("Creditor No.";rec."Creditor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference";rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Method Code";rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Ext. Doc. No.";rec."Applies-to Ext. Doc. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Recipient Bank Account";rec."Recipient Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Message to Recipient";rec."Message to Recipient")
                {
                    ApplicationArea = Basic;
                }
                field("Exported to Payment File";rec."Exported to Payment File")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Total TDS Including SHE CESS";rec."Total TDS Including SHE CESS")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code";rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST on Advance Payment";rec."GST on Advance Payment")
                {
                    ApplicationArea = Basic;
                }
                field("HSN/SAC Code";rec."HSN/SAC Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST Reverse Charge";rec."GST Reverse Charge")
                {
                    ApplicationArea = Basic;
                }
                field("Adv. Pmt. Adjustment";rec."Adv. Pmt. Adjustment")
                {
                    ApplicationArea = Basic;
                }
                field("Location State Code";rec."Location State Code")
                {
                    ApplicationArea = Basic;
                }
                field("Buyer State Code";rec."Buyer State Code")
                {
                    ApplicationArea = Basic;
                }
                field("Buyer GST Reg. No.";rec."Buyer GST Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("GST Vendor Type";rec."GST Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Location GST Reg. No.";rec."Location GST Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("GST Jurisdiction Type";rec."GST Jurisdiction Type")
                {
                    ApplicationArea = Basic;
                }
                field(Narration;rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field("Integration Document No";rec."Integration Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Reference Invoice Number";rec."Reference Invoice Number")
                {
                    ApplicationArea = Basic;
                }
                field("Integrated Invoice Type";rec."Integrated Invoice Type")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Date";rec."Invoice Date")
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
                field("GST Amount";rec."GST Amount")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Amount";rec."TDS Amount")
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
                field("GST Paid";rec."GST Paid")
                {
                    ApplicationArea = Basic;
                }
                field("Base Payment";rec."Base Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Base Paid";rec."Base Paid")
                {
                    ApplicationArea = Basic;
                }
                field("Total Payment";rec."Total Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Total Paid";rec."Total Paid")
                {
                    ApplicationArea = Basic;
                }
                field("Icici Payment Status";rec."Icici Payment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor PAN No.";rec."Vendor PAN No.")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Ref. No.";rec."Customer Ref. No.")
                {
                    ApplicationArea = Basic;
                }
                field("PO Number";rec."PO Number")
                {
                    ApplicationArea = Basic;
                }
                field("PO Date";rec."PO Date")
                {
                    ApplicationArea = Basic;
                }
                field("Billing Type";rec."Billing Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recall Response";rec."Recall Response")
                {
                    ApplicationArea = Basic;
                }
                field("Recall Response Message";rec."Recall Response Message")
                {
                    ApplicationArea = Basic;
                }
                field("UTR Sent to Middleware";rec."UTR Sent to Middleware")
                {
                    ApplicationArea = Basic;
                }
                field("Date Credited in Bank1";rec."Date Credited in Bank1")
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

