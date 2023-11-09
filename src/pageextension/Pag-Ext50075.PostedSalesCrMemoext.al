pageextension 50075 "Posted Sales Cr Memo ext" extends "Posted Sales Credit Memo"
{
    layout
    {
        // Add changes to page layout here

        addlast(General)
        {
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
            field("Customer Invoice No."; Rec."Customer Invoice No.")
            {
                ApplicationArea = All;
            }
            field("Reference Invoice Number"; Rec."Reference Invoice Number")
            {
                ApplicationArea = All;
            }
            field("EA Transaction Type"; Rec."EA Transaction Type")
            {
                ApplicationArea = All;
            }
        }
        //Richa
        /*

        addlast("Foreign Trade")
        {
            group("Tax Information")
            {
                Caption = 'Tax Information';
                group(GST)
                {
                
                    field("Location State Code"; Rec."Location State Code")
                    {
                    }
                    field("Nature of Supply"; Rec."Nature of Supply")
                    {
                    }
                    field("GST Without Payment of Duty"; Rec."GST Without Payment of Duty")
                    {
                    }
                    field("Invoice Type"; Rec."Invoice Type")
                    {
                    }
                    field("Bill Of Export No."; Rec."Bill Of Export No.")
                    {
                    }
                    field("Bill Of Export Date"; Rec."Bill Of Export Date")
                    {
                    }
                    field("e-Commerce Customer"; Rec."e-Commerce Customer")
                    {
                    }
                    field("e-Commerce Merchant Id"; Rec."e-Commerce Merchant Id")
                    {
                    }
                }
            }
        }
        */

    }

    actions
    {
        modify("Generate IRN")
        {
            Visible = false;
        }
        modify("Generate E-Invoice")
        {
            Visible = false;
        }
        modify("Import E-Invoice Response")
        {
            Visible = false;
        }
        // Add changes to page actions here
        addlast(processing)
        {
            group(Attachments)
            {
                action("Attach Policy Details")
                {
                    Image = Attach;
                    Promoted = true;
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        RecordLink: Record "Record Link1";
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


                        RecordLink.RESET;
                        RecordLink.SETRANGE("No.", Rec."Pre-Assigned No.");
                        RecordLink.SETRANGE("Policy Details", TRUE);
                        RecordLink.SETFILTER("Attachement Name", '<>%1', '');
                        IF RecordLink.FINDFIRST THEN BEGIN
                            ERROR('Policy details are already attached for invoice %1', Rec."Pre-Assigned No.");
                        END;

                        ImportFileName.RUN;

                        IF ImportFileName.FILENAME <> '' THEN BEGIN

                            // to get the path of the filename to be copied from client to server
                            FileName := DELSTR('\\172.16.5.3\Nav Attachment\' + ImportFileName.FILENAME, 29, 3);
                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');

                            // to convert the invoice no. in text format
                            OrderNo := FORMAT(Rec."No.");

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
                            RecordLink."No." := Rec."Pre-Assigned No.";
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
                            //FILE.COPY(FileName,Destination+Extension);naveen
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
                    ApplicationArea = all;
                    Promoted = true;
                    RunObject = Page 50014;
                    RunPageLink = "No." = FIELD("Pre-Assigned No.");
                }
            }
            group("E-Invoicing")
            {
                action("Generate-IRN")
                {
                    Promoted = true;
                    ApplicationArea = all;
                    Visible = ShowEInvoiceIG;

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

                        AuthToken := 'Bearer ' + RecCodeunitAPI.GenerateAuthToken('5B4C01A9FBB84B9FA6F7C3493CF8A4CB', 'A36ABD39GF34FG4592G80F7G0D8688D8DCF8');
                        RecCodeunitAPI.GenerateIRNForCreditMemo(UserIDState, PasswordState, LocationGSTNo, AuthToken, Rec);
                    end;
                }
                action("Cancel IRN")
                {
                    Promoted = true;
                    Visible = ShowEInvoiceIC;
                    ApplicationArea = all;

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


                        UserIDState := '';
                        PasswordState := '';
                        LocationGSTNo := '';

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
                        RecCodeunitAPI.CancelIRNCreditMemo(UserIDState, PasswordState, LocationGSTNo, AuthToken, Rec);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        IncomingDocument: Record 130;
    begin
        HasIncomingDocument := IncomingDocument.PostedDocExists(Rec."No.", Rec."Posting Date");
        DocExchStatusStyle := Rec.GetDocExchStatusStyle;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnAfterGetRecord()
    begin
        DocExchStatusStyle := Rec.GetDocExchStatusStyle;
    end;

    trigger OnOpenPage()
    begin


        // prdp 020421 -added code for e-invoice options visibility ++
        ShowEInvoiceIG := FALSE;
        ShowEInvoiceIC := FALSE;
        IF Rec."Posting Date" > 20210301D THEN BEGIN
            Cust.GET(Rec."Sell-to Customer No.");
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (Rec."Re-Dispatch" = FALSE)) THEN BEGIN
                ShowEInvoiceIG := TRUE;
            END;
            IF ((Cust."GST Customer Type" = Cust."GST Customer Type"::Registered) AND (Rec."EU 3-Party Trade" = FALSE)) THEN BEGIN
                ShowEInvoiceIC := TRUE;
            END;
        END;
        // prdp 020421 -added code for e-invoice options visibility --
    end;


    var
        DocExchStatusStyle: Text;
        SalesCrMemoHdr: Record 114;
        AuthToken: Text;
        RecCodeunitAPI: Codeunit 50016;
        RecLocation: Record 14;
        REcState: Record State;
        LocationGSTNo: Code[30];
        UserIDState: Text;
        PasswordState: Text;
        RecELE: Record 50020;
        ShowEInvoiceIG: Boolean;
        ShowEInvoiceIC: Boolean;
        Cust: Record 18;
        HasIncomingDocument: Boolean;
}