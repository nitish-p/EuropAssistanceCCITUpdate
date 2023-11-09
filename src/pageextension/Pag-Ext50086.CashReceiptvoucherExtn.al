pageextension 50086 "Cash Receipt voucher Extn" extends "Cash Receipt Voucher"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field("Location State Code"; Rec."Location State Code")
            {
                ApplicationArea = All;
            }
            // field("GST on Advance Payment"; Rec."GST on Advance Payment")
            // {
            //     ApplicationArea = All;
            // }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
            }
            // field(Narration; Rec.Narration)
            // {
            //     ApplicationArea = All;
            // }
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
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(navigation)
        {
        //     action(Approval)
        //     {
        //         Caption = 'Approvals';
        //         Image = Approvals;
        //         ApplicationArea = All;

        //         trigger OnAction()
        //         var
        //            // GenJournalLine: Record 81;
        //           //  ApprovalsMgmt: Codeunit 1535;
        //         begin
        //             // GetCurrentlySelectedLines(GenJournalLine);
        //             // ApprovalsMgmt.ShowJournalApprovalEntries(GenJournalLine);
        //         end;
        //     }
        //     action(Preview)
        //     {
        //         Caption = 'Preview Posting';
        //         Image = ViewPostedOrder;
        //         ApplicationArea = All;
        //         Promoted = false;

        //         trigger OnAction()
        //         var
        //             GenJnlPost: Codeunit 231;
        //         begin
        //             GenJnlPost.Preview(Rec);
        //         end;
        //     }
        // }
        // addlast(processing)
        // {
        //     group("Request Approval")
        //     {
        //         Caption = 'Request Approval';
        //         //ApplicationArea = All;
        //         group(SendApprovalRequest)
        //         {
        //             Caption = 'Send Approval Request';
        //             Image = SendApprovalRequest;
        //             action(SendApprovalRequestJournalBatch)
        //             {
        //                 Caption = 'Journal Batch';
        //               //  Enabled = NOT OpenApprovalEntriesOnBatchOrAnyJnlLineExist;
        //                 Image = SendApprovalRequest;

        //                 trigger OnAction()
        //                 var
        //                    // ApprovalsMgmt: Codeunit 1535;
        //                 begin
        //                     // ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);
        //                     // SetControlAppearance;
        //                 end;
        //             }
        //             action(SendApprovalRequestJournalLine)
        //             {
        //                 Caption = 'Selected Journal Lines';
        //                 ApplicationArea = All;
        //                // Enabled = NOT OpenApprovalEntriesOnBatchOrCurrJnlLineExist;
        //                 Image = SendApprovalRequest;

        //                 trigger OnAction()
        //                 var
        //                     // GenJournalLine: Record 81;
        //                     // ApprovalsMgmt: Codeunit 1535;
        //                 begin
        //                     // GetCurrentlySelectedLines(GenJournalLine);
        //                     // ApprovalsMgmt.TrySendJournalLineApprovalRequests(GenJournalLine);
        //                 end;
        //             }
        //         }
        //         group(CancelApprovalRequest)
        //         {
        //             Caption = 'Cancel Approval Request';
        //            // ApplicationArea = All;
        //             Image = Cancel;
        //             action(CancelApprovalRequestJournalBatch)
        //             {
        //                 Caption = 'Journal Batch';
        //                 //Enabled = OpenApprovalEntriesOnJnlBatchExist;
        //                 Image = Cancel;

        //                 trigger OnAction()
        //                 var
        //                     ApprovalsMgmt: Codeunit "1535";
        //                 begin
        //                     // ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
        //                     // SetControlAppearance;
        //                 end;
        //             }
        //             action(CancelApprovalRequestJournalLine)
        //             {
        //                 Caption = 'Selected Journal Lines';
        //                 ApplicationArea = All;
        //                 //Enabled = OpenApprovalEntriesOnJnlLineExist;
        //                 Image = Cancel;

        //                 trigger OnAction()
        //                 var
        //                     // GenJournalLine: Record 81;
        //                     // ApprovalsMgmt: Codeunit 1535;
        //                 begin
        //                     // GetCurrentlySelectedLines(GenJournalLine);
        //                     // ApprovalsMgmt.TryCancelJournalLineApprovalRequests(GenJournalLine);
        //                 end;
        //             }
        //         }
        //     }
        //     group(Approval)
        //     {
        //         Caption = 'Approval';
        //         action(Approve)
        //         {
        //             Caption = 'Approve';
        //             Image = Approve;
        //             Promoted = true;
        //             ApplicationArea = All;
        //             PromotedCategory = Category7;
        //             PromotedIsBig = true;
        //           //  Visible = OpenApprovalEntriesExistForCurrUser;

        //             trigger OnAction()
        //             var
        //             //     GenJournalBatch: Record 232;
        //             //     ApprovalsMgmt: Codeunit 1535;
        //              begin
        //             //     GenJournalBatch.GET("Journal Template Name", "Journal Batch Name");
        //             //     IF NOT ApprovalsMgmt.ApproveRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
        //             //         ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
        //             end;
        //         }
                action(Rejects)
                {
                    Caption = 'Reject';
                    ApplicationArea = All;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                 //   Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        GenJournalBatch: Record "Gen. Journal Batch";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // GenJournalBatch.GET("Journal Template Name", "Journal Batch Name");
                        // IF NOT ApprovalsMgmt.RejectRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
                        //     ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegates)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category7;
                  //  Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        GenJournalBatch: Record "Gen. Journal Batch";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // GenJournalBatch.GET("Journal Template Name", "Journal Batch Name");
                        // IF NOT ApprovalsMgmt.DelegateRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
                        //     ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Approval Comments";
                    RunPageLink = "Table ID"=CONST(81),
                                  "Document Type"=FIELD("Document Type"),
                                  "Document No."=FIELD("Document No.");
                   // Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
        }
    }
    // local procedure GetCurrentlySelectedLines(var GenJournalLine: Record "Gen. Journal Line"): Boolean
    // begin
    //     CurrPage.SETSELECTIONFILTER(GenJournalLine);
    //     EXIT(GenJournalLine.FINDSET);
    // end;

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

    // var
    //     myInt: Integer;
    //     OpenApprovalEntriesExistForCurrUser: Boolean;
    //     OpenApprovalEntriesOnJnlBatchExist: Boolean;
    //     OpenApprovalEntriesOnJnlLineExist: Boolean;
    //     OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
    //     OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
    //     ShowWorkflowStatusOnBatch: Boolean;
    //     ShowWorkflowStatusOnLine: Boolean;
//}