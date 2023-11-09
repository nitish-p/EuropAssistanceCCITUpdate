Report 50034 "GC Payment Process"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GC Payment Process.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; EndDate)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin

        if ((StartDate = 0D) and (EndDate = 0D)) then
            Error('Select Start Date as well as End Date for due date filter');

        recPurchInvHdr.Reset;
        recPurchInvHdr.SetRange("Integrated Invoice Type", 'GREENCHANNEL');
        recPurchInvHdr.SetFilter("Due Date", '%1..%2', StartDate, EndDate);
        if recPurchInvHdr.FindSet then
            repeat

                recVendorLedgerEntry.Reset;
                recVendorLedgerEntry.SetRange("Document No.", recPurchInvHdr."No.");
                recVendorLedgerEntry.SetRange(Open, true);
                if recVendorLedgerEntry.FindFirst then begin  // recVendorLedgerEntry begin

                    LineNumber := 0;

                    recGenJnlLine.Reset;
                    recGenJnlLine.SetRange("Journal Template Name", 'BANK PAYME');
                    recGenJnlLine.SetRange("Journal Batch Name", 'DEFAULT');
                    if recGenJnlLine.FindLast then begin
                        LineNumber := recGenJnlLine."Line No." + 10000;
                    end else begin
                        LineNumber := 10000;
                    end;

                    recGenJnlLine.Reset;
                    recGenJnlLine.SetRange("Integration Document No.", recPurchInvHdr."Integration Doc No");
                    if not recGenJnlLine.FindFirst then begin

                        insertGenjnlLine.Init;
                        insertGenjnlLine."Journal Template Name" := 'BANK PAYME';
                        insertGenjnlLine."Journal Batch Name" := 'DEFAULT';
                        insertGenjnlLine."Line No." := LineNumber;
                        insertGenjnlLine.Validate("Posting Date", recPurchInvHdr."Due Date");
                        insertGenjnlLine.Validate("Document No.", recPurchInvHdr."Integration Doc No");
                        insertGenjnlLine.Validate(insertGenjnlLine."Document Type", insertGenjnlLine."document type"::Payment);
                        insertGenjnlLine.Validate(insertGenjnlLine."Account Type", insertGenjnlLine."account type"::Vendor);
                        insertGenjnlLine.Validate("Account No.", recPurchInvHdr."Buy-from Vendor No.");
                        insertGenjnlLine.Validate(Amount, recVendorLedgerEntry."Remaining Amount");
                        insertGenjnlLine.Validate(insertGenjnlLine."Bal. Account Type", insertGenjnlLine."bal. account type"::"Bank Account");
                        insertGenjnlLine.Validate(insertGenjnlLine."Bal. Account No.", 'BANK0001');
                        insertGenjnlLine.Validate("External Document No.", recPurchInvHdr."Vendor Invoice No.");
                        insertGenjnlLine.Validate(insertGenjnlLine."Applies-to Doc. Type", insertGenjnlLine."applies-to doc. type"::Invoice);
                        insertGenjnlLine.Validate(insertGenjnlLine."Applies-to Doc. No.", recPurchInvHdr."No.");
                        insertGenjnlLine.Validate("Shortcut Dimension 1 Code", recPurchInvHdr."Shortcut Dimension 1 Code");
                        insertGenjnlLine.Validate("Department Code", recPurchInvHdr.Department);
                        insertGenjnlLine.Validate(Narration, recVendorLedgerEntry.Narration);
                        insertGenjnlLine.Validate("Integration Document No.", recPurchInvHdr."Integration Doc No");
                        insertGenjnlLine.Insert(true);

                    end;

                    recGenJnlLine.Reset;
                    recGenJnlLine.SetRange("Document No.", recPurchInvHdr."Integration Doc No");
                    GenJnlPost.Run(recGenJnlLine);


                    recBankAccLedgEntry.Reset;
                    recBankAccLedgEntry.SetRange("Integration Doc No", recPurchInvHdr."Integration Doc No");
                    if recBankAccLedgEntry.FindFirst then begin // recBankAccLedgEntry begin

                        EasyAutoNavBridge.Reset;
                        EasyAutoNavBridge.SetRange("Transaction No.", recPurchInvHdr."Integration Doc No");
                        EasyAutoNavBridge.SetRange(Validated, true);
                        EasyAutoNavBridge.SetRange(Flag, 0);
                        EasyAutoNavBridge.SetRange("Invoice Posted", true);
                        EasyAutoNavBridge.SetRange("Invoice Type", 'GREENCHANNEL');
                        EasyAutoNavBridge.SetRange(Applied, false);
                        if EasyAutoNavBridge.FindSet then
                            repeat

                                EasyAutoNavBridge."Applied By Doc No" := recBankAccLedgEntry."Document No.";
                                EasyAutoNavBridge.Applied := true;
                                EasyAutoNavBridge."Applied On" := CurrentDatetime;

                                recVendorBankAcc.Reset;
                                recVendorBankAcc.SetRange("Vendor No.", recPurchInvHdr."Buy-from Vendor No.");
                                recVendorBankAcc.SetRange("Default Account", true);
                                if recVendorBankAcc.FindFirst then begin
                                    EasyAutoNavBridge."Vendor Bank Account Name" := recVendorBankAcc.Name;
                                    EasyAutoNavBridge."Bank Account Number" := recVendorBankAcc."Bank Account No.";
                                    EasyAutoNavBridge."IFSC Code" := recVendorBankAcc."SWIFT Code";
                                end;

                                EasyAutoNavBridge.Modify;

                            until EasyAutoNavBridge.Next = 0;

                    end;

                end; // recVendorLedgerEntry end

            until recPurchInvHdr.Next = 0;
    end;

    var
        EasyAutoNavBridge: Record "Easy Auto - NAV Bridge";
        recPurchInvHdr: Record "Purch. Inv. Header";
        recGenJnlLine: Record "Gen. Journal Line";
        recGenJnlBatch: Record "Gen. Journal Batch";
        GenJnlDocNo: Code[20];
        NoSerisMgmt: Codeunit NoSeriesManagement;
        insertGenjnlLine: Record "Gen. Journal Line";
        LineNumber: Integer;
        GenJnlPost: Codeunit "Gen. Jnl.-Post";
        Evaluated_Amt: Decimal;
        recBankAccLedgEntry: Record "Bank Account Ledger Entry";
        StartDate: Date;
        EndDate: Date;
        recVendorLedgerEntry: Record "Vendor Ledger Entry";
        recVendorBankAcc: Record "Vendor Bank Account";
}

