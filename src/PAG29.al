// pageextension 50014 VendorLedgerEntries extends "Vendor Ledger Entries"
// {
//     layout
//     {
//         // Add changes to page layout here
//         addafter("Document No.")
//         {
//             field("Closed by Entry No."; Rec."Closed by Entry No.")
//             {
//                 ApplicationArea = all;
//             }

//         }
//         addafter("Creditor No.")
//         {
//             field("Invoice Amount"; rec."Purchase (LCY)")
//             {
//                 Caption = 'Invoice Amount';
//                 Editable = false;
//                 ApplicationArea = all;
//             }
//             field("GST Amount"; rec."GST Amount")
//             {
//                 ApplicationArea = all;
//             }
//             field("TDS Amount"; rec."TDS Amount")
//             {
//                 ApplicationArea = all;
//             }
//         }
//         addafter("Exported to Payment File")
//         {

//             field(Narration; rec.Narration)
//             {
//             }
//             field("Reference Invoice Number"; Rec."Reference Invoice Number")
//             {
//                 Editable = false;
//             }
//             field("Integration Document No"; Rec."Integration Document No")
//             {
//                 Editable = false;
//             }
//             field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
//             {
//             }
//             field("Invoice Date"; Rec."Invoice Date")
//             {
//                 Editable = false;
//             }
//             field("Payment Status Code"; Rec."Payment Status Code")
//             {
//             }
//             field("Payment Status"; Rec."Payment Status")
//             {
//             }
//             field("Vendor PAN No."; Rec."Vendor PAN No.")
//             {
//             }
//             field("Icici Payment Status"; Rec."Icici Payment Status")
//             {
//             }
//             field("Customer Ref. No."; Rec."Customer Ref. No.")
//             {
//             }
//             field("UTR No."; Rec."UTR No.")
//             {
//                 Editable = false;
//             }
//             field("GST Payment"; Rec."GST Payment")
//             {
//             }
//             field("GST Paid"; Rec."GST Paid")
//             {
//             }
//             field("UTR Sent to Middleware"; Rec."UTR Sent to Middleware")
//             {
//             }
//             field("Date Credited in Bank"; Rec."Date Credited in Bank")
//             {
//             }
//             field("Date Credited in Bank1"; Rec."Date Credited in Bank1")
//             {
//             }
//             field("PO Number"; Rec."PO Number")
//             {
//                 Editable = false;
//             }
//             field("PO Date"; Rec."PO Date")
//             {
//                 Editable = false;
//             }
//             field("Billing Type"; Rec."Billing Type")
//             {
//                 Editable = false;
//             }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//         addafter("&Navigate")
//         {
//             action("Upload Amt To Apply")
//             {
//                 // RunObject = XMLport 50025;
//             }
//             action("Files Attached")
//             {
//                 Image = Links;
//                 Promoted = true;
//                 // RunObject = Page 
//                 // RunPageLink = URL2 = FIELD(Document No.);

//                 trigger OnAction()
//                 var
//                     PurchInvHdr: Record "Purch. Inv. Header";
//                 begin
//                     PurchInvHdr.RESET;
//                     PurchInvHdr.SETRANGE("No.", "Document No.");
//                     IF PurchInvHdr.FINDFIRST THEN BEGIN

//                         RecordLink.RESET;
//                         RecordLink.SETRANGE("No.", PurchInvHdr."Pre-Assigned No.");
//                         RecordLink.SETRANGE(URL2, '');
//                         IF RecordLink.FINDFIRST THEN BEGIN
//                             RecordLink.URL2 := PurchInvHdr."No.";
//                             RecordLink.MODIFY;
//                         END;

//                     END;

//                     //CCIT-03012022
//                     RecPurchCrMemoH.RESET;
//                     RecPurchCrMemoH.SETRANGE("No.", "Document No.");
//                     IF RecPurchCrMemoH.FINDFIRST THEN BEGIN

//                         RecordLink.RESET;
//                         RecordLink.SETRANGE("No.", RecPurchCrMemoH."Pre-Assigned No.");
//                         RecordLink.SETRANGE(URL2, '');
//                         IF RecordLink.FINDFIRST THEN BEGIN
//                             RecordLink.URL2 := RecPurchCrMemoH."No.";
//                             RecordLink.MODIFY;
//                         END;

//                     END;
//                     //CCIT-03012022
//                 end;
//             }
//             action(Recall)
//             {
//                 Image = ReturnOrder;
//                 Promoted = true;
//                 Visible = false;

//                 trigger OnAction()
//                 var
//                     RecPurchHeader: Record "Purchase Header";
//                 begin

//                     // prdp 151020 ++

//                     IF NOT CONFIRM('Do you want to recall this invoice %1', FALSE, "Integration Document No")
//                             THEN
//                         EXIT;

//                     CALCFIELDS(Amount);
//                     CALCFIELDS("Remaining Amount");

//                     IF ((Open = TRUE) AND (Amount = "Remaining Amount")) THEN BEGIN

//                         CrMemoNo := '';

//                         Purch_HDRInsert.INIT;
//                         Purch_HDRInsert."Document Type" := Purch_HDRInsert."Document Type"::"Credit Memo";
//                         PurchpayablesSetup.GET('');
//                         CrMemoNo := NoSeriesManagement.GetNextNo(PurchpayablesSetup."Credit Memo Nos.", WORKDATE, TRUE);
//                         Purch_HDRInsert."No." := CrMemoNo;
//                         Purch_HDRInsert."Vendor Cr. Memo No." := "Document No.";
//                         Purch_HDRInsert.INSERT;


//                         RecPurchHeader.RESET;
//                         RecPurchHeader.SETRANGE(RecPurchHeader."Document Type", RecPurchHeader."Document Type"::"Credit Memo");
//                         RecPurchHeader.SETRANGE("No.", CrMemoNo);
//                         IF RecPurchHeader.FINDFIRST THEN BEGIN
//                             CopyPurchDoc.SetPurchHeader(RecPurchHeader);
//                             CopyPurchDoc.RUN;
//                             CLEAR(CopyPurchDoc);
//                             //IF GET(RecPurchHeader."Document Type",RecPurchHeader."No.") THEN;
//                         END;

//                         RecPurchHeader.RESET;
//                         RecPurchHeader.SETRANGE("No.", CrMemoNo);
//                         IF RecPurchHeader.FINDFIRST THEN BEGIN

//                             RecPurchLine.RESET;
//                             RecPurchLine.SETRANGE("Document No.", RecPurchHeader."No.");
//                             RecPurchLine.SETRANGE("Line No.", 10000);
//                             IF RecPurchLine.FINDFIRST THEN BEGIN
//                                 RecPurchLine.DELETE;
//                             END;

//                         END;



//                         PINo := '';
//                         PostDate := 0D;
//                         VendNo := '';
//                         TransNo := '';
//                         InvType := '';

//                         Purch_HDRInsert.RESET;
//                         Purch_HDRInsert.SETRANGE(Purch_HDRInsert."Document Type", Purch_HDRInsert."Document Type"::"Credit Memo");
//                         Purch_HDRInsert.SETRANGE(Purch_HDRInsert."No.", CrMemoNo);
//                         IF Purch_HDRInsert.FINDFIRST THEN BEGIN

//                             IF ((Purch_HDRInsert."Applies-to Doc. Type" = Purch_HDRInsert."Applies-to Doc. Type"::Invoice) AND (Purch_HDRInsert."Applies-to Doc. No." <> '')) THEN BEGIN
//                                 PINo := Purch_HDRInsert."Applies-to Doc. No.";
//                                 PostDate := Purch_HDRInsert."Posting Date";
//                                 VendNo := Purch_HDRInsert."Buy-from Vendor No.";
//                                 TransNo := Purch_HDRInsert."Integration Doc No";
//                                 InvType := Purch_HDRInsert."Integrated Invoice Type";

//                             END;

//                             PurchPost.RUN(Purch_HDRInsert);

//                             COMMIT;
//                         END;

//                         PurchCrMemoHdr.RESET;
//                         PurchCrMemoHdr.SETRANGE("Pre-Assigned No.", CrMemoNo);
//                         PurchCrMemoHdr.SETRANGE("Applies-to Doc. No.", PINo);
//                         IF PurchCrMemoHdr.FINDFIRST THEN BEGIN

//                             PostTDSAdj.InitTaxJnlLine(PINo, PostDate, VendNo);

//                         END;

//                         COMMIT;

//                         IF ((TransNo <> '') AND (InvType <> '')) THEN BEGIN
//                             updateVendorStatus(TransNo, InvType);
//                         END;

//                     END;
//                     // prdp 151020 --
//                 end;
//             }
//         }
//     }

//     var
//         myInt: Integer;
//         Purch_HDRInsert: Record "Purchase Header";
//         PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
//         // CrMemoNo: Code[20];
//         RecVendor: Record Vendor;
//         RecordLink: Record "Record Link";
//         CopyPurchDoc: Codeunit "Recalling API";
//         // Purch_HDRInsert: Record "Purchase Header";
//         CrMemoNo: Code[20];
//         PurchpayablesSetup: Record "Purchases & Payables Setup";
//         NoSeriesManagement: Codeunit "Posting No. Series Mgmt.";
//         RecPurchLine: Record "Purchase Line";
//         PurchPost: Codeunit "Purch.-Post";
//         PINo: Code[20];
//         VendNo: Code[20];
//         PostTDSAdj: Codeunit "Post TDS Adj & Apply";
//         PostDate: Date;
//         InvType: Text[20];
//         TransNo: Code[20];
//         recVLE: Record "Vendor Ledger Entry";
//         RecPurchCrMemoH: Record "Purch. Cr. Memo Hdr.";

//      [TryFunction]
//     procedure updateVendorStatus(transactionNo: Code[20];invoiceType: Text[20])
//     var
//         HttpWebRequestMgt: Codeunit "1297";
//         Url: Text;
//         Json: Text;
//         HttpStatusCode: DotNet HttpStatusCode;
//         ResponseHeaders: DotNet NameValueCollection;
//         REGAccessLevelEnum: Codeunit "8";
//         PostUrl: Text;
//         Params: Text;
//         JObject: DotNet JObject;
//         Registration: Record "3";
//         ApiResult: Text;
//         TempBlob: Record "99008535";
//         RequestBlob: Record "99008535";
//         Instr: InStream;
//         body: Text;
//         vend: Record "23";
//         RegistrationSuccess: Label 'Successfully Created';
//         RegistrationError: Label 'Error when contacting api';
//     begin

//         //PostUrl:='http://3.6.111.9:3002/api/navision/recallInvoice';
//         PostUrl:='https://apinavintegeai.europassistance.in/api/navision/recallInvoice';

//         HttpWebRequestMgt.Initialize(PostUrl);

//         HttpWebRequestMgt.DisableUI;

//         HttpWebRequestMgt.SetMethod('POST');
//         HttpWebRequestMgt.SetContentType('application/json');
//         HttpWebRequestMgt.SetReturnType('application/json');
//         HttpWebRequestMgt.AddHeader('app-name','Navision');
//         HttpWebRequestMgt.AddHeader('x-token','241a4d366da38e2d53361dbe65a36d023065f399');

//         body:='{"transactionNo":"'+transactionNo+'"'+','+'"invoiceType":"'+invoiceType+'"}';

//         HttpWebRequestMgt.AddBodyAsText(body);

//         TempBlob.INIT;

//         TempBlob.Blob.CREATEINSTREAM(Instr);

//         IF HttpWebRequestMgt.GetResponse(Instr,HttpStatusCode,ResponseHeaders) THEN BEGIN

//         // MESSAGE('httpstatuscode : '+HttpStatusCode.ToString);

//         // MESSAGE(ResponseHeaders.ToString);

//          ApiResult := TempBlob.ReadAsText('',TEXTENCODING::UTF8);

//          //MESSAGE(ApiResult);

//          JObject:=JObject.Parse(ApiResult);

//         recVLE.RESET;
//         recVLE.SETRANGE("Document No.","Document No.");
//         IF recVLE.FINDFIRST THEN BEGIN
//           recVLE."Recall Response":=JObject.GetValue('statusCode').ToString;
//           recVLE.MODIFY;
//         END;

//            MESSAGE(JObject.GetValue('statusCode').ToString+'-'+JObject.GetValue('message').ToString);


//         END ELSE BEGIN

//           MESSAGE('2'+RegistrationError);

//         END;
//     end;
// }