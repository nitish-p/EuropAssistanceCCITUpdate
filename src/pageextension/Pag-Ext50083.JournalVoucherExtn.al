pageextension 50083 "Journal Voucher Extn" extends "Journal Voucher"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
            field("Tax Type"; Rec."Tax Type")
            {
                ApplicationArea = All;
            }
            field("GST Component Code"; Rec."GST Component Code")
            {
                ApplicationArea = All;
            }
            // field("Location Code"; Rec."Location Code")
            // {
            // }
            field("Location State Code"; Rec."Location State Code")
            {
                ApplicationArea = All;
            }
            field("GST on Advance Payment"; Rec."GST on Advance Payment")
            {
                ApplicationArea = All;
            }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
            }
            // field("Service Tax Registration No."; Rec."Service Tax Registration No.")
            // {
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
            // field("Service Tax Group Code"; Rec."Service Tax Group Code")
            // {
            // }
            // field(Narration; Rec.Narration)
            // {
            // }
            field("Payment Reference"; Rec."Payment Reference")
            {
                ApplicationArea = All;
            }
            field("FA Posting Type"; Rec."FA Posting Type")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    //     addlast(navigation)
    //     {
    //         action(Approvals)
    //         {
    //             Caption = 'Approvals';
    //             Image = Approvals;

    //             trigger OnAction()
    //             var
    //                 GenJournalLine: Record "Gen. Journal Line";
    //                 ApprovalsMgmt: Codeunit 1535;
    //             begin
    //                 GetCurrentlySelectedLines(GenJournalLine);
    //                 ApprovalsMgmt.ShowJournalApprovalEntries(GenJournalLine);
    //             end;
    //         }
    //         action(Preview)
    //         {
    //             Caption = 'Preview Posting';
    //             Image = ViewPostedOrder;
    //             Promoted = false;

    //             trigger OnAction()
    //             var
    //                 GenJnlPost: Codeunit 231;
    //             begin


    //                 GenJnlPost.Preview(Rec);
    //             end;
    //         }
    //     }
    //     addlast(processing)
    //     {
    //         group("Request Approval")
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
    //                         ApprovalsMgmt: Codeunit 1535;
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
    //                         ApprovalsMgmt: Codeunit 1535;
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
    //                 Visible = false;
    //                 action(CancelApprovalRequestJournalBatch)
    //                 {
    //                     Caption = 'Journal Batch';
    //                     Enabled = OpenApprovalEntriesOnJnlBatchExist;
    //                     Image = Cancel;

    //                     trigger OnAction()
    //                     var
    //                         ApprovalsMgmt: Codeunit 1535;
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
    //                         GenJournalLine: Record 81;
    //                         ApprovalsMgmt: Codeunit 1535;
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
    //                     GenJournalBatch: Record 232;
    //                     ApprovalsMgmt: Codeunit 1535;
    //                 begin
    //                     GenJournalBatch.GET("Journal Template Name", "Journal Batch Name");
    //                     IF NOT ApprovalsMgmt.ApproveRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
    //                         ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
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
    //                     GenJournalBatch: Record 232;
    //                     ApprovalsMgmt: Codeunit 1535;
    //                 begin
    //                     GenJournalBatch.GET("Journal Template Name", "Journal Batch Name");
    //                     IF NOT ApprovalsMgmt.RejectRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
    //                         ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
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
    //                     GenJournalBatch: Record 232;
    //                     ApprovalsMgmt: Codeunit 1535;
    //                 begin
    //                     GenJournalBatch.GET("Journal Template Name", "Journal Batch Name");
    //                     IF NOT ApprovalsMgmt.DelegateRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
    //                         ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
    //                 end;
    //             }
    //             action(Comment)
    //             {
    //                 Caption = 'Comments';
    //                 Image = ViewComments;
    //                 Promoted = true;
    //                 PromotedCategory = Category7;
    //                 RunObject = Page "Approval Comments";
    //                 RunPageLink = "Table ID"=CONST(81),
    //                               "Document Type"=FIELD("Document Type"),
    //                               "Document No."=FIELD("Document No.");
    //                 Visible = OpenApprovalEntriesExistForCurrUser;
    //             }
    //         }
    //         group(Attach)
    //         {
    //             Caption = 'Attach';
    //             action("Attach File1")
    //             {
    //                 Image = Attach;
    //                 Promoted = true;
    //                 Visible = false;

    //                 trigger OnAction()
    //                 var
    //                     RecordLink: Record 2000000068;
    //                     FileName: Text[250];
    //                     ImportFileName: XMLport 50012;
    //                                         OrderNo: Code[30];
    //                                         No: Text[250];
    //                                         TimeStamp: Text[100];
    //                                         FinalName: Text[250];
    //                                         Timer: Text[100];
    //                                         Timer1: Text[100];
    //                                         Source: Text[250];
    //                                         Destination: Text[250];
    //                                         ActiveSession: Record 2000000110;
    //                                         User: Record 2000000120;
    //                                         UserPath: Text[250];
    //                                         UserName: Text[100];
    //                                         ActSession: Record 2000000110;
    //                                         GenLedSetup: Record 98;
    //                                         Extension: Text[100];
    //                                         Length: Integer;
    //                                         StartPt: Integer;
    //                                         Temp: Text[250];
    //                                         FileManagement: Codeunit 419;
    //                 begin

    //                       // prdp +++
    //                                                     ImportFileName.RUN;

    //                                                      IF ImportFileName.FILENAME <> '' THEN BEGIN

    //                                                           // to get the path of the filename to be copied from client to server
    //                                                               //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
    //                                                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
    //                                                            FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);
    //                                                           // to convert the invoice no. in text format
    //                                                               OrderNo:=FORMAT("Document No.");

    //                                                           // to get the invoice no. starting from 5th charecter to avoid error due to '\'
    //                                                               No:= CONVERTSTR(OrderNo,'/','-');

    //                                                           // to get the FinalName of file that is to be copied to server
    //                                                           FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
    //                                                           // to get the path of destination folder at server from purchase & payable set up
    //                                                               GenLedSetup.RESET;
    //                                                               GenLedSetup.GET('');

    //                                                               IF GenLedSetup."JVs Attachment Path" = '' THEN
    //                                                                 ERROR('please add JVs Attachment Path in general ledger setup');

    //                                                             Destination:=GenLedSetup."JVs Attachment Path"+FinalName;
    //                                                            // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

    //                                                           // to get the extension of file to be copied
    //                                                               Temp:=ImportFileName.FILENAME;
    //                                                               StartPt:=STRPOS(Temp,'.');
    //                                                               Length:=STRLEN(Temp);
    //                                                               Extension:=COPYSTR(Temp,StartPt,Length);

    //                                                           // to insert the link in record link table
    //                                                               RecordLink.RESET;
    //                                                               RecordLink."No.":="Document No.";
    //                                                               RecordLink.SourcerPath:=FileName;
    //                                                               RecordLink."Attachement Name":=FinalName;
    //                                                               RecordLink.URL1:=Destination+Extension;
    //                                                               RecordLink.Created:=CURRENTDATETIME;
    //                                                               RecordLink."User ID":=USERID;
    //                                                               RecordLink.Company:=COMPANYNAME;
    //                                                               RecordLink.INSERT;


    //                                                           // to copy the file to server
    //                                                              FILE.COPY(FileName,Destination+Extension);
    //                                                             MESSAGE('Attached and Saved to Server');

    //                                                     END;


    //                                                           // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
    //                                                               CLEAR(ImportFileName);

    //                     // prdp ---
    //                 end;
    //             }
    //             action("Attach File")
    //             {
    //                 Image = Attach;
    //                 Promoted = true;

    //                 trigger OnAction()
    //                 var
    //                     FileName: Text;
    //                     RecordLink: Record 2000000068;
    //                     ImportFileName: XMLport 50012;
    //                                         OrderNo: Code[30];
    //                                         No: Text[250];
    //                                         TimeStamp: Text[100];
    //                                         FinalName: Text[250];
    //                                         Timer: Text[100];
    //                                         Timer1: Text[100];
    //                                         Source: Text[250];
    //                                         Destination: Text[250];
    //                                         ActiveSession: Record 2000000110;
    //                                         User: Record 2000000120;
    //                                         UserPath: Text[250];
    //                                         UserName: Text[100];
    //                                         ActSession: Record 2000000110;
    //                                         GenLedSetup: Record 98;
    //                                         Extension: Text[100];
    //                                         Length: Integer;
    //                                         StartPt: Integer;
    //                                         Temp: Text[250];
    //                                         FileManagement: Codeunit 419;
    //                 begin

    //                                                         GenLedSetup.GET('');
    //                                                         IF GenLedSetup."JVs Attachment Path" = '' THEN
    //                                                         ERROR('please add JVs Attachment Path in general ledger setup');
    //                                                         Destination:=GenLedSetup."JVs Attachment Path";
    //                                                         //Destination:='';
    //                                                            // MESSAGE(Destination);

    //                                                         IF UPLOAD('Upload File','','All Files (*.*)|*.*',FileName,Destination) THEN BEGIN

    //                                                           //MESSAGE(FileName);

    //                                                               RecordLink.RESET;
    //                                                               RecordLink."No.":="Document No.";
    //                                                               RecordLink.URL1:=Destination;
    //                                                               RecordLink."Attachement Name":=DELSTR(Destination,1,STRLEN(GenLedSetup."JVs Attachment Path"));
    //                                                               RecordLink.Created:=CURRENTDATETIME;
    //                                                               RecordLink."User ID":=USERID;
    //                                                               RecordLink.Company:=COMPANYNAME;
    //                                                               RecordLink.INSERT;

    //                                                             MESSAGE('Attached and Saved to Server');

    //                                                     END;
    //                 end;
    //             }
    //             action("Files Attached")
    //             {
    //                 Image = Links;
    //                 Promoted = true;
    //                 RunObject = Page 50014;
    //                                 RunPageLink ="No."=FIELD("Document No.");
    //             }
    //         }
    //     }
    // }
    // local procedure GetCurrentlySelectedLines(var GenJournalLine: Record "81"): Boolean
    // begin
    //     CurrPage.SETSELECTIONFILTER(GenJournalLine);
    //     EXIT(GenJournalLine.FINDSET);
    // end;

    // local procedure SetControlAppearance()
    // var
    //     GenJournalBatch: Record "Gen. Journal Batch";
    //     ApprovalsMgmt: Codeunit "1535";
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
    //     RecordLink: Record 2000000068;
}
}