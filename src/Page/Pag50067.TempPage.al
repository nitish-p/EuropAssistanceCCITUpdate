/*Page 50067 "Temp Page"
{
    PageType = List;
    SourceTable = UnknownTable50024;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Esign_No.";"Esign_No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Process Data")
            {
                ApplicationArea = Basic;
                RunObject = Report MdlPurchaseOrder;
            }
        }
    }
}

*/