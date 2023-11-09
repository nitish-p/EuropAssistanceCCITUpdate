Page 50033 "HRIS-NAV Employee API"
{
    PageType = List;
    SourceTable = "HRIS-NAV Employee API";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee Code"; rec."Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Mobile No."; rec."Mobile No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-mail"; rec."E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(Address; rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(City; rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("State Code"; rec."State Code")
                {
                    ApplicationArea = Basic;
                }
                field("PAN No."; rec."PAN No.")
                {
                    ApplicationArea = Basic;
                }
                field("GST Reistration No."; rec."GST Reistration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Action"; rec.Action)
                {
                    ApplicationArea = Basic;
                }
                field(Validated; rec.Validated)
                {
                    ApplicationArea = Basic;
                }
                field("Error Flag"; rec."Error Flag")
                {
                    ApplicationArea = Basic;
                }
                field(Response; rec.Response)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Created"; rec."Employee Created")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Created On"; rec."Employee Created On")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Employee Code"; rec."NAV Employee Code")
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

