// xmlport 50002 "test Email"
// {
//     Caption = 'test Email';
//     Format = VariableText;
//     Direction = Import;

//     schema
//     {
//         textelement(RootNodeName)
//         {
//             tableelement(Integer; "Integer")
//             {
//                 AutoSave = false;
//                 UseTemporary = true;
//                 textelement(EmailId)
//                 {
//                 }

//                 trigger OnAfterInsertRecord()
//                 var
//                     EmailUserName: text;
//                     CompInfo: Record "Company Information";
//                     "PurchPayable": Record "Purchases & Payables Setup";
//                     email: Codeunit Email;
//                     emailmsg: Codeunit "Email Message";
//                     //CompInfo: Record "Company Information";
//                     //Report50042: Report "Auto Purchase Invoices Log";//nkp
//                     AttachmentName: Text[250];
//                     FileName: Text[50];
//                     TransactionAPI: Record "Transaction API";
//                     tempblob: Codeunit "Temp Blob";
//                     torecipients: List of [Text];
//                     ccRecipients: List of [Text];
//                     BccRecipients: List of [Text];
//                     instrm: InStream;
//                     outstrm: OutStream;
//                     Attachment: Record "Record Link1";
//                     purchinv: record "Purch. Inv. Header";
//                 //tempblob: Codeunit "Temp Blob";
//                 begin
//                     Sleep(1000);
//                     EmailUserName := COMPANYNAME;
//                     //SMTPSetup.Get;
//                     CompInfo.Get('');
//                     "PurchPayable".Get('');
//                     //SmtpEmail := SMTPSetup."User E-Mail ID";
//                     torecipients.Add(EmailId);
//                     ccRecipients.Add('');

//                     emailmsg.Create(torecipients, 'Automated Purchase Invoices Log', '', true, ccRecipients, BccRecipients);
//                     emailmsg.AppendToBody('Dear ' + 'Finance Team,');
//                     emailmsg.AppendToBody('<br><br>');
//                     emailmsg.AppendToBody('Find attachment of automated purchase invoices log for date ' + Format(Today));
//                     emailmsg.AppendToBody('<br><br>');
//                     //SMTPMail.AppendBody('Regards,');
//                     emailmsg.AppendToBody('<br><br>');
//                     // SMTPMail.AppendBody('Ez-Auto');
//                     //emailmsg.AddAttachment(AttachmentName, FileName);
//                     //emailmsg.Send;
//                     //Attachment.Get(96);
//                     //tempblob.CreateInStream(instrm);
//                     //Attachment.Note.CreateInStream(instrm);
//                     // purchinv.Get();
//                     // Report.SaveAs(Report::"Purchase - Invoice",'', ReportFormat::Pdf, outstrm);
//                     // DownloadFromStream(instrm, '', '', '', Attachment.URL1);
//                     // emailmsg.AddAttachment(Attachment.URL1, '', instrm);
//                     email.Send(emailmsg, Enum::"Email Scenario"::Default)

//                 end;
//             }

//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }
//     }
// }
