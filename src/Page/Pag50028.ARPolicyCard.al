Page 50028 "AR Policy Card"
{
    SourceTable = "Dealer Refund";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            group("Policy Details")
            {
                Caption = 'Policy Details';
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                /*field("Sell To Customer No.";rec."Sell To Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sell To Customer Name";rec."Sell To Customer Name")
                {
                    ApplicationArea = Basic;
                }*/
                //Naveen
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Bal. Account No."; rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary IFSC Code"; rec."Beneficiary IFSC Code")
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Rejection"; rec."Reason For Rejection")
                {
                    ApplicationArea = Basic;
                }
                /* field("EA Transaction Type";rec."EA Transaction Type")
                 {
                     ApplicationArea = Basic;
                 }*/
                //Naveen
                field("Rejected Date-Time"; rec."Rejected Date-Time")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field(Status; rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Select; rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field(Refunded; rec.Refunded)
                {
                    ApplicationArea = Basic;
                }
                field("NAV Refund No."; rec."NAV Refund No.")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Date-Time"; rec."Approved Date-Time")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Item Lines")
            {
                Caption = 'Item Lines';
                repeater(Control1000000021)
                {
                    field("Dealer Code"; rec."Dealer Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Dealer Name"; rec."Dealer Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Payment File Name"; rec."Payment File Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Date Of Bank Credit"; rec."Date Of Bank Credit")
                    {
                        ApplicationArea = Basic;
                    }
                    field("UTR No."; rec."UTR No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Narration; rec.Narration)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Beneficiary Name"; rec."Beneficiary Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Beneficiary Account No"; rec."Beneficiary Account No")
                    {
                        ApplicationArea = Basic;
                    }
                    /*field("Year Of Mfg.";rec."Year Of Mfg.")
                    {
                        ApplicationArea = Basic;
                    }*/
                    //Naveen
                    field(Control1000000034; rec.Narration)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Integration Document No."; rec."Integration Document No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Middleware Response"; rec."Middleware Response")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Dealer Id"; rec."Dealer Id")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
    }

    actions
    {
    }
}

