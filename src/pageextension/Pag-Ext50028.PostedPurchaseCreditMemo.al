pageextension 50028 "Posted Purchase Credit Memo" extends "Posted Purchase Credit Memo"
{
    // prdp 07122017
    // done the DeleteAllowed page property 'No '

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Purchase Credit Memo"(Page 140)".

    layout
    {
        addafter("Nature of Supply")
        {
            // field("Nature of Supply";Rec."Nature of Supply")
            // {
            // }
            field("GST Vendor Type"; Rec."GST Vendor Type")
            {
                ApplicationArea = All;
            }
            // field("Invoice Type";Rec."Invoice Type")
            // {
            // }
            // field("Associated Enterprises";Rec."Associated Enterprises")
            // {
            // }
            // field("Bill of Entry No.";Rec."Bill of Entry No.")
            // {
            // }
            // field("Bill of Entry Date";Rec."Bill of Entry Date")
            // {
            // }
            // field("Bill of Entry Value";Rec."Bill of Entry Value")
            // {
            // }
        }
    }
    actions
    {
        addafter(IncomingDocument)
        {
            group(Attachments)
            {
                action("Attached Files")
                {
                    Image = Links;
                    Promoted = true;
                    // RunObject = Page 50014;
                    // RunPageLink = No.=FIELD(Pre-Assigned No.);//Nkp
                }
            }
        }
    }
}

