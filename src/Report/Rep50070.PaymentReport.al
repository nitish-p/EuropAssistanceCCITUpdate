Report 50070 "Payment Report"
{
    // prdp
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payment Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.") order(descending) where("Document Type" = const(Payment));//, "Reference Invoice Number" = filter(<> ''));
            RequestFilterFields = "Vendor No.", "Posting Date", "Vendor Posting Group", "Reference Invoice Number", "Integration Document No", "Integrated Invoice Type";
            column(ReportForNavId_1; 1)
            {
            }
            column(PostingDate_VendorLedgerEntry; Format("Vendor Ledger Entry"."Posting Date"))
            {
            }
            column(DocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Document No.")
            {
            }
            column(Narration_VendorLedgerEntry; "Vendor Ledger Entry".Narration)
            {
            }
            column(IntegrationDocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Integration Document No")
            {
            }
            column(ReferenceInvoiceNumber_VendorLedgerEntry; "Vendor Ledger Entry"."Reference Invoice Number")
            {
            }
            column(IntegratedInvoiceType_VendorLedgerEntry; "Vendor Ledger Entry"."Integrated Invoice Type")
            {
            }
            column(UTRNo_VendorLedgerEntry; "Vendor Ledger Entry"."UTR No.")
            {
            }
            column(VendorNo_VendorLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
            {
            }
            column(ExternalDocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."External Document No.")
            {
            }
            column(VendorPostingGroup_VendorLedgerEntry; "Vendor Ledger Entry"."Vendor Posting Group")
            {
            }
            column(DateCreditedinBank_VendorLedgerEntry; "Vendor Ledger Entry"."Date Credited in Bank")
            {
            }
            column(Amount_VendorLedgerEntry; "Vendor Ledger Entry".Amount)
            {
            }
            column(VendorName; vendorName)
            {
            }
            column(GLNumber; GLNumber)
            {
            }
            column(bankGL; bankGL)
            {
            }
            column(ExtDocNo; ExtDocNo)
            {
            }
            column(baseAmt; baseAmt)
            {
            }
            column(gstAmt; gstAmt)
            {
            }
            column(tdsAmt; tdsAmt)
            {
            }

            trigger OnAfterGetRecord()
            begin
                vendorName := '';
                ExtDocNo := '';
                baseAmt := 0;
                gstAmt := 0;
                tdsAmt := 0;
                bankGL := '';
                GLNumber := '';

                recVendor.Get("Vendor Ledger Entry"."Vendor No.");
                vendorName := recVendor.Name;

                VLE.Reset;
                VLE.SetRange(VLE."Document Type", VLE."document type"::Invoice);
                VLE.SetRange("Document No.", "Vendor Ledger Entry"."Reference Invoice Number");
                VLE.SetRange("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                VLE.SetFilter("External Document No.", '<>%1', '');
                if VLE.FindFirst then begin
                    ExtDocNo := VLE."External Document No.";
                    baseAmt := VLE."Purchase (LCY)";
                    gstAmt := VLE."GST Amount";
                    tdsAmt := VLE."TDS Amount"
                end;

                GLE.Reset;
                GLE.SetRange("Document No.", "Vendor Ledger Entry"."Document No.");
                GLE.SetRange(GLE."Bal. Account Type", GLE."bal. account type"::Vendor);
                if GLE.FindFirst then begin
                    bankGL := GLE."G/L Account No.";
                end;

                GLE.Reset;
                GLE.SetRange("Document No.", "Vendor Ledger Entry"."Document No.");
                GLE.SetRange(GLE."Bal. Account Type", GLE."bal. account type"::"Bank Account");
                if GLE.FindFirst then begin
                    GLNumber := GLE."G/L Account No.";
                end;
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
        recVendor: Record Vendor;
        GLNumber: Code[20];
        vendorName: Text[50];
        VLE: Record "Vendor Ledger Entry";
        ExtDocNo: Code[35];
        baseAmt: Decimal;
        gstAmt: Decimal;
        tdsAmt: Decimal;
        bankGL: Code[20];
        GLE: Record "G/L Entry";
}

