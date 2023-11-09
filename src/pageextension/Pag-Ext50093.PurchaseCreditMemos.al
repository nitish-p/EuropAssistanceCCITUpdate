pageextension 50093 "Purchase Credit Memos" extends "Purchase Credit Memos"
{
    layout
    {
        // modify("Control 113.OnLookup")
        // {
        //     Visible = false;
        //     ApplicationArea = All;
        // }
        // modify("Control 111.OnLookup")
        // {
        //     Visible = false;
        //     ApplicationArea = All;
        // }
        addafter("Applies-to Doc. Type")
        {
            field("Vendor Invoice No."; Rec."Vendor Invoice No.")
            {
                ApplicationArea = All;
            }
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
            field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
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
        IF "Reference Invoice Number" = '' THEN
        ERROR('Add Reference Invoice Number');

        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
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

        // prdp 150420 ++
        CrMemoNo:="No.";;
        PINo:='';
        PostDate:=0D;
        VendNo:='';

        IF (("Applies-to Doc. Type"="Applies-to Doc. Type"::Invoice) AND ("Applies-to Doc. No." <> '')) THEN BEGIN
          PINo:="Applies-to Doc. No.";
          PostDate:="Posting Date";
          VendNo:="Buy-from Vendor No.";
        END;

        // prdp 150420 --

        SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");

        // prdp 150420 ++
        COMMIT;
        PurchCrMemoHdr.RESET;
        PurchCrMemoHdr.SETRANGE("Pre-Assigned No.",CrMemoNo);
        PurchCrMemoHdr.SETRANGE("Applies-to Doc. No.",PINo);
        IF PurchCrMemoHdr.FINDFIRST THEN BEGIN
        PostTDSAdj.InitTaxJnlLine(PINo,PostDate,VendNo);
        END;
        // prdp 150420 --
        */
        //end;
        //         addafter("Action 50")
        //         {
        //             group(Attach)
        //             {
        //                 Caption = 'Attach';
        //                 action("Attach File1")
        //                 {
        //                     Image = Attach;
        //                     Promoted = true;
        //                     Visible = false;

        //                     trigger OnAction()
        //                     var
        //                         RecordLink: Record "2000000068";
        //                         FileName: Text[250];
        //                         ImportFileName: XMLport "50012";
        //                         OrderNo: Code[30];
        //                         No: Text[250];
        //                         TimeStamp: Text[100];
        //                         FinalName: Text[250];
        //                         Timer: Text[100];
        //                         Timer1: Text[100];
        //                         Source: Text[250];
        //                         Destination: Text[250];
        //                         ActiveSession: Record "2000000110";
        //                         User: Record "2000000120";
        //                         UserPath: Text[250];
        //                         UserName: Text[100];
        //                         ActSession: Record "2000000110";
        //                         GenLedSetup: Record "98";
        //                         Extension: Text[100];
        //                         Length: Integer;
        //                         StartPt: Integer;
        //                         Temp: Text[250];
        //                         FileManagement: Codeunit "419";
        //                     begin

        //                           // prdp +++
        //                                                         ImportFileName.RUN;

        //                                                          IF ImportFileName.FILENAME <> '' THEN BEGIN

        //                                                               // to get the path of the filename to be copied from client to server
        //                                                                   //FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
        //                                                                //  FileName:=DELCHR(UserPath+ImportFileName.FILENAME,'=',':');

        //                                                                FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);


        //                                                               // to convert the invoice no. in text format
        //                                                                   OrderNo:=FORMAT("No.");

        //                                                               // to get the invoice no. starting from 5th charecter to avoid error due to '\'
        //                                                                   No:= CONVERTSTR(OrderNo,'/','-');

        //                                                               // to get the FinalName of file that is to be copied to server
        //                                                               FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
        //                                                               // to get the path of destination folder at server from purchase & payable set up
        //                                                                   GenLedSetup.RESET;
        //                                                                   GenLedSetup.GET('');

        //                                                                   IF GenLedSetup."Purch Cr Memo Attach. Path" = '' THEN
        //                                                                     ERROR('please add Purch Cr Memo Attach. Path in general ledger setup');

        //                                                                 Destination:=GenLedSetup."Purch Cr Memo Attach. Path"+FinalName;
        //                                                                // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

        //                                                               // to get the extension of file to be copied
        //                                                                   Temp:=ImportFileName.FILENAME;
        //                                                                   StartPt:=STRPOS(Temp,'.');
        //                                                                   Length:=STRLEN(Temp);
        //                                                                   Extension:=COPYSTR(Temp,StartPt,Length);

        //                                                               // to insert the link in record link table
        //                                                                   RecordLink.RESET;
        //                                                                   RecordLink."No.":="No.";
        //                                                                   RecordLink.SourcerPath:=FileName;
        //                                                                   RecordLink."Attachement Name":=FinalName;
        //                                                                   RecordLink.URL1:=Destination+Extension;
        //                                                                   RecordLink.Created:=CURRENTDATETIME;
        //                                                                   RecordLink."User ID":=USERID;
        //                                                                   RecordLink.Company:=COMPANYNAME;
        //                                                                   RecordLink.INSERT;


        //                                                               // to copy the file to server
        //                                                                  FILE.COPY(FileName,Destination+Extension);
        //                                                                 MESSAGE('Attached and Saved to Server');

        //                                                         END;


        //                                                               // clear the XMLPORT to avoid error after 1st file attach & attach multiple files at a time
        //                                                                   CLEAR(ImportFileName);

        //                         // prdp ---
        //                     end;
        //                 }
        //                 action("Attach File")
        //                 {
        //                     Image = Attach;
        //                     Promoted = true;

        //                     trigger OnAction()
        //                     var
        //                         FileName: Text;
        //                         RecordLink: Record "2000000068";
        //                         ImportFileName: XMLport "50012";
        //                         OrderNo: Code[30];
        //                         No: Text[250];
        //                         TimeStamp: Text[100];
        //                         FinalName: Text[250];
        //                         Timer: Text[100];
        //                         Timer1: Text[100];
        //                         Source: Text[250];
        //                         Destination: Text[250];
        //                         ActiveSession: Record "2000000110";
        //                         User: Record "2000000120";
        //                         UserPath: Text[250];
        //                         UserName: Text[100];
        //                         ActSession: Record "2000000110";
        //                         GenLedSetup: Record "98";
        //                         Extension: Text[100];
        //                         Length: Integer;
        //                         StartPt: Integer;
        //                         Temp: Text[250];
        //                         FileManagement: Codeunit "419";
        //                     begin

        //                                                             GenLedSetup.GET('');
        //                                                             IF GenLedSetup."Purch Cr Memo Attach. Path" = '' THEN
        //                                                             ERROR('please add Purch Cr Memo Attach. Path in general ledger setup');
        //                                                             Destination:=GenLedSetup."Purch Cr Memo Attach. Path";
        //                                                             //Destination:='';
        //                                                                // MESSAGE(Destination);

        //                                                             IF UPLOAD('Upload File','','All Files (*.*)|*.*',FileName,Destination) THEN BEGIN

        //                                                               //MESSAGE(FileName);

        //                                                                   RecordLink.RESET;
        //                                                                   RecordLink."No.":="No.";
        //                                                                   RecordLink.URL1:=Destination;
        //                                                                   RecordLink."Attachement Name":=DELSTR(Destination,1,STRLEN(GenLedSetup."Purch Cr Memo Attach. Path"));
        //                                                                   RecordLink.Created:=CURRENTDATETIME;
        //                                                                   RecordLink."User ID":=USERID;
        //                                                                   RecordLink.Company:=COMPANYNAME;
        //                                                                   RecordLink.INSERT;

        //                                                                 MESSAGE('Attached and Saved to Server');

        //                                                         END;
        //                     end;
        //                 }
        //                 action("Files Attached")
        //                 {
        //                     Image = Links;
        //                     Promoted = true;
        //                     RunObject = Page 50014;
        //                     RunPageLink = No.=FIELD(No.);
        //                 }
        //             }
        //             group(Upload)
        //             {
        //                 Caption = 'Upload';
        //                 action("Credit Memo Upload")
        //                 {
        //                     Promoted = true;
        //                     RunObject = XMLport 50025;
        //                 }
        //             }
        //         }
        //     }

        //     var
        //         PINo: Code[20];
        //         VendNo: Code[20];
        //         PostDate: Date;
        //         PostTDSAdj: Codeunit "50004";
        //         CrMemoNo: Code[20];
        //         PurchCrMemoHdr: Record "124";
    }
}


