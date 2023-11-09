Page 50030 "Sales Validate API"
{
    PageType = List;
    SourceTable = "Sales Invoice Validate API";
    ApplicationArea = all;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Code"; rec."Dealer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Contact No."; rec."Customer Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy No."; rec."Policy No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage Start Date"; rec."Policy Coverage Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage End Date"; rec."Policy Coverage End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Year Of Mfg"; rec."Year Of Mfg")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No."; rec."Vehicle Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Identification No."; rec."Vehicle Identification No.")
                {
                    ApplicationArea = Basic;
                }
                field("Client Name"; rec."Client Name")
                {
                    ApplicationArea = Basic;
                }
                field(Narration; rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field(Particulars; rec.Particulars)
                {
                    ApplicationArea = Basic;
                }
                field("Client Id"; rec."Client Id")
                {
                    ApplicationArea = Basic;
                }
                field("Brand Royalty"; rec."Brand Royalty")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Commission"; rec."Dealer Commission")
                {
                    ApplicationArea = Basic;
                }
                field("EA Fees"; rec."EA Fees")
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
            }
        }
    }

    actions
    {
    }
}

