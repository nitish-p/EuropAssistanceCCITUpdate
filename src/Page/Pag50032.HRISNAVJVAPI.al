Page 50032 "HRIS-NAV JV API"
{
    PageType = List;
    SourceTable = "HRIS-NAV JV API";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("JV Type"; rec."JV Type")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Entry Type"; rec."Salary Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Invoice Number"; rec."Vendor Invoice Number")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Vendor Code"; rec."Employee Vendor Code")
                {
                    ApplicationArea = Basic;
                }
                field("Account Number"; rec."Account Number")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Date"; rec."Invoice Date")
                {
                    ApplicationArea = Basic;
                }
                field(Narration; rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field(Attachment; rec.Attachment)
                {
                    ApplicationArea = Basic;
                }
                field("Department Dimension"; rec."Department Dimension")
                {
                    ApplicationArea = Basic;
                }
                field("Business Line Dimension"; rec."Business Line Dimension")
                {
                    ApplicationArea = Basic;
                }
                field("Client Level Code Dimension"; rec."Client Level Code Dimension")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code Dimension"; rec."Employee Code Dimension")
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
                field("JV Created"; rec."JV Created")
                {
                    ApplicationArea = Basic;
                }
                field("JV Created On"; rec."JV Created On")
                {
                    ApplicationArea = Basic;
                }
                field("NAV JV No."; rec."NAV JV No.")
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

