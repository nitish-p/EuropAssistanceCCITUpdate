pageextension 50046 "Sales & Receivables Setup" extends "Sales & Receivables Setup" 
{
    layout
    {
        // addafter("Archive Quotes")
        // {
        //     field("GST Dependency Type";Rec."GST Dependency Type")
        //     {
        //     }
        // }
        addafter("Salesperson Dimension Code")
        {
            group(DSC)
            {
                Caption = 'DSC';
                field("DSC Folder";Rec."DSC Folder")
                {
                    ApplicationArea = All;
                }
                field("DSC Print output";Rec."DSC Print output")
                {
                     ApplicationArea = All;
                }
                field("DSC Credit Note output";Rec."DSC Credit Note output")
                {
                     ApplicationArea = All;
                }
                field("DSC Password";Rec."DSC Password")
                {
                     ApplicationArea = All;
                }
            }
        }
        // addafter("Control 25")
        // {
        //     group(GST)
        //     {
        //         Caption = 'GST';
        //         field("Posted Inv. Nos. (Exempt)";Rec."Posted Inv. Nos. (Exempt)")
        //         {
        //         }
        //         field("Posted Cr. Memo Nos. (Exempt)";Rec."Posted Cr. Memo Nos. (Exempt)")
        //         {
        //         }
        //         field("Posted Inv. No. (Export)";Rec."Posted Inv. No. (Export)")
        //         {
        //         }
        //         field("Posted Cr. Memo No. (Export)";Rec."Posted Cr. Memo No. (Export)")
        //         {
        //         }
        //         field("Posted Inv. No. (Supp)";Rec."Posted Inv. No. (Supp)")
        //         {
        //         }
        //         field("Posted Cr. Memo No. (Supp)";Rec."Posted Cr. Memo No. (Supp)")
        //         {
        //         }
        //         field("Posted Inv. No. (Debit Note)";Rec."Posted Inv. No. (Debit Note)")
        //         {
        //         }
        //         field("Posted Inv. No. (Non-GST)";Rec."Posted Inv. No. (Non-GST)")
        //         {
        //         }
        //         field("Posted Cr. Memo No. (Non-GST)";Rec."Posted Cr. Memo No. (Non-GST)")
        //         {
        //         }
        //     }
        // }
    }
}

