Report 50041 "Invoice Payment Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Invoice Payment Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.") order(ascending) where("Document Type" = const(Invoice));
            RequestFilterFields = "Vendor No.", "Posting Date", "Integration Document No", "Integrated Invoice Type", "Invoice Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(PostingDate_VendorLedgerEntry; Format("Vendor Ledger Entry"."Posting Date"))
            {
            }
            column(VendorNo_VendorLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
            {
            }
            column(DocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Document No.")
            {
            }
            column(Amount_VendorLedgerEntry; Abs("Vendor Ledger Entry".Amount))
            {
            }
            column(InvoiceDate_VendorLedgerEntry; Format("Vendor Ledger Entry"."Invoice Date"))
            {
            }
            column(RemainingAmount_VendorLedgerEntry; Abs("Vendor Ledger Entry"."Remaining Amount"))
            {
            }
            column(IntegrationDocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Integration Document No")
            {
            }
            column(IntegratedInvoiceType_VendorLedgerEntry; "Vendor Ledger Entry"."Integrated Invoice Type")
            {
            }
            column(recVendorName; recVendor.Name)
            {
            }
            column(PurchaseLCY_VendorLedgerEntry; "Vendor Ledger Entry"."Purchase (LCY)")
            {
            }
            column(GSTAmount_VendorLedgerEntry; "Vendor Ledger Entry"."GST Amount")
            {
            }
            column(VendInvNo; VendInvNo)
            {
            }
            column(TDSAmount_VendorLedgerEntry; "Vendor Ledger Entry"."TDS Amount")
            {
            }
            column(DebitNoteAmt; DebitNoteAmt)
            {
            }
            dataitem("<Vendor Ledger Entry2>"; "Vendor Ledger Entry")
            {
                DataItemLink = "Closed by Entry No." = field("Entry No.");
                DataItemTableView = sorting("Entry No.") order(ascending) where("Document Type" = const(Payment));
                column(ReportForNavId_1000000010; 1000000010)
                {
                }
                column(PaidAmount2; PaidAmount2)
                {
                }
                column(Amount_VendorLedgerEntry2; Abs("<Vendor Ledger Entry2>".Amount))
                {
                }
                column(VLE2; VLE2)
                {
                }
                column(DocumentNo_VendorLedgerEntry2; "<Vendor Ledger Entry2>"."Document No.")
                {
                }
                column(PostingDate_VendorLedgerEntry2; Format("<Vendor Ledger Entry2>"."Posting Date"))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    VLE2 := true;
                    VLE3 := false;
                    PaidAmount2 := 0;

                    "<Vendor Ledger Entry2>".CalcFields("<Vendor Ledger Entry2>".Amount);


                    if "<Vendor Ledger Entry2>"."Closed by Amount" <> 0 then begin
                        PaidAmount2 := "<Vendor Ledger Entry2>"."Closed by Amount";
                    end else begin
                        DetVendLedEntry.Reset;
                        DetVendLedEntry.SetRange("Applied Vend. Ledger Entry No.", "<Vendor Ledger Entry2>"."Entry No.");
                        DetVendLedEntry.SetRange("Vendor Ledger Entry No.", "Vendor Ledger Entry"."Entry No.");
                        DetVendLedEntry.SetRange(DetVendLedEntry."Entry Type", DetVendLedEntry."entry type"::Application);
                        if DetVendLedEntry.FindFirst then begin
                            PaidAmount2 := DetVendLedEntry.Amount;
                        end;
                    end;
                end;
            }
            dataitem("<Vendor Ledger Entry3>"; "Vendor Ledger Entry")
            {
                DataItemLink = "Entry No." = field("Closed by Entry No.");
                DataItemTableView = sorting("Entry No.") order(ascending) where("Document Type" = const(Payment));
                column(ReportForNavId_1000000013; 1000000013)
                {
                }
                column(PaidAmount3; PaidAmount3)
                {
                }
                column(PostingDate_VendorLedgerEntry3; Format("<Vendor Ledger Entry3>"."Posting Date"))
                {
                }
                column(VLE3; VLE3)
                {
                }
                column(DocumentNo_VendorLedgerEntry3; "<Vendor Ledger Entry3>"."Document No.")
                {
                }
                column(Amount_VendorLedgerEntry3; Abs("<Vendor Ledger Entry3>".Amount))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    VLE2 := false;
                    VLE3 := true;
                    PaidAmount3 := 0;

                    "<Vendor Ledger Entry3>".CalcFields("<Vendor Ledger Entry3>".Amount);


                    if "<Vendor Ledger Entry3>"."Closed by Amount" <> 0 then begin
                        PaidAmount3 := "<Vendor Ledger Entry3>"."Closed by Amount";
                    end else begin
                        DetVendLedEntry.Reset;
                        DetVendLedEntry.SetRange("Applied Vend. Ledger Entry No.", "<Vendor Ledger Entry3>"."Entry No.");
                        DetVendLedEntry.SetRange("Vendor Ledger Entry No.", "Vendor Ledger Entry"."Entry No.");
                        DetVendLedEntry.SetRange(DetVendLedEntry."Entry Type", DetVendLedEntry."entry type"::Application);
                        if DetVendLedEntry.FindFirst then begin
                            PaidAmount3 := DetVendLedEntry.Amount;
                        end;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            var
                taxinfo: Codeunit TaxInfo;
                GSTBaseAmt: Decimal;
                TDSAmt: Decimal;
                TDSBaseAmt: Decimal;
                IGST: Decimal;
                SGST: Decimal;
                CGST: Decimal;
                IGSTPer: Decimal;
                SGSTPer: Decimal;
                CGSTPer: Decimal;
            //Naveen
            begin
                Taxinfo.GetTaxInfo(PurchInvHdr.RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);
                VLE2 := false;
                VLE3 := false;
                VendInvNo := '';
                DebitNoteAmt := 0;

                PurchInvHdr.Reset;
                PurchInvHdr.SetRange("No.", "Vendor Ledger Entry"."Document No.");
                if not PurchInvHdr.FindFirst then
                    CurrReport.Skip;

                PurchInvHdr.Reset;
                PurchInvHdr.SetRange("No.", "Vendor Ledger Entry"."Document No.");
                if PurchInvHdr.FindFirst then begin
                    VendInvNo := PurchInvHdr."Vendor Invoice No.";

                    PurchCrMemoHdr.Reset;
                    PurchCrMemoHdr.SetRange(PurchCrMemoHdr."Applies-to Doc. Type", PurchCrMemoHdr."applies-to doc. type"::Invoice);
                    PurchCrMemoHdr.SetRange("Applies-to Doc. No.", PurchInvHdr."No.");
                    if PurchCrMemoHdr.FindSet then
                        repeat
                            // PurchCrMemoHdr.CalcFields(PurchCrMemoHdr."Amount to Vendor");//CCIT-NkP
                            DebitNoteAmt := DebitNoteAmt + (GSTBaseAmt + CGST + SGST + IGST - TdsAmt);
                        until PurchCrMemoHdr.Next = 0;

                end;

                "Vendor Ledger Entry".CalcFields("Vendor Ledger Entry".Amount);
                "Vendor Ledger Entry".CalcFields("Vendor Ledger Entry"."Remaining Amount");
                "Vendor Ledger Entry".CalcFields("Vendor Ledger Entry"."Remaining Amount");

                if Abs("Vendor Ledger Entry".Amount) = Abs("Vendor Ledger Entry"."Remaining Amount") then
                    CurrReport.Skip;

                recVendor.Get("Vendor Ledger Entry"."Vendor No.");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        VLE: Record "Vendor Ledger Entry";
        ClosedByPaymentNo: Code[20];
        ClosedPaymentDate: Date;
        ClosedByAmount: Decimal;
        PurchInvHdr: Record "Purch. Inv. Header";
        recVendor: Record Vendor;
        VLE2: Boolean;
        VLE3: Boolean;
        PaidAmount2: Decimal;
        PaidAmount3: Decimal;
        DetVendLedEntry: Record "Detailed Vendor Ledg. Entry";
        VendInvNo: Text[35];
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        DebitNoteAmt: Decimal;
}

