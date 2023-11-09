pageextension 50016 PurchaseInvoice extends "Purchase Invoice" 
{
    // Pallavi 25012017
    // added code for setting posted status in raw data => post action
    // added new field "Integration Doc No"
    // prdp 15092017
    // added Manual Invoiceto front end
    // prdp - 12012018
    // added code for opening posted purchase invoice
    layout
    {

        //Unsupported feature: Property Insertion (Name) on "Control 1906354007".


        //Unsupported feature: Property Deletion (SubPageLink) on "Control 1906354007".

        addafter("Incoming Document Entry No.")
        {
            field("Invoice Date";Rec."Invoice Date")
            {
                Editable = true;
                ApplicationArea = All;
            }
        }
        addafter("Job Queue Status")
        {
            field("Integration Doc No";Rec."Integration Doc No")
            {
                Editable = true;
                 ApplicationArea = All;
            }
            // field(State;State)
            // {
            // }
        }
        addafter(Status)
        {
            field("Manual Invoice";Rec."Manual Invoice")
            {
                Editable = false;
                 ApplicationArea = All;
            }
            field("Gen. Bus. Posting Group";Rec."Gen. Bus. Posting Group")
            {
               ApplicationArea = All;
            }
            field("Integrated Invoice Type";Rec."Integrated Invoice Type")
            {
               ApplicationArea = All;
            }
            field("Payment Due Date";Rec."Payment Due Date")
            {
                Editable = false;
                 ApplicationArea = All;
            }
            field("PO Number";Rec."Vendor Order No.")
            {
                Caption = 'PO Number';
                 ApplicationArea = All;
            }
            field("PO Date";Rec."Order Date")
            {
                Caption = 'PO Date';
                 ApplicationArea = All;
            }
            field("Billing Type";Rec."Billing Type")
            {
               ApplicationArea = All;
            }
            field("Posting No.";Rec."Posting No.")
            {
               ApplicationArea = All;
            }
            field("Posting No. Series";Rec."Posting No. Series")
            {
               ApplicationArea = All;
            }
        }
        // addafter("Posting No.")
        // {
        //     field("Nature of Supply";Rec."Nature of Supply")
        //     {
        //        ApplicationArea = All;
        //     }
        //     field("GST Vendor Type";Rec."GST Vendor Type")
        //     {
        //        ApplicationArea = All;
        //     }
        //     field("Invoice Type";Rec."Invoice Type")
        //     {
        //        ApplicationArea = All;
        //     }
        //     field("Associated Enterprises";Rec."Associated Enterprises")
        //     {
        //        ApplicationArea = All;
        //     }
        //     field("Bill of Entry No.";Rec."Bill of Entry No.")
        //     {
        //         Importance = Additional;
        //          ApplicationArea = All;
        //     }
        //     field("Bill of Entry Date";Rec."Bill of Entry Date")
        //     {
        //         Importance = Additional;
        //          ApplicationArea = All;
        //     }
        //     field("Bill of Entry Value";Rec."Bill of Entry Value")
        //     {
        //         Importance = Additional;
        //          ApplicationArea = All;
        //     }
        // }
       // moveafter("Control 11";Rec."Control 81")
    }
    actions
    {


        //Unsupported feature: Code Insertion on "Comment(Action 13)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //var
            //ApprovalsMgmt: Codeunit "1535";
        //begin
            /*
            ApprovalsMgmt.GetApprovalComment(Rec);
            */
        //end;

        //Unsupported feature: Property Deletion (RunObject) on "Comment(Action 13)".


        //Unsupported feature: Property Deletion (RunPageLink) on "Comment(Action 13)".



        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 142).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
              ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            // prdp - added validation to avoid posting if attachment missing +++
            IF "Posting Date" >= 040119D THEN BEGIN
              RecordLink.RESET;
              RecordLink.SETRANGE("No.","No.");
              IF NOT RecordLink.FINDFIRST THEN BEGIN
                ERROR('file attachment is missing.');
              END;
            END;
            // prdp - added validation to avoid posting if attachment missing ---
            // prdp - added validation of case no mandatory for gl 218212 ++
            PurchLine.RESET;
            PurchLine.SETRANGE(PurchLine."Document No.","No.");
            PurchLine.SETRANGE(PurchLine.Type,PurchLine.Type::"G/L Account");
            PurchLine.SETRANGE(PurchLine."No.",'218212');
            PurchLine.SETFILTER(PurchLine."Case No.",'=%1','');
            IF PurchLine.FINDFIRST THEN BEGIN
              ERROR('Case No. for G/L 218212 is mandatory, plz add Case No.');
            END;
            // prdp - added validation of case no mandatory for gl 218212 --

            IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
              ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
            */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on "Post(Action 68).OnAction".

        //trigger (Variable: IntDocNo)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on "Post(Action 68).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            Post(CODEUNIT::"Purch.-Post (Yes/No)");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*


            // prdp - added code to make policy no, service id and case no mandatory for type item +++
              PurchLine.RESET;
              PurchLine.SETRANGE("Document No.","No.");
              PurchLine.SETRANGE(Type,2);
              IF PurchLine.FINDSET THEN REPEAT

                IF PurchLine."Policy No." = '' THEN BEGIN
                  ERROR('Policy no must not blank for item %1',PurchLine."No.");
                END;

                IF PurchLine."Case No." = '' THEN BEGIN
                  ERROR('Case no must not blank for item %1',PurchLine."No.");
                END;

                IF PurchLine."Service ID" = '' THEN BEGIN
                  ERROR('Service ID must not blank for item %1',PurchLine."No.");
                END;

                IF PurchLine."Service Date" = 0D THEN BEGIN
                  ERROR('Service Date must not blank for item %1',PurchLine."No.");
                END;

              UNTIL PurchLine.NEXT =0;
            // prdp - added code to make policy no, service id and case no mandatory for type item ---

            // prdp - added validation to avoid posting if attachment missing +++
            IF "Posting Date" >= 040119D THEN BEGIN
              RecordLink.RESET;
              RecordLink.SETRANGE("No.","No.");
              IF NOT RecordLink.FINDFIRST THEN BEGIN
                ERROR('You can not post this invoice, file attachment is missing.');
              END;
            END;
            // prdp - added validation to avoid posting if attachment missing ---

            // prdp - added validation of case no mandatory for gl 218212 ++
            PurchLine.RESET;
            PurchLine.SETRANGE(PurchLine."Document No.","No.");
            PurchLine.SETRANGE(PurchLine.Type,PurchLine.Type::"G/L Account");
            PurchLine.SETRANGE(PurchLine."No.",'218212');
            PurchLine.SETFILTER(PurchLine."Case No.",'=%1','');
            IF PurchLine.FINDFIRST THEN BEGIN
              ERROR('Case No. for G/L 218212 is mandatory, plz add Case No.');
            END;
            // prdp - added validation of case no mandatory for gl 218212 --

            //CCIT-20062022
            RecPL.RESET;
            RecPL.SETRANGE(RecPL."Document No.","No.");
            RecPL.SETRANGE(RecPL.Type,RecPL.Type::"G/L Account");
            RecPL.SETRANGE(RecPL."No.",'212401');
            RecPL.SETFILTER(RecPL."Project Name",'=%1','');
            IF RecPL.FINDFIRST THEN BEGIN
              ERROR('Project Name for G/L 212401 is mandatory,Line No. : %1, plz add Project Name',RecPL."Line No.");
            END;
            //CCIT-20062022

            IntDocNo := "Integration Doc No" ;
            Post(CODEUNIT::"Purch.-Post (Yes/No)");
            // added code to modify the status of raw data to posted ++
            RawData.RESET;
            RawData.SETRANGE(RawData."Integration Doc No",IntDocNo);
            IF RawData.FINDSET THEN REPEAT
            RawData.Status := 2;
            RawData.MODIFY ;
            UNTIL RawData.NEXT = 0 ;
            // added code to modify the status of raw data to posted --

            // prdp - 12012018 added code for opening posted purchase invoice
            PurchInvHdr.RESET;
            PurchInvHdr.SETRANGE("Integration Doc No",IntDocNo);
            PAGE.RUN(138,PurchInvHdr);
            */
        //end;


        //Unsupported feature: Code Modification on "Preview(Action 33).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            PurchPostYesNo.Preview(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            // prdp - added code to make policy no, service id and case no mandatory for type item +++
              PurchLine.RESET;
              PurchLine.SETRANGE("Document No.","No.");
              PurchLine.SETRANGE(Type,2);
              IF PurchLine.FINDSET THEN REPEAT

                IF PurchLine."Policy No." = '' THEN BEGIN
                  ERROR('Policy no must not blank for item %1',PurchLine."No.");
                END;

                IF PurchLine."Case No." = '' THEN BEGIN
                  ERROR('Case no must not blank for item %1',PurchLine."No.");
                END;

                IF PurchLine."Service ID" = '' THEN BEGIN
                  ERROR('Service ID must not blank for item %1',PurchLine."No.");
                END;

              UNTIL PurchLine.NEXT =0;
            // prdp - added code to make policy no, service id and case no mandatory for type item ---

            // prdp - added validation to avoid posting if attachment missing +++
            IF "Posting Date" >= 040119D THEN BEGIN
              RecordLink.RESET;
              RecordLink.SETRANGE("No.","No.");
              IF NOT RecordLink.FINDFIRST THEN BEGIN
                ERROR('You can not post this invoice, file attachment is missing.');
              END;
            END;//CCIT-04082022
            // prdp - added validation to avoid posting if attachment missing ---

            // prdp - added validation of case no mandatory for gl 218212 ++
            PurchLine.RESET;
            PurchLine.SETRANGE(PurchLine."Document No.","No.");
            PurchLine.SETRANGE(PurchLine.Type,PurchLine.Type::"G/L Account");
            PurchLine.SETRANGE(PurchLine."No.",'218212');
            PurchLine.SETFILTER(PurchLine."Case No.",'=%1','');
            IF PurchLine.FINDFIRST THEN BEGIN
              ERROR('Case No. for G/L 218212 is mandatory, plz add Case No.');
            END;
            // prdp - added validation of case no mandatory for gl 218212 --

            //CCIT-20062022
            RecPL.RESET;
            RecPL.SETRANGE(RecPL."Document No.","No.");
            RecPL.SETRANGE(RecPL.Type,RecPL.Type::"G/L Account");
            RecPL.SETRANGE(RecPL."No.",'212401');
            RecPL.SETFILTER(RecPL."Project Name",'=%1','');
            IF RecPL.FINDFIRST THEN BEGIN
              ERROR('Project Name for G/L 212401 is mandatory,Line No. : %1, plz add Project Name',RecPL."Line No.");
            END;
            //CCIT-20062022

            PurchPostYesNo.Preview(Rec);
            */
        //end;
        addafter("Attached Gate Entry")
        {
            action("Detailed GST")
            {
                Caption = 'Detailed GST';
                Image = ServiceTax;
                RunObject = Page "Detailed GST Entry Buffer";
                RunPageLink = "Transaction Type"=FILTER(Purchase),
                              "Document Type"=FIELD("Document Type"),
                              "Document No."=FIELD("No.");
            }
    //         group(Attach)
    //         {
    //             Caption = 'Attach';
    //             action("Attach File2")
    //             {
    //                 Image = Attach;
    //                 Promoted = true;
    //                 Visible = false;

    //                 trigger OnAction()
    //                 var
    //                     RecordLink: Record "Record Link";
    //                     FileName: Text[250];
    //                     ImportFileName: XMLport "50012";
    //                     OrderNo: Code[30];
    //                     No: Text[250];
    //                     TimeStamp: Text[100];
    //                     FinalName: Text[250];
    //                     Timer: Text[100];
    //                     Timer1: Text[100];
    //                     Source: Text[250];
    //                     Destination: Text[250];
    //                     ActiveSession: Record "Active Session";
    //                     User: Record User;
    //                     UserPath: Text[250];
    //                     UserName: Text[100];
    //                     ActSession: Record "Active Session";
    //                     GenLedSetup: Record "General Ledger Setup";
    //                     Extension: Text[100];
    //                     Length: Integer;
    //                     StartPt: Integer;
    //                     Temp: Text[250];
    //                     FileManagement: Codeunit "419";
    //                 begin

    //                       // prdp +++
    //                                                     ImportFileName.RUN;

    //                                                      IF ImportFileName.FILENAME <> '' THEN BEGIN

    //                                                           // to get the path of the filename to be copied from client to server
    //                                                           //FileName:='\\navlive\NAV File Import\'+ImportFileName.FILENAME;
    //                                                            //FileName:=ImportFileName.FILENAME;
    //                                                              FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);
    //                                                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');

    //                                                           // to convert the invoice no. in text format
    //                                                               OrderNo:=FORMAT("No.");

    //                                                           // to get the invoice no. starting from 5th charecter to avoid error due to '\'
    //                                                               No:= CONVERTSTR(OrderNo,'/','-');

    //                                                           // to get the FinalName of file that is to be copied to server
    //                                                           FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
    //                                                           // to get the path of destination folder at server from purchase & payable set up
    //                                                               GenLedSetup.RESET;
    //                                                               GenLedSetup.GET('');

    //                                                               IF GenLedSetup."Purch.Inv. Attach. Path" = '' THEN
    //                                                                 ERROR('please add Purch.Inv. Attach. Path in general ledger setup');

    //                                                             Destination:=GenLedSetup."Purch.Inv. Attach. Path"+FinalName;
    //                                                            // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

    //                                                           // to get the extension of file to be copied
    //                                                               Temp:=ImportFileName.FILENAME;
    //                                                               StartPt:=STRPOS(Temp,'.');
    //                                                               Length:=STRLEN(Temp);
    //                                                               Extension:=COPYSTR(Temp,StartPt,Length);

    //                                                           // to insert the link in record link table
    //                                                               RecordLink.RESET;
    //                                                               RecordLink."No.":="No.";
    //                                                               RecordLink.SourcerPath:=FileName;
    //                                                               RecordLink."Attachement Name":=FinalName;
    //                                                               RecordLink.URL1:=Destination+Extension;
    //                                                               RecordLink.Created:=CURRENTDATETIME;
    //                                                               RecordLink."User ID":=USERID;
    //                                                               RecordLink.Company:=COMPANYNAME;
    //                                                               RecordLink.INSERT;


    //                                                           // to copy the file to server
    //                                                              FILE.COPY(FileName,Destination+Extension);
    //                                                             MESSAGE('Attached and Saved to Server');

    //                                                     END;


    //                                                           // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
    //                                                               CLEAR(ImportFileName);

    //                     // prdp ---
    //                 end;
    //             }
    //             action("Attach File")
    //             {
    //                 Image = Attach;
    //                 Promoted = true;

    //                 trigger OnAction()
    //                 var
    //                     FileName: Text;
    //                     RecordLink: Record "2000000068";
    //                     ImportFileName: XMLport "50012";
    //                     OrderNo: Code[30];
    //                     No: Text[250];
    //                     TimeStamp: Text[100];
    //                     FinalName: Text[250];
    //                     Timer: Text[100];
    //                     Timer1: Text[100];
    //                     Source: Text[250];
    //                     Destination: Text[250];
    //                     ActiveSession: Record "Active Session";
    //                     User: Record User;
    //                     UserPath: Text[250];
    //                     UserName: Text[100];
    //                     ActSession: Record "Active Session";
    //                     GenLedSetup: Record "General Ledger Setup";
    //                     Extension: Text[100];
    //                     Length: Integer;
    //                     StartPt: Integer;
    //                     Temp: Text[250];
    //                     FileManagement: Codeunit "419";
    //                 begin

    //                                                         GenLedSetup.GET('');
    //                                                         IF GenLedSetup."Purch.Inv. Attach. Path" = '' THEN
    //                                                         ERROR('please add Purch.Inv. Attach. Path in general ledger setup');
    //                                                         Destination:=GenLedSetup."Purch.Inv. Attach. Path";
    //                                                         //Destination:='';
    //                                                            // MESSAGE(Destination);

    //                                                         IF UPLOAD('Upload File','','All Files (*.*)|*.*',FileName,Destination) THEN BEGIN

    //                                                           //MESSAGE(FileName);

    //                                                               RecordLink.RESET;
    //                                                               RecordLink."No.":="No.";
    //                                                               RecordLink.URL1:=Destination;
    //                                                               RecordLink."Attachement Name":=DELSTR(Destination,1,STRLEN(GenLedSetup."Purch.Inv. Attach. Path"));
    //                                                               RecordLink.Created:=CURRENTDATETIME;
    //                                                               RecordLink."User ID":=USERID;
    //                                                               RecordLink.Company:=COMPANYNAME;
    //                                                               RecordLink.INSERT;

    //                                                             MESSAGE('Attached and Saved to Server');

    //                                                     END;
    //                 end;
    //             }
    //             action("Files Attached")
    //             {
    //                 Image = Links;
    //                 Promoted = true;
    //                 RunObject = Page 50014;
    //                 RunPageLink = No.=FIELD(No.);
    //             }
    //         }
    //         group("temp attachment")
    //         {
    //             Caption = 'temp attachment';
    //             action("Attach File1")
    //             {
    //                 Image = Attach;
    //                 Promoted = false;

    //                 trigger OnAction()
    //                 var
    //                     RecordLink: Record "2000000068";
    //                     FileName: Text[250];
    //                     ImportFileName: XMLport "50012";
    //                     OrderNo: Code[30];
    //                     No: Text[250];
    //                     TimeStamp: Text[100];
    //                     FinalName: Text[250];
    //                     Timer: Text[100];
    //                     Timer1: Text[100];
    //                     Source: Text[250];
    //                     Destination: Text[250];
    //                     ActiveSession: Record "2000000110";
    //                     User: Record "2000000120";
    //                     UserPath: Text[250];
    //                     UserName: Text[100];
    //                     ActSession: Record "2000000110";
    //                     GenLedSetup: Record "98";
    //                     Extension: Text[100];
    //                     Length: Integer;
    //                     StartPt: Integer;
    //                     Temp: Text[250];
    //                     FileManagement: Codeunit "419";
    //                 begin
                        
    //                       // prdp +++
    //                                                     ImportFileName.RUN;
                        
    //                                                      IF ImportFileName.FILENAME <> '' THEN BEGIN
                        
    //                                                           // to get the path of the filename to be copied from client to server
    //                                                             //  FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
    //                                                              FileName:=ImportFileName.FILENAME;
                        
    //                                                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
                        
    //                                                           // to convert the invoice no. in text format
    //                                                               OrderNo:=FORMAT("No.");
                        
    //                                                           // to get the invoice no. starting from 5th charecter to avoid error due to '\'
    //                                                               No:= CONVERTSTR(OrderNo,'/','-');
                        
                        
    //                                                           // to get the FinalName of file that is to be copied to server
    //                                                           FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
                        
    //                                                           // to get the path of destination folder at server from purchase & payable set up
    //                                                               GenLedSetup.RESET;
    //                                                               GenLedSetup.GET('');
                        
    //                                                               IF GenLedSetup."Purch.Inv. Attach. Path" = '' THEN
    //                                                                 ERROR('please add Purch.Inv. Attach. Path in general ledger setup');
                        
    //                                                             Destination:=GenLedSetup."Purch.Inv. Attach. Path"+FinalName;
    //                                                            // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;
                        
    //                                                           // to get the extension of file to be copied
    //                                                             //  Temp:=ImportFileName.FILENAME;
    //                                                              // StartPt:=STRPOS(Temp,'.');
    //                                                              // Length:=STRLEN(Temp);
    //                                                               Extension:=FileManagement.GetExtension(FileName);
                        
    //                                                           // to insert the link in record link table
    //                                                               RecordLink.RESET;
    //                                                               RecordLink."No.":="No.";
    //                                                               RecordLink.SourcerPath:=FileName;
    //                                                               RecordLink."Attachement Name":=FinalName;
    //                                                               RecordLink.URL1:=Destination+'.'+Extension;
    //                                                               RecordLink.Created:=CURRENTDATETIME;
    //                                                               RecordLink."User ID":=USERID;
    //                                                               RecordLink.Company:=COMPANYNAME;
    //                                                              RecordLink.INSERT;
    //                                                              /*
    //                     MESSAGE('FILENAME: '+FileName);
    //                     MESSAGE('FINALNAME: '+FinalName);
    //                     MESSAGE('DESTINATION: '+Destination);
    //                     MESSAGE('EXTENSION: '+Extension);
    //                                                           // to copy the file to server
    //                        */
    //                                                              FILE.COPY(FileName,Destination+'.'+Extension);
    //                                                             MESSAGE('Attached and Saved to Server');
                        
    //                                                     END;
                        
                        
    //                                                           // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
    //                                                               CLEAR(ImportFileName);
                        
    //                     // prdp ---

    //                 end;
    //             }
    //         }
    //     }
    // }

    // var
    //     IntDocNo: Code[30];
    //     RawData: Record "50005";
    //     PurchInvHdr: Record "122";

    // var
    //     RecordLink: Record "2000000068";
    //     RecPL: Record "39";


    // //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    // //trigger OnAfterGetCurrRecord()
    // //>>>> ORIGINAL CODE:
    // //begin
    //     /*
    //     CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    //     ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    //     */
    // //end;
    // //>>>> MODIFIED CODE:
    // //begin
    //     /*
    //     CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    //     ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    //     CurrPage.ApprovalFactBox.PAGE.RefreshPage(RECORDID);
    //     */
    // //end;
}
    }
}

