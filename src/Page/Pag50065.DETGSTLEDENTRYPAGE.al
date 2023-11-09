page 50065 "DET. GST LED ENTRY PAGE"
{
    ApplicationArea = All;
    Caption = 'DET. GST LED ENTRY PAGE';
    PageType = List;
    SourceTable = "Detailed GST Ledger Entry";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies whether the entry is an initial entry or an application entry or an adjustment entry.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ToolTip = 'Specifies whether the transaction is a sale or purchase.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies whether the document type is Payment, Invoice, Credit Memo, Transfer or Refund.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number of the transaction that created the entry.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the posting date of the detailed  GST ledger entry.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies whether the type is G/L Account, Item, Resource, Fixed Asset or Charge (Item).';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the Item No., G/L Account No. etc.';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ToolTip = 'Specifies whether the type is G/L Account, Item, Resource, Fixed Asset or Charge (Item).';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the Source Type as customer for sales transaction,. For purchase transaction, Source Type is vendor. For Bank Charges Transaction, Source Type is Bank account.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ToolTip = 'Specifies the vendor number, if Source Type is vendor. If Source Type is customer, then the customer number is displayed. If Source Type is Bank Account, the Bank Account No. is displayed.';
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                    ToolTip = 'Specifies the HSN for Items & Fixed Assets. SAC for Services & Resources. For charges, it can be either SAC or HSN.';
                }
                field("GST Component Code"; Rec."GST Component Code")
                {
                    ToolTip = 'Specifies the GST component code with which the entry was posted.';
                }
                field("GST Group Code"; Rec."GST Group Code")
                {
                    ToolTip = 'Displays the GST Group code of the transaction.';
                }
                field("GST Jurisdiction Type"; Rec."GST Jurisdiction Type")
                {
                    ToolTip = 'Specifies the type related to GST jurisdiction. For example, interstate/intrastate.';
                }
                field("GST Base Amount"; Rec."GST Base Amount")
                {
                    ToolTip = 'Displays the base amount on which GST percentage is applied.';
                }
                field("GST %"; Rec."GST %")
                {
                    ToolTip = 'Specifies the GST % on the GST ledger entry.';
                }
                field("GST Amount"; Rec."GST Amount")
                {
                    ToolTip = 'Displays the tax amount computed by applying GST percentage on GST base.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Displays the external document number entered in the purchase/sales document/journal bank charges Line.';
                }
                field("Amount Loaded on Item"; Rec."Amount Loaded on Item")
                {
                    ToolTip = 'Specifies the charges or tax amount loaded on the line item.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity.';
                }
                field("GST Without Payment of Duty"; Rec."GST Without Payment of Duty")
                {
                    ToolTip = 'Specifies if the transaction is made with or without payment of duty.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ToolTip = 'This displays the general ledger account of tax component.';
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                    ToolTip = 'Specifies reversal entry number. Transactions posted through journals can be reversed.';
                }
                field(Reversed; Rec.Reversed)
                {
                    ToolTip = 'Specifies whether the transaction has been reversed or not.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ToolTip = 'Specifies the document line number.';
                }
                field("Item Charge Entry"; Rec."Item Charge Entry")
                {
                    ToolTip = 'Specifies if the entry is an Item charge entry.';
                }
                field("Reverse Charge"; Rec."Reverse Charge")
                {
                    ToolTip = 'Specifies whether the reverse charge is applicable for this GST group or not.';
                }
                field("GST on Advance Payment"; Rec."GST on Advance Payment")
                {
                    ToolTip = 'Specifies if GST is required to be calculated on Advance Payment.';
                }
                field("Payment Document No."; Rec."Payment Document No.")
                {
                    ToolTip = 'Specifies the settlement document number  when GST is paid through GST settlement.';
                }
                field("GST Exempted Goods"; Rec."GST Exempted Goods")
                {
                    ToolTip = 'Specifies if the goods/services are exempted from GST.';
                }
                field("Location  Reg. No."; Rec."Location  Reg. No.")
                {
                    ToolTip = 'Specifies the GSTIN of location.';
                }
                field("Buyer/Seller Reg. No."; Rec."Buyer/Seller Reg. No.")
                {
                    ToolTip = 'Specifies the customer/vendor GST Registration number.';
                }
                field("GST Group Type"; Rec."GST Group Type")
                {
                    ToolTip = 'Specifies if the GST group is assigned for goods or service.';
                }
                field("GST Credit"; Rec."GST Credit")
                {
                    ToolTip = 'Specifies if the GST credit has to be availed or not.';
                }
                field("Reversal Entry"; Rec."Reversal Entry")
                {
                    ToolTip = 'Specifies the value of the Reversal Entry field.';
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    ToolTip = 'Specifies the transaction number that the Detailed GST entry belongs to.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the currency code on GST ledger entry.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ToolTip = 'Specifies currency factor for this transactions.';
                }
                field("Application Doc. Type"; Rec."Application Doc. Type")
                {
                    ToolTip = 'Specifies the value of the Application Doc. Type field.';
                }
                field("Application Doc. No"; Rec."Application Doc. No")
                {
                    ToolTip = 'Specifies the value of the Application Doc. No field.';
                }
                field("Applied From Entry No."; Rec."Applied From Entry No.")
                {
                    ToolTip = 'Specifies the value of the Applied From Entry No. field.';
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                    ToolTip = 'Specifies the value of the Reversed Entry No. field.';
                }
                field("Remaining Closed"; Rec."Remaining Closed")
                {
                    ToolTip = 'Specifies the value of the Remaining Closed field.';
                }
                field("GST Rounding Precision"; Rec."GST Rounding Precision")
                {
                    ToolTip = 'Specifies the GST Rounding precision for the GST Ledger Entry';
                }
                field("GST Rounding Type"; Rec."GST Rounding Type")
                {
                    ToolTip = 'Specifies the GST Rounding type for the GST Ledger Entry';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("GST Customer Type"; Rec."GST Customer Type")
                {
                    ToolTip = 'Specifies the type of the customer. For example, Registered, Unregistered, Export etc..';
                }
                field("GST Vendor Type"; Rec."GST Vendor Type")
                {
                    ToolTip = 'Specifies the type of the vendor. For example,  Registered, Unregistered, Composite, Import etc..';
                }
                field("Original Invoice No."; Rec."Original Invoice No.")
                {
                    ToolTip = 'Specifies the Original invoice number on the GST ledger entry.';
                }
                field("Reconciliation Month"; Rec."Reconciliation Month")
                {
                    ToolTip = 'Specifies the year in which the transaction is Reconciled through GST Reconciliation feature.';
                }
                field("Reconciliation Year"; Rec."Reconciliation Year")
                {
                    ToolTip = 'Specifies the year in which the transaction is Reconciled through GST Reconciliation feature.';
                }
                field(Reconciled; Rec.Reconciled)
                {
                    ToolTip = 'Specifies if the transaction has been Reconciled.';
                }
                field("Credit Availed"; Rec."Credit Availed")
                {
                    ToolTip = 'Specifies if the GST credit has been availed or not.';
                }
                field(Paid; Rec.Paid)
                {
                    ToolTip = 'Specifies whether GST has been paid to the government through GST settlement.';
                }
                field("Credit Adjustment Type"; Rec."Credit Adjustment Type")
                {
                    ToolTip = 'Specifies the type of credit adjustment. For example, credit reversal, credit re-availment etc.';
                }
                field(UnApplied; Rec.UnApplied)
                {
                    ToolTip = 'Specifies the value of the UnApplied field.';
                }
                field("GST Place of Supply"; Rec."GST Place of Supply")
                {
                    ToolTip = 'Specifies the GST Place of Supply. For example Bill-to Address, Ship-to Address, Location Address etc.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ToolTip = 'Specifies the type of payment.';
                }
                field(Distributed; Rec.Distributed)
                {
                    ToolTip = 'Specifies the value of the Distributed field.';
                }
                field("Distributed Reversed"; Rec."Distributed Reversed")
                {
                    ToolTip = 'Specifies the value of the Distributed Reversed field.';
                }
                field("Input Service Distribution"; Rec."Input Service Distribution")
                {
                    ToolTip = 'Specifies the value of the Input Service Distribution field.';
                }
                field(Opening; Rec.Opening)
                {
                    ToolTip = 'Specifies the value of the Opening field.';
                }
                field("Remaining Base Amount"; Rec."Remaining Base Amount")
                {
                    ToolTip = 'Specifies the value of the Remaining Base Amount field.';
                }
                field("Remaining GST Amount"; Rec."Remaining GST Amount")
                {
                    ToolTip = 'Specifies the value of the Remaining GST Amount field.';
                }
                field("Dist. Document No."; Rec."Dist. Document No.")
                {
                    ToolTip = 'Specifies the value of the Dist. Document No. field.';
                }
                field("Associated Enterprises"; Rec."Associated Enterprises")
                {
                    ToolTip = 'Specifies the value of the Associated Enterprises field.';
                }
                field("Liable to Pay"; Rec."Liable to Pay")
                {
                    ToolTip = 'Specifies whether the payment liability occurs  for the transaction or not.';
                }
                field("Dist. Input GST Credit"; Rec."Dist. Input GST Credit")
                {
                    ToolTip = 'Specifies the entry of dist. input GST  credit by marking true or false.';
                }
                field("Dist. Reverse Document No."; Rec."Dist. Reverse Document No.")
                {
                    ToolTip = 'Specifies the value of the Dist. Reverse Document No. field.';
                }
                field("Eligibility for ITC"; Rec."Eligibility for ITC")
                {
                    ToolTip = 'Specifies the Eligibility for ITC on the GST ledger entry.';
                }
                field("GST Assessable Value"; Rec."GST Assessable Value")
                {
                    ToolTip = 'Specifies the GST assessable value on the GST ledger entry.';
                }
                field("GST Inv. Rounding Precision"; Rec."GST Inv. Rounding Precision")
                {
                    ToolTip = 'Specifies the value of the GST Inv. Rounding Precision field.';
                }
                field("GST Inv. Rounding Type"; Rec."GST Inv. Rounding Type")
                {
                    ToolTip = 'Specifies the value of the GST Inv. Rounding Type field.';
                }
                field("Cr. & Liab. Adjustment Type"; Rec."Cr. & Liab. Adjustment Type")
                {
                    ToolTip = 'Specifies the credit and liability adjustment type for the ledger entry.';
                }
                field("AdjustmentBase Amount"; Rec."AdjustmentBase Amount")
                {
                    ToolTip = 'Specifies the value of the AdjustmentBase Amount field.';
                }
                field("Adjustment Amount"; Rec."Adjustment Amount")
                {
                    ToolTip = 'Specifies the value of the Adjustment Amount field.';
                }
                field("Custom Duty Amount"; Rec."Custom Duty Amount")
                {
                    ToolTip = 'Specifies the Custom duty amount on the GST ledger entry.';
                }
                field("Journal Entry"; Rec."Journal Entry")
                {
                    ToolTip = 'Specifies if the transaction is posted from Journal with document type Invoice or Credit Memo.';
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ToolTip = 'Specifies the value of the Remaining Quantity field.';
                }
                field("ARN No."; Rec."ARN No.")
                {
                    ToolTip = 'Specifies the Customer/Vendor ARN number.';
                }
                field("Forex Fluctuation"; Rec."Forex Fluctuation")
                {
                    ToolTip = 'Specifies the Forex fluctuation on the ledger entry.';
                }
                field("Fluctuation Amt. Credit"; Rec."Fluctuation Amt. Credit")
                {
                    ToolTip = 'Specifies the value of the Fluctuation Amt. Credit field.';
                }
                field("CAJ %"; Rec."CAJ %")
                {
                    ToolTip = 'Specifies the CAJ % which is updated from credit adjustment journal line.';
                }
                field("CAJ Amount"; Rec."CAJ Amount")
                {
                    ToolTip = 'Specifies the CAJ amount which is updated from credit adjustment journal line, displays the adjusted GST amount.';
                }
                field("CAJ % Permanent Reversal"; Rec."CAJ % Permanent Reversal")
                {
                    ToolTip = 'Specifies the CAJ % of payment reversal which is updated from credit adjustment journal line if Adjustment Type is selected as Permanent Reversal. ';
                }
                field("CAJ Amount Permanent Reversal"; Rec."CAJ Amount Permanent Reversal")
                {
                    ToolTip = 'Specifies the amount of permanent reversal which is  updated from credit adjustment journal line, displays the GST amount for Adjustment Type - Permanent Reversal.';
                }
                field("Remaining CAJ Adj. Base Amt"; Rec."Remaining CAJ Adj. Base Amt")
                {
                    ToolTip = 'Specifies the remaining GST base amount after posting adjustments which is updated on posting credit adjustment journal. ';
                }
                field("Remaining CAJ Adj. Amt"; Rec."Remaining CAJ Adj. Amt")
                {
                    ToolTip = 'Specifies the remaining GST amount after posting adjustments which is updated on posting credit adjustment journal. ';
                }
                field("CAJ Base Amount"; Rec."CAJ Base Amount")
                {
                    ToolTip = 'Specifies the value of the CAJ Base Amount field.';
                }
                field("G/L Entry No."; Rec."G/L Entry No.")
                {
                    ToolTip = 'Specifies the value of the G/L Entry No. field.';
                }
                field("Skip Tax Engine Trigger"; Rec."Skip Tax Engine Trigger")
                {
                    ToolTip = 'Specifies the value of the Skip Tax Engine Trigger field.';
                }
                field("Executed Use Case ID"; Rec."Executed Use Case ID")
                {
                    ToolTip = 'Specifies the value of the Executed Use Case ID field.';
                }
                field("Post GST to Customer"; Rec."Post GST to Customer")
                {
                    ToolTip = 'Specifies the value of the Post GST to Customer field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
}
