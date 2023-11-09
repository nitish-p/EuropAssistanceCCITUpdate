pageextension 50094 "Purchase Invoices" extends "Purchase Invoices"
{

    layout
    {
        // modify("Control 113.OnLookup")
        // {
        //     Visible = false;
        // }
        // modify("Control 111.OnLookup")
        // {
        //     Visible = false;
        // }
        // modify("Control 1102601011")
        // {
        //     Visible = false;
        // }
        // modify("Control 1102601020")
        // {
        //     Visible = false;
        // }
        // modify("Control 1102601025")
        // {
        //     Visible = false;
        // }
        // modify("Control 5")
        // {
        //     Visible = false;
        // }
        addfirst(content)
        {
            field(Select; rec.Select)
            {
                ApplicationArea = All;
            }
        }
        addafter("Payment Discount %")
        {
            // field("Amount to Vendor";Rec."Amount to Vendor")
            // {
            // }
            // field(Amount;rec.Amount)
            // {
            // }
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
            // field("Vendor Invoice No.";Rec."Vendor Invoice No.")
            // {
            // }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
            field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
            {
                ApplicationArea = All;
            }
            field(State; rec.State)
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
            field("Payment Due Date"; Rec."Payment Due Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 14).OnAction".

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

        //IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);


        // prdp +++

        SHeader3.RESET;
        SHeader3.SETRANGE(SHeader3.Select,TRUE);
        IF SHeader3.FINDFIRST THEN BEGIN

        SHeader.RESET;
        SHeader.SETRANGE(SHeader.Select,TRUE);
        IF SHeader.FINDSET THEN REPEAT
        SHeader2.RESET;
        SHeader2.SETRANGE(SHeader2."No.",SHeader."No.");
        IF SHeader2.FINDFIRST THEN BEGIN
        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(SHeader2) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(SHeader2);
        END;
        UNTIL SHeader.NEXT = 0 ;

        END ELSE BEGIN
          IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        END;

        SalesInvHeader.RESET;
        SalesInvHeader.SETRANGE(SalesInvHeader.Select,TRUE);
        IF SalesInvHeader.FINDSET THEN REPEAT
           SalesInvHeader.Select:=FALSE;
           SalesInvHeader.MODIFY;
        UNTIL SalesInvHeader.NEXT = 0;

        // prdp ---
        */
        //end;


        //Unsupported feature: Code Modification on "CancelApprovalRequest(Action 12).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);

        // prdp +++

        SHeader3.RESET;
        SHeader3.SETRANGE(SHeader3.Select,TRUE);
        IF SHeader3.FINDFIRST THEN BEGIN

        SHeader.RESET;
        SHeader.SETRANGE(SHeader.Select,TRUE);
        IF SHeader.FINDSET THEN REPEAT
        SHeader2.RESET;
        SHeader2.SETRANGE(SHeader2."No.",SHeader."No.");
        IF SHeader2.FINDFIRST THEN BEGIN
          ApprovalsMgmt.OnCancelPurchaseApprovalRequest(SHeader2);;
        END;
        UNTIL SHeader.NEXT = 0 ;

        END ELSE BEGIN
          ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);;
        END;

        SalesInvHeader.RESET;
        SalesInvHeader.SETRANGE(SalesInvHeader.Select,TRUE);
        IF SalesInvHeader.FINDSET THEN REPEAT
           SalesInvHeader.Select:=FALSE;
           SalesInvHeader.MODIFY;
        UNTIL SalesInvHeader.NEXT = 0;

        // prdp ---
        */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on "Post(Action 52).OnAction".

        //trigger (Variable: PurchInvHdr)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Post(Action 52).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");
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

        SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");

        // prdp - 12012018 added code for opening posted purchase invoice
        PurchInvHdr.RESET;
        PurchInvHdr.SETRANGE("Integration Doc No","Integration Doc No");
        PAGE.RUN(138,PurchInvHdr);
        */
        //end;


        //Unsupported feature: Code Modification on "Preview(Action 9).OnAction".

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
        addafter(RemoveFromJobQueue)
        {
            action("Import Purchase Invoice")
            {
                Promoted = true;
                ApplicationArea = All;
                //RunObject = XMLport 50003;
            }
            action("Import Ez Auto Invoices")
            {
                Promoted = true;
                RunObject = XMLport 50036;
                ApplicationArea = All;
            }
            //         group(Attach)
            //         {
            //             Caption = 'Attach';
            //             action("Attach File1")
            //             {
            //                 Image = Attach;
            //                 Promoted = true;
            //                 Visible = false;

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
            //                                                           //FileName:='\\navlive\NAV File Import\'+ImportFileName.FILENAME;
            //                                                            //FileName:=ImportFileName.FILENAME;
            //                                                              //FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);
            //                                                              FileName:=ImportFileName.FILENAME;//CCIT-03082022
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
            action("Gen Jnl Line Upload")
            {
                ApplicationArea = All;
                RunObject = XMLport "Gen. Journal Line Upload";
                // trigger OnAction()
                // begin
                //     Message('Hello');
                // end;
            }
            //             action("Bank Payment Voucher")
            //             {
            //                 RunObject = Page 16577;
            //             }
            //             action("Jour. Voucher")
            //             {
            //                 RunObject = Page 16571;
            //             }
            //         }
            //         group("Delete Selected")
            //         {
            //             Caption = 'Delete Selected';
            //             action(Select)
            //             {
            //                 Image = SelectField;
            //                 Promoted = false;

            //                 trigger OnAction()
            //                 begin

            //                     // prdp +++
            //                       SalesInvHeader.RESET;
            //                       SalesInvHeader.SETRANGE("No.","No.");
            //                       IF SalesInvHeader.FINDFIRST THEN BEGIN
            //                         SalesInvHeader.Select:=TRUE;
            //                         SalesInvHeader.MODIFY;
            //                       END;
            //                     // prdp ---
            //                 end;
            //             }
            //             action(Deselct)
            //             {
            //                 Image = CancelLine;
            //                 Promoted = false;

            //                 trigger OnAction()
            //                 begin
            //                     // prdp +++
            //                       SalesInvHeader.RESET;
            //                       SalesInvHeader.SETRANGE("No.","No.");
            //                       IF SalesInvHeader.FINDFIRST THEN BEGIN
            //                         SalesInvHeader.Select:=FALSE;
            //                         SalesInvHeader.MODIFY;
            //                       END;
            //                     // prdp ---
            //                 end;
            //             }
            //             action("Select All")
            //             {
            //                 Image = SelectEntries;
            //                 Promoted = false;

            //                 trigger OnAction()
            //                 begin
            //                     // prdp +++
            //                     IF NOT CONFIRM ('Do you want Select all Invoices ?',FALSE)
            //                       THEN
            //                         EXIT;

            //                     SalesInvHeader.RESET;
            //                     SalesInvHeader.COPYFILTERS(Rec);
            //                     SalesInvHeader.COPYFILTER("No.",SalesInvHeader."No.");
            //                     //SalesInvHeader.SETFILTER(SalesInvHeader."No.",'<>%1','');
            //                     IF SalesInvHeader.FINDSET THEN REPEAT
            //                        SalesInvHeader.Select:=TRUE;
            //                        SalesInvHeader.MODIFY;
            //                     UNTIL SalesInvHeader.NEXT = 0;
            //                     // prdp ---
            //                 end;
            //             }
            //             action("Deselect All")
            //             {
            //                 Image = UnApply;
            //                 Promoted = false;

            //                 trigger OnAction()
            //                 begin
            //                     // prdp +++
            //                     IF NOT CONFIRM ('Do you want Deselect all Invoices ?',FALSE)
            //                       THEN
            //                         EXIT;

            //                     SalesInvHeader.RESET;
            //                     SalesInvHeader.COPYFILTERS(Rec);
            //                     SalesInvHeader.COPYFILTER("No.",SalesInvHeader."No.");
            //                     SalesInvHeader.SETRANGE(Select,TRUE);
            //                     IF SalesInvHeader.FINDSET THEN REPEAT
            //                        SalesInvHeader.Select:=FALSE;
            //                        SalesInvHeader.MODIFY;
            //                     UNTIL SalesInvHeader.NEXT = 0;
            //                     // prdp ---
            //                 end;
            //             }
            //             action("Delete Selected Invoices")
            //             {

            //                 trigger OnAction()
            //                 begin

            //                     IF NOT CONFIRM ('Do you want to delete selected invoices ?',FALSE)
            //                       THEN
            //                         EXIT;

            //                     recPurchHdr.RESET;
            //                     recPurchHdr.SETRANGE(Select,TRUE);
            //                     IF recPurchHdr.FINDSET THEN REPEAT

            //                     PurchLine.RESET;
            //                     PurchLine.SETRANGE("Document No.",recPurchHdr."No.");
            //                     IF PurchLine.FINDSET THEN REPEAT
            //                       PurchLine.DELETE;
            //                     UNTIL PurchLine.NEXT = 0;
            //                     PurchHdr.RESET;
            //                     PurchHdr.SETRANGE("No.",recPurchHdr."No.");
            //                     IF PurchHdr.FINDFIRST THEN BEGIN
            //                       PurchHdr.DELETE;
            //                     END;

            //                     UNTIL recPurchHdr.NEXT =0;
            //                 end;
            //             }
            //         }
            //         group(Automation)
            //         {
            //             Caption = 'Automation';
            //             action("Export Automation Invoices Log")
            //             {
            //                 RunObject = Report 50064;
            //             }
            //             action("Export Rejection Log")
            //             {
            //                 RunObject = Report 50050;
            //             }
            //         }
            //         group("Recall Invoice")
            //         {
            //             Caption = 'Recall Invoice';
            //             action(Recall)
            //             {
            //                 Image = ReturnOrder;
            //                 Promoted = true;

            //                 trigger OnAction()
            //                 var
            //                     RecPurchHeader: Record "38";
            //                 begin

            //                     // prdp 151020 ++

            //                     IF NOT CONFIRM('Do you want to recall this invoice %1',FALSE,"Integration Doc No")
            //                             THEN
            //                               EXIT;

            //                     IntDocNo:='';
            //                     IntDocNo:=COPYSTR("Integration Doc No",1,1)+COPYSTR(LOWERCASE("Integration Doc No"),2,STRLEN("Integration Doc No"));

            //                     Recall(IntDocNo,"Integrated Invoice Type");

            //                     // prdp 151020 --
            //                 end;
            //             }
            //             action("Get Attachment from EZAUTO")
            //             {

            //                 trigger OnAction()
            //                 begin
            //                     getAttachment(Rec);
            //                 end;
            //             }
            //         }
            //     }
            // }

            // var
            //     PurchInvHdr: Record "122";

            // var
            //     PurchLine: Record "39";
            //     RecordLink: Record "2000000068";
            //     SalesInvHeader: Record "38";
            //     PurchHdr: Record "38";
            //     recPurchHdr: Record "38";
            //     SHeader: Record "38";
            //     SHeader2: Record "38";
            //     SHeader3: Record "38";
            //     IntDocNo: Text[30];
            //     RecPL: Record "39";


            // //Unsupported feature: Code Insertion on "OnClosePage".

            // //trigger OnClosePage()
            // //begin
            //     /*
            //     SalesInvHeader.RESET;
            //     SalesInvHeader.SETRANGE(SalesInvHeader.Select,TRUE);
            //     IF SalesInvHeader.FINDSET THEN REPEAT
            //        SalesInvHeader.Select:=FALSE;
            //        SalesInvHeader.MODIFY;
            //     UNTIL SalesInvHeader.NEXT = 0;
            //     */
            // //end;


            // //Unsupported feature: Code Modification on "OnOpenPage".

            // //trigger OnOpenPage()
            // //>>>> ORIGINAL CODE:
            // //begin
            //     /*
            //     SetSecurityFilterOnRespCenter;

            //     JobQueueActive := PurchasesPayablesSetup.JobQueueActive;
            //     */
            // //end;
            // //>>>> MODIFIED CODE:
            // //begin
            //     /*
            //     #1..3



            //     SalesInvHeader.RESET;
            //     SalesInvHeader.SETRANGE(SalesInvHeader.Select,TRUE);
            //     IF SalesInvHeader.FINDSET THEN REPEAT
            //        SalesInvHeader.Select:=FALSE;
            //        SalesInvHeader.MODIFY;
            //     UNTIL SalesInvHeader.NEXT = 0;
            //     */
            // //end;

            // procedure getAttachment(RecPH: Record "38")
            // var
            //     recLink: Record "2000000068";
            //     RecTranAPI: Record "50009";
            //     PurchpayablesSetup: Record "312";
            //     PurchInvHdr: Record "122";
            //     RecordLink: Record "2000000068";
            //     FileManagement: Codeunit "419";
            //     PurchCrMemoHdr: Record "124";
            //     RecordLink1: Record "2000000068";
            //     RecordLink2: Record "2000000068";
            // begin

            //     RecTranAPI.RESET;
            //     RecTranAPI.SETRANGE(RecTranAPI."Transaction No.",RecPH."Integration Doc No");
            //     //RecTranAPI.SETRANGE(RecTranAPI."File Name",FileName1);
            //     RecTranAPI.SETRANGE(RecTranAPI.Final,TRUE);
            //     IF RecTranAPI.FINDFIRST THEN
            //     //BEGIN
            //     REPEAT

            //        IF ((RecTranAPI.Final = TRUE) AND (RecTranAPI."Transaction No." <> '') AND (RecTranAPI."File Name" <> '' )) THEN BEGIN
            //         //MESSAGE('%1',RecTranAPI."File Name");
            //     /*recLink.RESET;
            //     recLink.SETRANGE("No.","Nav Vendor Code");
            //     IF recLink.FINDSET THEN REPEAT
            //       recLink."No.":='';
            //       recLink.MODIFY;
            //     UNTIL recLink.NEXT=0;*/

            //       IF ((UPPERCASE(RecTranAPI."Invoice Type") = 'FTSP' )
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'PTM7 NORMAL' )
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'NORMAL1' )
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'GC-PPC NORMAL')
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'GC-PPC EXCEED')
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL NRML GST ONL')
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL EXCEED ONL')
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL CASH INVOICE')
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL NRML NONGST ONL')
            //         OR (UPPERCASE(RecTranAPI."Invoice Type") = 'MSIL CASH INVOICE')) THEN BEGIN

            //         PurchpayablesSetup.GET('');



            //                                               PurchInvHdr.RESET;
            //                                               PurchInvHdr.SETRANGE("No.",RecTranAPI."Preposted Invoice No");
            //                                               IF PurchInvHdr.FINDFIRST THEN BEGIN
            //                                                     RecordLink2.RESET;
            //                                                     RecordLink2.SETRANGE(RecordLink2."No.",RecTranAPI."Preposted Invoice No");
            //                                                     IF RecordLink2.FINDFIRST THEN BEGIN
            //                                                         RecordLink2.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                         RecordLink2.MODIFY;

            //                                                     END ELSE BEGIN
            //                                                         RecordLink.RESET;
            //                                                         RecordLink.INIT;
            //                                                         RecordLink."No.":=PurchInvHdr."Pre-Assigned No.";
            //                                                         RecordLink.URL2:=RecTranAPI."Posted Invoice No";
            //                                                         RecordLink."Attachement Name":=COPYSTR(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MAXSTRLEN(RecTranAPI."File Name"));
            //                                                         RecordLink.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                         RecordLink.Created:=CURRENTDATETIME;
            //                                                         RecordLink."User ID":=USERID;
            //                                                         RecordLink.Company:=COMPANYNAME;
            //                                                         RecordLink.INSERT;

            //                                                     END;

            //                                               END;
            //       END;


            //     IF (UPPERCASE(RecTranAPI."Invoice Type") = 'MSL CASH CN') THEN BEGIN
            //       PurchpayablesSetup.GET('');


            //                                               PurchCrMemoHdr.RESET;
            //                                               PurchCrMemoHdr.SETRANGE("No.",RecTranAPI."Posted Invoice No");
            //                                               IF PurchCrMemoHdr.FINDFIRST THEN BEGIN

            //                                               RecordLink1.RESET;
            //                                               RecordLink1.INIT;
            //                                               RecordLink1."No.":=PurchCrMemoHdr."Pre-Assigned No.";
            //                                               RecordLink1.URL2:=RecTranAPI."Posted Invoice No";
            //                                               RecordLink1."Attachement Name":=COPYSTR(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MAXSTRLEN(RecTranAPI."File Name"));
            //                                               RecordLink1.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                               RecordLink1.Created:=CURRENTDATETIME;
            //                                               RecordLink1."User ID":=USERID;
            //                                               RecordLink1.Company:=COMPANYNAME;
            //                                               RecordLink1.INSERT;

            //                                               END;

            //     END;


            //       IF ((UPPERCASE(RecTranAPI."Invoice Type") <> 'FTSP' )
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'PTM7 NORMAL' )
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'NORMAL1' )
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'GC-PPC NORMAL')
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'GC-PPC EXCEED')
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL NRML GST ONL')
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL EXCEED ONL')
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL CASH INVOICE')
            //         AND (UPPERCASE(RecTranAPI."Invoice Type") <> 'MSL NRML NONGST ONL')) THEN BEGIN
            //         PurchpayablesSetup.GET('');
            //                                             RecordLink2.RESET;
            //                                             RecordLink2.SETRANGE(RecordLink2."No.",RecTranAPI."Preposted Invoice No");
            //                                             IF RecordLink2.FINDFIRST THEN BEGIN
            //                                                 RecordLink2.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                                 RecordLink2.MODIFY;

            //                                             END ELSE BEGIN
            //                                               RecordLink.RESET;
            //                                               RecordLink.INIT;
            //                                               RecordLink."No.":=RecTranAPI."Preposted Invoice No";
            //                                               //RecordLink.URL2:="Posted Invoice No";
            //                                               RecordLink."Attachement Name":=COPYSTR(FileManagement.GetFileNameWithoutExtension(RecTranAPI."File Name"),1,MAXSTRLEN(RecTranAPI."File Name"));
            //                                               RecordLink.URL1:=PurchpayablesSetup."Local Attachment Folder"+RecTranAPI."File Name";
            //                                               RecordLink.Created:=CURRENTDATETIME;
            //                                               RecordLink."User ID":=USERID;
            //                                               RecordLink.Company:=COMPANYNAME;
            //                                               RecordLink.INSERT;

            //                                             END;
            //       END;

            //     DownloadFile(RecTranAPI."File Name");
            //     MESSAGE('Done');
            //     END;
            //     //END;
            //     UNTIL RecTranAPI.NEXT=0;

            // end;

            // local procedure DownloadFile(Attachment: Text[100])
            // var
            //     WinSCPSesh: DotNet Session;
            //     WinSCPSessionOptions: DotNet SessionOptions;
            //     WinSCPTransferOptions: DotNet TransferOptions;
            //     WinSCPTransferResults: DotNet TransferOperationResult;
            //     Directory: Record "2000000022";
            //     WinSCPTransferResumeSupport: DotNet TransferResumeSupport;
            //     WinSCPTransferResumeSupportState: DotNet TransferResumeSupportState;
            //     MoveFileDotNet: DotNet File;
            //     WinSCPProtocol: DotNet Protocol;
            //     WinSCPFtpSecure: DotNet FtpSecure;
            //     WinSCPRemoteInfoColl: DotNet RemoteDirectoryInfo;
            //     WinSCPRemoteInfo: DotNet RemoteFileInfo;
            //     PurchPayableSetup: Record "312";
            // begin

            //     PurchPayableSetup.GET('');

            //     WinSCPSessionOptions := WinSCPSessionOptions.SessionOptions;
            //     WinSCPSessionOptions.HostName := PurchPayableSetup."EzAuto SFTP Host Name";
            //     WinSCPSessionOptions.UserName := PurchPayableSetup."EzAuto SFTP Username";
            //     WinSCPSessionOptions.Password := PurchPayableSetup."EZAuto SFTP Password";
            //     //WinSCPSessionOptions.SshHostKeyFingerprint := PurchPaybleSetup."EZAuto SFTP Host Key";
            //     WinSCPSessionOptions.GiveUpSecurityAndAcceptAnySshHostKey := TRUE;

            //     WinSCPSesh := WinSCPSesh.Session;
            //     WinSCPSesh.Open(WinSCPSessionOptions);

            //     IF WinSCPSesh.Opened THEN BEGIN

            //     WinSCPTransferOptions := WinSCPTransferOptions.TransferOptions;
            //     WinSCPTransferOptions.TransferMode:=0;
            //     WinSCPTransferResumeSupport := WinSCPTransferOptions.ResumeSupport;
            //     WinSCPTransferResumeSupport.State(WinSCPTransferResumeSupportState.Off);

            //     WinSCPTransferResults := WinSCPSesh.GetFiles(PurchPayableSetup."EzAuto Attachment Folder"+'/'+Attachment,PurchPayableSetup."Local Attachment Folder",FALSE,WinSCPTransferOptions);
            //     //WinSCPSesh.RemoveFiles(PurchPayableSetup."EzAuto Attachment Folder"+'/'+Attachment)
            //     END ELSE ERROR('Connection failed to EzAuto SFTP server for Attachment !');

            //     IF WinSCPSesh.Opened THEN WinSCPSesh.Dispose();
            // end;
        }
    }
}

