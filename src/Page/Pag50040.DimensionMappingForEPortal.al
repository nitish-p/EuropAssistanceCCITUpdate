Page 50040 "Dimension Mapping For E-Portal"
{
    PageType = List;
    SourceTable = "Dimension Mapping For E-Portal";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("E-Portal Client Name"; rec."E-Portal Client Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Client Code Dimension"; rec."Client Code Dimension")
                {
                    ApplicationArea = Basic;
                }
                field("Business Line Dimension"; rec."Business Line Dimension")
                {
                    ApplicationArea = Basic;
                }
                field("Department Dimension"; rec."Department Dimension")
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

