Page 50026 "Dealer API"
{
    PageType = List;
    SourceTable = "Dealer Bridge";
    ApplicationArea = all;
    UsageCategory = Administration;

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
                field("Dealer Code"; rec."Dealer Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address; rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No"; rec."Contact No")
                {
                    ApplicationArea = Basic;
                }
                field(City; rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("State Code"; rec."State Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST Registration No."; rec."GST Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("PAN No."; rec."PAN No.")
                {
                    ApplicationArea = Basic;
                }
                field("TAN No."; Rec."TAN No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Id"; rec."Dealer Id")
                {
                    ApplicationArea = Basic;
                }
                field("Client Id"; rec."Client Id")
                {
                    ApplicationArea = Basic;
                }
                field("Client Name"; rec."Client Name")
                {
                    ApplicationArea = Basic;
                }
                field("Cancelled Cheque"; rec."Cancelled Cheque")
                {
                    ApplicationArea = Basic;
                }
                field("GST Registration File"; rec."GST Registration File")
                {
                    ApplicationArea = Basic;
                }
                field("PAN File"; rec."PAN File")
                {
                    ApplicationArea = Basic;
                }
                field("TAN File"; Rec."TAN File")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary Name"; rec."Beneficiary Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Beneficiary Account No"; rec."Beneficiary Account No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Beneficiary IFSC Code"; rec."Beneficiary IFSC Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Dealer Smart Account No"; rec."Dealer Smart Account No")
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
                field(nav_response; Rec.nav_response)
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Created"; rec."Dealer Created")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Creaated On"; rec."Dealer Creaated On")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Updated"; rec."Dealer Updated")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Updated On"; rec."Dealer Updated On")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Dealer Code"; rec."NAV Dealer Code")
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

