pageextension 50096 "Sales Invoice List" extends "Sales Invoice List"
{

    layout
    {
        // addfirst("Control 1")
        // {
        //     field(Select;Select)
        //     {
        //     }
        // }
        addafter("No.")
        {
            field("Doc No"; Rec."Doc No")
            {
                ApplicationArea = All;
            }
        }
        addafter("Document Date")
        {
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Job Queue Status")
        {
            // field("Amount to Customer";Rec."Amount to Customer")
            // {
            // }
            // field(Amount;Amount)
            // {
            // }
            field("Customer Invoice No."; Rec."Customer Invoice No.")
            {
                ApplicationArea = All;
            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
            }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
            field("GST Amount"; GSTAmt)
            {
                ApplicationArea = All;
            }
            field("Amount Including GST"; Rec.Amount + GSTAmt)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addafter(Preview)
        {
            action("New DscSalesInvoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Dsc Sales Invoice Draft';
                Ellipsis = true;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category10;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    salesHeader: Record "Sales Header";
                begin
                    salesHeader.Reset();
                    salesHeader.SetRange(salesHeader."No.", Rec."No.");
                    Report.RunModal(50117, true, true, salesHeader);
                end;
            }
            action("Sales Invoice Draft")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice GST Draft';
                Ellipsis = true;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category10;
                PromotedIsBig = true;


                trigger OnAction()
                var
                    salesHeader: Record "Sales Header";
                begin
                    salesHeader := Rec;
                    salesHeader.SetRecFilter();
                    Report.RunModal(Report::"Sales Invoice New", true, true, salesHeader);
                end;
            }
            action("Import Sales Invoice")
            {
                Promoted = true;
                //RunObject = XMLport 50000;
            }
            action("Import Sales Invoice New")
            {
                RunObject = XMLport 50023;


            }
            action("Uploaded Entries")
            {
                RunObject = Page "Uploaded Entries"; //nitish
            }
            /*action(Select)
            {
                Image = SelectField;
                Promoted = true;

                trigger OnAction()
                begin

                    // prdp +++
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE("No.", SalesInvHeader."No.");
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

                trigger OnAction()
                begin
                    // prdp +++
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE("No.", SalesInvHeader."No.");
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
            }*/
        }
        addafter("P&osting")
        {
            group(Attach)
            {
                Caption = 'Attach';
                action("Attach File1")
                {
                    Image = Attach;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        RecordLink: Record "Record Link1";
                        FileName: Text[250];
                        ImportFileName: XMLport "Export Contact";//"Attach File";//nitish
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
                    begin

                        // prdp +++
                        ImportFileName.RUN;

                        IF ImportFileName.FILENAME <> '' THEN BEGIN

                            // to get the path of the filename to be copied from client to server
                            //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
                            FileName := DELSTR('\\EAINPNAV004\NAV File Import\' + ImportFileName.FILENAME, 27, 3);
                            // to convert the invoice no. in text format
                            OrderNo := FORMAT(rec."No.");

                            // to get the invoice no. starting from 5th charecter to avoid error due to '\'
                            No := CONVERTSTR(OrderNo, '/', '-');

                            // to get the FinalName of file that is to be copied to server
                            FinalName := COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME), 1, MAXSTRLEN(FinalName));
                            // to get the path of destination folder at server from purchase & payable set up
                            GenLedSetup.RESET;
                            GenLedSetup.GET('');

                            IF GenLedSetup."Sales Inv. Attach. Path" = '' THEN
                                ERROR('please add Sales Inv. Attch. Path in general ledger setup');

                            Destination := GenLedSetup."Sales Inv. Attach. Path" + FinalName;
                            // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

                            // to get the extension of file to be copied
                            Temp := ImportFileName.FILENAME;
                            StartPt := STRPOS(Temp, '.');
                            Length := STRLEN(Temp);
                            Extension := COPYSTR(Temp, StartPt, Length);

                            // to insert the link in record link table
                            RecordLink.RESET;
                            RecordLink."No." := rec."No.";
                            RecordLink.SourcePath := FileName;
                            RecordLink."Attachement Name" := FinalName;
                            RecordLink.URL1 := Destination + Extension;
                            RecordLink.Created := CURRENTDATETIME;
                            RecordLink."User ID" := USERID;
                            RecordLink.Company := COMPANYNAME;
                            RecordLink.INSERT;


                            // to copy the file to server
                            // FILE.COPY(FileName, Destination + Extension);
                            MESSAGE('Attached and Saved to Server');

                        END;


                        // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
                        CLEAR(ImportFileName);

                        // prdp ---
                    end;
                }
                action("Attach File")
                {
                    Image = Attach;
                    Promoted = true;

                    trigger OnAction()
                    var
                        FileName: Text;
                        RecordLink: Record "Record Link1";
                        ImportFileName: XMLport "Export Contact";//"Attach File";//nitish
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
                    begin

                        GenLedSetup.GET('');
                        IF GenLedSetup."Sales Inv. Attach. Path" = '' THEN
                            ERROR('please add Sales Inv. Attach. Path in general ledger setup');
                        Destination := GenLedSetup."Sales Inv. Attach. Path";
                        //Destination:='';
                        // MESSAGE(Destination);

                        // IF UPLOAD('Upload File', '', 'All Files (*.*)|*.*', FileName, Destination) THEN BEGIN

                        //MESSAGE(FileName);

                        RecordLink.RESET;
                        RecordLink."No." := RecordLink."No.";
                        RecordLink.URL1 := Destination;
                        RecordLink."Attachement Name" := DELSTR(Destination, 1, STRLEN(GenLedSetup."Sales Inv. Attach. Path"));
                        RecordLink.Created := CURRENTDATETIME;
                        RecordLink."User ID" := USERID;
                        RecordLink.Company := COMPANYNAME;
                        RecordLink.INSERT;

                        MESSAGE('Attached and Saved to Server');

                    END;
                    // end;
                }
                action("Attach Policy Details")
                {
                    Image = Attach;
                    Promoted = true;

                    trigger OnAction()
                    var
                        RecordLink: Record "Record Link1";
                        FileName: Text[250];
                        ImportFileName: XMLport "Export Contact";// "Attach File";//nitish
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
                    begin

                        // prdp +++


                        RecordLink.RESET;
                        RecordLink.SETRANGE("No.", RecordLink."No.");
                        RecordLink.SETRANGE("Policy Details", TRUE);
                        RecordLink.SETFILTER("Attachement Name", '<>%1', '');
                        IF RecordLink.FINDFIRST THEN BEGIN
                            ERROR('Policy details are already attached for invoice %1', RecordLink."No.");
                        END;

                        ImportFileName.RUN;

                        IF ImportFileName.FILENAME <> '' THEN BEGIN

                            // to get the path of the filename to be copied from client to server
                            //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
                            FileName := DELSTR('\\EAINPNAV004\NAV File Import\' + ImportFileName.FILENAME, 27, 3);
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
                            RecordLink."No." := RecordLink."No.";
                            RecordLink.SourcePath := FileName;
                            RecordLink."Attachement Name" := FinalName;
                            RecordLink.URL1 := Destination + Extension;
                            RecordLink.URL3 := Extension;
                            RecordLink.Created := CURRENTDATETIME;
                            RecordLink."User ID" := USERID;
                            RecordLink.Company := COMPANYNAME;
                            RecordLink."Policy Details" := TRUE;
                            RecordLink.INSERT;


                            // to copy the file to server
                            // FILE.Copy(FileName, Destination + Extension);
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
                    // RunObject = Page 50014;
                    // RunPageLink = No.=FIELD(No.);
                }
                action("Gen Jnl Line Upload")
                {
                    ApplicationArea = All;
                    //RunObject = XMLport 50005;
                }
                action(Currencies)
                {
                    RunObject = Page Currencies;
                    ApplicationArea = All;
                }

            }

        }

    }

    trigger OnClosePage()
    var

    begin
        // prdp +++
        SHeader.RESET;
        SHeader.SETRANGE(SHeader.Select, TRUE);
        IF SHeader.FINDSET THEN
            REPEAT
                SHeader.Select := FALSE;
                SHeader.MODIFY;
            UNTIL SHeader.NEXT = 0;
        // prdp ---
    end;

    trigger OnOpenPage()
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        // SetSecurityFilterOnRespCenter;
        JobQueueActive := SalesSetup.JobQueueActive;

        // prdp +++
        SHeader.RESET;
        SHeader.SETRANGE(SHeader.Select, TRUE);
        IF SHeader.FINDSET THEN
            REPEAT
                SHeader.Select := FALSE;
                SHeader.MODIFY;
            UNTIL SHeader.NEXT = 0;


        SalesInvHeader.RESET;
        SalesInvHeader.SETFILTER("Posting Date", '%1..%2', 20190101D, TODAY);
        SalesInvHeader.SETFILTER("Doc No", '%1', '');
        IF SalesInvHeader.FINDSET THEN
            REPEAT
                SalesInvHeader."Doc No" := SalesInvHeader."No.";
                SalesInvHeader.MODIFY;
            UNTIL SalesInvHeader.NEXT = 0;
        // prdp ---
    end;

    trigger OnAfterGetCurrRecord()
    var
        taxinfo: Codeunit TaxInfo;
        salesLine: Record "Sales Line";

    begin
        Clear(GSTAmt);
        salesLine.Reset();
        salesLine.setrange("Document No.", Rec."No.");
        salesLine.SetRange("Document Type", Rec."Document Type");
        if salesLine.FindFirst() then
            repeat
                initialize();
                taxinfo.GetTaxInfo(salesLine.RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, CGST, SGST, IGSTPer, SGSTPer, CGSTPer);
                GSTAmt := GSTAmt + CGST + IGST + SGST;
            until salesLine.Next() = 0;
    end;

    trigger OnAfterGetRecord()
    var
        taxinfo: Codeunit TaxInfo;
        salesLine: Record "Sales Line";

    begin
        Clear(GSTAmt);
        salesLine.Reset();
        salesLine.setrange("Document No.", Rec."No.");
        salesLine.SetRange("Document Type", Rec."Document Type");
        if salesLine.FindFirst() then
            repeat
                initialize();
                taxinfo.GetTaxInfo(salesLine.RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, CGST, SGST, IGSTPer, SGSTPer, CGSTPer);
                GSTAmt := GSTAmt + CGST + IGST + SGST;
            until salesLine.Next() = 0;
    end;

    local procedure initialize()
    begin
        GSTBaseAmt := 0;
        TDSAmt := 0;
        TDSBaseAmt := 0;
        IGST := 0;
        SGST := 0;
        CGST := 0;
        IGSTPer := 0;
        SGSTPer := 0;
        CGSTPer := 0;

    end;

    var
        SalesInvHeader: Record "Sales Header";
        SHeader: Record "Sales Header";
        GSTAmt: Decimal;
        GSTBaseAmt: Decimal;
        TDSAmt: Decimal;
        TDSBaseAmt: Decimal;
        IGST: Decimal;
        SGST: Decimal;
        CGST: Decimal;
        IGSTPer: Decimal;
        SGSTPer: Decimal;
        CGSTPer: Decimal;
}


