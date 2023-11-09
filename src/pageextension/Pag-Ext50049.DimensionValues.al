pageextension 50049 "Dimension Values" extends "Dimension Values"
{
    // Pallavi 04012017
    // createc action for running service idnetifier
    // Pallavi 15012017
    // modified page property for action  for service identifier master
    actions
    {
        addafter("F&unctions")
        {
            action("Service Master")
            {
                ApplicationArea = All;
                RunObject = Page "Document Wise Service Master";
                RunPageLink = "Dimension code" = FIELD("Dimension Code"),
                              "Dimension Value Code" = FIELD(Code);
            }
        }
    }
}

