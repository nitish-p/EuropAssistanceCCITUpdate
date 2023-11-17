pageextension 50024 "PostedSalesInvoice" extends "Posted Sales Invoice"
{

    layout
    {
        addbefore("Work Description")
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
        addafter("Cancel Reason")
        {
            field("QR Code Image"; Rec."QR Code")
            {
                ApplicationArea = All;

            }
        }


        //Unsupported feature: Code Insertion (VariableCollection) on "Control 87.OnAssistEdit".

        //trigger (Variable: ChangeExchangeRate)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Control 87.OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date");
        ChangeExchangeRate.EDITABLE(FALSE);
        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
          "Currency Factor" := ChangeExchangeRate.GetParameter;
          MODIFY;
        END;
        CLEAR(ChangeExchangeRate);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..6
        */
        //end;
        addafter("Document Date")
        {
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("No. Printed")
        {
            field("Debit Note"; Rec."Debit Note")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Customer Invoice No."; Rec."Customer Invoice No.")
            {
                ApplicationArea = All;
            }
            field("EA Transaction Type"; Rec."EA Transaction Type")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "CreateInCRM(Action 29).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CRMIntegrationManagement.CreateNewRecordInCRM(RECORDID,FALSE);
        IF CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID) THEN BEGIN
          VALIDATE("Coupled to CRM",TRUE);
          MODIFY;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CRMIntegrationManagement.CreateNewRecordInCRM(RECORDID,FALSE);
        */
        //end;


        //Unsupported feature: Code Modification on "SendCustom(Action 5).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SalesInvHeader := Rec;
        CurrPage.SETSELECTIONFILTER(SalesInvHeader);
        SalesInvHeader.SendRecords;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SalesInvHeader := Rec;
        CurrPage.SETSELECTIONFILTER(SalesInvHeader);
        // Call SendRecords to open sending profile dialog
        SalesInvHeader.SendRecords;
        */
        //end;
        modify("Generate IRN")
        {
            Visible = false;
        }
        modify("Generate E-Invoice")
        {
            Visible = false;
        }
        modify("Generate QR Code")
        {
            Visible = false;
        }
        modify("Import E-Invoice Response")
        {
            Visible = false;
        }
        modify("Cancel E-Invoice")
        {
            Visible = false;
        }
        addafter(Approvals)
        {
            action("Sales Credit Memo")
            {
                RunObject = Page "Sales Credit Memo";
                ApplicationArea = All;
            }
        }
        addbefore(print)
        {

            action("Print GST Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print GST Invoice';
                Ellipsis = true;
                Image = PrintReport;
                Promoted = true;
                // PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr := Rec;
                    SalesInvHdr.SetRecFilter();
                    Report.RunModal(Report::"Sales Invoice GST", true, true, SalesInvHdr);
                end;
            }
            action("Print Sales Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print Sales Invoice';
                Ellipsis = true;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.RESET;
                    SalesInvHdr.SETRANGE(SalesInvHdr."No.", SalesInvHdr."No.");
                    REPORT.RUNMODAL(50002, TRUE, TRUE, SalesInvHdr);
                end;
            }
            action("Print Digital Signature")
            {
                Promoted = true;
                Visible = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    i: Integer;
                    Reportpdf: Report 50024;
                    Ostream: OutStream;
                    Instream: InStream;
                    Base64Convert: Codeunit "Base64 Convert";
                    tempblob: Codeunit "Temp Blob";
                    Digisign: Codeunit "Digital Sign Integration";
                    ResultBase64: Text;
                    exportfilename: Text;
                    ZipFileName: Text;
                    DataCompression: Codeunit "Data Compression";
                    RecRef: RecordRef;
                    FldRef: FieldRef;
                    Base64Content: text;
                    TenantMedia: Record "Tenant Media";
                    UpdateSalesInvHdr: Codeunit 50057;
                begin
                    // NP +++
                    // tempblob.CreateOutStream(Ostream);
                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE("No.", rec."No.");
                    // Reportpdf.SetTableView(SalesInvHeader);
                    // Reportpdf.SaveAs('', ReportFormat::Pdf, Ostream);
                    // tempblob.CreateInStream(Instream);

                    // ResultBase64 := Digisign.DigiSign(Rec, Base64Convert.ToBase64(Instream));
                    // exportfilename := Format(Rec."No.").Replace('/', '-') + '.pdf';
                    // Clear(tempblob);
                    // tempblob.CreateOutStream(Ostream);
                    // Base64Convert.FromBase64(ResultBase64, Ostream);
                    // tempblob.CreateInStream(Instream);
                    // DownloadFromStream(Instream, '', '', '', exportfilename);
                    // //REPORT.RUNMODAL(50025, TRUE, TRUE, SalesInvHeader);
                    SalesInvHeader.Reset();
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    SalesInvHeader.SetRange(DS, false);
                    if SalesInvHeader.FindFirst() then
                        repeat
                            Clear(tempblob);
                            Clear(Ostream);
                            Clear(Instream);
                            TempBlob.CreateOutStream(Ostream);
                            RecRef.GetTable(SalesInvHeader);
                            FldRef := RecRef.Field(SalesInvHeader.FieldNo("No."));
                            FldRef.SetRange(SalesInvHeader."No.");
                            if RecRef.FindFirst() then begin
                                Report.SaveAs(50024, '', ReportFormat::Pdf, Ostream, RecRef);
                                TempBlob.CreateInStream(Instream);
                                Sleep(1000);
                                Clear(ResultBase64);
                                Clear(Digisign);
                                Base64Content := Base64Convert.ToBase64(Instream);
                                ResultBase64 := Digisign.DigiSign(SalesInvHeader, Base64Content);
                                exportfilename := Format(SalesInvHeader."No.").Replace('/', '-') + '.pdf';
                                Clear(tempblob);
                                Clear(Ostream);
                                Clear(Instream);
                                tempblob.CreateOutStream(Ostream);
                                Base64Convert.FromBase64(ResultBase64, Ostream);
                                tempblob.CreateInStream(Instream);
                                //DataCompression.AddEntry(Instream, exportfilename);
                                SalesInvHeader.DS := true;
                                SalesInvHeader."DS Media".ImportStream(Instream, 'Signed Invoice ' + Format(SalesInvHeader."No.").Replace('/', '-'), 'application/pdf');
                                //SalesInvHeader.Modify();
                                UpdateSalesInvHdr.UpdateSalesInvoiceHeader(SalesInvHeader);
                            end
                        until SalesInvHeader.Next() = 0;



                    ZipFileName := 'Attachments_' + Format(CurrentDateTime) + '.zip';
                    DataCompression.CreateZipArchive();
                    SalesInvHeader.Reset();
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    if SalesInvHeader.FindFirst() then begin
                        repeat
                            Clear(Instream);

                            if TenantMedia.Get(SalesInvHeader."DS Media".MediaId) then begin
                                TenantMedia.CalcFields(Content);
                                if TenantMedia.Content.HasValue then begin
                                    exportfilename := Format(SalesInvHeader."No.").Replace('/', '-') + '.pdf';
                                    TenantMedia.Content.CreateInStream(InStream);
                                    DataCompression.AddEntry(Instream, exportfilename);
                                end;
                            end;
                        until SalesInvHeader.Next() = 0;
                    end;
                    TempBlob.CreateOutStream(Ostream);
                    DataCompression.SaveZipArchive(Ostream);
                    TempBlob.CreateInStream(Instream);
                    DownloadFromStream(Instream, '', '', '', ZipFileName);

                    //             


                    // prdp ---
                end;
            }
            action("Send To Customer New")
            {
                Promoted = true;
                Visible = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesInvheader2: Record 112;
                begin
                    // prdp +++
                    IF NOT CONFIRM('Do you want Send Mail ?', FALSE)
                          THEN
                        EXIT;

                    if Rec."Re-Dispatch" = false then
                        Error('IRN must be generate for invoice %1', Rec."No.");


                    Cust.RESET;
                    Cust.SETRANGE("No.", Rec."Sell-to Customer No.");
                    Cust.SETRANGE("E-Mail", '');
                    IF Cust.FINDFIRST THEN BEGIN
                        ERROR('Define E-Mail ID for customer %1', Cust."No.");
                    END;






                    // prdp ---
                end;
            }
            action("Send To Customer Old")
            {
                Promoted = true;
                ApplicationArea = All;
                Visible = true;

                trigger OnAction()
                var
                    CustContact: Text;
                    MonthText: Text;
                    day: Text;
                    EmailUserName: text;
                    CompInfo: Record "Company Information";
                    "PurchPayable": Record "Purchases & Payables Setup";
                    email: Codeunit Email;
                    emailmsg: Codeunit "Email Message";
                    AttachmentName: Text[250];
                    FileName: Text[50];
                    TransactionAPI: Record "Transaction API";
                    tempblob: Codeunit "Temp Blob";
                    torecipients: List of [Text];
                    ccRecipients: List of [Text];
                    BccRecipients: List of [Text];
                    instrm: InStream;
                    outstrm: OutStream;
                    recordlink: Record "Record Link1";
                    updaterec: Codeunit 50057;

                begin
                    // prdp +++

                    IF NOT CONFIRM('Do you want Send Mail to selected customers ?', FALSE)
                      THEN
                        EXIT;
                    if Rec."Re-Dispatch" = false then
                        Error('IRN must be generate for invoice %1', Rec."No.");


                    Cust.RESET;
                    Cust.SETRANGE("No.", Rec."Sell-to Customer No.");
                    Cust.SETRANGE("E-Mail", '');
                    IF Cust.FINDFIRST THEN BEGIN
                        ERROR('Define E-Mail ID for customer %1', Cust."No.");
                    END;

                    Cust.RESET;
                    Cust.SETRANGE("No.", Rec."Sell-to Customer No.");
                    IF Cust.FINDFIRST THEN BEGIN
                        //ERROR('Define E-Mail ID for customer %1', Cust."No.");
                    END;
                    if not Rec."DS Media".HasValue then
                        Error('Generate DSC first');

                    CustContact := '';
                    MonthText := '';
                    day := '';



                    if rec."Invoice Date" <> 0D then begin

                        MonthText := Format(rec."Invoice Date", 0, '<Month Text>') + ' ' + Format(Date2dmy(rec."Invoice Date", 3));

                        day := Format(Date2dmy(rec."Invoice Date", 1));
                        if StrLen(day) = 1 then begin
                            day := '0' + day;
                        end;

                    end else begin

                        MonthText := Format(rec."Posting Date", 0, '<Month Text>') + ' ' + Format(Date2dmy(rec."Posting Date", 3));

                        day := Format(Date2dmy(rec."Posting Date", 1));
                        if StrLen(day) = 1 then begin
                            day := '0' + day;
                        end;

                    end;



                    torecipients.Add(Cust."E-Mail");
                    ccRecipients.Add(Cust."Cc E-mail ID");
                    BccRecipients.Add(Cust."Bcc E-mail ID");

                    emailmsg.Create(torecipients, Cust.Name + ': Sales Invoice ' + rec."No." + ', ' + day + ' ' + MonthText, '', true, ccRecipients, BccRecipients);
                    emailmsg.AppendToBody('Dear ' + 'Finance Team,');


                    //SMTPMail.CreateMessage('Europ Assistance India', SmtpEmail, CustomerEmail, custName + ': Sales Invoice ' + rec."No." + ', ' + day + ' ' + MonthText, '', true); //"Sales Invoice Header"."No.",'',TRUE);
                    emailmsg.AppendToBody('Dear ' + 'Sir/Madam' + ',');
                    emailmsg.AppendToBody('<br><br>');
                    emailmsg.AppendToBody('Please find enclosed the invoice for the ' + MonthText + ' as per our service agreement or equivalent document(s). Kindly note, this is a digitally signed, electronic invoice.');
                    emailmsg.AppendToBody('<br><br>');
                    emailmsg.AppendToBody('Please acknowledge for receipt of  attached invoice and if no acknowledgement received within 7 days from receipt of this electronic email then it is deemed to be the acceptance of Invoice including GST as applicable');
                    emailmsg.AppendToBody('<br><br>');
                    emailmsg.AppendToBody('An early settlement of the invoice will be much appreciated.');
                    emailmsg.AppendToBody('<br><br>');
                    emailmsg.AppendToBody('Thank you.');
                    emailmsg.AppendToBody('<br><br>');
                    emailmsg.AppendToBody('Regards,');
                    emailmsg.AppendToBody('<br><br>');
                    emailmsg.AppendToBody(EmailUserName);
                    emailmsg.AppendToBody('<br><br>');
                    tempblob.CreateOutStream(outstrm);
                    Rec."DS Media".ExportStream(outstrm);
                    tempblob.CreateInStream(instrm);
                    emailmsg.AddAttachment('Invoice_' + ConvertStr(Rec."No.", '/', '-') + '.pdf', 'PDF', instrm);

                    recordLink.Reset;
                    recordLink.SetRange("No.", rec."Pre-Assigned No.");
                    recordLink.SetRange("Policy Details", true);
                    if recordLink.FindFirst then begin
                        recordlink.Note.CreateOutStream(outstrm);
                        tempblob.CreateInStream(instrm);
                        emailmsg.AddAttachment('Policy Details.pdf', 'PDF', instrm);
                    end;

                    email.Send(emailmsg, Enum::"Email Scenario"::Default);

                    Rec.Validate("Mail Sent", true);
                    Rec."Invoice Sent Date & Time" := CurrentDatetime;
                    //Rec."Signed Invoice" := true;
                    updaterec.UpdateSalesInvoiceHeader(Rec);
                    //Rec.Modify;
                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE("No.", Rec."No.");
                    // REPORT.RUNMODAL(50025, FALSE, FALSE, SalesInvHeader);

                    // prdp ---
                end;
            }
            action("Temp Digital Invoice Export")
            {
                ApplicationArea = All;
                Promoted = true;
                Visible = false;
                trigger OnAction()
                begin
                    // prdp +++



                    IF NOT CONFIRM('Do you want to export digitally signed pdfs for this invoice ?', FALSE)
                      THEN
                        EXIT;
                    /*
                      Cust.RESET;
                      Cust.SETRANGE("No.","Sell-to Customer No.");
                      Cust.SETRANGE("E-Mail",'');
                      IF Cust.FINDFIRST THEN BEGIN
                        ERROR('Define E-Mail ID for customer %1',Cust."No.");
                      END;
                      */
                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE("No.", Rec."No.");
                    // IF SalesInvHeader.FINDFIRST THEN BEGIN
                    //     SalesInvHeader.Select := TRUE;
                    //     SalesInvHeader.MODIFY;
                    // END;

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE("No.", Rec."No.");
                    REPORT.RUNMODAL(50060, FALSE, FALSE, SalesInvHeader);

                    // prdp ---

                end;
            }
        }
        addafter(Print)
        {
            action("Print Voucher")
            {
                ApplicationArea = All;
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
                    GLEntry.SETRANGE("Posting Date", GLEntry."PO Date");
                    IF GLEntry.FINDFIRST THEN
                        REPORT.RUNMODAL(REPORT::"Posted Voucher", TRUE, TRUE, GLEntry);
                end;
            }

            action("Attach Policy Details")
            {
                ApplicationArea = All;
                Image = Attach;
                Promoted = true;

                trigger OnAction()
                var
                    RecordLink: Record "Record Link1";
                    FileName: Text[250];
                    ImportFileName: XMLport "Attach File";
                    OrderNo: Code[30];
                    No: Text[250];
                    TimeStamp: Text[100];
                    FinalName: Text[250];
                    Timer: Text[100];
                    Timer1: Text[100];
                    Source: Text[250];
                    Destination: Text[250];
                    ActiveSession: Record "Active Session";
                    User: Record User;
                    UserPath: Text[250];
                    UserName: Text[100];
                    ActSession: Record "Active Session";
                    GenLedSetup: Record "General Ledger Setup";
                    Extension: Text[100];
                    Length: Integer;
                    StartPt: Integer;
                    Temp: Text[250];
                    FileManagement: Codeunit "File Management";
                    instrm: InStream;
                    outstrm: OutStream;
                    LinkID: Integer;
                begin
                    RecordLink.RESET;
                    RecordLink.SETRANGE("No.", Rec."Pre-Assigned No.");
                    RecordLink.SETRANGE("Policy Details", TRUE);
                    RecordLink.SETFILTER("Attachement Name", '<>%1', '');
                    IF RecordLink.FINDFIRST THEN BEGIN
                        ERROR('Policy details are already attached for invoice %1', Rec."Pre-Assigned No.");
                    END;

                    UploadIntoStream('Please Select File', '', 'All Files (*.*)|*.*', FinalName, instrm);
                    //to insert the link in record link table
                    RecordLink.Reset();
                    if RecordLink.FindLast() then
                        LinkID := RecordLink."Link Id" + 1
                    else
                        LinkID := LinkID + 1;
                    RecordLink.Init();
                    RecordLink."No." := Rec."Pre-Assigned No.";
                    //RecordLink.SourcerPath := FileName;
                    RecordLink."Attachement Name" := FinalName;
                    RecordLink.URL1 := FileName;
                    RecordLink.URL3 := Extension;
                    RecordLink.Note.CreateOutStream(outstrm);
                    CopyStream(outstrm, instrm);
                    RecordLink.Created := CURRENTDATETIME;
                    RecordLink."User ID" := USERID;
                    RecordLink.Company := COMPANYNAME;
                    RecordLink."Policy Details" := TRUE;
                    RecordLink."Link Id" := LinkID;
                    RecordLink.INSERT;
                    // to copy the file to server
                    // FILE.COPY(FileName, Destination + Extension);
                    MESSAGE('Attached and Saved to Server');
                end;
            }
            action("Files Attached")
            {
                ApplicationArea = All;
                Image = Links;
                Promoted = true;
                RunObject = Page 50014;
                RunPageLink = "No." = FIELD("Pre-Assigned No.");
            }



            action("Generate-IRN")
            {
                Promoted = true;
                Visible = ShowEInvoiceIG;
                Caption = 'Generate-IRN';
                Image = UpdateDescription;
                ApplicationArea = All;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    IF NOT CONFIRM('Do you want to Generate IRN ?', FALSE)
                      THEN
                        EXIT;

                    UserIDState := '';
                    PasswordState := '';
                    LocationGSTNo := '';

                    RecLocation.RESET;
                    RecLocation.SETRANGE(RecLocation.Code, Rec."Location Code");
                    IF RecLocation.FINDFIRST THEN BEGIN
                        LocationGSTNo := RecLocation."GST Registration No.";
                    END;

                    REcState.RESET;
                    REcState.SETRANGE(REcState.Code, Rec."Location State Code");
                    IF REcState.FINDFIRST THEN BEGIN
                        UserIDState := REcState."User Id";
                        PasswordState := REcState.Password;
                    END;

                    IF LocationGSTNo = '' THEN
                        ERROR('GST Reg No must not be blank for state %1', Rec."Location State Code");

                    IF UserIDState = '' THEN
                        ERROR('User ID must not be blank for state %1', Rec."Location State Code");

                    IF PasswordState = '' THEN
                        ERROR('Password must not be blank for state %1', Rec."Location State Code");

                    AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('', '');
                    RecCodeunitAPI.GenerateIRN(UserIDState, PasswordState, LocationGSTNo, AuthToken, Rec);


                    /*
                    // UAT credentials
                      AuthToken := 'Bearer '+ RecCodeunitAPI.GenerateAuthToken('D1D3B83EDFE24D28BC7308FE610CDFE9','2BB56693GCBB3G4E47G982BGD9F378BE4CB6');
                      RecCodeunitAPI.GenerateIRN('adqgspmhusr1','Gsp@1234','27AMBPG7773M016',AuthToken,Rec);
                    */

                end;
            }
            action("Cancel IRN")
            {
                Promoted = true;
                Visible = ShowEInvoiceIC;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    IF NOT CONFIRM('Do you want to Cancel IRN ?', FALSE)
                      THEN
                        EXIT;

                    UserIDState := '';
                    PasswordState := '';
                    LocationGSTNo := '';

                    RecLocation.RESET;
                    RecLocation.SETRANGE(RecLocation.Code, Rec."Location Code");
                    IF RecLocation.FINDFIRST THEN BEGIN
                        LocationGSTNo := RecLocation."GST Registration No.";
                    END;

                    REcState.RESET;
                    REcState.SETRANGE(REcState.Code, Rec."Location State Code");
                    IF REcState.FINDFIRST THEN BEGIN
                        UserIDState := REcState."User Id";
                        PasswordState := REcState.Password;
                    END;

                    IF LocationGSTNo = '' THEN
                        ERROR('GST Reg No must not be blank for state %1', Rec."Location State Code");

                    IF UserIDState = '' THEN
                        ERROR('User ID must not be blank for state %1', Rec."Location State Code");

                    IF PasswordState = '' THEN
                        ERROR('Password must not be blank for state %1', Rec."Location State Code");

                    AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('5B4C01A9FBB84B9FA6F7C3493CF8A4CB', 'A36ABD39GF34FG4592G80F7G0D8688D8DCF8');
                    RecCodeunitAPI.CancelIRN(UserIDState, PasswordState, LocationGSTNo, AuthToken, Rec);
                end;
            }
            action("Get Duplicate Response")
            {
                Promoted = true;
                Visible = ShowEInvoiceIG;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    IF NOT CONFIRM('Do you want to get Response Again ?', FALSE)
                     THEN
                        EXIT;
                    if AuthToken = '' then
                        AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('', '');
                    RecCodeunitAPI.GetResponse(AuthToken, Rec);
                end;
            }

        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";

    var
        Cust: Record Customer;
        AuthToken: Text;
        RecCodeunitAPI: Codeunit "E-Invoice Creation";
        RecLocation: Record Location;
        REcState: Record State;
        LocationGSTNo: Code[30];
        UserIDState: Text;
        PasswordState: Text;
        RecELE: Record "E-Invoice Ledger Entries";
        ShowEInvoiceIG: Boolean;
        ShowEInvoiceIC: Boolean;
        EInvEntry: Record "E-Invoice Ledger Entries";


    //Unsupported feature: Code Modification on "OnOpenPage".
    trigger OnOpenPage()
    begin
        ShowEInvoiceIG := FALSE;
        ShowEInvoiceIC := FALSE;
        IF Rec."Posting Date" > 20211231D THEN BEGIN
            Cust.GET(Rec."Sell-to Customer No.");
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (Rec."Re-Dispatch" = FALSE)) THEN BEGIN
                ShowEInvoiceIG := TRUE;
            END;
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (Rec."EU 3-Party Trade" = FALSE)) THEN BEGIN
                ShowEInvoiceIC := TRUE;
            END;
        END;
    end;
    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetSecurityFilterOnRespCenter;
    CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetSecurityFilterOnRespCenter;
    CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;


    // prdp 020421 -added code for e-invoice options visibility ++
    ShowEInvoiceIG:=FALSE;
    ShowEInvoiceIC:=FALSE;
    IF "Posting Date" > 033121D THEN BEGIN
      Cust.GET("Sell-to Customer No.");
      IF ((Cust."GST Customer Type"= Cust."GST Customer Type"::Registered) AND ("Re-Dispatch"=FALSE))THEN BEGIN
        ShowEInvoiceIG:=TRUE;
      END;
      IF ((Cust."GST Customer Type"= Cust."GST Customer Type"::Registered) AND ("EU 3-Party Trade"=FALSE))THEN BEGIN
        ShowEInvoiceIC:=TRUE;
      END;
    END;
    // prdp 020421 -added code for e-invoice options visibility --
    */
    //end;
}

