pageextension 50085 "Bank Payment Voucher Extn" extends "Bank Payment Voucher"
{
    layout
    {
        // Add changes to page layout here
        addafter(Comment)
        {
            field("Payment Mode"; Rec."Payment Mode")
            {
                ApplicationArea = All;
            }
            field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
            {
                ApplicationArea = All;
            }
            // field("Location State Code"; Rec."Location State Code")
            // {
            // }
            // field("GST on Advance Payment"; Rec."GST on Advance Payment")
            // {
            // }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
            }
            field("Tax Type"; Rec."Tax Type")
            {
                ApplicationArea = All;
            }
            // field("Location Code"; Rec."Location Code")
            // {
            // }
            field("Payment Reference"; Rec."Payment Reference")
            {
                ApplicationArea = All;
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = All;
            }
            field("Client Level Code"; Rec."Client Level Code")
            {
                ApplicationArea = All;
            }
            field("Employee Code"; Rec."Employee Code")
            {
                ApplicationArea = All;
            }
            field("Reference Invoice Number"; Rec."Reference Invoice Number")
            {
                ApplicationArea = All;
            }
            field("Suggested Payment"; Rec."Suggested Payment")
            {
                ApplicationArea = All;
            }
            field("Base Payment"; Rec."Base Payment")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("GST Payment"; Rec."GST Payment")
            {
                ApplicationArea = All;
            }
            field("Total Payment"; Rec."Total Payment")
            {
                ApplicationArea = All;
            }
            field("PO Number"; Rec."PO Number")
            {
            }
            field("PO Date"; Rec."PO Date")
            {
                ApplicationArea = All;
            }
            // field(Narration; Rec.Narration)
            // {
            // }
            field("Beneficiary Name"; Rec."Beneficiary Name")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Beneficiary Acc. No."; Rec."Beneficiary Acc. No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Beneficiary IFSC Code"; Rec."Beneficiary IFSC Code")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(PostAndPrint)
        {
            action("Suggest Vendor Payments (New)")
            {
                Caption = 'Suggest Vendor Payments (New)';
                Ellipsis = true;
                Image = SuggestVendorPayments;
                Promoted = true;
                PromotedCategory = Category10;
                ApplicationArea = All;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction()
                var

                begin

                    // CustomCreateVendorPmtSuggestion.SetGenJnlLine(Rec);
                    // CustomCreateVendorPmtSuggestion.RUNMODAL;
                    // CLEAR(CustomCreateVendorPmtSuggestion);
                end;
            }
        }
        // Add changes to page actions here
    }
    local procedure GetCurrentlySelectedLines(var GenJournalLine: Record "Gen. Journal Line"): Boolean
    begin
        CurrPage.SETSELECTIONFILTER(GenJournalLine);
        EXIT(GenJournalLine.FINDSET);
    end;

    // local procedure SetControlAppearance()
    // var
    //     GenJournalBatch: Record "Gen. Journal Batch";
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    // begin
    //     IF GenJournalBatch.GET("Journal Template Name", "Journal Batch Name") THEN BEGIN
    //         ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RECORDID);
    //         OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(GenJournalBatch.RECORDID);
    //         OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(GenJournalBatch.RECORDID);
    //     END;
    //     OpenApprovalEntriesExistForCurrUser :=
    //       OpenApprovalEntriesExistForCurrUser OR
    //       ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);

    //     OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    //     OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist OR OpenApprovalEntriesOnJnlLineExist;

    //     OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
    //       OpenApprovalEntriesOnJnlBatchExist OR
    //       ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries("Journal Template Name", "Journal Batch Name");

    //     ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    // end;

    var
        myInt: Integer;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesOnJnlBatchExist: Boolean;
        OpenApprovalEntriesOnJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
        ShowWorkflowStatusOnBatch: Boolean;
        ShowWorkflowStatusOnLine: Boolean;
        recVendor: Record 23;
        UserSetup: Record 91;
        SmtpEmail: Text[100];
        EmailUserName: Text[100];
        // SMTPSetup: Record 409;
        // SMTPMail: Codeunit 400;
        // ServerInstance: Record 2000000112;
        //CustomCreateVendorPmtSuggestion: Report 50053; nitish 1412
        report50051: Report 50051;
        BALE: Record 271;
        GenLedSetup: Record 98;
        FileNo: Integer;
        FileName: Text[100];
        Dt: Text[2];
        Month1: Text[2];
        BALE1: Record "Bank Account Ledger Entry";
        //report50059: Report "ICICI Bank File Export";
        GenJnlBatch: Record "Gen. Journal Batch";
        xmlp50035: XMLport "Export ICICI Payment File";
    // report50055: Report "ICICI Payment File Exp.";
    //report50068: Report "ICICI Refund File Export";
}