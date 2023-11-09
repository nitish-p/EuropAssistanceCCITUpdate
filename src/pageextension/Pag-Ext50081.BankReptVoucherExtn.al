pageextension 50081 "Bank Rept. Voucher Extn" extends "Bank Receipt Voucher"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field("UTR No."; Rec."UTR No.")
            {
                ApplicationArea = All;
            }

            // field("Location State Code"; rec."Location State Code")
            // {
            // }

            // field("GST on Advance Payment"; rec."GST on Advance Payment")
            // {
            // }
            // field("Ship-to Code"; rec."Ship-to Code")
            // {
            //     Editable = true;
            // }
            // field("Location Code"; rec."Location Code")
            // {
            // }
            field("Department Code"; rec."Department Code")
            {
                ApplicationArea = All;
            }
            field("Client Level Code"; rec."Client Level Code")
            {
                ApplicationArea = All;
            }
            field("Employee Code"; rec."Employee Code")
            {
                ApplicationArea = All;
            }
            // field(Narration; rec.Narration)
            // {
            // }


        }
    }

    actions
    {
        // Add changes to page actions here
        // addlast(navigation)
        // {
            //         action(Approvals)
            //         {
            //             Caption = 'Approvals';
            //             Image = Approvals;

            //             trigger OnAction()
            //             var
            //                 GenJournalLine: Record "Gen. Journal Line";
            //                 ApprovalsMgmt: Codeunit "1535";
            //             begin
            //                 // GetCurrentlySelectedLines(GenJournalLine);
            //                 // ApprovalsMgmt.ShowJournalApprovalEntries(GenJournalLine);
            //             end;
            //         }
            //         action(Preview)
            //         {
            //             Caption = 'Preview Posting';
            //             Image = ViewPostedOrder;
            //             Promoted = false;

            //             trigger OnAction()
            //             var
            //                 GenJnlPost: Codeunit 81;
            //             begin
            //                 GenJnlPost.Preview(Rec);
            //             end;
            //         }

            //     group("Request Approval")
            //         {
            //             Caption = 'Request Approval';
            //             group(SendApprovalRequest)
            //             {
            //                 Caption = 'Send Approval Request';
            //                 Image = SendApprovalRequest;
            //                 action(SendApprovalRequestJournalBatch)
            //                 {
            //                     Caption = 'Journal Batch';
            //                     Enabled = NOT OpenApprovalEntriesOnBatchOrAnyJnlLineExist;
            //                     Image = SendApprovalRequest;

            //                     trigger OnAction()
            //                     var
            //                         ApprovalsMgmt: Codeunit "1535";
            //                     begin
            //                         ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);
            //                         SetControlAppearance;
            //                     end;
            //                 }
            //                 action(SendApprovalRequestJournalLine)
            //                 {
            //                     Caption = 'Selected Journal Lines';
            //                     Enabled = NOT OpenApprovalEntriesOnBatchOrCurrJnlLineExist;
            //                     Image = SendApprovalRequest;

            //                     trigger OnAction()
            //                     var
            //                         GenJournalLine: Record 81;
            //                         ApprovalsMgmt: Codeunit "1535";
            //                     begin
            //                         GetCurrentlySelectedLines(GenJournalLine);
            //                         ApprovalsMgmt.TrySendJournalLineApprovalRequests(GenJournalLine);
            //                     end;
            //                 }
            //             }
            //             group(CancelApprovalRequest)
            //             {
            //                 Caption = 'Cancel Approval Request';
            //                 Image = Cancel;
            //                 action(CancelApprovalRequestJournalBatch)
            //                 {
            //                     Caption = 'Journal Batch';
            //                     Enabled = OpenApprovalEntriesOnJnlBatchExist;
            //                     Image = Cancel;

            //                     trigger OnAction()
            //                     var
            //                         ApprovalsMgmt: Codeunit "1535";
            //                     begin
            //                         ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
            //                         SetControlAppearance;
            //                     end;
            //                 }
            //                 action(CancelApprovalRequestJournalLine)
            //                 {
            //                     Caption = 'Selected Journal Lines';
            //                     Enabled = OpenApprovalEntriesOnJnlLineExist;
            //                     Image = Cancel;

            //                     trigger OnAction()
            //                     var
            //                         GenJournalLine: Record "81";
            //                         ApprovalsMgmt: Codeunit "1535";
            //                     begin
            //                         GetCurrentlySelectedLines(GenJournalLine);
            //                         ApprovalsMgmt.TryCancelJournalLineApprovalRequests(GenJournalLine);
            //                     end;
            //                 }
            //             }
            //         }
            //         group(Approval)
            //         {
            //             Caption = 'Approval';
            //             action(Approve)
            //             {
            //                 Caption = 'Approve';
            //                 Image = Approve;
            //                 Promoted = true;
            //                 PromotedCategory = Category7;
            //                 PromotedIsBig = true;
            //                 Visible = OpenApprovalEntriesExistForCurrUser;

            //                 trigger OnAction()
            //                 var
            //                     GenJournalBatch: Record "Gen. Journal Batch";
            //                     ApprovalsMgmt: Codeunit "1535";
            //                 begin
            //                     GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
            //                     IF NOT ApprovalsMgmt.ApproveRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
            //                       ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
            //                 end;
            //             }
            //             action(Reject)
            //             {
            //                 Caption = 'Reject';
            //                 Image = Reject;
            //                 Promoted = true;
            //                 PromotedCategory = Category7;
            //                 PromotedIsBig = true;
            //                 Visible = OpenApprovalEntriesExistForCurrUser;

            //                 trigger OnAction()
            //                 var
            //                     GenJournalBatch: Record "Gen. Journal Batch";
            //                     ApprovalsMgmt: Codeunit "1535";
            //                 begin
            //                     GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
            //                     IF NOT ApprovalsMgmt.RejectRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
            //                       ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
            //                 end;
            //             }
            //             action(Delegate)
            //             {
            //                 Caption = 'Delegate';
            //                 Image = Delegate;
            //                 Promoted = true;
            //                 PromotedCategory = Category7;
            //                 Visible = OpenApprovalEntriesExistForCurrUser;

            //                 trigger OnAction()
            //                 var
            //                     GenJournalBatch: Record "Gen. Journal Batch";
            //                     ApprovalsMgmt: Codeunit "1535";
            //                 begin
            //                     GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
            //                     IF NOT ApprovalsMgmt.DelegateRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
            //                       ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
            //                 end;
            //             }
            //             action(Comment)
            //             {
            //                 Caption = 'Comments';
            //                 Image = ViewComments;
            //                 Promoted = true;
            //                 PromotedCategory = Category7;
            //                 RunObject = Page 660;
            //                                 RunPageLink = Table ID=CONST(81),
            //                               "Document Type"=FIELD("Document Type"),
            //                               "Document No."=FIELD("Document No.");
            //                 Visible = OpenApprovalEntriesExistForCurrUser;
            //             }
            //         }
            // }
            //  local procedure GetCurrentlySelectedLines(var GenJournalLine: Record "81"): Boolean
            // begin
            //     CurrPage.SETSELECTIONFILTER(GenJournalLine);
            //     EXIT(GenJournalLine.FINDSET);
            // end;

            // local procedure SetControlAppearance()
            // var
            //     GenJournalBatch: Record "Gen. Journal Batch";
            //     ApprovalsMgmt: Codeunit "1535";
            // begin
            //     IF GenJournalBatch.GET("Journal Template Name","Journal Batch Name") THEN BEGIN
            //       ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RECORDID);
            //       OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(GenJournalBatch.RECORDID);
            //       OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(GenJournalBatch.RECORDID);
            //     END;
            //     OpenApprovalEntriesExistForCurrUser :=
            //       OpenApprovalEntriesExistForCurrUser OR
            //       ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);

            //     OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
            //     OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist OR OpenApprovalEntriesOnJnlLineExist;

            //     OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
            //       OpenApprovalEntriesOnJnlBatchExist OR
            //       ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries("Journal Template Name","Journal Batch Name");

            //     ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RECORDID);
            // end;

            // var
            //     myInt: Integer;
        }
    }