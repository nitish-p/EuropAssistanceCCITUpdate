Page 50010 "Creditor Transer IMPS Subform"
{
    PageType = ListPart;
    SourceTable = "HRIS-NAV Employee API";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Control1000000001)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Case Id";rec."Case Id")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code";rec."Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name;rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Mobile No.";rec."Mobile No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-mail";rec."E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(Address;rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("State Code";rec."State Code")
                {
                    ApplicationArea = Basic;
                }
                field("PAN No.";rec."PAN No.")
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

