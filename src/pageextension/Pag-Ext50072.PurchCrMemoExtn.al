pageextension 50072 "Purch Cr Memo Extn" extends "Purchase Credit Memo"
{
    layout
    {
        // Add changes to page layout here
        addafter(Status)
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = All;
            }
            field("Reference Invoice Number"; Rec."Reference Invoice Number")
            {
                ApplicationArea = All;
            }
        }
        //Richa
        /*
        addafter("Service Tax Rounding Type")
        {
            
            field("Nature of Supply";Rec."Nature of Supply")
            {
            }

            field("Associated Enterprises";Rec."Associated Enterprises")
            {
            }
            field("Bill of Entry No.";Rec."Bill of Entry No.")
            {
                Importance = Additional;
            }
            field("Bill of Entry Date";Rec."Bill of Entry Date")
            {
                Importance = Additional;
            }
        
            field("Bill of Entry Value"; "Bill of Entry Value")
            {
                Importance = Additional;
            }
        }
        */
    }

    actions
    {
        // Add changes to page actions here
        //Richa
        /*
        addafter("Detailed Tax")
        {

            action("Detailed GST")
            {
                Caption = 'Detailed GST';
                Image = ServiceTax;
                RunObject = Page 16412;
                RunPageLink = "Transaction Type" = FILTER(Purchase),
                                  "Document Type" = FIELD("Document Type"),
                                  "Document No." = FIELD("No.");
            }
        }
        */

        addlast(processing)
        {
            group(Attach)
            {
                action("Attach File1")
                {
                    Image = Attach;
                    Promoted = true;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        RecordLink: Record 2000000068;
                        FileName: Text[250];
                        ImportFileName: XMLport 50012;
                        OrderNo1: Code[30];
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
                        ImportFileName.RUN;

                        IF ImportFileName.FILENAME <> '' THEN BEGIN

                            // to get the path of the filename to be copied from client to server
                            // FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
                            //FileName:=ImportFileName.FILENAME;
                            FileName := DELSTR('\\EAINPNAV004\NAV File Import\' + ImportFileName.FILENAME, 27, 3);
                            // to convert the invoice no. in text format
                            //OrderNo := FORMAT(rec."No.");

                            // to get the invoice no. starting from 5th charecter to avoid error due to '\'
                            // No := CONVERTSTR(OrderNo, '/', '-');

                            // to get the FinalName of file that is to be copied to server
                            FinalName := COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME), 1, MAXSTRLEN(FinalName));
                            // to get the path of destination folder at server from purchase & payable set up
                            GenLedSetup.RESET;
                            GenLedSetup.GET('');

                            IF GenLedSetup."Purch Cr Memo Attach. Path" = '' THEN
                                ERROR('please add Purch Cr Memo Attach. Path in general ledger setup');

                            Destination := GenLedSetup."Purch Cr Memo Attach. Path" + FinalName;
                            // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

                            // to get the extension of file to be copied
                            Temp := ImportFileName.FILENAME;
                            StartPt := STRPOS(Temp, '.');
                            Length := STRLEN(Temp);
                            Extension := COPYSTR(Temp, StartPt, Length);

                            // to insert the link in record link table
                            RecordLink.RESET;
                            //Richa
                            //RecordLink."No." := rec."No.";
                            //RecordLink.SourcerPath := FileName;
                            //RecordLink."Attachement Name" := FinalName;
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
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        FileName: Text;
                        RecordLink: Record 2000000068;
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
                        GenLedSetup: Record "General Ledger Setup";
                        Extension: Text[100];
                        Length: Integer;
                        StartPt: Integer;
                        Temp: Text[250];
                        FileManagement: Codeunit 419;
                    begin

                        GenLedSetup.GET('');
                        IF GenLedSetup."Purch Cr Memo Attach. Path" = '' THEN
                            ERROR('please add Purch Cr Memo Attach. Path in general ledger setup');
                        Destination := GenLedSetup."Purch Cr Memo Attach. Path";
                        //Destination:='';
                        // MESSAGE(Destination);

                        //IF UPLOAD('Upload File', '', 'All Files (*.*)|*.*', FileName, Destination) THEN BEGIN

                        //MESSAGE(FileName);

                        RecordLink.RESET;
                        //RecordLink."No." := Rec."No.";  //Richa
                        RecordLink.URL1 := Destination;
                        //Richa
                        //RecordLink."Attachement Name" := DELSTR(Destination, 1, STRLEN(GenLedSetup."Purch Cr Memo Attach. Path"));
                        RecordLink.Created := CURRENTDATETIME;
                        RecordLink."User ID" := USERID;
                        RecordLink.Company := COMPANYNAME;
                        RecordLink.INSERT;

                        MESSAGE('Attached and Saved to Server');

                    END;
                    // end;
                }
                action("Files Attached")
                {
                    ApplicationArea = All;
                    Image = Links;
                    Promoted = true;
                   // RunObject = Page 50014;
                    //RunPageLink = "No." = FIELD("No.");  //Richa
                }
            }
        }
    }

    var
        myInt: Integer;
}