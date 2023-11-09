// pageextension 70000027 pageextension70000027 extends "Apply Vendor Entries" 
// {
//     layout
//     {

//         //Unsupported feature: Property Insertion (Name) on "Control 94".


//         //Unsupported feature: Code Insertion (VariableCollection) on "Control 90.OnValidate".

//         //trigger (Variable: HSNWiseAmount)()
//         //Parameters and return type have not been exported.
//         //begin
//             /*
//             */
//         //end;


//         //Unsupported feature: Code Modification on "Control 90.OnValidate".

//         //trigger OnValidate()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);

//             IF (xRec."Amount to Apply" = 0) OR ("Amount to Apply" = 0) AND
//                (ApplnType = ApplnType::"Applies-to ID")
//             THEN
//               SetVendApplId;
//             GET("Entry No.");
//             AmounttoApplyOnAfterValidate;
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             {
//             IF (CalcType = CalcType::Direct) AND ("Amount to Apply" <> 0) AND ("GST Vendor Type" <>  "GST Vendor Type"::" ") THEN
//               TESTFIELD("TDS Nature of Deduction",'');
//               }
//               // prdp 22012020
//             CheckRefundApplicationGST;
//             IF NOT HSNWiseApplication(Rec,ApplyingVendLedgEntry) THEN
//               CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
//             #2..8
//             */
//         //end;
//         addafter("Control 61")
//         {
//             field("GST Amount";"GST Amount")
//             {
//             }
//             field("TDS Amount";"TDS Amount")
//             {
//             }
//             field("Invoice Amount";"Purchase (LCY)")
//             {
//                 Caption = 'Invoice Amount';
//             }
//         }
//         addafter("Control 33")
//         {
//             field("HSN/SAC Code";"HSN/SAC Code")
//             {
//                 Editable = false;
//             }
//         }
//         addafter("Control 92")
//         {
//             field(HSNWiseLineRemainingAmount;HSNWiseLineRemainingAmount)
//             {
//                 Caption = 'HSNWise Remaining Amount';
//                 Editable = false;
//             }
//         }
//         addafter("Control 59")
//         {
//             field("TDS Nature of Deduction";"TDS Nature of Deduction")
//             {
//             }
//         }
//     }
//     actions
//     {


//         //Unsupported feature: Code Insertion (VariableCollection) on "ActionSetAppliesToID(Action 32).OnAction".

//         //trigger (Variable: TransactionType)()
//         //Parameters and return type have not been exported.
//         //begin
//             /*
//             */
//         //end;


//         //Unsupported feature: Code Modification on "ActionSetAppliesToID(Action 32).OnAction".

//         //trigger OnAction()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             IF (CalcType = CalcType::GenJnlLine) AND (ApplnType = ApplnType::"Applies-to Doc. No.") THEN
//               ERROR(CannotSetAppliesToIDErr);

//             SetVendApplId;
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*


//             //IF (CalcType = CalcType::Direct)  AND ("GST Vendor Type" <> "GST Vendor Type"::" ") THEN // prdp 25022020 commented for vijay's issue
//             // TESTFIELD("TDS Nature of Deduction",'');  // prdp 25022020 commented for vijay's issue
//             IF (CalcType = CalcType::GenJnlLine) AND (ApplnType = ApplnType::"Applies-to Doc. No.") THEN
//               ERROR(CannotSetAppliesToIDErr);
//             IF GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund THEN BEGIN
//               DetailedGSTLedgerEntry.RESET;
//               DetailedGSTLedgerEntry.SETCURRENTKEY("CLE/VLE Entry No.","HSN/SAC Code");
//               DetailedGSTLedgerEntry.SETRANGE("CLE/VLE Entry No.",VendLedgEntry."Entry No.");
//               IF DetailedGSTLedgerEntry.FINDFIRST THEN
//                 ERROR(CannotSetRefundIDErr);
//             END;
//             CheckRefundApplicationGST;
//             SetVendApplId;
//             */
//         //end;
//     }

//     var
//         TransactionType: Option Purchase,Sale;

//     var
//         HSNWiseAmount: Decimal;

//     var
//         DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";

//     var
//         GSTApplicationManagement: Codeunit "16403";
//         VendEntryEdit: Codeunit "Vend. Entry-Edit";

//     var
//         ApplicationType: Option Online,Offline;
//         HSNWiseRemainingAmount: Decimal;
//         HSNWiseLineRemainingAmount: Decimal;
//         MustNotBeLargerErr: Label 'Amount to Apply must not be larger than %1';
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
//         IF ApplyingVendLedgEntry."GST on Advance Payment" THEN
//           CheckHSNWiseLineAmount;
//         StyleTxt := SetStyle;
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnModifyRecord".

//     //trigger OnModifyRecord(): Boolean
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
//         IF "Applies-to ID" <> xRec."Applies-to ID" THEN
//           CalcApplnAmount;
//         EXIT(FALSE);
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         IF NOT HSNWiseApplication(Rec,ApplyingVendLedgEntry) THEN
//         #1..4
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnOpenPage".

//     //trigger OnOpenPage()
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF CalcType = CalcType::Direct THEN BEGIN
//           Vend.GET("Vendor No.");
//           ApplnCurrencyCode := Vend."Currency Code";
//         #4..10
//         IF CalcType = CalcType::GenJnlLine THEN
//           CalcApplnAmount;
//         PostingDone := FALSE;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         HSNWiseLineRemainingAmount := 0;

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
//             CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
//           END;
//         END;
//         #16..20
//             "Applies-to ID" := '';
//             "Amount to Apply" := 0;
//           END;
//           CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
//         END;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..11
//               IF NOT "GST on Advance Payment" THEN
//                 "Amount to Apply" := "Remaining Amount"
//               ELSE IF "GST on Advance Payment" AND (CalcType =  CalcType::GenJnlLine) AND
//                 (GenJnlLine."Document Type" = GenJnlLine."Document Type"::Refund) THEN BEGIN
//               "Amount to Apply" := "Remaining Amount";
//               END
//               ELSE IF ("Amount to Apply" = 0) AND ("Remaining Amount" <> 0) AND (CalcType =CalcType::PurchHeader) THEN
//                 IF GSTApplicationManagement.FillGSTApplicationBufferPurchase(PurchHeader,Rec) THEN
//                     "Amount to Apply" :=
//                       GSTApplicationManagement.GetApplicationRemainingAmount(
//                         TransactionType2::Purchase,PurchHeader."Document Type",PurchHeader."No.",
//                         "Vendor No.","HSN/SAC Code","Remaining Amount",
//                         "Remaining Amount" ,"Entry No.",FALSE,InvoiceGSTAmount,
//                         AppliedGSTAmount,InvoiceBase);
//             IF NOT HSNWiseApplication(Rec,ApplyingVendLedgEntry) THEN
//         #13..23
//           IF NOT HSNWiseApplication(Rec,ApplyingVendLedgEntry) THEN
//           CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
//         END;
//         */
//     //end;

//     //Unsupported feature: Variable Insertion (Variable: VendorLedgerEntry) (VariableCollection) on "SetVendApplId(PROCEDURE 10)".



//     //Unsupported feature: Code Modification on "SetVendApplId(PROCEDURE 10)".

//     //procedure SetVendApplId();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF (CalcType = CalcType::GenJnlLine) AND (ApplyingVendLedgEntry."Posting Date" < "Posting Date") THEN
//           ERROR(
//             EarlierPostingDateErr,ApplyingVendLedgEntry."Document Type",ApplyingVendLedgEntry."Document No.",
//         #4..8

//         VendLedgEntry.COPY(Rec);
//         CurrPage.SETSELECTIONFILTER(VendLedgEntry);
//         IF GenJnlLineApply THEN
//           VendEntrySetApplID.SetApplId(VendLedgEntry,ApplyingVendLedgEntry,GenJnlLine."Applies-to ID")
//         ELSE
//           VendEntrySetApplID.SetApplId(VendLedgEntry,ApplyingVendLedgEntry,PurchHeader."Applies-to ID");

//         ActionPerformed := VendLedgEntry."Applies-to ID" <> '';
//         CalcApplnAmount;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..11

//         IF "Applies-to ID" = '' THEN BEGIN
//           CASE CalcType OF
//             CalcType::PurchHeader :
//               IF "GST on Advance Payment" THEN
//                 VendEntrySetApplID.SetGSTType(PurchHeader);
//             CalcType::GenJnlLine :
//               IF GenJnlLine."Document Type" =  GenJnlLine."Document Type"::Refund THEN
//                 VendEntrySetApplID.SetRefund;
//           END;
//         END;

//         #12..18
//         */
//     //end;

//     //Unsupported feature: Variable Insertion (Variable: RemainingAmountExclDiscounts) (VariableCollection) on "HandlChosenEntries(PROCEDURE 8)".


//     //Unsupported feature: Variable Insertion (Variable: HasOppositeEntries) (VariableCollection) on "HandlChosenEntries(PROCEDURE 8)".


//     //Unsupported feature: Variable Insertion (Variable: CurrPosFilter) (VariableCollection) on "HandlChosenEntries(PROCEDURE 8)".



//     //Unsupported feature: Code Modification on "HandlChosenEntries(PROCEDURE 8)".

//     //procedure HandlChosenEntries();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF AppliedVendLedgEntry.FINDSET(FALSE,FALSE) THEN BEGIN
//           REPEAT
//             AppliedVendLedgEntryTemp := AppliedVendLedgEntry;
//         #4..46
//                     CurrentAmount := CurrentAmount +
//                       AppliedVendLedgEntryTemp."Remaining Amount" - AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                   END ELSE BEGIN
//                     IF (CurrentAmount + AppliedVendLedgEntryTemp."Remaining Amount" <= 0) <> (CurrentAmount <= 0) THEN BEGIN
//                       PmtDiscAmount := PmtDiscAmount + PossiblePmtdisc;
//                       AppliedAmount := AppliedAmount + CorrectionAmount;
//                     END;
//                     CurrentAmount := CurrentAmount + AppliedVendLedgEntryTemp."Remaining Amount" -
//                       AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                     PossiblePmtdisc := AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                   END;
//             END ELSE BEGIN
//               IF ((CurrentAmount + AppliedVendLedgEntryTemp."Amount to Apply") * CurrentAmount) >= 0 THEN
//         #60..83
//           AppliedVendLedgEntryTemp.SETRANGE(Positive);

//         UNTIL NOT AppliedVendLedgEntryTemp.FINDFIRST;
//         PmtDiscAmount += PossiblePmtdisc;
//         CheckRounding;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         #1..49
//                     PossiblePmtdisc := AppliedVendLedgEntryTemp."Remaining Pmt. Disc. Possible";
//                     CurrPosFilter := AppliedVendLedgEntryTemp.GETFILTER(Positive);
//                     IF CurrPosFilter = '' THEN
//                       HasOppositeEntries := FALSE
//                     ELSE BEGIN
//                       AppliedVendLedgEntryTemp.SETRANGE(Positive,NOT AppliedVendLedgEntryTemp.Positive);
//                       HasOppositeEntries := NOT AppliedVendLedgEntryTemp.ISEMPTY;
//                       AppliedVendLedgEntryTemp.SETFILTER(Positive,CurrPosFilter);
//                     END;
//                     RemainingAmountExclDiscounts := AppliedVendLedgEntryTemp."Remaining Amount" - PossiblePmtdisc -
//                       AppliedVendLedgEntryTemp."Max. Payment Tolerance";
//                     IF (ABS(CurrentAmount) > ABS(RemainingAmountExclDiscounts)) OR HasOppositeEntries
//                     THEN BEGIN
//         #51..55
//         #57..86
//         CheckRounding;
//         */
//     //end;

//     //Unsupported feature: Variable Insertion (Variable: ServiceTaxMgt) (VariableCollection) on "PostDirectApplication(PROCEDURE 15)".


//     //Unsupported feature: Variable Insertion (Variable: AmountToApply) (VariableCollection) on "PostDirectApplication(PROCEDURE 15)".



//     //Unsupported feature: Code Modification on "PostDirectApplication(PROCEDURE 15)".

//     //procedure PostDirectApplication();
//     //Parameters and return type have not been exported.
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IF CalcType = CalcType::Direct THEN BEGIN
//           IF ApplyingVendLedgEntry."Entry No." <> 0 THEN BEGIN
//             Rec := ApplyingVendLedgEntry;
//             ApplicationDate := VendEntryApplyPostedEntries.GetApplicationDate(Rec);

//         #6..24
//             ERROR(Text002);
//         END ELSE
//           ERROR(Text003);
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         IF CalcType = CalcType::Direct THEN BEGIN
//           IF ApplyingVendLedgEntry."Entry No." <> 0 THEN BEGIN
//             ServiceTaxMgt.CheckApplyServiceTaxAndTDS(ApplyingVendLedgEntry,Rec);
//         #3..27
//         */
//     //end;

//     local procedure HSNWiseApplication(var VendorLedgerEntry: Record "25";var ApplyingVendorLedgerEntry: Record "25"): Boolean
//     begin
//         WITH VendorLedgerEntry DO BEGIN
//           IF "Amount to Apply" = 0 THEN
//             EXIT(FALSE);
//           IF ("GST on Advance Payment") OR NOT ("GST Vendor Type" IN ["GST Vendor Type"::" ","GST Vendor Type"::Exempted]) THEN BEGIN
//             CASE CalcType OF
//               CalcType::PurchHeader : BEGIN
//                 IF NOT "GST on Advance Payment" THEN
//                   EXIT(FALSE);
//                 VendEntryEdit.SetGSTType(PurchHeader,TRUE);
//                 VendEntryEdit.RUN(Rec);
//                 EXIT(TRUE);
//               END;
//               CalcType::Direct : BEGIN
//                 VendEntryEdit.SetGSTTypeDirect(ApplyingVendorLedgerEntry,FALSE);
//                 VendEntryEdit.RUN(VendorLedgerEntry);
//                 EXIT(TRUE);
//               END;
//             END;
//           END;
//         END;
//     end;

//     local procedure CheckRefundApplicationGST()
//     var
//         DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
//     begin
//         IF VendLedgEntry."Document Type" = VendLedgEntry."Document Type"::Refund THEN BEGIN
//           DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Transaction No.");
//           DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Purchase);
//           DetailedGSTLedgerEntry.SETRANGE("Document Type",DetailedGSTLedgerEntry."Document Type"::Refund);
//           DetailedGSTLedgerEntry.SETRANGE("Document No.",VendLedgEntry."Document No.");
//           DetailedGSTLedgerEntry.SETRANGE("Transaction No.",VendLedgEntry."Transaction No.");
//           IF DetailedGSTLedgerEntry.FINDFIRST THEN BEGIN
//             DetailedVendorLedgEntry.SETRANGE("Entry Type",DetailedVendorLedgEntry."Entry Type"::Application);
//             DetailedVendorLedgEntry.SETRANGE("Document Type",DetailedVendorLedgEntry."Document Type"::Refund);
//             DetailedVendorLedgEntry.SETRANGE("Document No.",VendLedgEntry."Document No.");
//             DetailedVendorLedgEntry.SETRANGE("Vendor Ledger Entry No.",VendLedgEntry."Entry No.");
//             DetailedVendorLedgEntry.SETRANGE(Unapplied,TRUE);
//             IF NOT DetailedVendorLedgEntry.ISEMPTY THEN
//               ERROR(CannotSetRefundOfflineErr);
//           END;
//         END;
//     end;

//     local procedure CheckHSNWiseLineAmount()
//     var
//         GSTBaseAmount: Decimal;
//     begin
//         CLEAR(HSNWiseLineRemainingAmount);
//         HSNWiseLineRemainingAmount :=
//           GSTApplicationManagement.GetInvoiceGSTAmountHSNWise(
//             TransactionType2::Purchase,"Vendor No.","Document No.",
//             ApplyingVendLedgEntry."HSN/SAC Code",GSTBaseAmount);
//         HSNWiseLineRemainingAmount := GSTBaseAmount;
//         IF "Adjusted Currency Factor" <> 0 THEN
//           HSNWiseLineRemainingAmount := GSTBaseAmount * "Adjusted Currency Factor";
//     end;

//     procedure FindApplyingEntry2()
//     begin
//         IF CalcType = CalcType::Direct THEN BEGIN
//           VendEntryApplID := USERID;
//           IF VendEntryApplID = '' THEN
//             VendEntryApplID := '***';

//           VendLedgEntry.SETCURRENTKEY("Vendor No.","Applies-to ID",Open);
//           VendLedgEntry.SETRANGE("Vendor No.","Vendor No.");
//           IF AppliesToID = '' THEN
//             VendLedgEntry.SETRANGE("Applies-to ID",VendEntryApplID)
//           ELSE
//             VendLedgEntry.SETRANGE("Applies-to ID",AppliesToID);
//           VendLedgEntry.SETRANGE(Open,TRUE);
//           VendLedgEntry.SETRANGE("Applying Entry",TRUE);
//           IF VendLedgEntry.FINDFIRST THEN BEGIN
//             VendLedgEntry.CALCFIELDS(Amount,"Remaining Amount");
//             ApplyingVendLedgEntry := VendLedgEntry;
//             SETFILTER("Entry No.",'<>%1',VendLedgEntry."Entry No.");
//             ApplyingAmount := VendLedgEntry."Remaining Amount";
//             ApplnDate := VendLedgEntry."Posting Date";
//             ApplnCurrencyCode := VendLedgEntry."Currency Code";
//           END;
//           CalcApplnAmount;
//         END;
//     end;

//     procedure PostDirectApplication2(PreviewMode: Boolean;AppDate: Date)
//     var
//         VendEntryApplyPostedEntries: Codeunit "227";
//         ServiceTaxMgt: Codeunit "16471";
//         PostApplication: Page "579";
//         ApplicationDate: Date;
//         NewApplicationDate: Date;
//         NewDocumentNo: Code[20];
//         AmountToApply: Decimal;
//     begin
//         IF CalcType = CalcType::Direct THEN BEGIN
//           IF ApplyingVendLedgEntry."Entry No." <> 0 THEN BEGIN
//             //ServiceTaxMgt.CheckApplyServiceTaxAndTDS(ApplyingVendLedgEntry,Rec);
//             Rec := ApplyingVendLedgEntry;
//             ApplicationDate := VendEntryApplyPostedEntries.GetApplicationDate(Rec);
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
//               VendEntryApplyPostedEntries.PreviewApply(Rec,NewDocumentNo,NewApplicationDate)
//             ELSE
//               VendEntryApplyPostedEntries.Apply(Rec,NewDocumentNo,NewApplicationDate);

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

