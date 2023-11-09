// Report 50111 "Get Inv Attachment EZ_Auto"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(UnknownTable50024;UnknownTable50024)
//         {
//             column(ReportForNavId_1000000000; 1000000000)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 getAttachment("Temp Table"."No.");
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPostReport()
//     begin
//         Message('Done...');
//     end;

//     local procedure DownloadFile(Attachment: Text[100])
//     var
//         WinSCPSesh: dotnet Session;
//         WinSCPSessionOptions: dotnet SessionOptions;
//         WinSCPTransferOptions: dotnet TransferOptions;
//         WinSCPTransferResults: dotnet TransferOperationResult;
//         Directory: Record File;
//         WinSCPTransferResumeSupport: dotnet TransferResumeSupport;
//         WinSCPTransferResumeSupportState: dotnet TransferResumeSupportState;
//         MoveFileDotNet: dotnet File;
//         WinSCPProtocol: dotnet Protocol;
//         WinSCPFtpSecure: dotnet FtpSecure;
//         WinSCPRemoteInfoColl: dotnet RemoteDirectoryInfo;
//         WinSCPRemoteInfo: dotnet RemoteFileInfo;
//         PurchPayableSetup: Record "Purchases & Payables Setup";
//     begin

//         PurchPayableSetup.Get('');

//         WinSCPSessionOptions := WinSCPSessionOptions.SessionOptions;
//         WinSCPSessionOptions.HostName := PurchPayableSetup."EzAuto SFTP Host Name";
//         WinSCPSessionOptions.UserName := PurchPayableSetup."EzAuto SFTP Username";
//         WinSCPSessionOptions.Password := PurchPayableSetup."EZAuto SFTP Password";
//         //WinSCPSessionOptions.SshHostKeyFingerprint := PurchPaybleSetup."EZAuto SFTP Host Key";
//         WinSCPSessionOptions.GiveUpSecurityAndAcceptAnySshHostKey := true;

//         WinSCPSesh := WinSCPSesh.Session;
//         WinSCPSesh.Open(WinSCPSessionOptions);

//         if WinSCPSesh.Opened then begin

//         WinSCPTransferOptions := WinSCPTransferOptions.TransferOptions;
//         WinSCPTransferOptions.TransferMode:=0;
//         WinSCPTransferResumeSupport := WinSCPTransferOptions.ResumeSupport;
//         WinSCPTransferResumeSupport.State(WinSCPTransferResumeSupportState.Off);

//         WinSCPTransferResults := WinSCPSesh.GetFiles(PurchPayableSetup."EzAuto Attachment Folder"+'/'+Attachment,PurchPayableSetup."Local Attachment Folder",false,WinSCPTransferOptions);
//         //WinSCPSesh.RemoveFiles(PurchPayableSetup."EzAuto Attachment Folder"+'/'+Attachment)
//         end else Error('Connection failed to EzAuto SFTP server for Attachment !');

//         if WinSCPSesh.Opened then WinSCPSesh.Dispose();
//     end;


//     procedure getAttachment(FileName1: Text[100])
//     var
//         recLink: Record "Record Link";
//         RecTranAPI: Record UnknownRecord50009;
//         PurchpayablesSetup: Record "Purchases & Payables Setup";
//         PurchInvHdr: Record "Purch. Inv. Header";
//         RecordLink: Record "Record Link";
//         FileManagement: Codeunit "File Management";
//         PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
//         RecordLink1: Record "Record Link";
//         RecordLink2: Record "Record Link";
//     begin
        
//         RecTranAPI.Reset;
//         RecTranAPI.SetRange(RecTranAPI."File Name",FileName1);
//         RecTranAPI.SetRange(RecTranAPI.Final,true);
//         if RecTranAPI.FindFirst then
//         begin
//            if ((RecTranAPI.Final = true) and (RecTranAPI."Transaction No." <> '') and (RecTranAPI."File Name" <> '' )) then begin
        
//         /*recLink.RESET;
//         recLink.SETRANGE("No.","Nav Vendor Code");
//         IF recLink.FINDSET THEN REPEAT
//           recLink."No.":='';
//           recLink.MODIFY;
//         UNTIL recLink.NEXT=0;*/
        
//           if ((UpperCase(RecTranAPI."Invoice Type") = 'FTSP' )
//             or (UpperCase(RecTranAPI."Invoice Type") = 'PTM7 NORMAL' )
//             or (UpperCase(RecTranAPI."Invoice Type") = 'NORMAL1' )
//             or (UpperCase(RecTranAPI."Invoice Type") = 'GC-PPC NORMAL')
//             or (UpperCase(RecTranAPI."Invoice Type") = 'GC-PPC EXCEED')
//             or (UpperCase(RecTranAPI."Invoice Type") = 'MSL NRML GST ONL')
//             or (UpperCase(RecTranAPI."Invoice Type") = 'MSL EXCEED ONL')
//             or (UpperCase(RecTranAPI."Invoice Type") = 'MSL CASH INVOICE')
//             or (UpperCase(RecTranAPI."Invoice Type") = 'MSL NRML NONGST ONL')
//             or (UpperCase(RecTranAPI."Invoice Type") = 'MSIL CASH INVOICE')) then begin
        
//             PurchpayablesSetup.Get('');
        
        
        
//                                                   PurchInvHdr.Reset;
//                                                   PurchInvHdr.SetRange("No.",RecTranAPI."Posted Invoice No");
//                                                   if PurchInvHdr.FindFirst then begin
//                                                         RecordLink2.Reset;
//                                                         RecordLink2.SetRange(RecordLink2."No.",RecTranAPI."Preposted Invoice No");
//                                                         if RecordLink2.FindFirst then begin
//                                                             RecordLink2.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
//                                                             RecordLink2.Modify;
//                                                             "Temp Table".Status := "Temp Table".Status::Modify;
//                                                             "Temp Table".Modify;
//                                                         end else begin
//                                                             RecordLink.Reset;
//                                                             RecordLink.Init;
//                                                             RecordLink."No.":=PurchInvHdr."Pre-Assigned No.";
//                                                             RecordLink.URL2:=RecTranAPI."Posted Invoice No";
//                                                             RecordLink."Attachement Name":=CopyStr(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MaxStrLen(RecTranAPI."File Name"));
//                                                             RecordLink.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
//                                                             RecordLink.Created:=CurrentDatetime;
//                                                             RecordLink."User ID":=UserId;
//                                                             RecordLink.Company:=COMPANYNAME;
//                                                             RecordLink.Insert;
//                                                             "Temp Table".Status := "Temp Table".Status::Insert;
//                                                             "Temp Table".Modify;
//                                                         end;
        
//                                                   end;
//           end;
        
        
//         if (UpperCase(RecTranAPI."Invoice Type") = 'MSL CASH CN') then begin
//           PurchpayablesSetup.Get('');
        
        
//                                                   PurchCrMemoHdr.Reset;
//                                                   PurchCrMemoHdr.SetRange("No.",RecTranAPI."Posted Invoice No");
//                                                   if PurchCrMemoHdr.FindFirst then begin
        
//                                                   RecordLink1.Reset;
//                                                   RecordLink1.Init;
//                                                   RecordLink1."No.":=PurchCrMemoHdr."Pre-Assigned No.";
//                                                   RecordLink1.URL2:=RecTranAPI."Posted Invoice No";
//                                                   RecordLink1."Attachement Name":=CopyStr(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MaxStrLen(RecTranAPI."File Name"));
//                                                   RecordLink1.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
//                                                   RecordLink1.Created:=CurrentDatetime;
//                                                   RecordLink1."User ID":=UserId;
//                                                   RecordLink1.Company:=COMPANYNAME;
//                                                   RecordLink1.Insert;
        
//                                                   end;
        
//         end;
        
        
//           if ((UpperCase(RecTranAPI."Invoice Type") <> 'FTSP' )
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'PTM7 NORMAL' )
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'NORMAL1' )
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'GC-PPC NORMAL')
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'GC-PPC EXCEED')
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'MSL NRML GST ONL')
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'MSL EXCEED ONL')
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'MSL CASH INVOICE')
//             and (UpperCase(RecTranAPI."Invoice Type") <> 'MSL NRML NONGST ONL')) then begin
//             PurchpayablesSetup.Get('');
//                                                 RecordLink2.Reset;
//                                                 RecordLink2.SetRange(RecordLink2."No.",RecTranAPI."Preposted Invoice No");
//                                                 if RecordLink2.FindFirst then begin
//                                                     RecordLink2.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
//                                                     RecordLink2.Modify;
//                                                     "Temp Table".Status := "Temp Table".Status::Modify;
//                                                     "Temp Table".Modify;
//                                                 end else begin
//                                                   RecordLink.Reset;
//                                                   RecordLink.Init;
//                                                   RecordLink."No.":=RecTranAPI."Preposted Invoice No";
//                                                   //RecordLink.URL2:="Posted Invoice No";
//                                                   RecordLink."Attachement Name":=CopyStr(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MaxStrLen(RecTranAPI."File Name"));
//                                                   RecordLink.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
//                                                   RecordLink.Created:=CurrentDatetime;
//                                                   RecordLink."User ID":=UserId;
//                                                   RecordLink.Company:=COMPANYNAME;
//                                                   RecordLink.Insert;
//                                                   "Temp Table".Status := "Temp Table".Status::Insert;
//                                                     "Temp Table".Modify;
//                                                 end;
//           end;
        
//         DownloadFile(RecTranAPI."File Name");
        
//         end;
//         end;

//     end;
// }

