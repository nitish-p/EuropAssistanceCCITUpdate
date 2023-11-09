Page 50034 "Receipt-Refund API"
{
    PageType = List;
    SourceTable = "E-Collection API";
    ApplicationArea = All;
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
                field("Account No."; rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bal. Account No."; rec."Bal. Account No.")
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
                field("Beneficiary IFSC Code"; rec."Beneficiary IFSC Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Id"; rec."Dealer Id")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Smart Account No"; Rec."Dealer Smart Account No")
                {
                    ApplicationArea = basic;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = All;

                }
                field("Credit Datetime"; Rec."Credit Datetime")
                {
                    ApplicationArea = All;

                }
                field("Integration Document No."; rec."Integration Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(admin; Rec.admin)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Mode"; Rec."Payment Mode")
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
                field(Nav_response; Rec.Nav_response)
                {
                    ApplicationArea = Basic;
                }
                field(Wallet_Synced; Rec.Wallet_Synced)
                {
                    ApplicationArea = Basic;
                }
                field("Entry Posted"; rec."Entry Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Posted On"; rec."Entry Posted On")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Voucher No."; rec."NAV Voucher No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(EportalJobs)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"E-Portal Jobs");
                end;
            }
        }
    }
}

