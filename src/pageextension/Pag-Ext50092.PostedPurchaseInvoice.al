pageextension 50092 "Posted Purchase Invoice" extends "Posted Purchase Invoice"
{

    layout
    {
        // modify("Control 104")
        // {
        //     Visible = false;
        // }
        addafter("No. Printed")
        {
            field("Invoice Date"; Rec."Invoice Date")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
        addafter("Purchaser Code")
        {
            field("Integration Doc No"; Rec."Integration Doc No")
            {
                ApplicationArea = All;
            }
        }
        addafter("Responsibility Center")
        {
            field("Manual Invoice"; Rec."Manual Invoice")
            {
                ApplicationArea = All;
            }
            field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
            {
                ApplicationArea = All;
            }
            // field(State;rec.State)
            // {
            // }
            field("Payment Due Date"; Rec."Payment Due Date")
            {
                ApplicationArea = All;
            }
            field("PO Number"; Rec."Vendor Order No.")
            {
                Caption = 'PO Number';
                ApplicationArea = All;
                Editable = false;
            }
            field("PO Date"; Rec."Order Date")
            {
                Caption = 'PO Date';
                ApplicationArea = All;
                Editable = false;
            }
            field("Billing Type"; Rec."Billing Type")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
        addafter("Nature of Supply")
        {
            // field("Nature of Supply";Rec."Nature of Supply")
            // {
            // }
            field("GST Vendor Type"; Rec."GST Vendor Type")
            {
                ApplicationArea = All;
            }
            // field("Invoice Type";Rec."Invoice Type")
            // {
            // }
            // field("Associated Enterprises";Rec."Associated Enterprises")
            // {
            // }
            // field("Bill of Entry No.";Rec."Bill of Entry No.")
            // {
            // }
            // field("Bill of Entry Date";Rec."Bill of Entry Date")
            // {
            // }
            // field("Bill of Entry Value";Rec."Bill of Entry Value")
            // {
            // }
        }
    }
    //     actions
    //     {
    //         addafter(IncomingDocAttachFile)
    //         {
    //             action("Print Voucher")
    //             {
    //                 Caption = 'Print Voucher';
    //                 Ellipsis = true;
    //                 Image = PrintVoucher;
    //                 Promoted = true;

    //                 trigger OnAction()
    //                 var
    //                     GLEntry: Record "17";
    //                 begin
    //                     GLEntry.SETCURRENTKEY("Document No.","Posting Date");
    //                     GLEntry.SETRANGE("Document No.","No.");
    //                     GLEntry.SETRANGE("Posting Date","Posting Date");
    //                     IF GLEntry.FINDFIRST THEN
    //                       REPORT.RUNMODAL(REPORT::"Posted Voucher",TRUE,TRUE,GLEntry);
    //                 end;
    //             }
    //             group(Attachments)
    //             {
    //                 action("Attach File")
    //                 {
    //                     Image = Attach;
    //                     Promoted = true;

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
    //                                                                //   FileName:=DELSTR('\\172.16.5.3\Nav Attachment\'+ImportFileName.FILENAME,29,3);
    //                                                                 //FileName:=ImportFileName.FILENAME;
    //                                                                 FileName:=DELSTR('\\EAINPNAV004\NAV File Import\'+ImportFileName.FILENAME,27,3);

    //                                                               // to convert the invoice no. in text format
    //                                                                   OrderNo:=FORMAT("No.");

    //                                                               // to get the invoice no. starting from 5th charecter to avoid error due to '\'
    //                                                                   No:= CONVERTSTR(OrderNo,'/','-');

    //                                                               // to get the FinalName of file that is to be copied to server
    //                                                               FinalName:=COPYSTR(FileManagement.GetFileNameWithoutExtension(ImportFileName.FILENAME),1,MAXSTRLEN(FinalName));
    //                                                               // to get the path of destination folder at server from purchase & payable set up
    //                                                                   GenLedSetup.RESET;
    //                                                                   GenLedSetup.GET('');

    //                                                                   IF GenLedSetup."Purch.Inv. Attach. Path" = '' THEN
    //                                                                     ERROR('please add Purch.Inv. Attach. Path in general ledger setup');

    //                                                                 Destination:=GenLedSetup."Purch.Inv. Attach. Path"+FinalName;
    //                                                                // Destination:=DELCHR(GenLedSetup."Purchase Invoice Path",'=',':')+FinalName;

    //                                                               // to get the extension of file to be copied
    //                                                                   Temp:=ImportFileName.FILENAME;
    //                                                                   StartPt:=STRPOS(Temp,'.');
    //                                                                   Length:=STRLEN(Temp);
    //                                                                   Extension:=COPYSTR(Temp,StartPt,Length);

    //                                                               // to insert the link in record link table
    //                                                                   RecordLink.RESET;
    //                                                                   RecordLink."No.":="Pre-Assigned No.";
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
    //                 action("Attached Files")
    //                 {
    //                     Image = Links;
    //                     Promoted = true;
    //                     RunObject = Page 50014;
    //                     RunPageLink = No.=FIELD(Pre-Assigned No.);
    //                 }
    //             }
    //             group("Recall Invoice")
    //             {
    //                 Caption = 'Recall Invoice';
    //                 action(Recall)
    //                 {
    //                     Image = ReturnOrder;
    //                     Promoted = true;

    //                     trigger OnAction()
    //                     begin

    //                         IF NOT CONFIRM('Do you want to recall this invoice %1',FALSE,"Integration Doc No")
    //                                 THEN
    //                                  EXIT;

    //                         VLE.RESET;
    //                         VLE.SETRANGE(VLE."Document Type",VLE."Document Type"::Invoice);
    //                         VLE.SETRANGE("Document No.","No.");
    //                         VLE.SETRANGE(Open,TRUE);
    //                         VLE.SETFILTER(Amount,'<%1',0);
    //                         IF VLE.FINDFIRST THEN BEGIN

    //                         VLE.CALCFIELDS(VLE.Amount);
    //                         VLE.CALCFIELDS(VLE."Remaining Amount");

    //                         IF VLE.Amount=VLE."Remaining Amount" THEN BEGIN

    //                         IntDocNo:='';
    //                         IntDocNo:=COPYSTR("Integration Doc No",1,1)+COPYSTR(LOWERCASE("Integration Doc No"),2,STRLEN("Integration Doc No"));

    //                         IF ((IntDocNo <> '') AND ("Integrated Invoice Type" <> '')) THEN BEGIN
    //                         Recall(IntDocNo,"Integrated Invoice Type");
    //                         END;

    //                         END;
    //                         END;

    //                         // prdp 151020 --
    //                     end;
    //                 }
    //             }
    //         }
    //     }

    //     var
    //         Purch_HDRInsert: Record "38";
    //         CrMemoNo: Code[20];
    //         PurchpayablesSetup: Record "312";
    //         NoSeriesManagement: Codeunit "396";
    //         RecPurchLine: Record "39";
    //         CopyPurchDoc: Codeunit "50007";
    //         VLE: Record "25";
    //         PurchPost: Codeunit "90";
    //         PINo: Code[20];
    //         VendNo: Code[20];
    //         PostTDSAdj: Codeunit "50004";
    //         PostDate: Date;
    //         PurchCrMemoHdr: Record "124";
    //         InvType: Text[20];
    //         TransNo: Code[20];
    //         recVLE: Record "25";
    //         IntDocNo: Text[30];
}


