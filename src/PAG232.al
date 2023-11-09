// pageextension 70000026 pageextension70000026 extends "Apply Customer Entries" 
// {
//     layout
//     {

//         //Unsupported feature: Code Modification on "Control 89.OnValidate".

//         //trigger OnValidate()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);

//             IF (xRec."Amount to Apply" = 0) OR ("Amount to Apply" = 0) AND
//                (ApplnType = ApplnType::"Applies-to ID")
//             THEN
//               SetCustApplId;
//             GET("Entry No.");
//             AmounttoApplyOnAfterValidate;
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             IF (CalcType = CalcType::Direct) AND ("Amount to Apply" <> 0) AND ("GST Customer Type" <> "GST Customer Type"::" ") THEN
//               TESTFIELD("TCS Nature of Collection",'');

//             CheckRefundApplicationGST;
//             IF NOT HSNWiseApplication(Rec,ApplyingCustLedgEntry) THEN
//               CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
//             #2..8
//             */
//         //end;
//         addafter("Control 89")
//         {
//             field(ABS(HSNWiseLineRemainingAmount);ABS(HSNWiseLineRemainingAmount))
//             {
//                 Caption = 'HSNWise Remaining Amount';
//                 Editable = false;
//             }
//         }
//         addafter("Control 93")
//         {
//             field("HSN/SAC Code";"HSN/SAC Code")
//             {
//                 Editable = false;
//             }
//         }
//     }
//     actions
//     {


//         //Unsupported feature: Code Modification on ""Set Applies-to ID"(Action 32).OnAction".

//         //trigger OnAction()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             IF (CalcType = CalcType::GenJnlLine) AND (ApplnType = ApplnType::"Applies-to Doc. No.") THEN
//               ERROR(CannotSetAppliesToIDErr);

//             SetCustApplId;
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             IF (CalcType = CalcType::GenJnlLine) AND (ApplnType = ApplnType::"Applies-to Doc. No.") THEN
//               ERROR(CannotSetAppliesToIDErr);
//             IF GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund THEN BEGIN
//               DetailedGSTLedgerEntry.RESET;
//               DetailedGSTLedgerEntry.SETCURRENTKEY("CLE/VLE Entry No.","HSN/SAC Code");
//               DetailedGSTLedgerEntry.SETRANGE("CLE/VLE Entry No.",CustLedgEntry."Entry No.");
//               DetailedGSTLedgerEntry.SETRANGE("HSN/SAC Code",CustLedgEntry."HSN/SAC Code");
//               IF DetailedGSTLedgerEntry.FINDFIRST THEN
//                 ERROR(CannotSetRefundIDErr);
//             END;
//             IF CalcType = CalcType::Direct THEN
//               TESTFIELD("TCS Nature of Collection",'');
//             CheckRefundApplicationGST;
//             SetCustApplId;
//             */
//         //end;
//     }

//     var
//         DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";

//     var
//         CustEntryEdit: Codeunit "Cust. Entry-Edit";

//     var
//         // GSTApplicationManagement: Codeunit "16403";
//         // GSTManagement: Codeunit "16401";
//         ActionPerformed: Boolean;
//         HSNWiseLineRemainingAmount: Decimal;
//         CannotSetRefundIDErr: Label 'You cannot apply entries from set Applies-to ID';
//         CannotSetRefundOfflineErr: Label 'You cannot Re-apply GST Refund entries once it has been unapplied';
//         TransactionType2: Option Purchase,Sales,Transfer,Service;
//         InvoiceGSTAmount: Decimal;
//         AppliedGSTAmount: Decimal;
//         InvoiceBase: Decimal;


//     //Unsupported feature: Code Modification on "OnAfterGetRecord".

//     //trigger OnAfterGetRecord()
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         StyleTxt := SetStyle;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         IF ApplyingCustLedgEntry."GST on Advance Payment" THEN
//           CheckHSNWiseLineAmount;
//         StyleTxt := SetStyle;
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnModifyRecord".

//     //trigger OnModifyRecord(): Boolean
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
//         IF "Applies-to ID" <> xRec."Applies-to ID" THEN
//           CalcApplnAmount;
//         EXIT(FALSE);
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         IF NOT HSNWiseApplication(Rec,ApplyingCustLedgEntry) THEN
//         #1..4
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnOpenPage".

//     //trigger OnOpenPage()
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF CalcType = CalcType::Direct THEN BEGIN
//           Cust.GET("Customer No.");
//           ApplnCurrencyCode := Cust."Currency Code";
//         #4..10
//         IF ApplnType = ApplnType::"Applies-to Doc. No." THEN
//           CalcApplnAmount;
//         PostingDone := FALSE;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         HSNWiseLineRemainingAmount := 0;//GST Sales
//         #1..13
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnQueryClosePage".

//     //trigger OnQueryClosePage(CloseAction: Action): Boolean
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF CloseAction = ACTION::LookupOK THEN
//           LookupOKOnPush;
//         IF ApplnType = ApplnType::"Applies-to Doc. No." THEN BEGIN
//         #4..8
//           END;
//           IF OK THEN BEGIN
//             IF "Amount to Apply" = 0 THEN
//               "Amount to Apply" := "Remaining Amount";
//             CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
//           END;
//         END;
//         IF (CalcType = CalcType::Direct) AND NOT OK AND NOT PostingDone THEN BEGIN
//           Rec := ApplyingCustLedgEntry;
//           "Applying Entry" := FALSE;
//           "Applies-to ID" := '';
//           "Amount to Apply" := 0;
//           CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
//         END;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..11
//               IF NOT "GST on Advance Payment" THEN
//                 "Amount to Apply" := "Remaining Amount"
//                ELSE IF "GST on Advance Payment" AND (CalcType =  CalcType::GenJnlLine) AND
//                  (GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund) THEN
//                  "Amount to Apply" := "Remaining Amount"
//               ELSE IF ("Amount to Apply" = 0) AND ("Remaining Amount" <> 0) THEN
//                 CASE CalcType OF
//                   CalcType::SalesHeader :
//                     IF GSTApplicationManagement.FillGSTApplicationBufferSales(SalesHeader,Rec) THEN
//                       "Amount to Apply" :=
//                         GSTApplicationManagement.GetApplicationRemainingAmount(
//                           TransactionType2::Sales,SalesHeader."Document Type",SalesHeader."No.",
//                           "Customer No.","HSN/SAC Code","Remaining Amount",
//                           "Remaining Amount" + "Total TDS/TCS Incl SHE CESS","Entry No.",TRUE,
//                           InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
//                   CalcType::ServHeader :
//                     IF GSTApplicationManagement.FillGSTApplicationBufferService(ServHeader,Rec) THEN
//                         "Amount to Apply" :=
//                           GSTApplicationManagement.GetApplicationRemainingAmount(
//                             TransactionType2::Sales,ServHeader."Document Type",ServHeader."No.",
//                             "Customer No.","HSN/SAC Code","Remaining Amount",
//                             "Remaining Amount","Entry No.",TRUE,InvoiceGSTAmount,AppliedGSTAmount,InvoiceBase);
//                 END;
//             IF NOT HSNWiseApplication(Rec,ApplyingCustLedgEntry) THEN
//         #13..20
//           IF NOT HSNWiseApplication(Rec,ApplyingCustLedgEntry) THEN
//           CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
//         END;
//         */
//     //end;


//     //Unsupported feature: Code Modification on "SetApplyingCustLedgEntry(PROCEDURE 9)".

//     //procedure SetApplyingCustLedgEntry();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         CASE CalcType OF
//           CalcType::SalesHeader:
//             BEGIN
//         #4..29
//               ApplyingCustLedgEntry.Description := ServHeader."Posting Description";
//               ApplyingCustLedgEntry."Currency Code" := ServHeader."Currency Code";
//               IF ApplyingCustLedgEntry."Document Type" = ApplyingCustLedgEntry."Document Type"::"Credit Memo" THEN  BEGIN
//                 ApplyingCustLedgEntry.Amount := -TotalSalesLine."Amount To Customer";
//                 ApplyingCustLedgEntry."Remaining Amount" := -TotalSalesLine."Amount To Customer";
//               END ELSE BEGIN
//                 ApplyingCustLedgEntry.Amount := TotalSalesLine."Amount To Customer";
//                 ApplyingCustLedgEntry."Remaining Amount" := TotalSalesLine."Amount To Customer";
//               END;
//               CalcApplnAmount;
//             END;
//         #41..79
//               CalcApplnAmount;
//             END;
//         END;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..32
//                 ApplyingCustLedgEntry.Amount := -TotalServLine."Amount To Customer";
//                 ApplyingCustLedgEntry."Remaining Amount" := -TotalServLine."Amount To Customer";
//               END ELSE BEGIN
//                 ApplyingCustLedgEntry.Amount := TotalServLine."Amount To Customer";
//                 ApplyingCustLedgEntry."Remaining Amount" := TotalServLine."Amount To Customer";
//         #38..82
//         */
//     //end;

//     //Unsupported feature: Variable Insertion (Variable: CustLedgerEntry) (VariableCollection) on "SetCustApplId(PROCEDURE 11)".



//     //Unsupported feature: Code Modification on "SetCustApplId(PROCEDURE 11)".

//     //procedure SetCustApplId();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF (CalcType = CalcType::GenJnlLine) AND (ApplyingCustLedgEntry."Posting Date" < "Posting Date") THEN
//           ERROR(
//             EarlierPostingDateErr,ApplyingCustLedgEntry."Document Type",ApplyingCustLedgEntry."Document No.",
//         #4..8

//         CustLedgEntry.COPY(Rec);
//         CurrPage.SETSELECTIONFILTER(CustLedgEntry);

//         CustEntrySetApplID.SetApplId(CustLedgEntry,ApplyingCustLedgEntry,GetAppliesToID);

//         CalcApplnAmount;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..11
//         IF "Applies-to ID" = '' THEN BEGIN
//           CASE CalcType OF
//             CalcType::SalesHeader :
//               IF "GST on Advance Payment" THEN
//                 CustEntrySetApplID.SetGSTType(SalesHeader);
//             CalcType::ServHeader :
//               IF "GST on Advance Payment" THEN
//                 CustEntrySetApplID.SetGSTTypeService(ServHeader);
//             CalcType::GenJnlLine :
//               IF GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund THEN
//                 CustEntrySetApplID.SetRefund;
//           END;
//         END;
//         CustEntrySetApplID.SetApplId(CustLedgEntry,ApplyingCustLedgEntry,GetAppliesToID);
//         ActionPerformed := CustLedgEntry."Applies-to ID" <> '';
//         CalcApplnAmount;
//         */
//     //end;

//     //Unsupported feature: Variable Insertion (Variable: RemainingAmountExclDiscounts) (VariableCollection) on "HandlChosenEntries(PROCEDURE 14)".


//     //Unsupported feature: Variable Insertion (Variable: HasOppositeEntries) (VariableCollection) on "HandlChosenEntries(PROCEDURE 14)".


//     //Unsupported feature: Variable Insertion (Variable: CurrPosFilter) (VariableCollection) on "HandlChosenEntries(PROCEDURE 14)".



//     //Unsupported feature: Code Modification on "HandlChosenEntries(PROCEDURE 14)".

//     //procedure HandlChosenEntries();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF AppliedCustLedgEntry.FINDSET(FALSE,FALSE) THEN BEGIN
//           REPEAT
//             AppliedCustLedgEntryTemp := AppliedCustLedgEntry;
//             AppliedCustLedgEntryTemp.INSERT;
//           UNTIL AppliedCustLedgEntry.NEXT = 0;
//         END ELSE
//           EXIT;

//         FromZeroGenJnl := (CurrentAmount = 0) AND (Type = Type::GenJnlLine);

//         REPEAT
//           IF NOT FromZeroGenJnl THEN
//             AppliedCustLedgEntryTemp.SETRANGE(Positive,CurrentAmount < 0);
//           IF AppliedCustLedgEntryTemp.FINDFIRST THEN BEGIN
//             ExchangeAmountsOnLedgerEntry(Type,CurrencyCode,AppliedCustLedgEntryTemp,"Posting Date");

//             CASE Type OF
//               Type::Direct:
//                 CanUseDisc := PaymentToleranceMgt.CheckCalcPmtDiscCust(CustLedgEntry,AppliedCustLedgEntryTemp,0,FALSE,FALSE);
//               Type::GenJnlLine:
//                 CanUseDisc := PaymentToleranceMgt.CheckCalcPmtDiscGenJnlCust(GenJnlLine2,AppliedCustLedgEntryTemp,0,FALSE)
//               ELSE
//                 CanUseDisc := FALSE;
//             END;

//             IF CanUseDisc AND
//                (ABS(AppliedCustLedgEntryTemp."Amount to Apply") >= ABS(AppliedCustLedgEntryTemp."Remaining Amount" -
//                   AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible"))
//             THEN BEGIN
//               IF (ABS(CurrentAmount) > ABS(AppliedCustLedgEntryTemp."Remaining Amount" -
//                     AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible"))
//               THEN BEGIN
//                 PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                 CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
//                   AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
//               END ELSE
//                 IF (ABS(CurrentAmount) = ABS(AppliedCustLedgEntryTemp."Remaining Amount" -
//                       AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible"))
//                 THEN BEGIN
//                   PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible" + PossiblePmtDisc;
//                   CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
//                     AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible" - PossiblePmtDisc;
//                   PossiblePmtDisc := 0;
//                   AppliedAmount := AppliedAmount + CorrectionAmount;
//                 END ELSE
//                   IF FromZeroGenJnl THEN BEGIN
//                     PmtDiscAmount := PmtDiscAmount + AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                     CurrentAmount := CurrentAmount +
//                       AppliedCustLedgEntryTemp."Remaining Amount" - AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                   END ELSE BEGIN
//                     IF (CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" >= 0) <> (CurrentAmount >= 0) THEN BEGIN
//                       PmtDiscAmount := PmtDiscAmount + PossiblePmtDisc;
//                       AppliedAmount := AppliedAmount + CorrectionAmount;
//                     END;
//                     CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Remaining Amount" -
//                       AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                     PossiblePmtDisc := AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                   END;
//             END ELSE BEGIN
//               IF ((CurrentAmount - PossiblePmtDisc + AppliedCustLedgEntryTemp."Amount to Apply") * CurrentAmount) <= 0 THEN BEGIN
//                 PmtDiscAmount := PmtDiscAmount + PossiblePmtDisc;
//                 CurrentAmount := CurrentAmount - PossiblePmtDisc;
//                 PossiblePmtDisc := 0;
//                 AppliedAmount := AppliedAmount + CorrectionAmount;
//               END;
//               CurrentAmount := CurrentAmount + AppliedCustLedgEntryTemp."Amount to Apply";
//             END;
//           END ELSE BEGIN
//             AppliedCustLedgEntryTemp.SETRANGE(Positive);
//             AppliedCustLedgEntryTemp.FINDFIRST;
//             ExchangeAmountsOnLedgerEntry(Type,CurrencyCode,AppliedCustLedgEntryTemp,"Posting Date");
//           END;

//           IF OldPmtDisc <> PmtDiscAmount THEN
//             AppliedAmount := AppliedAmount + AppliedCustLedgEntryTemp."Remaining Amount"
//           ELSE
//             AppliedAmount := AppliedAmount + AppliedCustLedgEntryTemp."Amount to Apply";
//           OldPmtDisc := PmtDiscAmount;

//           IF PossiblePmtDisc <> 0 THEN
//             CorrectionAmount := AppliedCustLedgEntryTemp."Remaining Amount" - AppliedCustLedgEntryTemp."Amount to Apply"
//           ELSE
//             CorrectionAmount := 0;

//           IF NOT DifferentCurrenciesInAppln THEN
//             DifferentCurrenciesInAppln := ApplnCurrencyCode <> AppliedCustLedgEntryTemp."Currency Code";

//           AppliedCustLedgEntryTemp.DELETE;
//           AppliedCustLedgEntryTemp.SETRANGE(Positive);

//         UNTIL NOT AppliedCustLedgEntryTemp.FINDFIRST;
//         PmtDiscAmount += PossiblePmtDisc;
//         CheckRounding;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..50
//                     PossiblePmtDisc := AppliedCustLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                     CurrPosFilter := AppliedCustLedgEntryTemp.GETFILTER(Positive);
//                     IF CurrPosFilter = '' THEN
//                       HasOppositeEntries := FALSE
//                     ELSE BEGIN
//                       AppliedCustLedgEntryTemp.SETRANGE(Positive,NOT AppliedCustLedgEntryTemp.Positive);
//                       HasOppositeEntries := NOT AppliedCustLedgEntryTemp.ISEMPTY;
//                       AppliedCustLedgEntryTemp.SETFILTER(Positive,CurrPosFilter);
//                     END;
//                     RemainingAmountExclDiscounts := AppliedCustLedgEntryTemp."Remaining Amount" - PossiblePmtDisc -
//                       AppliedCustLedgEntryTemp."Max. Payment Tolerance";
//                     IF (ABS(CurrentAmount) > ABS(RemainingAmountExclDiscounts)) OR HasOppositeEntries
//                     THEN BEGIN
//         #52..56
//                   END;
//             END ELSE BEGIN
//               IF ((CurrentAmount - PossiblePmtDisc + AppliedCustLedgEntryTemp."Amount to Apply") * CurrentAmount) <= 0 THEN
//                 AppliedAmount := AppliedAmount + CorrectionAmount;
//         #66..91
//         CheckRounding;
//         */
//     //end;

//     local procedure CheckHSNWiseLineAmount()
//     var
//         GSTBaseAmount: Decimal;
//     begin
//         CLEAR(HSNWiseLineRemainingAmount);
//         HSNWiseLineRemainingAmount :=
//           GSTApplicationManagement.GetInvoiceGSTAmountHSNWise(
//             TransactionType2::Sales,"Customer No.","Document No.",
//             ApplyingCustLedgEntry."HSN/SAC Code",GSTBaseAmount);
//         HSNWiseLineRemainingAmount += GSTBaseAmount;
//     end;

//     local procedure HSNWiseApplication(var CustLedgerEntry: Record "21";var ApplyingCustLedgerEntry: Record "21"): Boolean
//     begin
//         WITH CustLedgerEntry DO BEGIN
//           IF "Amount to Apply" = 0 THEN
//             EXIT(FALSE);
//           IF ("GST on Advance Payment") OR NOT ("GST Customer Type" IN ["GST Customer Type"::" ","GST Customer Type"::Exempted]) THEN BEGIN
//             CASE CalcType OF
//               CalcType::SalesHeader : BEGIN
//                 IF NOT "GST on Advance Payment" THEN
//                   EXIT(FALSE);
//                 CustEntryEdit.SetGSTType(SalesHeader,TRUE);
//                 CustEntryEdit.RUN(Rec);
//                 EXIT(TRUE);
//               END;
//               CalcType::ServHeader : BEGIN
//                 IF NOT "GST on Advance Payment" THEN
//                   EXIT(FALSE);
//                 CustEntryEdit.SetGSTTypeService(ServHeader,TRUE);
//                 CustEntryEdit.RUN(Rec);
//                 EXIT(TRUE);
//               END;
//               CalcType::Direct : BEGIN
//                 CustEntryEdit.SetGSTTypeDirect(ApplyingCustLedgEntry,FALSE);
//                 CustEntryEdit.RUN(CustLedgerEntry);
//                 EXIT(TRUE);
//               END;
//             END;
//           END;
//         END;
//     end;

//     local procedure CheckRefundApplicationGST()
//     var
//         DetailedCustLedgEntry: Record "379";
//     begin
//         IF CustLedgEntry."Document Type" = CustLedgEntry."Document Type"::Refund THEN BEGIN
//           DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Transaction No.");
//           DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
//           DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Refund);
//           DetailedGSTLedgerEntry.SETRANGE("Document No.",CustLedgEntry."Document No.");
//           DetailedGSTLedgerEntry.SETRANGE("Transaction No.",CustLedgEntry."Transaction No.");
//           IF DetailedGSTLedgerEntry.FINDFIRST THEN BEGIN
//             DetailedCustLedgEntry.SETRANGE("Entry Type",DetailedCustLedgEntry."Entry Type"::Application);
//             DetailedCustLedgEntry.SETRANGE("Document Type",DetailedCustLedgEntry."Document Type"::Refund);
//             DetailedCustLedgEntry.SETRANGE("Document No.",CustLedgEntry."Document No.");
//             DetailedCustLedgEntry.SETRANGE("Cust. Ledger Entry No.",CustLedgEntry."Entry No.");
//             DetailedCustLedgEntry.SETRANGE(Unapplied,TRUE);
//             IF DetailedCustLedgEntry.FINDFIRST THEN
//               ERROR(CannotSetRefundOfflineErr);
//           END;
//         END;
//     end;

//     procedure FindApplyingEntry2()
//     begin
//         IF CalcType = CalcType::Direct THEN BEGIN
//           CustEntryApplID := USERID;
//           IF CustEntryApplID = '' THEN
//             CustEntryApplID := '***';

//           CustLedgEntry.SETCURRENTKEY("Customer No.","Applies-to ID",Open);
//           CustLedgEntry.SETRANGE("Customer No.","Customer No.");
//           CustLedgEntry.SETRANGE("Applies-to ID",CustEntryApplID);
//           CustLedgEntry.SETRANGE(Open,TRUE);
//           CustLedgEntry.SETRANGE("Applying Entry",TRUE);
//           IF CustLedgEntry.FINDFIRST THEN BEGIN
//             CustLedgEntry.CALCFIELDS(Amount,"Remaining Amount");
//             ApplyingCustLedgEntry := CustLedgEntry;
//             SETFILTER("Entry No.",'<>%1',CustLedgEntry."Entry No.");
//             ApplyingAmount := CustLedgEntry."Remaining Amount";
//             ApplnDate := CustLedgEntry."Posting Date";
//             ApplnCurrencyCode := CustLedgEntry."Currency Code";
//           END;
//           CalcApplnAmount;
//         END;
//     end;

//     procedure PostDirectApplication2(PreviewMode: Boolean;AppDate: Date)
//     var
//         CustEntryApplyPostedEntries: Codeunit "CustEntry-Apply Posted Entries";
//         PostApplication: Page "Post Application";
//         ApplicationDate: Date;
//         NewApplicationDate: Date;
//         NewDocumentNo: Code[20];
//     begin
//         IF CalcType = CalcType::Direct THEN BEGIN
//           IF ApplyingCustLedgEntry."Entry No." <> 0 THEN BEGIN
//             Rec := ApplyingCustLedgEntry;
//             ApplicationDate := CustEntryApplyPostedEntries.GetApplicationDate(Rec);
//             NewDocumentNo := "Document No.";
//             //NewApplicationDate := ApplicationDate;
//             NewApplicationDate := AppDate;

//             PostApplication.SetValues("Document No.",ApplicationDate);
//             //IF ACTION::OK = PostApplication.RUNMODAL THEN BEGIN
//               //PostApplication.GetValues(NewDocumentNo,NewApplicationDate);
//               IF NewApplicationDate < ApplicationDate THEN
//                 ERROR(Text013,FIELDCAPTION("Posting Date"),TABLECAPTION);
//             //END ELSE
//               //ERROR(Text019);

//             IF PreviewMode THEN
//               CustEntryApplyPostedEntries.PreviewApply(Rec,NewDocumentNo,NewApplicationDate)
//             ELSE
//               CustEntryApplyPostedEntries.Apply(Rec,NewDocumentNo,NewApplicationDate);

//             IF NOT PreviewMode THEN BEGIN
//               //MESSAGE(Text012);
//               PostingDone := TRUE;
//               CurrPage.CLOSE;
//             END;
//           END //ELSE
//             //ERROR(Text002);
//         END ELSE
//           ERROR(Text003);
//     end;
// }

