pageextension 50078 "Posted Sales Cr Memo Extn" extends "Posted Sales Credit Memos"
{
    layout
    {
        // Add changes to page layout here
        addafter("No. Printed")
        {
            // field(Select; Rec.Select)
            // {
            // }
            field("Mail Sent"; Rec."Mail Sent")
            {
                ApplicationArea = All;
            }
            field("Doc No"; Rec."Doc No")
            {
                ApplicationArea = All;

            }
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
            field("Customer Invoice No."; Rec."Customer Invoice No.")
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
            action("Print Invoice")
            {
                Promoted = true;
                ApplicationArea = All;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    SalesCrMemoHdr: Record "Sales Cr.Memo Header";
                begin
                    SalesCrMemoHdr.RESET;
                    SalesCrMemoHdr.SETRANGE(SalesCrMemoHdr."No.", rec."No.");
                    REPORT.RUNMODAL(50003, TRUE, TRUE, SalesCrMemoHdr);
                end;
            }
            action(Taxable)
            {
                Caption = 'Taxable';
                ApplicationArea = All;
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //ShowInvoiceTypeDoc("Invoice Type"::Taxable);
                end;
            }
            action("Bill of Supply")
            {
                Caption = 'Bill of Supply';
                ApplicationArea = All;
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //ShowInvoiceTypeDoc("Invoice Type"::"Bill of Supply");
                end;
            }
            action(Export)
            {
                Caption = 'Export';
                Ellipsis = true;
                Image = "Filter";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //ShowInvoiceTypeDoc("Invoice Type"::Export);
                end;
            }
            action(Supplementary)
            {
                Caption = 'Supplementary';
                Ellipsis = true;
                Image = "Filter";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ShowInvoiceTypeDoc("Invoice Type"::Supplementary);
                end;
            }
            action("Debit Note")
            {
                Caption = 'Debit Note';
                ApplicationArea = All;
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ShowInvoiceTypeDoc("Invoice Type"::"Debit Note");
                end;
            }
            action("Non GST")
            {
                Caption = 'Non GST';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //ShowInvoiceTypeDoc("Invoice Type"::"Non-GST");
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
            action("Print Credit Note-GST")
            {
                Promoted = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    // SalesCrMemoHdr.RESET;
                    // SalesCrMemoHdr.SETRANGE(SalesCrMemoHdr."No.", rec."No.");
                    // REPORT.RUNMODAL(50021, TRUE, TRUE, SalesCrMemoHdr);
                end;
            }
            action(Select)
            {
                Image = SelectField;
                ApplicationArea = All;
                Promoted = true;

                trigger OnAction()
                begin

                    // prdp +++
                    //  SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE("No.", rec."No.");
                    // IF SalesInvHeader.FINDFIRST THEN BEGIN
                    //     SalesInvHeader.Select := TRUE;
                    //     SalesInvHeader.MODIFY;
                    // END;
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
                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE("No.", rec."No.");
                    // IF SalesInvHeader.FINDFIRST THEN BEGIN
                    //     SalesInvHeader.Select := FALSE;
                    //     SalesInvHeader.MODIFY;
                    // END;
                    // prdp ---
                end;
            }
            action("Select All")
            {
                Image = SelectEntries;
                ApplicationArea = All;
                Promoted = true;

                trigger OnAction()
                begin
                    // prdp +++
                    IF NOT CONFIRM('Do you want Select all Invoices ?', FALSE)
                      THEN
                        EXIT;

                    // SalesInvHeader.RESET;
                    // SalesInvHeader.COPYFILTERS(Rec);
                    // SalesInvHeader.SETFILTER(SalesInvHeader."No.", '<>%1', '');
                    // IF SalesInvHeader.FINDSET THEN
                    //     REPEAT
                    //         SalesInvHeader.Select := TRUE;
                    //         SalesInvHeader.MODIFY;
                    //     UNTIL SalesInvHeader.NEXT = 0;
                    // prdp ---
                end;
            }
            action("Deselect All")
            {

                // Image = UnApply;
                // Promoted = true;

                // trigger OnAction()
                // begin
                //     // prdp +++
                //     IF NOT CONFIRM('Do you want Deselect all Invoices ?', FALSE)
                //       THEN
                //         EXIT;

                //     SalesInvHeader.RESET;
                //     SalesInvHeader.COPYFILTERS(Rec);
                //     SalesInvHeader.SETRANGE(Select, TRUE);
                //     IF SalesInvHeader.FINDSET THEN
                //         REPEAT
                //             SalesInvHeader.Select := FALSE;
                //             SalesInvHeader.MODIFY;
                //         UNTIL SalesInvHeader.NEXT = 0;
                //     // prdp ---
                // end;
            }
            action("Send To Customer")
            {
                Image = SendAsPDF;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // prdp +++

                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE(Select, TRUE);
                    // IF NOT SalesInvHeader.FINDFIRST THEN BEGIN
                    //     ERROR('No credit note selected for send to customer');
                    // END;

                    IF NOT CONFIRM('Do you want to Send Mail to selected customers ?', FALSE)
                      THEN
                        EXIT;

                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE(Select, TRUE);
                    // IF SalesInvHeader.FINDSET THEN
                    //     REPEAT
                    //         Cust.RESET;
                    //         Cust.SETRANGE("No.", SalesInvHeader."Sell-to Customer No.");
                    //         Cust.SETRANGE("E-Mail", '');
                    //         IF Cust.FINDFIRST THEN BEGIN
                    //             ERROR('Define E-Mail ID for customer %1', Cust."No.");
                    // END;

                    // IF ((SalesInvHeader."Posting Date" > 033121D) AND (SalesInvHeader."GST Customer Type" = SalesInvHeader."GST Customer Type"::Registered)) THEN BEGIN
                    //     EInvEntry.RESET;
                    //     EInvEntry.SETRANGE(EInvEntry."Document Type", EInvEntry."Document Type"::CreditNote);
                    //     EInvEntry.SETRANGE("Document No.", SalesInvHeader."No.");
                    //     EInvEntry.SETRANGE(EInvEntry.Status, EInvEntry.Status::Generated);
                    //     EInvEntry.SETFILTER(IRN, '<>%1', '');
                    //     IF NOT EInvEntry.FINDFIRST THEN BEGIN
                    //         ERROR('IRN must be generate for credit memo %1', SalesInvHeader."No.");
                    //     END;
                    // END;

                    //UNTIL SalesInvHeader.NEXT = 0;


                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE(Select, TRUE);
                    // REPORT.RUNMODAL(50026, FALSE, TRUE, SalesInvHeader);


                    // prdp ---
                end;
            }

            action("Temp Digital Cr Note Export")
            {
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    // prdp +++

                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE(Select, TRUE);
                    // IF NOT SalesInvHeader.FINDFIRST THEN BEGIN
                    //     ERROR('No credit note selected to export');
                    // END;

                    IF NOT CONFIRM('Do you want to export selected digitally signed credit note pdfs ?', FALSE)
                      THEN
                        EXIT;
                    /*
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE(Select,TRUE);
                    IF SalesInvHeader.FINDSET THEN REPEAT
                      Cust.RESET;
                      Cust.SETRANGE("No.",SalesInvHeader."Sell-to Customer No.");
                      Cust.SETRANGE("E-Mail",'');
                      IF Cust.FINDFIRST THEN BEGIN
                        ERROR('Define E-Mail ID for customer %1',Cust."No.");
                      END;
                    UNTIL SalesInvHeader.NEXT = 0;
                    */

                    // SalesInvHeader.RESET;
                    // SalesInvHeader.SETRANGE(Select, TRUE);
                    // REPORT.RUNMODAL(50061, FALSE, TRUE, SalesInvHeader);


                    // prdp ---

                end;
            }
            group(Attachments)
            {
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
                        // RecordLink.SETRANGE("No.", "Pre-Assigned No.");
                        // RecordLink.SETRANGE("Policy Details", TRUE);
                        // RecordLink.SETFILTER("Attachement Name", '<>%1', '');
                        // IF RecordLink.FINDFIRST THEN BEGIN
                        //     ERROR('Policy details are already attached for invoice %1', "Pre-Assigned No.");
                        // END;

                        ImportFileName.RUN;

                        IF ImportFileName.FILENAME <> '' THEN BEGIN

                            // to get the path of the filename to be copied from client to server
                            FileName := DELSTR('\\172.16.5.3\Nav Attachment\' + ImportFileName.FILENAME, 29, 3);
                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');

                            // to convert the invoice no. in text format
                            //  OrderNo := FORMAT("No.");

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
                            // RecordLink.RESET;
                            // RecordLink."No." := "Pre-Assigned No.";
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
                            //FILE.COPY(FileName, Destination + Extension);
                            MESSAGE('Attached and Saved to Server');

                        END;


                        // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
                        CLEAR(ImportFileName);

                        // prdp ---
                    end;
                }
                action("Files Attached")
                {
                    Image = Links;
                    ApplicationArea = All;
                    Promoted = true;
                    RunObject = Page "Attached Files";
                    RunPageLink = "No." = FIELD("Pre-Assigned No.");
                }
            }
            group("E-Invoicing")
            {
                action("Generate IRN")
                {
                    Promoted = true;
                    ApplicationArea = All;
                    Visible = ShowEInvoiceIG;

                    trigger OnAction()
                    begin

                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(Select, TRUE);
                        IF SalesInvHeader.FINDFIRST THEN BEGIN

                            IF NOT CONFIRM('Do you want to Generate IRN for selected credit memos ?', FALSE)
                              THEN
                                EXIT;

                            SCMH.RESET;
                            SCMH.SETRANGE(Select, TRUE);
                            SCMH.SETRANGE("Re-Dispatch", FALSE);
                            SCMH.SETRANGE(SCMH."GST Customer Type", SCMH."GST Customer Type"::Registered);
                            //  SCMH.SETFILTER("Posting Date",'>%1',033121D);
                            IF SCMH.FINDSET THEN
                                REPEAT
                                    SLEEP(5000);
                                    LocationGSTNo := '';
                                    UserIDState := '';
                                    PasswordState := '';

                                    RecLocation.RESET;
                                    RecLocation.SETRANGE(RecLocation.Code, SCMH."Location Code");
                                    IF RecLocation.FINDFIRST THEN BEGIN
                                        LocationGSTNo := RecLocation."GST Registration No.";
                                    END;

                                    REcState.RESET;
                                    REcState.SETRANGE(REcState.Code, SCMH."Location State Code");
                                    IF REcState.FINDFIRST THEN BEGIN
                                        UserIDState := REcState."User Id";
                                        PasswordState := REcState.Password;
                                    END;

                                    IF LocationGSTNo = '' THEN
                                        ERROR('GST Reg No must not be blank for state %1', SCMH."Location State Code");

                                    IF UserIDState = '' THEN
                                        ERROR('User ID must not be blank for state %1', SCMH."Location State Code");

                                    IF PasswordState = '' THEN
                                        ERROR('Password must not be blank for state %1', SCMH."Location State Code");

                                    AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('5B4C01A9FBB84B9FA6F7C3493CF8A4CB', 'A36ABD39GF34FG4592G80F7G0D8688D8DCF8');
                                    RecCodeunitAPI.GenerateIRNForCreditMemoBulk(UserIDState, PasswordState, LocationGSTNo, AuthToken, SCMH);
                                UNTIL SCMH.NEXT = 0;
                        END ELSE BEGIN

                            LocationGSTNo := '';
                            UserIDState := '';
                            PasswordState := '';

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
                            RecCodeunitAPI.GenerateIRNForCreditMemo(UserIDState, PasswordState, LocationGSTNo, AuthToken, Rec);

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
                    Promoted = true;
                    ApplicationArea = All;
                    Visible = ShowEInvoiceIC;

                    trigger OnAction()
                    begin



                        SalesInvHeader.RESET;
                        SalesInvHeader.SETRANGE(Select, TRUE);
                        IF SalesInvHeader.FINDFIRST THEN BEGIN

                            IF NOT CONFIRM('Do you want to Cancel IRN for selected credit memos ?', FALSE)
                              THEN
                                EXIT;

                            SCMH.RESET;
                            SCMH.SETRANGE(Select, TRUE);
                            SCMH.SETRANGE("Re-Dispatch", TRUE);
                            SCMH.SETRANGE("EU 3-Party Trade", FALSE);
                            SCMH.SETRANGE(SCMH."GST Customer Type", SCMH."GST Customer Type"::Registered);
                            //   SCMH.SETFILTER("Posting Date",'>%1',033121D);
                            IF SCMH.FINDSET THEN
                                REPEAT
                                    SLEEP(5000);

                                    LocationGSTNo := '';
                                    UserIDState := '';
                                    PasswordState := '';

                                    RecLocation.RESET;
                                    RecLocation.SETRANGE(RecLocation.Code, SCMH."Location Code");
                                    IF RecLocation.FINDFIRST THEN BEGIN
                                        LocationGSTNo := RecLocation."GST Registration No.";
                                    END;

                                    REcState.RESET;
                                    REcState.SETRANGE(REcState.Code, SCMH."Location State Code");
                                    IF REcState.FINDFIRST THEN BEGIN
                                        UserIDState := REcState."User Id";
                                        PasswordState := REcState.Password;
                                    END;

                                    IF LocationGSTNo = '' THEN
                                        ERROR('GST Reg No must not be blank for state %1', SCMH."Location State Code");

                                    IF UserIDState = '' THEN
                                        ERROR('User ID must not be blank for state %1', SCMH."Location State Code");

                                    IF PasswordState = '' THEN
                                        ERROR('Password must not be blank for state %1', SCMH."Location State Code");

                                    AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('5B4C01A9FBB84B9FA6F7C3493CF8A4CB', 'A36ABD39GF34FG4592G80F7G0D8688D8DCF8');
                                    RecCodeunitAPI.CancelIRNCreditMemoBulk(UserIDState, PasswordState, LocationGSTNo, AuthToken, SCMH);


                                UNTIL SCMH.NEXT = 0;
                        END ELSE BEGIN

                            LocationGSTNo := '';
                            UserIDState := '';
                            PasswordState := '';

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
                            RecCodeunitAPI.CancelIRNCreditMemo(UserIDState, PasswordState, LocationGSTNo, AuthToken, Rec);

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
                    RunObject = Page "E-Invoices Entries";
                    ApplicationArea = All;
                }
                action("E-Invoices Error Log")
                {
                    RunObject = Page "E-Invoice Error Log";
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        DocExchStatusStyle := rec.GetDocExchStatusStyle;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

        // prdp 020421 -added code for e-invoice options visibility ++
        ShowEInvoiceIG := FALSE;
        ShowEInvoiceIC := FALSE;

        IF rec."Posting Date" > 20210331D THEN BEGIN
            Cust.GET(rec."Sell-to Customer No.");
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (rec."Re-Dispatch" = FALSE)) THEN BEGIN
                ShowEInvoiceIG := TRUE;
            END;
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (rec."EU 3-Party Trade" = FALSE)) THEN BEGIN
                ShowEInvoiceIC := TRUE;
            END;
        END;
        // prdp 020421 -added code for e-invoice options visibility --
    end;

    trigger OnAfterGetRecord()
    begin
        DocExchStatusStyle := rec.GetDocExchStatusStyle;
    end;

    // trigger OnClosePage()
    // begin
    //     // prdp +++
    //     SalesInvHeader.RESET;
    //     SalesInvHeader.SETRANGE(SalesInvHeader.Select, TRUE);
    //     IF SalesInvHeader.FINDSET THEN
    //         REPEAT
    //             SalesInvHeader.Select := FALSE;
    //             SalesInvHeader.MODIFY;
    //         UNTIL SalesInvHeader.NEXT = 0;
    //     // prdp ---
    // end;

    // trigger OnOpenPage()
    // begin
    //     rec.SetSecurityFilterOnRespCenter;

    //     // prdp +++
    //     SalesInvHeader.RESET;
    //     SalesInvHeader.SETRANGE(SalesInvHeader.Select, TRUE);
    //     IF SalesInvHeader.FINDSET THEN
    //         REPEAT
    //             SalesInvHeader.Select := FALSE;
    //             SalesInvHeader.MODIFY;
    //         UNTIL SalesInvHeader.NEXT = 0;

    //     SalesInvHeader.RESET;
    //     SalesInvHeader.SETFILTER("Posting Date", '%1..%2', 20190101D, TODAY);
    //     SalesInvHeader.SETFILTER("Doc No", '%1', '');
    //     IF SalesInvHeader.FINDSET THEN
    //         REPEAT
    //             SalesInvHeader."Doc No" := SalesInvHeader."No.";
    //             SalesInvHeader.MODIFY;
    //         UNTIL SalesInvHeader.NEXT = 0;
    //     // prdp ---
    // end;

    var

        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        DocExchStatusStyle: Text;
        SalesInvHeader: Record "Sales Cr.Memo Header";
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
        SCMH: Record 114;
        EInvEntry: Record "E-Invoice Ledger Entries";

    local procedure ShowInvoiceTypeDoc(InvoiceType: Option Taxable,"Bill of Supply",Export,Supplementary,"Debit Notes")
    var
        SalesInvHeader: Record "Sales Cr.Memo Header";
    begin
        rec.SETRANGE(rec."Invoice Type", InvoiceType);
        IF rec.FINDSET THEN
            PAGE.RUN(PAGE::"Posted Sales Credit Memos", Rec);
    end;
}