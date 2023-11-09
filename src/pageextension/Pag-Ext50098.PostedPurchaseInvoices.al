pageextension 50098 "Posted Purchase Invoices" extends "Posted Purchase Invoices"
{

    layout
    {
        addafter("Shipment Method Code")
        {
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
            // field("Service Type (Rev. Chrg.)";Rec."Service Type (Rev. Chrg.)")
            // {
            // }
            field("Manual Invoice"; Rec."Manual Invoice")
            {
                ApplicationArea = All;
            }
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
            // field("Vendor Invoice No."; Rec."Vendor Invoice No.")
            // {
            //     ApplicationArea = All;
            // }
            field("Payment Due Date"; Rec."Payment Due Date")
            {
                ApplicationArea = All;
            }
            field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
            {
                ApplicationArea = All;
            }
            field("Billing Type"; Rec."Billing Type")
            {
                ApplicationArea = All;
            }
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
            }
            field("Dealer Client Name"; Rec."Your Reference")
            {
                Caption = 'Dealer Client Name';
                ApplicationArea = All;
            }
            field("Pre-Assigned No."; Rec."Pre-Assigned No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Navigate)
        {
            action("Print Voucher")
            {
                Caption = 'Print Voucher';
                Ellipsis = true;
                Image = PrintVoucher;
                Promoted = true;

                trigger OnAction()
                var
                    GLEntry: Record "G/L Entry";
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    GLEntry.SETRANGE("Document No.", GLEntry."No. Series");
                    GLEntry.SETRANGE("Posting Date", GLEntry."Posting Date");
                    IF GLEntry.FINDFIRST THEN
                        REPORT.RUNMODAL(REPORT::"Posted Voucher", TRUE, TRUE, GLEntry);
                end;
            }
            //             group(Attachments)
            //             {
            //                 action("Attach File")
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
            //                                                         ImportFileName.RUN;

            //                                                          IF ImportFileName.FILENAME <> '' THEN BEGIN

            //                                                               // to get the path of the filename to be copied from client to server
            //                                                               //    FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
            //                                                                  //FileName:=ImportFileName.FILENAME;
            //                                                                  FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);
            //                                                               // to convert the invoice no. in text format
            //                                                                   OrderNo:=FORMAT("No.");

            //                                                               // to get the invoice no. starting from 5th charecter to avoid error due to '\'
            //                                                                   No:= CONVERTSTR(OrderNo,'/','-');

            //                                                               // to get the FinalName of file that is to be copied to server
            //                                                               FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
            //                                                               // to get the path of destination folder at server from purchase & payable set up
            //                                                                   GenLedSetup.RESET;
            //                                                                   GenLedSetup.GET('');

            //                                                                   IF GenLedSetup."Purch.Inv. Attach. Path" = '' THEN
            //                                                                     ERROR('please add Purch.Inv. Attach. Path in general ledger setup');

            //                                                                 Destination:=GenLedSetup."Purch.Inv. Attach. Path"+FinalName;
            //                                                                // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

            //                                                               // to get the extension of file to be copied
            //                                                                   Temp:=ImportFileName.FILENAME;
            //                                                                   StartPt:=STRPOS(Temp,'.');
            //                                                                   Length:=STRLEN(Temp);
            //                                                                   Extension:=COPYSTR(Temp,StartPt,Length);

            //                                                               // to insert the link in record link table
            //                                                                   RecordLink.RESET;
            //                                                                   RecordLink."No.":="Pre-Assigned No.";
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
            //                 action("Attached Files")
            //                 {
            //                     Image = Links;
            //                     Promoted = true;
            //                     RunObject = Page 50014;
            //                     RunPageLink = No.=FIELD(Pre-Assigned No.);
            //                 }
            //             }
            //             group("Recall Invvoice")
            //             {
            //                 Caption = 'Recall Invvoice';
            //                 action(Recall)
            //                 {
            //                     Image = ReturnOrder;
            //                     Promoted = true;

            //                     trigger OnAction()
            //                     begin

            //                         IF NOT CONFIRM('Do you want to recall this invoice %1',FALSE,"Integration Doc No")
            //                                 THEN
            //                                  EXIT;

            //                         VLE.RESET;
            //                         VLE.SETRANGE(VLE."Document Type",VLE."Document Type"::Invoice);
            //                         VLE.SETRANGE("Document No.","No.");
            //                         VLE.SETRANGE(Open,TRUE);
            //                         VLE.SETFILTER(Amount,'<%1',0);
            //                         IF VLE.FINDFIRST THEN BEGIN

            //                         VLE.CALCFIELDS(VLE.Amount);
            //                         VLE.CALCFIELDS(VLE."Remaining Amount");

            //                         IF VLE.Amount=VLE."Remaining Amount" THEN BEGIN

            //                         IntDocNo:='';
            //                         IntDocNo:=COPYSTR("Integration Doc No",1,1)+COPYSTR(LOWERCASE("Integration Doc No"),2,STRLEN("Integration Doc No"));

            //                         IF ((IntDocNo <> '') AND ("Integrated Invoice Type" <> '')) THEN BEGIN
            //                         Recall(IntDocNo,"Integrated Invoice Type");
            //                         END;

            //                         END;
            //                         END;

            //                         // prdp 151020 --
            //                     end;
            //                 }
            //                 action("Get Attachment from EZAUTO")
            //                 {

            //                     trigger OnAction()
            //                     begin
            //                         getAttachment(Rec);
            //                     end;
            //                 }
            //             }
            //         }
            //     }

            //     var
            //         Purch_HDRInsert: Record "38";
            //         CrMemoNo: Code[20];
            //         PurchpayablesSetup: Record "312";
            //         NoSeriesManagement: Codeunit "396";
            //         RecPurchLine: Record "39";
            //         CopyPurchDoc: Codeunit "50007";
            //         VLE: Record "25";
            //         PurchPost: Codeunit "90";
            //         PINo: Code[20];
            //         VendNo: Code[20];
            //         PostTDSAdj: Codeunit "50004";
            //         PostDate: Date;
            //         PurchCrMemoHdr: Record "124";
            //         InvType: Text[20];
            //         TransNo: Code[20];
            //         recVLE: Record "25";
            //         RecPurchHeader: Record "38";
            //         IntDocNo: Text[30];

            //     procedure getAttachment(RecPIH: Record "122")
            //     var
            //         recLink: Record "2000000068";
            //         RecTranAPI: Record "50009";
            //         PurchpayablesSetup: Record "312";
            //         PurchInvHdr: Record "122";
            //         RecordLink: Record "2000000068";
            //         FileManagement: Codeunit "419";
            //         PurchCrMemoHdr: Record "124";
            //         RecordLink1: Record "2000000068";
            //         RecordLink2: Record "2000000068";
            //     begin

            //         RecTranAPI.RESET;
            //         RecTranAPI.SETRANGE(RecTranAPI."Transaction No.",RecPIH."Integration Doc No");
            //         RecTranAPI.SETRANGE(RecTranAPI.Final,TRUE);
            //         IF RecTranAPI.FINDFIRST THEN
            //         //BEGIN
            //         REPEAT

            //            IF ((RecTranAPI.Final = TRUE) AND (RecTranAPI."Transaction No." <> '') AND (RecTranAPI."File Name" <> '' )) THEN BEGIN

            //         /*recLink.RESET;
            //         recLink.SETRANGE("No.","Nav Vendor Code");
            //         IF recLink.FINDSET THEN REPEAT
            //           recLink."No.":='';
            //           recLink.MODIFY;
            //         UNTIL recLink.NEXT=0;*/

            //           IF ((UPPERCASE(RecTranAPI."Invoice Type") = 'FTSP' )
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'PTM7 NORMAL' )
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'NORMAL1' )
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'GC-PPC NORMAL')
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'GC-PPC EXCEED')
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL NRML GST ONL')
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL EXCEED ONL')
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL CASH INVOICE')
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL NRML NONGST ONL')
            //             OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSIL CASH INVOICE')) THEN BEGIN

            //             PurchpayablesSetup.GET('');



            //                                                   PurchInvHdr.RESET;
            //                                                   PurchInvHdr.SETRANGE("Pre-Assigned No.",RecTranAPI."Preposted Invoice No");
            //                                                   IF PurchInvHdr.FINDFIRST THEN BEGIN
            //                                                         RecordLink2.RESET;
            //                                                         RecordLink2.SETRANGE(RecordLink2."No.",RecTranAPI."Preposted Invoice No");
            //                                                         IF RecordLink2.FINDFIRST THEN BEGIN
            //                                                             RecordLink2.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                             RecordLink2.MODIFY;

            //                                                         END ELSE BEGIN
            //                                                             RecordLink.RESET;
            //                                                             RecordLink.INIT;
            //                                                             RecordLink."No.":=PurchInvHdr."Pre-Assigned No.";
            //                                                             RecordLink.URL2:=RecTranAPI."Posted Invoice No";
            //                                                             RecordLink."Attachement Name":=COPYSTR(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MAXSTRLEN(RecTranAPI."File Name"));
            //                                                             RecordLink.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                             RecordLink.Created:=CURRENTDATETIME;
            //                                                             RecordLink."User ID":=USERID;
            //                                                             RecordLink.Company:=COMPANYNAME;
            //                                                             RecordLink.INSERT;

            //                                                         END;

            //                                                   END;
            //           END;


            //         IF (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL CASH CN') THEN BEGIN
            //           PurchpayablesSetup.GET('');


            //                                                   PurchCrMemoHdr.RESET;
            //                                                   PurchCrMemoHdr.SETRANGE("No.",RecTranAPI."Posted Invoice No");
            //                                                   IF PurchCrMemoHdr.FINDFIRST THEN BEGIN

            //                                                   RecordLink1.RESET;
            //                                                   RecordLink1.INIT;
            //                                                   RecordLink1."No.":=PurchCrMemoHdr."Pre-Assigned No.";
            //                                                   RecordLink1.URL2:=RecTranAPI."Posted Invoice No";
            //                                                   RecordLink1."Attachement Name":=COPYSTR(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MAXSTRLEN(RecTranAPI."File Name"));
            //                                                   RecordLink1.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                   RecordLink1.Created:=CURRENTDATETIME;
            //                                                   RecordLink1."User ID":=USERID;
            //                                                   RecordLink1.Company:=COMPANYNAME;
            //                                                   RecordLink1.INSERT;

            //                                                   END;

            //         END;


            //           IF ((UPPERCASE(RecTranAPI."Invoice Type") <> 'FTSP' )
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'PTM7 NORMAL' )
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'NORMAL1' )
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'GC-PPC NORMAL')
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'GC-PPC EXCEED')
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL NRML GST ONL')
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL EXCEED ONL')
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL CASH INVOICE')
            //             AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL NRML NONGST ONL')) THEN BEGIN
            //             PurchpayablesSetup.GET('');
            //                                                 RecordLink2.RESET;
            //                                                 RecordLink2.SETRANGE(RecordLink2."No.",RecTranAPI."Preposted Invoice No");
            //                                                 IF RecordLink2.FINDFIRST THEN BEGIN
            //                                                     RecordLink2.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                     RecordLink2.MODIFY;

            //                                                 END ELSE BEGIN
            //                                                   RecordLink.RESET;
            //                                                   RecordLink.INIT;
            //                                                   RecordLink."No.":=RecTranAPI."Preposted Invoice No";
            //                                                   //RecordLink.URL2:="Posted Invoice No";
            //                                                   RecordLink."Attachement Name":=COPYSTR(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MAXSTRLEN(RecTranAPI."File Name"));
            //                                                   RecordLink.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                   RecordLink.Created:=CURRENTDATETIME;
            //                                                   RecordLink."User ID":=USERID;
            //                                                   RecordLink.Company:=COMPANYNAME;
            //                                                   RecordLink.INSERT;

            //                                                 END;
            //           END;

            //         DownloadFile(RecTranAPI."File Name");
            //         MESSAGE('Done');
            //         END;
            //         //END;
            //         UNTIL RecTranAPI.NEXT=0;

            //     end;

            //     local procedure DownloadFile(Attachment: Text[100])
            //     var
            //         WinSCPSesh: DotNet Session;
            //         WinSCPSessionOptions: DotNet SessionOptions;
            //         WinSCPTransferOptions: DotNet TransferOptions;
            //         WinSCPTransferResults: DotNet TransferOperationResult;
            //         Directory: Record "2000000022";
            //         WinSCPTransferResumeSupport: DotNet TransferResumeSupport;
            //         WinSCPTransferResumeSupportState: DotNet TransferResumeSupportState;
            //         MoveFileDotNet: DotNet File;
            //         WinSCPProtocol: DotNet Protocol;
            //         WinSCPFtpSecure: DotNet FtpSecure;
            //         WinSCPRemoteInfoColl: DotNet RemoteDirectoryInfo;
            //         WinSCPRemoteInfo: DotNet RemoteFileInfo;
            //         PurchPayableSetup: Record "312";
            //     begin

            //         PurchPayableSetup.GET('');

            //         WinSCPSessionOptions := WinSCPSessionOptions.SessionOptions;
            //         WinSCPSessionOptions.HostName := PurchPayableSetup."EzAuto SFTP Host Name";
            //         WinSCPSessionOptions.UserName := PurchPayableSetup."EzAuto SFTP Username";
            //         WinSCPSessionOptions.Password := PurchPayableSetup."EZAuto SFTP Password";
            //         //WinSCPSessionOptions.SshHostKeyFingerprint := PurchPaybleSetup."EZAuto SFTP Host Key";
            //         WinSCPSessionOptions.GiveUpSecurityAndAcceptAnySshHostKey := TRUE;

            //         WinSCPSesh := WinSCPSesh.Session;
            //         WinSCPSesh.Open(WinSCPSessionOptions);

            //         IF WinSCPSesh.Opened THEN BEGIN

            //         WinSCPTransferOptions := WinSCPTransferOptions.TransferOptions;
            //         WinSCPTransferOptions.TransferMode:=0;
            //         WinSCPTransferResumeSupport := WinSCPTransferOptions.ResumeSupport;
            //         WinSCPTransferResumeSupport.State(WinSCPTransferResumeSupportState.Off);

            //         WinSCPTransferResults := WinSCPSesh.GetFiles(PurchPayableSetup."EzAuto Attachment Folder"+'/'+Attachment,PurchPayableSetup."Local Attachment Folder",FALSE,WinSCPTransferOptions);
            //         //WinSCPSesh.RemoveFiles(PurchPayableSetup."EzAuto Attachment Folder"+'/'+Attachment)
            //         END ELSE ERROR('Connection failed to EzAuto SFTP server for Attachment !');

            //         IF WinSCPSesh.Opened THEN WinSCPSesh.Dispose();
            //     end;
        }
    }
}

