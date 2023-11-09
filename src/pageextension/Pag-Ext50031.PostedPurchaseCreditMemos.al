pageextension 50031 "Posted Purchase Credit Memos" extends "Posted Purchase Credit Memos" 
{
    // prdp 07122017
    // done the DeleteAllowed page property 'No '

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Purchase Credit Memos"(Page 147)".

    layout
    {
        addafter("Applies-to Doc. Type")
        {
            field("Integration Doc No";Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("&Navigate")
        {
            group(Attachments)
            {
                action("Attached Files")
                {
                    ApplicationArea = All;
                    Image = Links;
                    Promoted = true;
                    // RunObject = Page 50014;
                    // RunPageLink = No.=FIELD(Pre-Assigned No.);//nkp
                }
            }
        }
    }
}

