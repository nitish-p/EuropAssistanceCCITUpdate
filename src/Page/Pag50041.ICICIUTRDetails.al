Page 50041 "ICICI UTR Details"
{
    Editable = false;
    PageType = List;
    SourceTable = "ICICI UTR Data";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Debit Acc. No."; rec."Debit Acc. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary A/c No."; rec."Beneficiary A/c No.")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary Name"; rec."Beneficiary Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Mod"; rec."Payment Mod")
                {
                    ApplicationArea = Basic;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("IFSC Code"; rec."IFSC Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payable Location Name"; rec."Payable Location Name")
                {
                    ApplicationArea = Basic;
                }
                field("Print Location Name"; rec."Print Location Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bene Mobile No."; rec."Bene Mobile No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bene Email Id"; rec."Bene Email Id")
                {
                    ApplicationArea = Basic;
                }
                field("Bene Add 4"; rec."Bene Add 4")
                {
                    ApplicationArea = Basic;
                }
                field("Add details 4"; rec."Add details 4")
                {
                    ApplicationArea = Basic;
                }
                field("Add details 5"; rec."Add details 5")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Ref. No."; rec."Payment Ref. No.")
                {
                    ApplicationArea = Basic;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Liquidation Date"; rec."Liquidation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Ref. No."; rec."Customer Ref. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Instrument Ref. No."; rec."Instrument Ref. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Instrument No."; rec."Instrument No.")
                {
                    ApplicationArea = Basic;
                }
                field("UTR No."; rec."UTR No.")
                {
                    ApplicationArea = Basic;
                }
                field("UTR Updated"; rec."UTR Updated")
                {
                    ApplicationArea = Basic;
                }
                field("Case Id"; rec."Case Id")
                {
                    ApplicationArea = Basic;
                }
                field(Reversed; rec.Reversed)
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

