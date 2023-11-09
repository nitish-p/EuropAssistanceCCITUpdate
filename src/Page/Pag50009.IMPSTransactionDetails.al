Page 50009 "IMPS Transaction Details"
{
    SourceTable = "Sales Invoice Transaction API";
    SourceTableView = sorting("EA Fees", "Vehicle Engine No", "Entry No.");
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            group("Payment Batch Deatils")
            {
                field("EA Fees"; rec."EA Fees")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Engine No"; rec."Vehicle Engine No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Code"; rec."Dealer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No."; rec."Vehicle Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("CASE ID"; rec."CASE ID")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Type"; rec."Invoice Type")
                {
                    ApplicationArea = Basic;
                }
                field("<Country code>"; rec."Invoice Generated")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Company  Deatils")
            {
                field("Customer Contact No."; rec."Customer Contact No.")
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
                field(Particulars; rec.Particulars)
                {
                    ApplicationArea = Basic;
                }
                field("Client Id"; rec."Client Id")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Invoice No"; rec."NAV Invoice No")
                {
                    ApplicationArea = Basic;
                }
                /* field("Name(UltmtDbtr)";rec."Name(rUltmtDbtr)")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Pstcd(UltmtDbtr)";"Pstcd(UltmtDbtr)")
                 {
                     ApplicationArea = Basic;
                 }
                 field("TwnNm(UltmtDbtr)";"TwnNm(UltmtDbtr)")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Ctry(UltmtDbtr)";"Ctry(UltmtDbtr)")
                 {
                     ApplicationArea = Basic;
                 }*/
            }
            group(Control1000000024)
            {
                part("<Creditor Transer Details>"; "Creditor Transer IMPS Subform")
                {
                    Caption = 'Creditor Transfer deatils ';
                    ShowFilter = false;
                }
            }
        }
    }

    actions
    {
    }
}

