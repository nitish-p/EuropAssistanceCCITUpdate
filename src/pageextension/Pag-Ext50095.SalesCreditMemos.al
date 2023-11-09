pageextension 50095 "Sales Credit Memos" extends "Sales Credit Memos" 
{
    
    layout
    {
        addfirst(content)
        {
            // field(Select;rec.Select)
            // {
            // }
        }
        addafter("No.")
        {
            field("Doc No";Rec."Doc No")
            {
                ApplicationArea = All;
            }
        }
        addafter("Document Date")
        {
            field("Invoice Date";Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
        }
        // addafter("Control 1102601013")
        // {
        //     field(Amount;rEC.Amount)
        //     {
        //     }
            // field("Amount to Customer";Rec."Amount to Customer")
            // {
            // }
        }
    }
//     actions
//     {


//         //Unsupported feature: Code Modification on "SendApprovalRequest(Action 1102601014).OnAction".

//         //trigger OnAction()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
//               ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*

//             IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
//             //  ApprovalsMgmt.OnSendSalesDocForApproval(Rec);


//             // prdp +++
//             SHeader.RESET;
//             SHeader.SETRANGE(SHeader.Select,TRUE);
//             IF NOT SHeader.FINDFIRST THEN BEGIN
//               ERROR('No Entry Selected to Approve');
//             END;

//             SHeader.RESET;
//             SHeader.SETRANGE(SHeader.Select,TRUE);
//             IF SHeader.FINDSET THEN REPEAT

//             SHeader2.RESET;
//             SHeader2.SETRANGE(SHeader2."No.",SHeader."No.");
//             IF SHeader2.FINDFIRST THEN BEGIN

//               {RecordLink.RESET;
//               RecordLink.SETRANGE("No.",SHeader2."No.");
//               IF NOT RecordLink.FINDFIRST THEN BEGIN
//                 ERROR('Can not send for approval, file attachment is missing for invoice %1',SHeader2."No.");
//               END;}//CCIT-06052022

//              IF SHeader2."Reference Invoice Number" = '' THEN BEGIN
//               ERROR('Add Reference Invoice Number for invoice %1',SHeader2."No.");
//              END;

//              ApprovalsMgmt.OnSendSalesDocForApproval(SHeader2);

//             END;

//             UNTIL SHeader.NEXT = 0 ;

//             MESSAGE('Approval Request Sent');
//             // prdp ---
//             */
//         //end;


//         //Unsupported feature: Code Modification on "CancelApprovalRequest(Action 1102601015).OnAction".

//         //trigger OnAction()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             //ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);

//             // prdp +++
//             SHeader.RESET;
//             SHeader.SETRANGE(SHeader.Select,TRUE);
//             IF NOT SHeader.FINDFIRST THEN BEGIN
//               ERROR('No Entry Selected to Cancel');
//             END;

//             SHeader.RESET;
//             SHeader.SETRANGE(SHeader.Select,TRUE);
//             IF SHeader.FINDSET THEN REPEAT
//             SHeader2.RESET;
//             SHeader2.SETRANGE(SHeader2."No.",SHeader."No.");
//             IF SHeader2.FINDFIRST THEN BEGIN
//              ApprovalsMgmt.OnCancelSalesApprovalRequest(SHeader2);
//             END;
//             UNTIL SHeader.NEXT = 0 ;

//             MESSAGE('Approval Request Canceled');
//             // prdp ---
//             */
//         //end;


//         //Unsupported feature: Code Modification on "Action 52.OnAction".

//         //trigger OnAction()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             // prdp - added validation to avoid posting if attachment missing +++

//              {RecordLink.RESET;
//               RecordLink.SETRANGE("No.","No.");
//               IF NOT RecordLink.FINDFIRST THEN BEGIN
//                 ERROR('You can not post, file attachment is missing.');
//               END;}//CCIT-06092022
//                // temp comment 13082022
//             // prdp - added validation to avoid posting if attachment missing ---

//             // prdp 210820 ++
//               IF "Invoice Date"=0D THEN BEGIN
//                 ERROR('Please select Invoice Date');
//               END;
//               IF "EA Transaction Type" = 0 THEN BEGIN
//                 ERROR('Please select EA Transaction Type');
//               END;
//             // prdp 210820 --

//             SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
//             */
//         //end;


//         //Unsupported feature: Code Modification on "Action 10.OnAction".

//         //trigger OnAction()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             SalesPostYesNo.Preview(Rec);
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             // prdp - added validation to avoid posting if attachment missing +++

//               {RecordLink.RESET;
//               RecordLink.SETRANGE("No.","No.");
//               IF NOT RecordLink.FINDFIRST THEN BEGIN
//                 ERROR('You can not post, file attachment is missing.');
//               END; }//CCIT-06092022
//                 // temp comment 13082022
//             // prdp - added validation to avoid posting if attachment missing ---

//             SalesPostYesNo.Preview(Rec);
//             */
//         //end;
//         addafter("Action 3")
//         {
//             action("Import Sales Credit Memo")
//             {
//                 Promoted = true;
//                 RunObject = XMLport 50002;
//             }
//             action(Select)
//             {
//                 Image = SelectField;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin

//                     // prdp +++
//                       SalesInvHeader.RESET;
//                       SalesInvHeader.SETRANGE("No.","No.");
//                       IF SalesInvHeader.FINDFIRST THEN BEGIN
//                         SalesInvHeader.Select:=TRUE;
//                         SalesInvHeader.MODIFY;
//                       END;
//                     // prdp ---
//                 end;
//             }
//             action(Deselct)
//             {
//                 Image = CancelLine;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin
//                     // prdp +++
//                       SalesInvHeader.RESET;
//                       SalesInvHeader.SETRANGE("No.","No.");
//                       IF SalesInvHeader.FINDFIRST THEN BEGIN
//                         SalesInvHeader.Select:=FALSE;
//                         SalesInvHeader.MODIFY;
//                       END;
//                     // prdp ---
//                 end;
//             }
//             action("Select All")
//             {
//                 Image = SelectEntries;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin
//                     // prdp +++
//                     IF NOT CONFIRM ('Do you want Select all Invoices ?',FALSE)
//                       THEN
//                         EXIT;

//                     SalesInvHeader.RESET;
//                     SalesInvHeader.COPYFILTERS(Rec);
//                     SalesInvHeader.SETFILTER(SalesInvHeader."No.",'<>%1','');
//                     IF SalesInvHeader.FINDSET THEN REPEAT
//                        SalesInvHeader.Select:=TRUE;
//                        SalesInvHeader.MODIFY;
//                     UNTIL SalesInvHeader.NEXT = 0;
//                     // prdp ---
//                 end;
//             }
//             action("Deselect All")
//             {
//                 Image = UnApply;
//                 Promoted = true;

//                 trigger OnAction()
//                 begin
//                     // prdp +++
//                     IF NOT CONFIRM ('Do you want Deselect all Invoices ?',FALSE)
//                       THEN
//                         EXIT;

//                     SalesInvHeader.RESET;
//                     SalesInvHeader.COPYFILTERS(Rec);
//                     SalesInvHeader.SETRANGE(Select,TRUE);
//                     IF SalesInvHeader.FINDSET THEN REPEAT
//                        SalesInvHeader.Select:=FALSE;
//                        SalesInvHeader.MODIFY;
//                     UNTIL SalesInvHeader.NEXT = 0;
//                     // prdp ---
//                 end;
//             }
//             group(Attach)
//             {
//                 Caption = 'Attach';
//                 action("Attach File1")
//                 {
//                     Image = Attach;
//                     Promoted = true;
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         RecordLink: Record "2000000068";
//                         FileName: Text[250];
//                         ImportFileName: XMLport "50012";
//                         OrderNo: Code[30];
//                         No: Text[250];
//                         TimeStamp: Text[100];
//                         FinalName: Text[250];
//                         Timer: Text[100];
//                         Timer1: Text[100];
//                         Source: Text[250];
//                         Destination: Text[250];
//                         ActiveSession: Record "2000000110";
//                         User: Record "2000000120";
//                         UserPath: Text[250];
//                         UserName: Text[100];
//                         ActSession: Record "2000000110";
//                         GenLedSetup: Record "98";
//                         Extension: Text[100];
//                         Length: Integer;
//                         StartPt: Integer;
//                         Temp: Text[250];
//                         FileManagement: Codeunit "419";
//                     begin

//                           // prdp +++
//                                                         ImportFileName.RUN;

//                                                          IF ImportFileName.FILENAME <> '' THEN BEGIN

//                                                               // to get the path of the filename to be copied from client to server
//                                                               //    FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
//                                                                //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
//                                                                //FileName:=DELSTR('\\NAVLIVE\NAV File Import\'+ImportFileName.FILENAME,27,3);
//                                                                FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,31,3);
//                                                               // to convert the invoice no. in text format
//                                                                   OrderNo:=FORMAT("No.");

//                                                               // to get the invoice no. starting from 5th charecter to avoid error due to '\'
//                                                                   No:= CONVERTSTR(OrderNo,'/','-');

//                                                               // to get the FinalName of file that is to be copied to server
//                                                               FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
//                                                               // to get the path of destination folder at server from purchase & payable set up
//                                                                   GenLedSetup.RESET;
//                                                                   GenLedSetup.GET('');

//                                                                   IF GenLedSetup."Sales Cr Memo Attach. Path" = '' THEN
//                                                                     ERROR('please add Sales Cr Memo Attch. Path in general ledger setup');

//                                                                 Destination:=GenLedSetup."Sales Cr Memo Attach. Path"+FinalName;
//                                                                // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

//                                                               // to get the extension of file to be copied
//                                                                   Temp:=ImportFileName.FILENAME;
//                                                                   StartPt:=STRPOS(Temp,'.');
//                                                                   Length:=STRLEN(Temp);
//                                                                   Extension:=COPYSTR(Temp,StartPt,Length);

//                                                               // to insert the link in record link table
//                                                                   RecordLink.RESET;
//                                                                   RecordLink."No.":="No.";
//                                                                   RecordLink.SourcerPath:=FileName;
//                                                                   RecordLink."Attachement Name":=FinalName;
//                                                                   RecordLink.URL1:=Destination+Extension;
//                                                                   RecordLink.Created:=CURRENTDATETIME;
//                                                                   RecordLink."User ID":=USERID;
//                                                                   RecordLink.Company:=COMPANYNAME;
//                                                                   RecordLink.INSERT;


//                                                               // to copy the file to server
//                                                                  FILE.COPY(FileName,Destination+Extension);
//                                                                 MESSAGE('Attached and Saved to Server');

//                                                         END;


//                                                               // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
//                                                                   CLEAR(ImportFileName);

//                         // prdp ---
//                     end;
//                 }
//                 action("Attach File")
//                 {
//                     Image = Attach;
//                     Promoted = true;

//                     trigger OnAction()
//                     var
//                         FileName: Text;
//                         RecordLink: Record "2000000068";
//                         ImportFileName: XMLport "50012";
//                         OrderNo: Code[30];
//                         No: Text[250];
//                         TimeStamp: Text[100];
//                         FinalName: Text[250];
//                         Timer: Text[100];
//                         Timer1: Text[100];
//                         Source: Text[250];
//                         Destination: Text[250];
//                         ActiveSession: Record "2000000110";
//                         User: Record "2000000120";
//                         UserPath: Text[250];
//                         UserName: Text[100];
//                         ActSession: Record "2000000110";
//                         GenLedSetup: Record "98";
//                         Extension: Text[100];
//                         Length: Integer;
//                         StartPt: Integer;
//                         Temp: Text[250];
//                         FileManagement: Codeunit "419";
//                     begin

//                                                             GenLedSetup.GET('');
//                                                             IF GenLedSetup."Sales Cr Memo Attach. Path" = '' THEN
//                                                             ERROR('please add Sales Cr Memo Attach. Path in general ledger setup');
//                                                             Destination:=GenLedSetup."Sales Cr Memo Attach. Path";
//                                                             //Destination:='';
//                                                                // MESSAGE(Destination);

//                                                             IF UPLOAD('Upload File','','All Files (*.*)|*.*',FileName,Destination) THEN BEGIN

//                                                               //MESSAGE(FileName);

//                                                                   RecordLink.RESET;
//                                                                   RecordLink."No.":="No.";
//                                                                   RecordLink.URL1:=Destination;
//                                                                   RecordLink."Attachement Name":=DELSTR(Destination,1,STRLEN(GenLedSetup."Sales Cr Memo Attach. Path"));
//                                                                   RecordLink.Created:=CURRENTDATETIME;
//                                                                   RecordLink."User ID":=USERID;
//                                                                   RecordLink.Company:=COMPANYNAME;
//                                                                   RecordLink.INSERT;

//                                                                 MESSAGE('Attached and Saved to Server');

//                                                         END;
//                     end;
//                 }
//                 action("Attach Policy Details")
//                 {
//                     Image = Attach;
//                     Promoted = true;

//                     trigger OnAction()
//                     var
//                         RecordLink: Record "2000000068";
//                         FileName: Text[250];
//                         ImportFileName: XMLport "50012";
//                         OrderNo: Code[30];
//                         No: Text[250];
//                         TimeStamp: Text[100];
//                         FinalName: Text[250];
//                         Timer: Text[100];
//                         Timer1: Text[100];
//                         Source: Text[250];
//                         Destination: Text[250];
//                         ActiveSession: Record "2000000110";
//                         User: Record "2000000120";
//                         UserPath: Text[250];
//                         UserName: Text[100];
//                         ActSession: Record "2000000110";
//                         GenLedSetup: Record "98";
//                         Extension: Text[100];
//                         Length: Integer;
//                         StartPt: Integer;
//                         Temp: Text[250];
//                         FileManagement: Codeunit "419";
//                     begin

//                           // prdp +++


//                         RecordLink.RESET;
//                         RecordLink.SETRANGE("No.","No.");
//                         RecordLink.SETRANGE("Policy Details",TRUE);
//                         RecordLink.SETFILTER("Attachement Name",'<>%1','');
//                         IF RecordLink.FINDFIRST THEN BEGIN
//                           ERROR('Policy details are already attached for invoice %1',"No.");
//                         END;

//                                                         ImportFileName.RUN;

//                                                          IF ImportFileName.FILENAME <> '' THEN BEGIN

//                                                               // to get the path of the filename to be copied from client to server
//                                                                   //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
//                                                                //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
//                                                                FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);
//                                                               // to convert the invoice no. in text format
//                                                                   OrderNo:=FORMAT("No.");

//                                                               // to get the invoice no. starting from 5th charecter to avoid error due to '\'
//                                                                   No:= CONVERTSTR(OrderNo,'/','-');

//                                                               // to get the FinalName of file that is to be copied to server
//                                                               FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
//                                                               // to get the path of destination folder at server from purchase & payable set up
//                                                                   GenLedSetup.RESET;
//                                                                   GenLedSetup.GET('');

//                                                                   IF GenLedSetup."Policy Details Attachment" = '' THEN
//                                                                     ERROR('please add Policy Details Attachment Path in general ledger setup');

//                                                                 Destination:=GenLedSetup."Policy Details Attachment"+FinalName;
//                                                                // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

//                                                               // to get the extension of file to be copied
//                                                                   Temp:=ImportFileName.FILENAME;
//                                                                   StartPt:=STRPOS(Temp,'.');
//                                                                   Length:=STRLEN(Temp);
//                                                                   Extension:=COPYSTR(Temp,StartPt,Length);

//                                                               // to insert the link in record link table
//                                                                   RecordLink.RESET;
//                                                                   RecordLink."No.":="No.";
//                                                                   RecordLink.SourcerPath:=FileName;
//                                                                   RecordLink."Attachement Name":=FinalName;
//                                                                   RecordLink.URL1:=Destination+Extension;
//                                                                   RecordLink.URL3:=Extension;
//                                                                   RecordLink.Created:=CURRENTDATETIME;
//                                                                   RecordLink."User ID":=USERID;
//                                                                   RecordLink.Company:=COMPANYNAME;
//                                                                   RecordLink."Policy Details":=TRUE;
//                                                                   RecordLink.INSERT;


//                                                               // to copy the file to server
//                                                                  FILE.COPY(FileName,Destination+Extension);
//                                                                 MESSAGE('Attached and Saved to Server');

//                                                         END;


//                                                               // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
//                                                                   CLEAR(ImportFileName);

//                         // prdp ---
//                     end;
//                 }
//                 action("Files Attached")
//                 {
//                     Image = Links;
//                     Promoted = true;
//                     RunObject = Page 50014;
//                     RunPageLink = No.=FIELD(No.);
//                 }
//             }
//         }
//     }

//     var
//         rec37: Record "37";
//         SHeader: Record "36";
//         SHeader2: Record "36";
//         SalesInvHeader: Record "36";
//         RecordLink: Record "2000000068";


//     //Unsupported feature: Code Insertion on "OnClosePage".

//     //trigger OnClosePage()
//     //begin
//         /*
//         // prdp +++
//         SHeader.RESET;
//         SHeader.SETRANGE(SHeader.Select,TRUE);
//         IF SHeader.FINDSET THEN REPEAT
//           SHeader.Select:=FALSE;
//           SHeader.MODIFY;
//         UNTIL SHeader.NEXT=0;

//         // prdp ---
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnOpenPage".

//     //trigger OnOpenPage()
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         SetSecurityFilterOnRespCenter;
//         JobQueueActive := SalesSetup.JobQueueActive;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         SetSecurityFilterOnRespCenter;
//         JobQueueActive := SalesSetup.JobQueueActive;

//         // prdp +++
//         SHeader.RESET;
//         SHeader.SETRANGE(SHeader.Select,TRUE);
//         IF SHeader.FINDSET THEN REPEAT
//           SHeader.Select:=FALSE;
//           SHeader.MODIFY;
//         UNTIL SHeader.NEXT=0;


//         SalesInvHeader.RESET;
//         SalesInvHeader.SETFILTER("Posting Date",'%1..%2',010119D,TODAY);
//         SalesInvHeader.SETFILTER("Doc No",'%1','');
//         IF SalesInvHeader.FINDSET THEN REPEAT
//           SalesInvHeader."Doc No":=SalesInvHeader."No.";
//           SalesInvHeader.MODIFY;
//         UNTIL SalesInvHeader.NEXT =0;
//         // prdp ---
//         */
//     //end;
// }

