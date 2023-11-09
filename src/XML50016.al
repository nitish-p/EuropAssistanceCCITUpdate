// xmlport 50016 "IMPS IMPORT"
// {
//     Direction = Import;
//     // Encoding = UTF8;
//     FileName = 'dummy.csv';
//     Format = VariableText;
//     Permissions = TableData 271 = rimd;
//     UseRequestPage = false;

//     schema
//     {
//         textelement(root)
//         {
//             tableelement("IMPS Import Bridge"; "B2B Monthwise Client Invoicing")
//             {
//                 XmlName = 'IMPSimport';
//                 fieldelement(IMPSReferenceNo; "IMPS Import Bridge"."Entry No.")
//                 {
//                 }
//                 fieldelement(RequestId; "IMPS Import Bridge"."Case ID")
//                 {
//                 }
//                 fieldelement(TransactionDate; "IMPS Import Bridge"."Client Name")
//                 {
//                 }
//                 fieldelement(TransactionType; "IMPS Import Bridge"."Invoicing Month")
//                 {
//                 }
//                 fieldelement(TransactionInfo; "IMPS Import Bridge"."Amount For Policies")
//                 {
//                 }
//                 fieldelement(RemitterMobileNumber; "IMPS Import Bridge"."NAV Dealer Code")
//                 {
//                 }
//                 fieldelement(RemitterMMID; "IMPS Import Bridge"."NAV Dealer Name")
//                 {
//                 }
//                 fieldelement(RemitterName; "IMPS Import Bridge"."Start Date")
//                 {
//                 }
//                 fieldelement(BeneficiaryName; "IMPS Import Bridge"."End Date")
//                 {
//                 }
//                 fieldelement(BeneMerchantMobileNumber; "IMPS Import Bridge"."Invoice Pdf")
//                 {
//                 }
//                 fieldelement(BeneMerchantMMID; "IMPS Import Bridge".Particulars)
//                 {
//                 }
//                 fieldelement(PaymentRefNumber; "IMPS Import Bridge"."Active Policies")
//                 {
//                 }
//                 fieldelement(MCC; "IMPS Import Bridge"."Client Id")
//                 {
//                 }
//                 fieldelement(Amount; "IMPS Import Bridge"."Dealer Id")
//                 {
//                 }
//                 fieldelement(DebitAccounNumber; "IMPS Import Bridge"."Dealer Code")
//                 {
//                 }
//                 fieldelement(CreditAccountNumber; "IMPS Import Bridge"."Posted Invoice No.")
//                 {
//                 }
//                 fieldelement(Status; "IMPS Import Bridge"."Posted Invoice Amount")
//                 {
//                 }
//                 fieldelement(MSPID; "IMPS Import Bridge"."Digital Invoice")
//                 {
//                 }
//                 fieldelement(ResponceCode; "IMPS Import Bridge"."Transaction Type")
//                 {
//                 }
//                 fieldelement(Description; "IMPS Import Bridge"."Invoice Posted")
//                 {
//                 }
//                 fieldelement(ReversalFlag; "IMPS Import Bridge"."Posting Date")
//                 {
//                 }
//                 fieldelement(RemitterAccountNumber; "IMPS Import Bridge".Field22)
//                 {
//                 }
//                 fieldelement(BeneficiaryAccountNumber; "IMPS Import Bridge".Field23)
//                 {
//                 }
//                 fieldelement(BeneIFSC; "IMPS Import Bridge".Field24)
//                 {
//                 }
//                 fieldelement(TransactionCurrency; "IMPS Import Bridge".Field25)
//                 {
//                 }

//                 trigger OnBeforeInsertRecord()
//                 begin

//                     "B2B Monthwise Client Invoicing"."CASE ID" := CASIDTEXT;
//                     RowNo := RowNo + 1;

//                     "B2B Monthwise Client Invoicing"."File Name" := currXMLport.FILENAME;
//                     "B2B Monthwise Client Invoicing"."Row Number" := RowNo;
//                     "B2B Monthwise Client Invoicing".Status1 := 0;
//                     "B2B Monthwise Client Invoicing"."Imported Date" := TODAY;
//                     "B2B Monthwise Client Invoicing"."Imported Time" := TIME;
//                     "B2B Monthwise Client Invoicing"."User ID" := USERID;
//                 end;
//             }
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     trigger OnPostXmlPort()
//     begin
//         ValidatedRawData(CASIDTEXT);
//     end;

//     trigger OnPreXmlPort()
//     begin
//         RowNo := 0;
//         CASIDTEXT := USERID + FORMAT(CURRENTDATETIME);
//     end;

//     var
//         RowNo: Integer;
//         CASIDTEXT: Text;
//         PayRefNo: Code[20];
//         RecBALE: Record "Bank Account Ledger Entry";
//         EvaluatedEntryNo: Integer;
//         RecBankAcc: Record "Bank Account";
//         RecVendor: Record "Vendor";
//         RecVenBalAcc: Record "Vendor Bank Account";
//         BankAccLedEntry: Record "Bank Account Ledger Entry";

//     local procedure ValidatedRawData(CASEID: Code[250])
//     var
//         RawUpdateLog: Record "B2B Monthwise Client Invoicing";
//         FoundError: Boolean;
//         RawUpdateLog2: Record "B2B Monthwise Client Invoicing";
//         XMLRejectMaster: XMLport "50017";
//     begin
//         FoundError := FALSE;


//         RawUpdateLog.RESET;
//         RawUpdateLog.SETRANGE(RawUpdateLog."CASE ID", CASEID);
//         RawUpdateLog.SETRANGE(RawUpdateLog.Validated, FALSE);
//         IF RawUpdateLog.FINDSET THEN
//             REPEAT

//                 IF RawUpdateLog."Entry No." = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'IMPS Ref No should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Case ID" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Request ID should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 /*
//                 IF  RawUpdateLog."Transaction Date" = 0DT THEN BEGIN
//                  RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';'+ 'Transaction date should not be blank';
//                  FoundError := TRUE ;
//                 END;
//                */

//                 IF RawUpdateLog."Invoicing Month" = 0 THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Transaction type should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Amount For Policies" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Transaction info should not be blank';
//                     FoundError := TRUE;
//                 END;
//                 /*
//                 IF  RawUpdateLog."Remitter Mobile Number" = '' THEN BEGIN
//                  RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';'+ 'Remitter Mobile Number should not be blank';
//                  FoundError := TRUE ;
//                 END;

//                 IF  RawUpdateLog."Remitter MMID" = '' THEN BEGIN
//                  RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';'+ 'Remitter MMID should not be blank';
//                  FoundError := TRUE ;
//                 END;
//                 */
//                 IF RawUpdateLog."Start Date" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Remitter name should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."End Date" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Beneficiary Name should not be blank';
//                     FoundError := TRUE;
//                 END;
//                 /*
//               IF  RawUpdateLog."Bene Merchant Mobile Number" = '' THEN BEGIN
//                RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';'+ 'Bene Merchant Mobile Number should not be blank';
//                FoundError := TRUE ;
//               END;

//               IF  RawUpdateLog."Bene Merchant MMID" = '' THEN BEGIN
//                RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';'+ 'Bene Merchant MMID should not be blank';
//                FoundError := TRUE ;
//               END;
//               */
//                 IF RawUpdateLog."Active Policies" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Payment ref. no should not be blank';
//                     FoundError := TRUE;
//                 END;


//                 IF RawUpdateLog."Active Policies" <> '' THEN BEGIN
//                     PayRefNo := COPYSTR(RawUpdateLog."Active Policies", 1, 16);
//                 END;

//                 RecBALE.RESET;
//                 RecBALE.SETRANGE(RecBALE."Refrence No.", PayRefNo);
//                 IF RecBALE.FINDFIRST THEN BEGIN
//                     IF RecBALE.Identifier <> RawUpdateLog."Active Policies" THEN BEGIN
//                         RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Invalid Payment ref. no';
//                     END;
//                 END;

//                 IF RawUpdateLog."Client Id" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'MCC should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Dealer Id" = 0 THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Ammount should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Dealer Code" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Debit Account no should not be blank';
//                     FoundError := TRUE;
//                 END;


//                 RecBALE.RESET;
//                 RecBALE.SETRANGE(RecBALE.Identifier, RawUpdateLog."Active Policies");
//                 IF RecBALE.FINDFIRST THEN BEGIN
//                     RecBankAcc.RESET;
//                     RecBankAcc.SETRANGE(RecBankAcc."No.", RecBALE."Bank Account No.");
//                     IF RecBankAcc.FINDFIRST THEN BEGIN
//                         IF RecBankAcc."Bank Account No." <> FORMAT(RawUpdateLog."Dealer Code") THEN BEGIN
//                             RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Invalid Debit Account no';
//                             FoundError := TRUE;
//                         END;
//                     END;
//                 END;


//                 IF RawUpdateLog."Posted Invoice No." = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'credit Account no should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 RecBALE.RESET;
//                 RecBALE.SETRANGE(RecBALE.Identifier, RawUpdateLog."Active Policies");
//                 RecBALE.SETRANGE(RecBALE."Bal. Account Type", RecBALE."Bal. Account Type"::Vendor);
//                 IF RecBALE.FINDFIRST THEN BEGIN
//                     RecVendor.RESET;
//                     RecVendor.SETRANGE(RecVendor."No.", RecBALE."Bal. Account No.");
//                     IF RecVendor.FINDFIRST THEN BEGIN
//                         RecVenBalAcc.RESET;
//                         RecVenBalAcc.SETRANGE(RecVenBalAcc."Vendor No.", RecVendor."No.");
//                         IF RecVenBalAcc.FINDFIRST THEN BEGIN
//                             IF RecVenBalAcc."Bank Account No." <> FORMAT(RawUpdateLog."Posted Invoice No.") THEN BEGIN
//                                 RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Invalid credit Account no';
//                                 FoundError := TRUE;
//                             END;
//                         END;
//                     END;
//                 END;

//                 IF RawUpdateLog."Posted Invoice Amount" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Status should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Digital Invoice" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'MSP ID should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Transaction Type" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Responce code should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Invoice Posted" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Description should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Remitter Account Number" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Remitter Account Number should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Beneficiary Account Number" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Beneficiary Account Number should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Bene IFSC" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Bene IFSC code should not be blank';
//                     FoundError := TRUE;
//                 END;

//                 IF RawUpdateLog."Transaction Currency" = '' THEN BEGIN
//                     RawUpdateLog."Error Description" := RawUpdateLog."Error Description" + ';' + 'Transaction currency should not be blank';
//                     FoundError := TRUE;
//                 END;


//                 RawUpdateLog.Validated := TRUE;
//                 RawUpdateLog.MODIFY;

//             UNTIL RawUpdateLog.NEXT = 0;


//         IF FoundError = FALSE THEN BEGIN
//             UpdateBankLedger(CASEID);
//             MESSAGE('Imported Successfully');
//         END;

//         IF FoundError = TRUE THEN BEGIN

//             RawUpdateLog.RESET;
//             RawUpdateLog.SETRANGE(RawUpdateLog."CASE ID", CASEID);
//             IF RawUpdateLog.FINDSET THEN
//                 REPEAT
//                     RawUpdateLog.Status1 := 1;
//                     RawUpdateLog.MODIFY;
//                 UNTIL RawUpdateLog.NEXT = 0;

//             MESSAGE('Error occured ; Please check Rejected Log in csv file');

//             RawUpdateLog.RESET;
//             RawUpdateLog.SETRANGE(RawUpdateLog."CASE ID", CASEID);
//             IF RawUpdateLog.FINDFIRST THEN BEGIN
//                 COMMIT;
//                 XMLRejectMaster.SETTABLEVIEW(RawUpdateLog);
//                 XMLRejectMaster.RUN;
//             END;

//         END;

//     end;

//     local procedure UpdateBankLedger(CASEID: Code[250])
//     var
//         BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
//         RawDataLog: Record "B2B Monthwise Client Invoicing";
//     begin
//         RawDataLog.RESET;
//         RawDataLog.SETRANGE(RawDataLog."CASE ID", CASEID);
//         RawDataLog.SETCURRENTKEY("CASE ID");
//         RawDataLog.ASCENDING(TRUE);
//         IF RawDataLog.FINDSET THEN
//             REPEAT
//                 BankAccLedEntry.RESET;
//                 BankAccLedEntry.SETRANGE(BankAccLedEntry.Identifier, RawDataLog."Active Policies");
//                 IF BankAccLedEntry.FINDFIRST THEN BEGIN
//                     BankAccLedEntry."Return Pay Ref No" := RawDataLog."Active Policies";
//                     BankAccLedEntry.Status := RawDataLog."Posted Invoice Amount";
//                     BankAccLedEntry."File Returned" := TRUE;
//                     BankAccLedEntry.MODIFY;
//                 END;

//             UNTIL RawDataLog.NEXT = 0;
//     end;
// }

