page 50022 "Not Verified Vendor List"
{
    Caption = 'Vendors To Verify';
    DeleteAllowed = false;
    Editable = true;
    ApplicationArea = All;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Vendor;
    SourceTableView = SORTING("Vendor Created On")
                      ORDER(Descending)
                      WHERE(Verification = FILTER(<> Success));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    Editable = false;
                }
                field("Address 2"; Rec."Address 2")
                {
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                }
                field(Contact; Rec.Contact)
                {
                    Editable = false;
                }
                field("State Code"; Rec."State Code")
                {
                    Editable = false;
                    Enabled = true;
                }
                field(Type; Rec.Type)
                {
                }
                field("Dealer Client Name"; Rec."Dealer Client Name")
                {
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    Editable = false;
                    Visible = true;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Editable = false;
                    Visible = true;
                }
                field("GST Vendor Type"; Rec."GST Vendor Type")
                {
                    Editable = false;
                }
                field("GST Registration No."; Rec."GST Registration No.")
                {
                    Editable = false;
                }
                field("P.A.N. No."; Rec."P.A.N. No.")
                {
                    Editable = false;
                }
                // field("Bank Account No.";Rec."Bank Account No.")
                // {
                //     Caption = 'Bank Account No.';
                //     Editable = false;
                // }
                // field("SWIFT Code";Rec."SWIFT Code")
                // {
                //     Caption = 'SWIFT Code';
                //     Editable = false;
                // }
                field("PLS Id"; Rec."Easy Auto Vendor Code")
                {
                    Editable = false;
                }
                field("Reject Reason"; Rec."Reject Reason")
                {
                }
                field(Verification; REc.Verification)
                {
                }
                field("Vendor Created On"; Rec."Vendor Created On")
                {
                }
                field("Vendor Invoice Type"; Rec."Vendor Invoice Type")
                {
                    Editable = false;
                }
                field("Vendor Modified On 2nd Last"; Rec."Vendor Modified On 2nd Last")
                {
                    Visible = true;
                }
                field("Vendor Approved On 2nd Last"; Rec."Vendor Approved On 2nd Last")
                {
                    Visible = true;
                }
                field("Vendor Modified On Last"; Rec."Vendor Modified On")
                {
                    Caption = 'Vendor Modified On Last';
                }
                field("Vendor Approved On Last"; Rec."Vendor Approved On")
                {
                    Caption = 'Vendor Approved On Last';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Ven&dor")
            {
                Caption = 'Ven&dor';
                Image = Vendor;
                action("Bank Accounts")
                {
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    RunObject = Page "Vendor Bank Account List";
                    RunPageLink = "Vendor No." = FIELD("No.");
                }
                action("KYC Attachments")
                {
                    Image = Links;
                    RunObject = Page "Attached Files";
                    RunPageLink = "No." = FIELD("No.");
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetSocialListeningFactboxVisibility;
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(rec.RECORDID)
    end;

    trigger OnAfterGetRecord()
    begin
        SetSocialListeningFactboxVisibility;

        //CCIT-25032022
        "Bank Account No." := '';
        "SWIFT Code" := '';

        RecVendBankAcc.RESET;
        RecVendBankAcc.SETRANGE(RecVendBankAcc."Vendor No.", Rec."No.");
        RecVendBankAcc.SETRANGE(RecVendBankAcc."Default Account", TRUE);
        IF RecVendBankAcc.FINDFIRST THEN BEGIN
            "Bank Account No." := RecVendBankAcc."Bank Account No.";
            "SWIFT Code" := RecVendBankAcc."IFSC Code";

        END;
        //CCIT-25032022
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        OpenApprovalEntriesExist: Boolean;
        "Bank Account No.": Text[30];
        "SWIFT Code": Code[20];
        RecVendBankAcc: Record "Vendor Bank Account";

    procedure GetSelectionFilter(): Text
    var
        Vend: Record Vendor;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SETSELECTIONFILTER(Vend);
        EXIT(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
    end;

    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SETSELECTIONFILTER(Vend);
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //SocialListeningMgt: Codeunit "871";
    begin
        // SocialListeningMgt.GetVendFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;
}

