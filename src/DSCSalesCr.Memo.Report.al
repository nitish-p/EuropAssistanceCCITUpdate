// Report 50026 "DSC Sales Cr.Memo"
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
//                   statusFileName :='\\EAINPNAV004\D\Digital Signature\Temp\status.ini';
//                   certificateFileName := SalesAndRec."DSC Folder";
//                   //certificatePassword := 'capricorn';
//                   certificatePassword := SalesAndRec."DSC Password";

//                     pdfFileName :=SalesAndRec."DSC Credit Note output"+'\CrNote_' + ConvertStr("Sales Cr.Memo Header"."No.",'/','-') + '.pdf';
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


//                  CustomerEmail :='';
//                  SmtpEmail :='';
//                  EmailUserName:='';
//                  CcEmailID:='';
//                  BccEmailID:='';
//                  custName:='';


//                  CustContact:='';
//                  MonthText:='';
//                  day:='';

//                  SalesInvHdr.Reset;
//                  SalesInvHdr.SetRange("No.","Sales Cr.Memo Header"."No.");
//                  if SalesInvHdr.FindFirst then begin
//                 if SalesInvHdr."Invoice Date" <> 0D then begin
//                  MonthText:=Format(SalesInvHdr."Invoice Date",0,'<Month Text>')+' '+Format(Date2dmy(SalesInvHdr."Invoice Date",3));
//                  day:=Format(Date2dmy(SalesInvHdr."Invoice Date",1));
//                  if StrLen(day) = 1 then begin
//                    day:='0'+day;
//                  end;
//                 end else begin
//                  MonthText:=Format(SalesInvHdr."Posting Date",0,'<Month Text>')+' '+Format(Date2dmy(SalesInvHdr."Posting Date",3));
//                  day:=Format(Date2dmy(SalesInvHdr."Posting Date",1));
//                  if StrLen(day) = 1 then begin
//                    day:='0'+day;
//                  end;
//                 end;


//                  CustomerRecord.Reset;
//                  CustomerRecord.SetFilter(CustomerRecord."No.",'%1',SalesInvHdr."Sell-to Customer No.");
//                  if CustomerRecord.FindFirst then begin
//                    CustomerEmail :=CustomerRecord."E-Mail";
//                    CcEmailID:=CustomerRecord."Cc E-mail ID";
//                    BccEmailID:=CustomerRecord."Bcc E-mail ID";
//                    CustContact:=CustomerRecord.Contact;
//                    custName:=CustomerRecord.Name;
//                  end;

//                  SMTPSetup.Get;

//                  ServerInstance.Reset;
//                  ServerInstance.SetFilter("Server Instance ID",'<>%1',0);
//                  if ServerInstance.FindFirst then begin
//                  ServerName:=ServerInstance."Server Computer Name";
//                  end;

//                  SmtpEmail :=SMTPSetup."User E-Mail ID";
//                  EmailUserName:=SMTPSetup."User Name";
//                  BccEmailID:=SMTPSetup."BCC E-Mail ID";
//                  SMTPMail.CreateMessage('Europ Assistance India',SmtpEmail,CustomerEmail,custName+': Credit Note '+ SalesInvHdr."No."+', '+day+' '+MonthText,'',true); //"Sales Cr.Memo Header"."No.",'',TRUE);
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

//                 if CcEmailID <> '' then begin
//                 SMTPMail.AddCC(CcEmailID);
//                 end;
//                 if BccEmailID <> '' then begin
//                 SMTPMail.AddBCC(BccEmailID);
//                 end;

//                 AttachmentName:='';

//                  AttachmentName:=pdfFileName;
//                  SMTPMail.AddAttachment(AttachmentName,SalesInvHdr."No."+'.pdf');
//                  recordLink.Reset;
//                  recordLink.SetRange("No.",SalesInvHdr."Pre-Assigned No.");
//                  recordLink.SetRange("Policy Details",true);
//                  if recordLink.FindFirst then begin
//                    SMTPMail.AddAttachment(recordLink.URL1,recordLink."Attachement Name"+recordLink.URL3);
//                  end;
//                  SMTPMail.Send;

//                  SalesInvHeader.Reset;
//                  SalesInvHeader.SetRange(SalesInvHeader."No.","Sales Cr.Memo Header"."No.");
//                  if SalesInvHeader.FindFirst then begin

//                   SalesInvHeader.CalcFields(Amount);
//                   GSTAmt:=0;

//                   GSTLedEntry.Reset;
//                   GSTLedEntry.SetRange("Document No.",SalesInvHeader."No.");
//                   if GSTLedEntry.FindSet then repeat
//                     GSTAmt:=GSTAmt+Abs(GSTLedEntry."GST Amount");
//                   until GSTLedEntry.Next = 0;

//                   Cust.Get(SalesInvHeader."Sell-to Customer No.");
//                   SalesInvHeader."E-Mail ID Of Concern":=Cust."E-Mail";
//                   SalesInvHeader."Doc No":=SalesInvHeader."No.";
//                   SalesInvHeader."GST Amt":=GSTAmt;
//                   SalesInvHeader.Total:=SalesInvHeader.Amount+GSTAmt;
//                   SalesInvHeader."Cr.Note Sent Date & Time":=CurrentDatetime;
//                   SalesInvHeader.Validate("Mail Sent",true);
//                   SalesInvHeader."Signed Invoice":=SignedCrNote;
//                   SalesInvHeader.Modify;

//                  end;
//                 end;
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

//         Message('Mail Sent');
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
//         CU50002: Codeunit "Update Bank Response_1";
//         CustContact: Text[50];
//         EmailUserName: Text[100];
//         ServerInstance: Record "Server Instance";
//         CcEmailID: Text[150];
//         BccEmailID: Text[150];
//         ServerName: Text[250];
//         SalesInvHeader: Record "Sales Cr.Memo Header";
//         SMTPrec: Record "SMTP Mail Setup";
//         GSTAmt: Decimal;
//         GSTLedEntry: Record "GST Ledger Entry";
//         Cust: Record Customer;
//         SignedCrNote: Text[30];
//         custName: Text[100];
//         day: Text[2];
//         recordLink: Record "Record Link";
// }

