// codeunit 50134 FlowDatatoDtlVendorLedgEntry
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostInvoice', '', false, false)]
//     local procedure OnAfterPostInvoice(var PurchHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; TotalPurchLine: Record "Purchase Line"; TotalPurchLineLCY: Record "Purchase Line"; CommitIsSupressed: Boolean; var VendorLedgerEntry: Record "Vendor Ledger Entry");
//     begin
//         // VendorLedgerEntry.ZYTest := PurchHeader.ZYTest;
//         // VendorLedgerEntry.Modify();
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromPurchHeader', '', true, true)]
//     local procedure TransferMSMEToGenJrnlLine(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
//     begin
//         GenJournalLine.MSME := PurchaseHeader.MSME;
//     end;

//  

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitVendLedgEntry', '', true, true)]
//     local procedure TransferMSMEToVendorLedger(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
//     begin
//         VendorLedgerEntry.MSME := GenJournalLine.MSME;
//     end;
// }
