pageextension 50070 "Sales Inv Extn" extends "Sales Invoice"
{
    layout
    {
        addbefore("Work Description")
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = all;
                MultiLine = true;
            }
        }
        // Add changes to page layout here

        addlast(general)
        {
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
                Editable = true;
            }
            field("Customer Invoice No."; Rec."Customer Invoice No.")
            {
                ApplicationArea = All;
            }
            field("Invoice Date"; Rec."Invoice Date")
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
            field("Debit Note"; Rec."Debit Note")
            {
                ApplicationArea = All;
            }
            field("EA Transaction Type"; Rec."EA Transaction Type")
            {
                ApplicationArea = All;
            }
            // group(GST)
            // {
            //     Caption = 'GST';
            //     field("GST Bill-to State Code";Rec."GST Bill-to State Code")
            //     {
            //     }
            //     field("GST Ship-to State Code";Rec."GST Ship-to State Code")
            //     {
            //     }
            //     field("Location State Code";Rec."Location State Code")
            //     {
            //     }
            //     field("Nature of Supply";Rec."Nature of Supply")
            //     {
            //     }
            //     field("GST Customer Type";Rec."GST Customer Type")
            //     {
            //     }
            //     field("GST Without Payment of Duty";Rec."GST Without Payment of Duty")
            //     {
            //     }
            //     field("Invoice Type";Rec."Invoice Type")
            //     {
            //     }
            //     field("Bill Of Export No.";Rec."Bill Of Export No.")
            //     {
            //     }
            //     field("Bill Of Export Date";Rec."Bill Of Export Date")
            //     {
            //     }
            //     field("e-Commerce Customer";Rec."e-Commerce Customer")
            //     {
            //     }
            //     field("e-Commerce Merchant Id";Rec."e-Commerce Merchant Id")
            //     {
            //     }
            // }
        }

    }

    actions
    {
        // Add changes to page actions here
        addafter("Co&mments")
        {
            action("Detailed GST")
            {
                Caption = 'Detailed GST';
                ApplicationArea = All;
                Image = ServiceTax;
                RunObject = Page "Detailed GST Entry Buffer";
                RunPageLink = "Transaction Type" = FILTER(Sales),
                                  "Document Type" = FIELD("Document Type"),
                                  "Document No." = FIELD("No.");
            }
        }

        addafter(Delegate)
        {
            action(Comments)
            {
                Caption = 'Comments';
                Image = ViewComments;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Category4;
                RunObject = Page "Approval Comments";
                RunPageLink = "Table ID" = CONST(36),
                                  "Document Type" = FIELD("Document Type"),
                                  "Document No." = FIELD("No.");
                // Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //  ApprovalsMgmt.GetApprovalComment(Rec);
                end;
            }
        }

        modify(Post)
        {
            trigger OnBeforeAction()
            var
                IntDocNo: Code[30];
            begin
                IntDocNo := rec."Integration Doc No";

                // prdp 210820 ++
                IF Rec."Invoice Date" = 0D THEN BEGIN
                    ERROR('Please select Invoice Date');
                END;
                IF Rec."EA Transaction Type" = 0 THEN BEGIN
                    ERROR('Please select EA Transaction Type');
                END;
                // prdp 210820 --

                // CCIT-19012022
                RecSalesLine.RESET;
                RecSalesLine.SETRANGE(RecSalesLine."Document No.", Rec."No.");
                RecSalesLine.SetFilter("No.", '<>%1');
                IF RecSalesLine.FINDSET THEN
                    REPEAT
                        IF RecSalesLine."Policy Month" = 0D THEN
                            ERROR('Line No. : %1 And No. : %2 Policy Month is Blank.', RecSalesLine."Line No.", RecSalesLine."No.");
                    UNTIL RecSalesLine.NEXT = 0;
                RawData.RESET;
                RawData.SETRANGE(RawData."Integration Doc No", IntDocNo);
                IF RawData.FINDSET THEN
                    REPEAT
                        RawData.Status := 2;
                        RawData.MODIFY;
                    UNTIL RawData.NEXT = 0;
                //CCIT-19012022
            end;

        }
        addlast("P&osting")
        {

            //     action(Posts)
            //     {
            //         Caption = 'P&ost';
            //         Image = PostOrder;
            //         Promoted = true;
            //         PromotedCategory = Category6;
            //         ApplicationArea = All;
            //         PromotedIsBig = true;
            //         ShortCutKey = 'F9';

            //         trigger OnAction()
            //         var
            //             IntDocNo: Code[30];
            //         begin
            //             IntDocNo  := rec."Integration Doc No" ;

            //             // prdp 210820 ++
            //               IF Rec."Invoice Date" =0D THEN BEGIN
            //                 ERROR('Please select Invoice Date');
            //               END;
            //               IF rec."EA Transaction Type" = 0 THEN BEGIN
            //                 ERROR('Please select EA Transaction Type');
            //               END;
            //            // prdp 210820 --

            //            // CCIT-19012022
            //             RecSalesLine.RESET;
            //             RecSalesLine.SETRANGE(RecSalesLine."Document No.",Rec."No.");
            //             IF RecSalesLine.FINDSET THEN
            //                REPEAT
            //                   IF RecSalesLine."Policy Month" = 0D THEN
            //                      ERROR('Line No. : %1 And No. : %2 Policy Month is Blank.',RecSalesLine."Line No.",RecSalesLine."No.");
            //                UNTIL RecSalesLine.NEXT=0;
            //             //CCIT-19012022

            //             Post(CODEUNIT::"Sales-Post (Yes/No)");
            //             //added code to modify the status of raw data to posted ++
            //             RawData.RESET;
            //             RawData.SETRANGE(RawData."Integration Doc No",IntDocNo);
            //             IF RawData.FINDSET THEN REPEAT
            //             RawData.Status := 2;
            //             RawData.MODIFY ;
            //             UNTIL RawData.NEXT = 0 ;
            //            // added code to modify the status of raw data to posted --
            //         end;
            //     }

        }
        addlast(Action9)
        {
            //Caption = 'Attach';
            action("Attach File1")
            {
                Image = Attach;
                Promoted = true;
                ApplicationArea = All;
                Visible = false;

                trigger OnAction()
                var
                    RecordLink: Record "Record Link";
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
                begin

                    // prdp +++


                    ImportFileName.RUN;

                    IF ImportFileName.FILENAME <> '' THEN BEGIN

                        // to get the path of the filename to be copied from client to server
                        //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
                        //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
                        //FileName:=DELSTR('\\navlive\NAV File Import\'+ImportFileName.FILENAME,27,3);
                        FileName := DELSTR('\\EAINPNAV004\NAV File Import\' + ImportFileName.FILENAME, 27, 3);//CCIT-30072022
                                                                                                              // to convert the invoice no. in text format
                                                                                                              //  OrderNo:=FORMAT("No.");

                        // to get the invoice no. starting from 5th charecter to avoid error due to '\'
                        No := CONVERTSTR(OrderNo, '/', '-');

                        // to get the FinalName of file that is to be copied to server
                        // FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
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
                        //   RecordLink."No.":="No.";
                        //   RecordLink.SourcerPath:=FileName;
                        //   RecordLink."Attachement Name":=FinalName;
                        RecordLink.URL1 := Destination + Extension;
                        RecordLink.Created := CURRENTDATETIME;
                        RecordLink."User ID" := USERID;
                        RecordLink.Company := COMPANYNAME;
                        RecordLink.INSERT;


                        // to copy the file to server
                        // FILE.COPY(FileName,Destination+Extension);
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
                ApplicationArea = All;

                trigger OnAction()
                var
                    FileName: Text;
                    RecordLink: Record "Record Link";
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
                begin

                    GenLedSetup.GET('');
                    IF GenLedSetup."Sales Inv. Attach. Path" = '' THEN
                        ERROR('please add Sales Inv. Attach. Path in general ledger setup');
                    Destination := GenLedSetup."Sales Inv. Attach. Path";
                    //Destination:='';
                    // MESSAGE(Destination);

                    //IF UPLOAD('Upload File','','All Files (*.*)|*.*',FileName,Destination) THEN BEGIN

                    //MESSAGE(FileName);

                    RecordLink.RESET;
                    //   RecordLink."No.":="No.";
                    //   RecordLink.URL1:=Destination;
                    //   RecordLink."Attachement Name":=DELSTR(Destination,1,STRLEN(GenLedSetup."Sales Inv. Attach. Path"));
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
                ApplicationArea = All;

                trigger OnAction()
                var
                    RecordLink: Record "Record Link";
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
                begin

                    // prdp +++


                    RecordLink.RESET;
                    // RecordLink.SETRANGE("No.","No.");
                    // RecordLink.SETRANGE("Policy Details",TRUE);
                    // RecordLink.SETFILTER("Attachement Name",'<>%1','');
                    IF RecordLink.FINDFIRST THEN BEGIN
                        // ERROR('Policy details are already attached for invoice %1',"No.");
                    END;

                    ImportFileName.RUN;

                    IF ImportFileName.FILENAME <> '' THEN BEGIN

                        // to get the path of the filename to be copied from client to server
                        //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
                        //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
                        //FileName:=DELSTR('\\navlive\NAV File Import\'+ImportFileName.FILENAME,27,3);
                        FileName := DELSTR('\\EAINPNAV004\NAV File Import\' + ImportFileName.FILENAME, 27, 3);//CCIT-30072022
                                                                                                              // to convert the invoice no. in text format
                                                                                                              //  OrderNo:=FORMAT("No.");

                        // to get the invoice no. starting from 5th charecter to avoid error due to '\'
                        No := CONVERTSTR(OrderNo, '/', '-');

                        // to get the FinalName of file that is to be copied to server
                        //FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
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
                        //   RecordLink."No.":="No.";
                        //   RecordLink.SourcerPath:=FileName;
                        //   RecordLink."Attachement Name":=FinalName;
                        //   RecordLink.URL1:=Destination+Extension;
                        //   RecordLink.URL3:=Extension;
                        RecordLink.Created := CURRENTDATETIME;
                        RecordLink."User ID" := USERID;
                        RecordLink.Company := COMPANYNAME;
                        //RecordLink."Policy Details":=TRUE;
                        RecordLink.INSERT;


                        // to copy the file to server
                        // FILE.COPY(FileName,Destination+Extension);
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
                //                 RunPageLink = No.=FIELD(No.);
            }
        }
        addafter(Preview)
        {
            action("DSC Sales Invoice draft")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'DSC Sales Invoice draft';
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
                    Report.RunModal(Report::New_Sales_Invoice, true, true, salesHeader);
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
        }

    }
    trigger OnOpenPage()
    var


    begin
        // if RecSalesHeader.Get(rec."Integration Doc No") then begin
        //     IntegrationDoc := RecSalesHeader."Integration Doc No";
        // end;

    end;


    var
        myInt: Integer;
        RecSalesLine: Record "Sales Line";
        RawData: Record "Raw Update Log";
        RecSalesHeader: Record "Sales Header";
        IntegrationDoc: Code[30];

}