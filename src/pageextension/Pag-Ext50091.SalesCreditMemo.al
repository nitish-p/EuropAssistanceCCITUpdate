pageextension 50091 SalesCreditMemo extends "Sales Credit Memo" 
{
    // Pallavi 24-01-2017
    // brought new field "Integration Doc No"
    // added code for setting status to posted = psot action
    // prdp 02022017
    // added field "Posting No. Series" to front end
    // Pradi p11042107
    // added code to set canceeld status for document service master and policy master = POST -Onaction()
    layout
    {

        //Unsupported feature: Property Insertion (Name) on "Control 1906354007".


        //Unsupported feature: Property Deletion (SubPageLink) on "Control 1906354007".

        addafter("No.")
        {
            field("Integration Doc No";Rec."Integration Doc No")
            {
                 ApplicationArea = All;
            }
        }
        addafter("Document Date")
        {
            field("Invoice Date";Rec."Invoice Date")
            { ApplicationArea = All;

            }
        }
        addafter("Job Queue Status")
        {
            field("Posting No. Series";Rec."Posting No. Series")
            {
                 ApplicationArea = All;
            }
            field("Posting No.";Rec."Posting No.")
            {
                 ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field("Reference Invoice Number";Rec."Reference Invoice Number")
            {
                 ApplicationArea = All;
            }
            field("EA Transaction Type";Rec."EA Transaction Type")
            {
                 ApplicationArea = All;
            }
        }
        addfirst(General)
        {
    //         field("Ship-to Code";Rec."Ship-to Code")
    //         {

    //             trigger OnValidate()
    //             begin
    //                 //CCIT-02052022
    //                 IF "Document Type" = Rec."Document Type"::"Credit Memo" THEN
    //                 BEGIN
    //                   IF Rec."Ship-to Code" <> '' THEN
    //                   BEGIN
    //                     IF RecShipToAddress.GET(Rec."Sell-to Customer No.",Rec."Ship-to Code") THEN BEGIN
    //                         "Ship-to Name" := RecShipToAddress.Name;
    //                         "Ship-to Name 2" := RecShipToAddress."Name 2";
    //                         "Ship-to Address" := RecShipToAddress.Address;
    //                         "Ship-to Address 2" := RecShipToAddress."Address 2";
    //                         "Ship-to City" := RecShipToAddress.City;
    //                         "Ship-to Post Code" := RecShipToAddress."Post Code";
    //                         "Ship-to County" := RecShipToAddress.County;
    //                         "Ship-to Country/Region Code" := RecShipToAddress."Country/Region Code";
    //                         "Ship-to Contact" := RecShipToAddress.Contact;
    //                      END;
    //                    END ELSE BEGIN
    //                        RecLoc.GET(Rec."Location Code");
    //                         "Ship-to Name" := RecLoc.Name;
    //                         "Ship-to Name 2" := RecLoc."Name 2";
    //                         "Ship-to Address" := RecLoc.Address;
    //                         "Ship-to Address 2" := RecLoc."Address 2";
    //                         "Ship-to City" := RecLoc.City;
    //                         "Ship-to Post Code" := RecLoc."Post Code";
    //                         "Ship-to County" := RecLoc.County;
    //                         "Ship-to Country/Region Code" := RecLoc."Country/Region Code";
    //                         "Ship-to Contact" := RecLoc.Contact;
    //                     END;
    //                 END;
    //                 //CCIT-02052022
    //             end;
    //         }
    //     }
    //     addafter("Control 1500027")
    //     {
    //         group(GST)
    //         {
    //             Caption = 'GST';
    //             field("GST Bill-to State Code";Rec."GST Bill-to State Code")
    //             {
    //             }
    //             field("GST Ship-to State Code";Rec."GST Ship-to State Code")
    //             {
    //             }
    //             field("Location State Code";Rec."Location State Code")
    //             {
    //             }
    //             field("Nature of Supply";Rec."Nature of Supply")
    //             {
    //             }
    //             field("GST Customer Type";Rec."GST Customer Type")
    //             {
    //             }
    //             field("GST Without Payment of Duty";Rec."GST Without Payment of Duty")
    //             {
    //             }
    //             field("Invoice Type";Rec."Invoice Type")
    //             {
    //             }
    //             field("Bill Of Export No.";Rec."Bill Of Export No.")
    //             {
    //             }
    //             field("Bill Of Export Date";Rec."Bill Of Export Date")
    //             {
    //             }
    //             field("e-Commerce Customer";Rec."e-Commerce Customer")
    //             {
    //             }
    //             field("e-Commerce Merchant Id";Rec."e-Commerce Merchant Id")
    //             {
    //             }
    //         }
    //     }
    // }
    // actions
    // {


    //     //Unsupported feature: Code Modification on "Statistics(Action 51).OnAction".

    //     //trigger OnAction()
    //     //Parameters and return type have not been exported.
    //     //>>>> ORIGINAL CODE:
    //     //begin
    //         /*
    //         Salessetup.GET;
    //         CALCFIELDS("Price Inclusive of Taxes");
    //         IF Salessetup."Calc. Inv. Discount" AND (NOT "Price Inclusive of Taxes") THEN BEGIN
    //         #4..19
    //           SalesLine.CalculateTCS(Rec);
    //           COMMIT;
    //         END;

    //         PAGE.RUNMODAL(PAGE::"Sales Statistics",Rec);
    //         SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
    //         */
    //     //end;
    //     //>>>> MODIFIED CODE:
    //     //begin
    //         /*
    //         #1..22
    //         IF GSTManagement.CheckGSTStrucure(Structure) THEN
    //             GSTManagement.SalesPostValidations(Rec);
    //         #23..25
    //         */
    //     //end;


    //     //Unsupported feature: Code Insertion on "Comment(Action 31)".

    //     //trigger OnAction()
    //     //Parameters and return type have not been exported.
    //     //var
    //         //ApprovalsMgmt: Codeunit "1535";
    //     //begin
    //         /*
    //         ApprovalsMgmt.GetApprovalComment(Rec);
    //         */
    //     //end;

    //     //Unsupported feature: Property Deletion (RunObject) on "Comment(Action 31)".


    //     //Unsupported feature: Property Deletion (RunPageLink) on "Comment(Action 31)".



    //     //Unsupported feature: Code Modification on "SendApprovalRequest(Action 139).OnAction".

    //     //trigger OnAction()
    //     //Parameters and return type have not been exported.
    //     //>>>> ORIGINAL CODE:
    //     //begin
    //         /*
    //         IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
    //           ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
    //         */
    //     //end;
    //     //>>>> MODIFIED CODE:
    //     //begin
    //         /*

    //         IF "Reference Invoice Number" = '' THEN
    //         ERROR('Add Reference Invoice Number');

    //         // prdp - added validation to avoid posting if attachment missing +++

    //          { RecordLink.RESET;
    //           RecordLink.SETRANGE("No.","No.");
    //           IF NOT RecordLink.FINDFIRST THEN BEGIN
    //             ERROR('Can not send for approval, file attachment is missing.');
    //           END;}//CCIT-06052022

    //         // prdp - added validation to avoid posting if attachment missing ---

    //         IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
    //           ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
    //         */
    //     //end;


    //     //Unsupported feature: Code Insertion (VariableCollection) on "Post(Action 61).OnAction".

    //     //trigger (Variable: IntDocNo)()
    //     //Parameters and return type have not been exported.
    //     //begin
    //         /*
    //         */
    //     //end;


    //     //Unsupported feature: Code Modification on "Post(Action 61).OnAction".

    //     //trigger OnAction()
    //     //Parameters and return type have not been exported.
    //     //>>>> ORIGINAL CODE:
    //     //begin
    //         /*
    //         Post(CODEUNIT::"Sales-Post (Yes/No)");
    //         */
    //     //end;
    //     //>>>> MODIFIED CODE:
    //     //begin
    //         /*
    //         // prdp - added validation to avoid posting if attachment missing +++

    //           {RecordLink.RESET;
    //           RecordLink.SETRANGE("No.","No.");
    //           IF NOT RecordLink.FINDFIRST THEN BEGIN
    //             ERROR('You can not post, file attachment is missing.');
    //           END;}//CCIT-06092022
    //            // temp comment 13082022
    //         // prdp - added validation to avoid posting if attachment missing ---

    //         // prdp 210820 ++
    //           IF "Invoice Date"=0D THEN BEGIN
    //             ERROR('Please select Invoice Date');
    //           END;
    //           IF "EA Transaction Type" = 0 THEN BEGIN
    //             ERROR('Please select EA Transaction Type');
    //           END;
    //         // prdp 210820 --

    //         IntDocNo  := "Integration Doc No" ;
    //         Post(CODEUNIT::"Sales-Post (Yes/No)");
    //         // added code to modify the status of raw data to posted ++
    //         RawData.RESET;
    //         RawData.SETRANGE(RawData."Integration Doc No",IntDocNo);
    //         IF RawData.FINDSET THEN REPEAT
    //         RawData.Status := 2;
    //         RawData.MODIFY ;
    //         UNTIL RawData.NEXT = 0 ;
    //         // added code to set canceeld status for document service master and policy master
    //         XmlRawCreditMemo.UpdateDocumentServiceMAster(IntDocNo);
    //         // added code to modify the status of raw data to posted --
    //         */
    //     //end;


    //     //Unsupported feature: Code Modification on "Action 35.OnAction".

    //     //trigger OnAction()
    //     //Parameters and return type have not been exported.
    //     //>>>> ORIGINAL CODE:
    //     //begin
    //         /*
    //         ShowPreview;
    //         */
    //     //end;
    //     //>>>> MODIFIED CODE:
    //     //begin
    //         /*
    //         // prdp - added validation to avoid posting if attachment missing +++
    //         {
    //           RecordLink.RESET;
    //           RecordLink.SETRANGE("No.","No.");
    //           IF NOT RecordLink.FINDFIRST THEN BEGIN
    //             ERROR('You can not post, file attachment is missing.');
    //           END;
    //           }//temp comment ++
    //         // prdp - added validation to avoid posting if attachment missing ---

    //         ShowPreview;
    //         */
    //     //end;
    //     addafter("Action 1500025")
    //     {
    //         action("Detailed GST")
    //         {
    //             Caption = 'Detailed GST';
    //             Image = ServiceTax;
    //             RunObject = Page "Detailed GST Entry Buffer";
    //             RunPageLink = "Transaction Type"=FILTER(Sales),
    //                           "Document Type"=FIELD("Document Type"),
    //                           "Document No."=FIELD("No.");
    //         }
    //     }
    //     addafter("Action 59")
    //     {
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
    //                                                               //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
    //                                                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
    //                                                            //FileName:=DELSTR('\\NAVLIVE\NAV File Import\'+ImportFileName.FILENAME,27,3);
    //                                                            FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,31,3);
    //                                                           // to convert the invoice no. in text format
    //                                                               OrderNo:=FORMAT("No.");

    //                                                           // to get the invoice no. starting from 5th charecter to avoid error due to '\'
    //                                                               No:= CONVERTSTR(OrderNo,'/','-');

    //                                                           // to get the FinalName of file that is to be copied to server
    //                                                           FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
    //                                                           // to get the path of destination folder at server from purchase & payable set up
    //                                                               GenLedSetup.RESET;
    //                                                               GenLedSetup.GET('');

    //                                                               IF GenLedSetup."Sales Cr Memo Attach. Path" = '' THEN
    //                                                                 ERROR('please add Sales Cr Memo Attch. Path in general ledger setup');

    //                                                             Destination:=GenLedSetup."Sales Cr Memo Attach. Path"+FinalName;
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
    //                                                         IF GenLedSetup."Sales Cr Memo Attach. Path" = '' THEN
    //                                                         ERROR('please add Sales Cr Memo Attach. Path in general ledger setup');
    //                                                         Destination:=GenLedSetup."Sales Cr Memo Attach. Path";
    //                                                         //Destination:='';
    //                                                            // MESSAGE(Destination);

    //                                                         IF UPLOAD('Upload File','','All Files (*.*)|*.*',FileName,Destination) THEN BEGIN

    //                                                           //MESSAGE(FileName);

    //                                                               RecordLink.RESET;
    //                                                               RecordLink."No.":="No.";
    //                                                               RecordLink.URL1:=Destination;
    //                                                               RecordLink."Attachement Name":=DELSTR(Destination,1,STRLEN(GenLedSetup."Sales Cr Memo Attach. Path"));
    //                                                               RecordLink.Created:=CURRENTDATETIME;
    //                                                               RecordLink."User ID":=USERID;
    //                                                               RecordLink.Company:=COMPANYNAME;
    //                                                               RecordLink.INSERT;

    //                                                             MESSAGE('Attached and Saved to Server');

    //                                                     END;
    //                 end;
    //             }
    //             action("Attach Policy Details")
    //             {
    //                 Image = Attach;
    //                 Promoted = true;

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


    //                     RecordLink.RESET;
    //                     RecordLink.SETRANGE("No.","No.");
    //                     RecordLink.SETRANGE("Policy Details",TRUE);
    //                     RecordLink.SETFILTER("Attachement Name",'<>%1','');
    //                     IF RecordLink.FINDFIRST THEN BEGIN
    //                       ERROR('Policy details are already attached for invoice %1',"No.");
    //                     END;

    //                                                     ImportFileName.RUN;

    //                                                      IF ImportFileName.FILENAME <> '' THEN BEGIN

    //                                                           // to get the path of the filename to be copied from client to server
    //                                                               //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
    //                                                            //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');
    //                                                            FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);
    //                                                           // to convert the invoice no. in text format
    //                                                               OrderNo:=FORMAT("No.");

    //                                                           // to get the invoice no. starting from 5th charecter to avoid error due to '\'
    //                                                               No:= CONVERTSTR(OrderNo,'/','-');

    //                                                           // to get the FinalName of file that is to be copied to server
    //                                                           FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
    //                                                           // to get the path of destination folder at server from purchase & payable set up
    //                                                               GenLedSetup.RESET;
    //                                                               GenLedSetup.GET('');

    //                                                               IF GenLedSetup."Policy Details Attachment" = '' THEN
    //                                                                 ERROR('please add Policy Details Attachment Path in general ledger setup');

    //                                                             Destination:=GenLedSetup."Policy Details Attachment"+FinalName;
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
    //                                                               RecordLink.URL3:=Extension;
    //                                                               RecordLink.Created:=CURRENTDATETIME;
    //                                                               RecordLink."User ID":=USERID;
    //                                                               RecordLink.Company:=COMPANYNAME;
    //                                                               RecordLink."Policy Details":=TRUE;
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
    //             action("Files Attached")
    //             {
    //                 Image = Links;
    //                 Promoted = true;
    //                 RunObject = Page 50014;
    //                 RunPageLink = No.=FIELD(No.);
    //             }
    //         }
    //     }
    // }

    // var
    //     IntDocNo: Code[30];
    //     RawData: Record "50004";
    //     XmlRawCreditMemo: XMLport "50002";

    // var
    //     GSTManagement: Codeunit "16401";

    // var
    //     RecordLink: Record "2000000068";
    //     RecShipToAddress: Record "222";
    //     RecLoc: Record "14";


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
//}

        }
    }
}