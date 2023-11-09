Page 50025 "Update From Bank API"
{
    PageType = List;
    SourceTable = "Update From Bank";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction No.";rec."Transaction No.")
                {
                    ApplicationArea = Basic;
                }
                field("UTR No";rec."UTR No")
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
                field("NAV Response";rec."NAV Response")
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

