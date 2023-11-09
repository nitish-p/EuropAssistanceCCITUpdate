pageextension 50021 GeneralLedgerSetup extends "General Ledger Setup"
{
    layout
    {
        addafter("Print VAT specification in LCY")
        {
            // field("Purch Acc (Job Work Liability)";Rec."Purch Acc (Job Work Liability)")
            // {
            // }
            // field("Amount Rounding Precision";"Amount Rounding Precision")
            // {
            // }
            field("Bank Accoount For FTSP"; Rec."Bank Accoount For FTSP")
            {
            }
            field("Bank Accoount For Non-FTSP"; Rec."Bank Accoount For Non-FTSP")
            {
            }
        }
        addafter("VAT Reporting Date Usage")
        {
            field("Bank Payment File Path"; Rec."Bank Payment File Path")
            {
            }
        }
        addafter("Bank Payment File Path")
        {
            // group(GST)
            // {
            //     Caption = 'GST';
            //     field("GST Rounding Precision";Rec."GST Rounding Precision")
            //     {
            //     }
            //     field("GST Rounding Type";Rec."GST Rounding Type")
            //     {
            //     }
            //     field("IGST Payable A/c (Import)";Rec."IGST Payable A/c (Import)")
            //     {
            //     }
            //     field("GST Recon. Tolerance";Rec."GST Recon. Tolerance")
            //     {
            //     }
            // }
            group("Attachment Paths")
            {
                field("Purch.Inv. Attach. Path"; Rec."Purch.Inv. Attach. Path")
                {
                }
                field("Purch Cr Memo Attach. Path"; Rec."Purch Cr Memo Attach. Path")
                {
                }
                field("Sales Inv. Attach. Path"; Rec."Sales Inv. Attach. Path")
                {
                }
                field("Sales Cr Memo Attach. Path"; Rec."Sales Cr Memo Attach. Path")
                {
                }
                field("JVs Attachment Path"; Rec."JVs Attachment Path")
                {
                }
                field("Bank Details Attach. Path"; Rec."Bank Details Attach. Path")
                {
                }
                field("Policy Details Attachment"; Rec."Policy Details Attachment")
                {
                }
                field("ICICI H2H File Path"; Rec."ICICI H2H File Path")
                {
                }
                field("ICICI UTR File Path"; Rec."ICICI UTR File Path")
                {
                }
                field("NAV H2H File Path"; Rec."NAV H2H File Path")
                {
                }
                field("NAV UTR File Path"; Rec."NAV UTR File Path")
                {
                }
            }
            group("FIN SCAN")
            {
                field("SFTP Folder (Input)"; Rec."SFTP Folder (Input)")
                {
                }
                field("SFTP Folder (Rollup)"; Rec."SFTP Folder (Rollup)")
                {
                }
                field("Audit File Folder"; Rec."Audit File Folder")
                {
                }
            }
        }
    }
}

