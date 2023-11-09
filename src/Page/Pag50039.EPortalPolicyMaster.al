Page 50039 "E-Portal Policy Master"
{
    Editable = false;
    PageType = List;
    SourceTable = "E-Portal Policy Master";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("CASE ID"; rec."CASE ID")
                {
                    ApplicationArea = Basic;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Type"; rec."Transaction Type")
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
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Code"; rec."Dealer Code")
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
                field("Dealer Id"; rec."Dealer Id")
                {
                    ApplicationArea = Basic;
                }
                field("Nav Dealer Code"; rec."Nav Dealer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Invoice No."; rec."Posted Invoice No.")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        SIH.Reset;
                        SIH.SetRange("No.", rec."Posted Invoice No.");
                        Page.RunModal(132, SIH);
                    end;
                }
                field(Cancelled; rec.Cancelled)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        SIH: Record "Sales Invoice Header";
}

