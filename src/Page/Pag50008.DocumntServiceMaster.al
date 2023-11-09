Page 50008 "Documnt Service Master"
{
    Editable = false;
    PageType = List;
    SourceTable = "Documentwise Service Master";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Line No."; rec."Document Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension code"; rec."Dimension code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Value Code"; rec."Dimension Value Code")
                {
                    ApplicationArea = Basic;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Policy No/OEM Inv/Ref No"; rec."Policy No/OEM Inv/Ref No")
                {
                    ApplicationArea = Basic;
                }
                field("Year of MFG"; rec."Year of MFG")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Regn No"; rec."Vehicle Regn No")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Contact No"; rec."Customer Contact No")
                {
                    ApplicationArea = Basic;
                }
                field("Policy / Coverage Start Date"; rec."Policy / Coverage Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy / Coverage End Date"; rec."Policy / Coverage End Date")
                {
                    ApplicationArea = Basic;
                }
                field(City; rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(State; rec.State)
                {
                    ApplicationArea = Basic;
                }
                field(Region; rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Policy Type"; rec."Policy Type")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Country"; rec."Destination Country")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Region"; rec."Destination Region")
                {
                    ApplicationArea = Basic;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Identification No"; rec."Vehicle Identification No")
                {
                    ApplicationArea = Basic;
                }
                field("Integration doc No"; rec."Integration doc No")
                {
                    ApplicationArea = Basic;
                }
                field(Cancelled; rec.Cancelled)
                {
                    ApplicationArea = Basic;
                }
                field("Old Integration Doc No"; rec."Old Integration Doc No")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Customer"; rec."NAV Customer")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Customer Name"; rec."NAV Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Credit Memo Doc No"; rec."Credit Memo Doc No")
                {
                    ApplicationArea = Basic;
                }
                field("Credit Memo Line No"; rec."Credit Memo Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Doc No"; rec."Purchase Doc No")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Doc Line No"; rec."Purchase Doc Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Department Dim"; rec."Department Dim")
                {
                    ApplicationArea = Basic;
                }
                field("Business Line Dim"; rec."Business Line Dim")
                {
                    ApplicationArea = Basic;
                }
                field(Narration; rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field("Case No"; rec."Case No")
                {
                    ApplicationArea = Basic;
                }
                field("Item No"; rec."Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("PI No."; rec."PI No.")
                {
                    ApplicationArea = Basic;
                }
                field("PI Posting Date"; rec."PI Posting Date")
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

