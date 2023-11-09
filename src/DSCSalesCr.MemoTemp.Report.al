// Report 50061 "DSC Sales Cr.Memo Temp"
// {
//     Permissions = TableData "Sales Cr.Memo Header"=rimd,
//                   TableData "SMTP Mail Setup"=rimd;
//     ProcessingOnly = true;
//     UseRequestPage = false;

//     dataset
//     {
//         dataitem("Sales Cr.Memo Header";"Sales Cr.Memo Header")
//         {
//             DataItemTableView = where(Select=filter(true));
//             RequestFilterFields = "No.","Posting Date","Sell-to Customer No.","Integration Doc No";
//             column(ReportForNavId_1000000000; 1000000000)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
                
                
//                 //bool zip code
//                 if ISCLEAR(pdfSettings) then
//                 Create(pdfSettings,false,true);
                
//                 if ISCLEAR(pdfUtil) then
//                 Create(pdfUtil,false,true);
                
//                   SalesAndRec.Get('');
                
//                   baseFolder := SalesAndRec."DSC Folder";
//                   //statusFileName :='\\navlive\D\Digital Signature\Temp\status.ini';
//                   statusFileName :='\\EAINPNAV004\D\Digital Signature\Temp\status.ini';//CCIT-30072022
//                   certificateFileName := SalesAndRec."DSC Folder";
//                   //certificatePassword := 'capricorn';
//                   certificatePassword := SalesAndRec."DSC Password";
                
//                     //pdfFileName :='\\NAVLIVE\NAV File Import\Pritesh\'+'CrNote_' + CONVERTSTR("Sales Cr.Memo Header"."No.",'/','-') + '.pdf';
//                     pdfFileName :='\\EAINPNAV004\NAV File Import\Pritesh\'+'CrNote_' + ConvertStr("Sales Cr.Memo Header"."No.",'/','-') + '.pdf';//CCIT-30072022
//                     SignedCrNote:='CrNote_' + ConvertStr("Sales Cr.Memo Header"."No.",'/','-') + '.pdf';
//                    if Exists(pdfFileName) then Erase(pdfFileName);
//                     pdfSettings.printerName := pdfUtil.DefaultPrinterName;
//                     pdfSettings.SetValue('Output', pdfFileName);
                
//                      pdfSettings.SetValue('ShowSaveAs', 'never');
//                      pdfSettings.SetValue('ShowSettings', 'never');
//                      pdfSettings.SetValue('ShowPDF', 'no');
//                      pdfSettings.SetValue('ShowProgress', 'no');
//                      pdfSettings.SetValue('ShowProgressFinished', 'no');
                
//                      pdfSettings.SetValue('SignLLX','55');
//                      pdfSettings.SetValue('SignLLY','70');
//                      pdfSettings.SetValue('SignRUX','250');
//                      pdfSettings.SetValue('SignRUY','90');
//                      pdfSettings.SetValue('SignPage','1');
                
//                      pdfSettings.SetValue('ConfirmOverwrite', 'no');
//                     pdfSettings.SetValue('StatusFile', statusFileName);
//                     pdfSettings.SetValue('SignCertificate', certificateFileName);
//                     pdfSettings.SetValue('SignPassword', certificatePassword);
                
//                     pdfSettings.SetValue('ShowSignature', 'yes');
//                     pdfSettings.SetValue('SuppressErrors', 'yes');
//                     pdfSettings.WriteSettings(true);
                
//                     if Exists(statusFileName) then Erase(statusFileName);
                
//                     Sales_Invoice_Header_Record.Reset;
//                     Sales_Invoice_Header_Record.SetRange("No.","Sales Cr.Memo Header"."No.");
//                     Report.RunModal(50027, false, false, Sales_Invoice_Header_Record);
                
//                     if pdfUtil.WaitForFile(statusFileName, 20000)  then begin
//                       // Check status file for errors.
//                       if pdfUtil.ReadIniString(statusFileName, 'Status', 'Errors', '') <> '0' then begin
//                         Error('Error creating PDF. ' + pdfUtil.ReadIniString(statusFileName, 'Status', 'MessageText', ''));
//                       end;
//                     end else begin
//                       // The timeout elapsed. Something is wrong.
//                       Error('Error creating ' + pdfFileName)
//                     end;
                
//                 Sleep(5000);
                
//                 /*
//                  CustomerEmail :='';
//                  SmtpEmail :='';
//                  EmailUserName:='';
//                  CcEmailID:='';
//                  BccEmailID:='';
//                  custName:='';
                
                
//                  CustContact:='';
//                  MonthText:='';
//                  day:='';
                
//                  SalesInvHdr.RESET;
//                  SalesInvHdr.SETRANGE("No.","Sales Cr.Memo Header"."No.");
//                  IF SalesInvHdr.FINDFIRST THEN BEGIN
                
//                  MonthText:=FORMAT(SalesInvHdr."Posting Date",0,'<Month Text>')+' '+FORMAT(DATE2DMY(SalesInvHdr."Posting Date",3));
//                  day:=FORMAT(DATE2DMY(SalesInvHdr."Posting Date",1));
//                  IF STRLEN(day) = 1 THEN BEGIN
//                    day:='0'+day;
//                  END;
                
//                  CustomerRecord.RESET;
//                  CustomerRecord.SETFILTER(CustomerRecord."No.",'%1',SalesInvHdr."Sell-to Customer No.");
//                  IF CustomerRecord.FINDFIRST THEN BEGIN
//                    CustomerEmail :=CustomerRecord."E-Mail";
//                    CcEmailID:=CustomerRecord."Cc E-mail ID";
//                    BccEmailID:=CustomerRecord."Bcc E-mail ID";
//                    CustContact:=CustomerRecord.Contact;
//                    custName:=CustomerRecord.Name;
//                  END;
                
//                  SMTPSetup.GET;
                
//                  ServerInstance.RESET;
//                  ServerInstance.SETFILTER("Server Instance ID",'<>%1',0);
//                  IF ServerInstance.FINDFIRST THEN BEGIN
//                  ServerName:=ServerInstance."Server Computer Name";
//                  END;
                
//                  SmtpEmail :=SMTPSetup."User E-Mail ID";
//                  EmailUserName:=SMTPSetup."User Name";
//                  BccEmailID:=SMTPSetup."BCC E-Mail ID";
//                  SMTPMail.CreateMessage('Europ Assistance India',SmtpEmail,CustomerEmail,custName+': Credit Note '+ SalesInvHdr."No."+', '+day+' '+MonthText,'',TRUE); //"Sales Cr.Memo Header"."No.",'',TRUE);
//                  SMTPMail.AppendBody('Dear '+ 'Sir/Madam' +',');
//                  SMTPMail.AppendBody('<br><br>');
//                  SMTPMail.AppendBody('Please find enclosed the credit note for the '+ MonthText +' as per our service agreement or equivalent document(s). Kindly note, this is a digitally signed, electronic credit note.');
//                  SMTPMail.AppendBody('<br><br>');
//                  SMTPMail.AppendBody('Please acknowledge for receipt of attached credit note and if no acknowledgement received within 7 days from receipt of this electronic email then it is deemed to be the acceptance of credit note including GST as applicable');
//                  SMTPMail.AppendBody('<br><br>');
//                  SMTPMail.AppendBody('Thank you.');
//                  SMTPMail.AppendBody('<br><br>');
//                  SMTPMail.AppendBody('Regards,');
//                  SMTPMail.AppendBody('<br><br>');
//                  SMTPMail.AppendBody(EmailUserName);
                
//                 IF CcEmailID <> '' THEN BEGIN
//                 SMTPMail.AddCC(CcEmailID);
//                 END;
//                 IF BccEmailID <> '' THEN BEGIN
//                 SMTPMail.AddBCC(BccEmailID);
//                 END;
                
//                 AttachmentName:='';
                
//                  AttachmentName:=pdfFileName;
//                  SMTPMail.AddAttachment(AttachmentName,SalesInvHdr."No."+'.pdf');
//                  recordLink.RESET;
//                  recordLink.SETRANGE("No.",SalesInvHdr."Pre-Assigned No.");
//                  recordLink.SETRANGE("Policy Details",TRUE);
//                  IF recordLink.FINDFIRST THEN BEGIN
//                    SMTPMail.AddAttachment(recordLink.URL1,recordLink."Attachement Name"+recordLink.URL3);
//                  END;
//                  SMTPMail.Send;
                
//                  SalesInvHeader.RESET;
//                  SalesInvHeader.SETRANGE(SalesInvHeader."No.","Sales Cr.Memo Header"."No.");
//                  IF SalesInvHeader.FINDFIRST THEN BEGIN
                
//                   SalesInvHeader.CALCFIELDS(Amount);
//                   GSTAmt:=0;
                
//                   GSTLedEntry.RESET;
//                   GSTLedEntry.SETRANGE("Document No.",SalesInvHeader."No.");
//                   IF GSTLedEntry.FINDSET THEN REPEAT
//                     GSTAmt:=GSTAmt+ABS(GSTLedEntry."GST Amount");
//                   UNTIL GSTLedEntry.NEXT = 0;
                
//                   Cust.GET(SalesInvHeader."Sell-to Customer No.");
//                   SalesInvHeader."E-Mail ID Of Concern":=Cust."E-Mail";
//                   SalesInvHeader."Doc No":=SalesInvHeader."No.";
//                   SalesInvHeader."GST Amt":=GSTAmt;
//                   SalesInvHeader.Total:=SalesInvHeader.Amount+GSTAmt;
//                   SalesInvHeader."Cr.Note Sent Date & Time":=CURRENTDATETIME;
//                   SalesInvHeader.VALIDATE("Mail Sent",TRUE);
//                   SalesInvHeader."Signed Invoice":=SignedCrNote;
//                   SalesInvHeader.MODIFY;
                
//                  END;
//                 END;
//                 */
//                 Commit;
//                 //END;
//                 //End E-Mail Code

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

//         // prdp +++
//         SalesInvHeader.Reset;
//         SalesInvHeader.SetRange(SalesInvHeader.Select,true);
//         if SalesInvHeader.FindSet then repeat
//            SalesInvHeader.Select:=false;
//            SalesInvHeader.Modify;
//         until SalesInvHeader.Next = 0;

//         Message('PDFs Exported');
//         // prdp ---
//     end;

//     var
//         DocExchStatusStyle: Text;
//         CRMIntegrationEnabled: Boolean;
//         CRMIsCoupledToRecord: Boolean;
//         pdfSettings: Automation ComPdfSettings;
//         pdfUtil: Automation ComPdfUtil;
//         pdfFolderName: Text[200];
//         counter: Integer;
//         Pdf_File_Name: Text;
//         SMTPSetup: Record "SMTP Mail Setup";
//         SMTPMail: Codeunit UnknownCodeunit400;
//         aa: Text[300];
//         CustomerRecord: Record Customer;
//         CustomerEmail: Text;
//         SmtpEmail: Text;
//         MonthText: Text;
//         New: Text;
//         BullZipPDF: Automation PDFPrinterSettings;
//         Sales_Invoice_Header_Record: Record "Sales Cr.Memo Header";
//         Customer_Record: Record Customer;
//         Customer_Email: Text;
//         Customer_Order_No: Text;
//         Smtp_Email: Text;
//         pdfFileName: Text[250];
//         statusFileName: Text[250];
//         certificateFileName: Text[250];
//         certificatePassword: Text[30];
//         backgroundFileName: Text[250];
//         mergeBeforeFileName: Text[250];
//         mergeAfterFileName: Text[250];
//         baseFolder: Text[250];
//         SalesAndRec: Record "Sales & Receivables Setup";
//         AttachmentName: Text[100];
//         pdfFileName1: Text[250];
//         Page132: Page "Posted Sales Invoice";
//         InvNo: Code[20];
//         SalesInvHdr: Record "Sales Cr.Memo Header";
//         pdfFileName2: Text[250];
//         CU50002: Codeunit UnknownCodeunit50002;
//         CustContact: Text[50];
//         EmailUserName: Text[100];
//         ServerInstance: Record "Server Instance";
//         CcEmailID: Text[150];
//         BccEmailID: Text[150];
//         ServerName: Text[250];
//         SalesInvHeader: Record "Sales Cr.Memo Header";
//         SMTPrec: Record "SMTP Mail Setup";
//         GSTAmt: Decimal;
//         GSTLedEntry: Record UnknownRecord16418;
//         Cust: Record Customer;
//         SignedCrNote: Text[30];
//         custName: Text[100];
//         day: Text[2];
//         recordLink: Record "Record Link";
// }

