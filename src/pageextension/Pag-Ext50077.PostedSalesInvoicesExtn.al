pageextension 50077 "Posted Sales Invoices Extn" extends "Posted Sales Invoices"
{

    layout
    {
        // Add changes to page layout here
        addafter(Corrective)
        {
            // field(Select; Rec.Select)
            // {
            //     ApplicationArea = All;
            // }
            field("Mail Sent"; Rec."Mail Sent")
            {
                ApplicationArea = All;
            }
            field(DS; Rec.DS)
            {
                ApplicationArea = All;
                Caption = 'Digital Signature';
            }
            field("Doc No"; Rec."Doc No")
            {
                ApplicationArea = All;
            }
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
            field("Debit Note"; Rec."Debit Note")
            {
                Editable = false;
                HideValue = false;
                ApplicationArea = All;
            }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Customer Invoice No."; Rec."Customer Invoice No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
            //Richa
            /*
            field("Invoice Type";Rec."Invoice Type")
            {
            }
            field("External Document No.";Rec."External Document No.")
            {
                Editable = false;
            }
            */
            field("IRN Generated"; Rec."Re-Dispatch")
            {
                Caption = 'IRN Generated';
                ApplicationArea = All;
            }
            field("IRN Cancelled"; Rec."EU 3-Party Trade")
            {
                Caption = 'IRN Cancelled';
                ApplicationArea = All;
            }

        }
        addafter(Amount)
        {
            field("GST Amt"; Rec."GST Amt")
            {
                ApplicationArea = All;

            }
            field("Amount Including GST"; Rec.Amount + Rec."GST Amt")
            {
                ApplicationArea = All;
            }
        }
    }



    actions
    {

        // Add changes to page actions here
        addlast(processing)
        {
            action("Print GST Invoice")
            {
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.RESET;
                    SalesInvHdr.SETRANGE(SalesInvHdr."No.", rec."No.");
                    REPORT.RUNMODAL(50022, TRUE, TRUE, SalesInvHdr);
                end;
            }
            action("DSC Invoice New")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.RESET;
                    SalesInvHdr.SETRANGE(SalesInvHdr."No.", rec."No.");
                    REPORT.RUNMODAL(50030, TRUE, TRUE, SalesInvHdr);
                end;
            }
            action("Print Sales Invoice")
            {
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.RESET;
                    SalesInvHdr.SETRANGE(SalesInvHdr."No.", rec."No.");
                    REPORT.RUNMODAL(50002, TRUE, TRUE, SalesInvHdr);
                end;
            }
            action(Taxable)
            {
                Caption = 'Taxable';
                ApplicationArea = All;
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ShowInvoiceTypeDoc(Rec."Invoice Type"::Taxable);
                end;
            }
            action("Bill of Supply")
            {
                Caption = 'Bill of Supply';
                ApplicationArea = All;
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ShowInvoiceTypeDoc(Rec."Invoice Type"::"Bill of Supply");
                end;
            }
            action(Export)
            {
                Caption = 'Export';
                Ellipsis = true;
                ApplicationArea = All;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ShowInvoiceTypeDoc(Rec."Invoice Type"::Export);
                end;
            }
            action(Supplementary)
            {
                Caption = 'Supplementary';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ShowInvoiceTypeDoc(Rec."Invoice Type"::Supplementary);
                end;
            }
            //Richa
            /*
            action("Debit Note")
            {
                Caption = 'Debit Note';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ShowInvoiceTypeDoc("Invoice Type"::"Debit Note");
                end;
            }
            */
            action("Non GST")
            {
                Caption = 'Non GST';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ShowInvoiceTypeDoc(Rec."Invoice Type"::"Non-GST");
                end;
            }
            action("Print Voucher")
            {
                Caption = 'Print Voucher';
                Ellipsis = true;
                ApplicationArea = All;
                Image = PrintVoucher;
                Promoted = true;

                trigger OnAction()
                var
                    GLEntry: Record "G/L Entry";
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date");
                    GLEntry.SETRANGE("Document No.", rec."No.");
                    GLEntry.SETRANGE("Posting Date", rec."Posting Date");
                    IF GLEntry.FINDFIRST THEN
                        REPORT.RUNMODAL(REPORT::"Posted Voucher", TRUE, TRUE, GLEntry);
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
                                SalesInvHeader.Modify();
                                //UpdateSalesInvHdr.UpdateSalesInvoiceHeader(SalesInvHeader);
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
            //Richa

            action(Select)
            {
                Image = SelectField;
                Promoted = true;

                trigger OnAction()
                begin

                    // prdp +++
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE("No.", rec."No.");
                    IF SalesInvHeader.FINDFIRST THEN BEGIN
                        SalesInvHeader.Select := TRUE;
                        SalesInvHeader.MODIFY;
                    END;
                    // prdp ---
                end;
            }

            action(Deselct)
            {
                Image = CancelLine;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // prdp +++
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE("No.", rec."No.");
                    IF SalesInvHeader.FINDFIRST THEN BEGIN
                        SalesInvHeader.Select := FALSE;
                        SalesInvHeader.MODIFY;
                    END;
                    // prdp ---
                end;
            }
            action("Select All")
            {
                Image = SelectEntries;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // prdp +++
                    IF NOT CONFIRM('Do you want Select all Invoices ?', FALSE)
                      THEN
                        EXIT;

                    SalesInvHeader.RESET;
                    SalesInvHeader.COPYFILTERS(Rec);
                    SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', '');
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            SalesInvHeader.Select := TRUE;
                            SalesInvHeader.MODIFY;
                        UNTIL SalesInvHeader.NEXT = 0;
                    // prdp ---
                end;
            }
            action("Deselect All")
            {
                Image = UnApply;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // prdp +++
                    IF NOT CONFIRM('Do you want Deselect all Invoices ?', FALSE)
                      THEN
                        EXIT;

                    SalesInvHeader.RESET;
                    SalesInvHeader.COPYFILTERS(Rec);
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            SalesInvHeader.Select := FALSE;
                            SalesInvHeader.MODIFY;
                        UNTIL SalesInvHeader.NEXT = 0;
                    // prdp ---
                end;
            }
            action("Send To Customer New")
            {
                Image = SendAsPDF;
                Promoted = true;
                Visible = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    cust: Record Customer;
                begin
                    // prdp +++

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF NOT SalesInvHeader.FINDFIRST THEN BEGIN
                        ERROR('No invoice selected for send to customer');
                    END;

                    IF NOT CONFIRM('Do you want to Send Mail to selected customers ?', FALSE)
                      THEN
                        EXIT;



                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            Cust.RESET;
                            Cust.SETRANGE("No.", SalesInvHeader."Sell-to Customer No.");
                            Cust.SETRANGE("E-Mail", '');
                            IF Cust.FINDFIRST THEN BEGIN
                                ERROR('Define E-Mail ID for customer %1', Cust."No.");
                            END;
                        //Richa
                        /*
                        IF ((SalesInvHeader."Posting Date" > 033121D) AND (SalesInvHeader."GST Customer Type"=SalesInvHeader."GST Customer Type"::Registered)) THEN BEGIN
                        EInvEntry.RESET;
                        EInvEntry.SETRANGE(EInvEntry."Document Type",EInvEntry."Document Type"::Invoice);
                        EInvEntry.SETRANGE("Document No.",SalesInvHeader."No.");
                        EInvEntry.SETRANGE(EInvEntry.Status,EInvEntry.Status::Generated);
                        EInvEntry.SETFILTER(IRN,'<>%1','');
                        IF NOT EInvEntry.FINDFIRST THEN BEGIN
                          ERROR('IRN must be generate for invoice %1',SalesInvHeader."No.");
                        END;
                        END;
                        */
                        UNTIL SalesInvHeader.NEXT = 0;


                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    REPORT.RUNMODAL(50031, FALSE, FALSE, SalesInvHeader);


                    // prdp ---
                end;
            }
            action("Send To Customer Old")
            {
                Image = SendAsPDF;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    cust: Record Customer;
                begin
                    // prdp +++

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF NOT SalesInvHeader.FINDFIRST THEN BEGIN
                        ERROR('No invoice selected for send to customer');
                    END;

                    IF NOT CONFIRM('Do you want to Send Mail to selected customers ?', FALSE)
                      THEN
                        EXIT;

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            Cust.RESET;
                            Cust.SETRANGE("No.", SalesInvHeader."Sell-to Customer No.");
                            Cust.SETRANGE("E-Mail", '');
                            IF Cust.FINDFIRST THEN BEGIN
                                ERROR('Define E-Mail ID for customer %1', Cust."No.");
                            END;
                        //Richa
                        /*
                        IF ((SalesInvHeader."Posting Date" > 033121D) AND (SalesInvHeader."GST Customer Type"=SalesInvHeader."GST Customer Type"::Registered)) THEN BEGIN
                        EInvEntry.RESET;
                        EInvEntry.SETRANGE(EInvEntry."Document Type",EInvEntry."Document Type"::Invoice);
                        EInvEntry.SETRANGE("Document No.",SalesInvHeader."No.");
                        EInvEntry.SETRANGE(EInvEntry.Status,EInvEntry.Status::Generated);
                        EInvEntry.SETFILTER(IRN,'<>%1','');
                        IF NOT EInvEntry.FINDFIRST THEN BEGIN
                          ERROR('IRN must be generate for invoice %1',SalesInvHeader."No.");
                        END;
                        END;
                        */
                        UNTIL SalesInvHeader.NEXT = 0;


                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    REPORT.RUNMODAL(50025, FALSE, FALSE, SalesInvHeader);


                    // prdp ---
                end;
            }
            action("Temp Digital Invoice Export")
            {
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // prdp +++

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF NOT SalesInvHeader.FINDFIRST THEN BEGIN
                        ERROR('No invoice selected for export pdf');
                    END;

                    IF NOT CONFIRM('Do you want to export digitally signed pdfs for selected invoices ?', FALSE)
                      THEN
                        EXIT;


                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    REPORT.RUNMODAL(50060, FALSE, FALSE, SalesInvHeader);

                    // prdp ---
                end;
            }

            // group(Attachments)//nit

            // {
            action("Files Attached")
            {
                Image = Links;
                ApplicationArea = All;
                Promoted = true;
                // RunObject = Page 50014;
                //RunPageLink = "No." = FIELD("Pre-Assigned No.");  //Richa
            }
            action("Attach Policy Details")
            {
                Image = Attach;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    RecordLink: Record 2000000068;
                    FileName: Text[250];
                    ImportFileName: XMLport 50012;
                    OrderNo: Code[30];
                    No: Text[250];
                    TimeStamp: Text[100];
                    FinalName: Text[250];
                    Timer: Text[100];
                    Timer1: Text[100];
                    Source: Text[250];
                    Destination: Text[250];
                    ActiveSession: Record 2000000110;
                    User: Record 2000000120;
                    UserPath: Text[250];
                    UserName: Text[100];
                    ActSession: Record 2000000110;
                    GenLedSetup: Record 98;
                    Extension: Text[100];
                    Length: Integer;
                    StartPt: Integer;
                    Temp: Text[250];
                    FileManagement: Codeunit 419;
                begin

                    // prdp +++


                    // RecordLink.RESET;
                    // RecordLink.SETRANGE("No.", rec."Pre-Assigned No.");
                    // RecordLink.SETRANGE("Policy Details", TRUE);
                    // RecordLink.SETFILTER("Attachement Name", '<>%1', '');
                    // IF RecordLink.FINDFIRST THEN BEGIN
                    //     ERROR('Policy details are already attached for invoice %1', rec."Pre-Assigned No.");
                    // END;

                    ImportFileName.RUN;

                    IF ImportFileName.FILENAME <> '' THEN BEGIN

                        // to get the path of the filename to be copied from client to server
                        FileName := DELSTR('\\172.16.5.3\Nav Attachment\' + ImportFileName.FILENAME, 29, 3);
                        //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');

                        // to convert the invoice no. in text format
                        OrderNo := FORMAT(rec."No.");

                        // to get the invoice no. starting from 5th charecter to avoid error due to '\'
                        No := CONVERTSTR(OrderNo, '/', '-');

                        // to get the FinalName of file that is to be copied to server
                        FinalName := COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME), 1, MAXSTRLEN(FinalName));
                        // to get the path of destination folder at server from purchase & payable set up
                        GenLedSetup.RESET;
                        GenLedSetup.GET('');

                        IF GenLedSetup."Policy Details Attachment" = '' THEN
                            ERROR('please add Policy Details Attachment Path in general ledger setup');

                        Destination := GenLedSetup."Policy Details Attachment" + FinalName;
                        // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

                        // to get the extension of file to be copied
                        Temp := ImportFileName.FILENAME;
                        StartPt := STRPOS(Temp, '.');
                        Length := STRLEN(Temp);
                        Extension := COPYSTR(Temp, StartPt, Length);

                        // to insert the link in record link table
                        RecordLink.RESET;
                        // RecordLink."No." := rec."Pre-Assigned No.";
                        // RecordLink.SourcerPath := FileName;
                        // RecordLink."Attachement Name" := FinalName;
                        // RecordLink.URL1 := Destination + Extension;
                        // RecordLink.URL3 := Extension;
                        // RecordLink.Created := CURRENTDATETIME;
                        // RecordLink."User ID" := USERID;
                        // RecordLink.Company := COMPANYNAME;
                        // RecordLink."Policy Details" := TRUE;
                        // RecordLink.INSERT;


                        // to copy the file to server
                        //  FILE.COPY(FileName, Destination + Extension);
                        MESSAGE('Attached and Saved to Server');

                    END;


                    // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
                    CLEAR(ImportFileName);

                    // prdp ---
                end;
            }
            action(GSTB2BSales)
            {
                RunObject = Report 50080;
                ApplicationArea = All;
            }
            //}


            // group("E-Invoicing")
            // {
            //Richa


        }
        addlast("&Invoice")
        {
            action("Generate-IRN")
            {
                //Promoted = true;
                Visible = ShowEInvoiceIG;
                ApplicationArea = All;

                trigger OnAction()
                var
                    AuthToken: Text;
                begin

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF SalesInvHeader.FINDFIRST THEN BEGIN

                        IF NOT CONFIRM('Do you want to Generate IRN for selected invoices ?', FALSE)
                          THEN
                            EXIT;

                        SIH.RESET;
                        SIH.SETRANGE(Select, TRUE);
                        SIH.SETRANGE("Re-Dispatch", FALSE);
                        SIH.SETRANGE(Canceled, FALSE);
                        SIH.SETRANGE(SIH."GST Customer Type", SIH."GST Customer Type"::Registered);
                        SIH.SETFILTER("Posting Date", '>%1', 20210331D);
                        IF SIH.FINDSET THEN
                            REPEAT

                                UserIDState := '';
                                PasswordState := '';
                                LocationGSTNo := '';

                                SLEEP(5000);
                                RecLocation.RESET;
                                RecLocation.SETRANGE(RecLocation.Code, SIH."Location Code");
                                IF RecLocation.FINDFIRST THEN BEGIN
                                    LocationGSTNo := RecLocation."GST Registration No.";
                                END;

                                REcState.RESET;
                                REcState.SETRANGE(REcState.Code, SIH."Location State Code");
                                IF REcState.FINDFIRST THEN BEGIN
                                    UserIDState := REcState."User Id";
                                    PasswordState := REcState.Password;

                                END;

                                IF LocationGSTNo = '' THEN
                                    ERROR('GST Reg No must not be blank for state %1', SIH."Location State Code");

                                IF UserIDState = '' THEN
                                    ERROR('User ID must not be blank for state %1', SIH."Location State Code");

                                IF PasswordState = '' THEN
                                    ERROR('Password must not be blank for state %1', SIH."Location State Code");

                                AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('5B4C01A9FBB84B9FA6F7C3493CF8A4CB', 'A36ABD39GF34FG4592G80F7G0D8688D8DCF8');
                                RecCodeunitAPI.GenerateIRNBulk(UserIDState, PasswordState, LocationGSTNo, AuthToken, SIH);

                            UNTIL SIH.NEXT = 0;

                        MESSAGE('IRN Generation process completed.');


                    END ELSE BEGIN

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
                        RecCodeunitAPI.GenerateIRN(UserIDState, PasswordState, LocationGSTNo, AuthToken, Rec);

                    END;

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            SalesInvHeader.Select := FALSE;
                            SalesInvHeader.MODIFY;
                        UNTIL SalesInvHeader.NEXT = 0;
                end;
            }

            action("Cancel IRN")
            {
                // Promoted = true;
                ApplicationArea = All;
                Visible = ShowEInvoiceIC;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                Ellipsis = true;


                trigger OnAction()
                var
                    AuthToken: Text;
                begin

                    //Added code for BE Live
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF SalesInvHeader.FINDFIRST THEN BEGIN

                        IF NOT CONFIRM('Do you want to Cancel IRN for selected invoices ?', FALSE)
                          THEN
                            EXIT;

                        SIH.RESET;
                        SIH.SETRANGE(Select, TRUE);
                        SIH.SETRANGE("Re-Dispatch", TRUE);
                        SIH.SETRANGE("EU 3-Party Trade", FALSE);
                        SIH.SETRANGE(SIH."GST Customer Type", SIH."GST Customer Type"::Registered);
                        SIH.SETFILTER("Posting Date", '>%1', 20210331D);
                        IF SIH.FINDSET THEN
                            REPEAT

                                UserIDState := '';
                                PasswordState := '';
                                LocationGSTNo := '';

                                SLEEP(5000);
                                RecLocation.RESET;
                                RecLocation.SETRANGE(RecLocation.Code, SIH."Location Code");
                                IF RecLocation.FINDFIRST THEN BEGIN
                                    LocationGSTNo := RecLocation."GST Registration No.";
                                END;

                                REcState.RESET;
                                REcState.SETRANGE(REcState.Code, SIH."Location State Code");
                                IF REcState.FINDFIRST THEN BEGIN
                                    UserIDState := REcState."User Id";
                                    PasswordState := REcState.Password;
                                END;

                                IF LocationGSTNo = '' THEN
                                    ERROR('GST Reg No must not be blank for state %1', SIH."Location State Code");

                                IF UserIDState = '' THEN
                                    ERROR('User ID must not be blank for state %1', SIH."Location State Code");

                                IF PasswordState = '' THEN
                                    ERROR('Password must not be blank for state %1', SIH."Location State Code");

                                AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('5B4C01A9FBB84B9FA6F7C3493CF8A4CB', 'A36ABD39GF34FG4592G80F7G0D8688D8DCF8');
                                RecCodeunitAPI.CancelIRNBulk(UserIDState, PasswordState, LocationGSTNo, AuthToken, SIH);

                            UNTIL SIH.NEXT = 0;
                        MESSAGE('IRN Cancellation process completed.');
                    END ELSE BEGIN

                        UserIDState := '';
                        PasswordState := '';
                        LocationGSTNo := '';

                        SLEEP(5000);
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


                    END;

                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select, TRUE);
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            SalesInvHeader.Select := FALSE;
                            SalesInvHeader.MODIFY;
                        UNTIL SalesInvHeader.NEXT = 0;
                end;

            }
            action("E-Invoices Entries")
            {
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                Ellipsis = true;
                ApplicationArea = All;
                //  RunObject = Page 50038;
            }
            action("E-Invoices Error Log")
            {
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                Ellipsis = true;
                ApplicationArea = All;
                //  RunObject = Page 50037;
            }
            // action("Import IRN Details")
            // {
            //     ApplicationArea = All;
            //     RunObject = XMLport 50039;
            // }    


        }
    }
    trigger OnAfterGetCurrRecord()
    var
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
    begin
        Clear(Rec."GST Amt");
        DocExchStatusStyle := Rec.GetDocExchStatusStyle;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

        // prdp 020421 -added code for e-invoice options visibility ++
        ShowEInvoiceIG := FALSE;
        ShowEInvoiceIC := FALSE;

        IF Rec."Posting Date" > 20210331D THEN BEGIN
            Cust.GET(Rec."Sell-to Customer No.");
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (Rec."Re-Dispatch" = FALSE)) THEN BEGIN
                ShowEInvoiceIG := TRUE;
            END;
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (Rec."EU 3-Party Trade" = FALSE)) THEN BEGIN
                ShowEInvoiceIC := TRUE;
            END;
        END;
        // prdp 020421 -added code for e-invoice options visibility --
        DetailedGSTLedgerEntry.RESET;
        DetailedGSTLedgerEntry.SETRANGE("Document No.", Rec."No.");
        // DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
        //DetailedGSTLedgerEntry.SETRANGE("GST Group Code", "GST Group Code");
        DetailedGSTLedgerEntry.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry."Transaction Type"::Sales);
        //DetailedGSTLedgerEntry.SETRANGE("GST Component Code", 'CGST');
        if DetailedGSTLedgerEntry.FindSet() then begin
            repeat
                Rec."GST Amt" += -1 * DetailedGSTLedgerEntry."GST Amount";
            until DetailedGSTLedgerEntry.Next() = 0;

        end;
        if Rec."Currency Code" <> '' then begin
            Rec."GST Amt" := rec."GST Amt" * Rec."Currency Factor";
        end;
    end;


    trigger OnAfterGetRecord()
    var
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
    begin
        Clear(Rec."GST Amt");
        DocExchStatusStyle := Rec.GetDocExchStatusStyle;
        DetailedGSTLedgerEntry.RESET;
        DetailedGSTLedgerEntry.SETRANGE("Document No.", Rec."No.");

        DetailedGSTLedgerEntry.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry."Transaction Type"::Sales);
        if DetailedGSTLedgerEntry.FindSet() then begin
            repeat
                Rec."GST Amt" += -1 * DetailedGSTLedgerEntry."GST Amount";
            until DetailedGSTLedgerEntry.Next() = 0;

        end;
        if Rec."Currency Code" <> '' then begin
            Rec."GST Amt" := rec."GST Amt" * Rec."Currency Factor";
        end;
    end;

    local procedure ShowInvoiceTypeDoc(InvoiceType: enum "Sales Invoice Type")
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        SalesInvHeader.SETRANGE("Invoice Type", InvoiceType);
        IF SalesInvHeader.FINDSET THEN
            PAGE.RUN(PAGE::"Posted Sales Invoices", Rec);
    end;

    var
        myInt: Integer;
        Cust: Record Customer;
        DocExchStatusStyle: Text;
        SalesInvHeader: Record "Sales Invoice Header";
        SIH: Record "Sales Invoice Header";
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
}