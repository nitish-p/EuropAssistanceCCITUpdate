Report 50043 "Send Auto Invoice Log Mail"
{
    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
    //Naveen
    trigger OnPostReport()
    var
        outstrm: OutStream;
        instrm: InStream;
    begin
        // e-mail notification to finance team +++
        FileName := 'Log_' + ConvertStr(Format(Today), '/', '-') + '.xlsx';
        // Report50042.SaveAs('', ReportFormat::Excel, outstrm);//nkp
        //Report50042.SaveAsExcel('\\EAINPNAV004\d\Attachment\Automated Purchase Invoice Logs\' + FileName);
        tempblob.CreateOutStream(outstrm);
        tempblob.CreateInStream(instrm);
        AttachmentName := '\\EAINPNAV004\d\Attachment\Automated Purchase Invoice Logs\' + FileName;

        Sleep(10000);
        EmailUserName := COMPANYNAME;
        //SMTPSetup.Get;
        CompInfo.Get('');
        "Purch&Payable".Get('');
        //SmtpEmail := SMTPSetup."User E-Mail ID";
        torecipients.Add('');
        ccRecipients.Add('');

        emailmsg.Create(torecipients, 'Automated Purchase Invoices Log', '', true, ccRecipients, BccRecipients);
        emailmsg.AppendToBody('Dear ' + 'Finance Team,');
        emailmsg.AppendToBody('<br><br>');
        emailmsg.AppendToBody('Find attachment of automated purchase invoices log for date ' + Format(Today));
        emailmsg.AppendToBody('<br><br>');
        //SMTPMail.AppendBody('Regards,');
        emailmsg.AppendToBody('<br><br>');
        // SMTPMail.AppendBody('Ez-Auto');
        //emailmsg.AddAttachment(AttachmentName, FileName);
        //emailmsg.Send;
        emailmsg.AddAttachment(FileName, 'EXCEL', instrm);
        email.Send(emailmsg, Enum::"Email Scenario"::Default)
        // e-mail notification to finance team ---
    end;
    //Naveen

    var
        "Purch&Payable": Record "Purchases & Payables Setup";
        SmtpEmail: Text[100];
        EmailUserName: Text[50];
        // SMTPMail: Codeunit "Email Message";
        // SMTPSetup: Record "SMTP Mail Setup";//Smtp mail setup
        email: Codeunit Email;
        emailmsg: Codeunit "Email Message";
        CompInfo: Record "Company Information";
        // Report50042: Report "Auto Purchase Invoices Log";//nkp
        AttachmentName: Text[250];
        FileName: Text[50];
        TransactionAPI: Record "Transaction API";
        tempblob: Codeunit "Temp Blob";
        torecipients: List of [Text];
        ccRecipients: List of [Text];
        BccRecipients: List of [Text];
}

