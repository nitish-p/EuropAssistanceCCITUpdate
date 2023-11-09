Report 50091 GSTB2BURPurchase
{
    // Pushkar 26/10/2017
    // 1.Added column External Document No. and Vendor Name
    // 2.Added code for GST filter
    // 3.Added code for Vendor Name
    // priyanka.15.11.2017
    // 1.Added code for periodfilter.
    // 2.added column supplier.
    // 3.modified layout as per standard format.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTB2BURPurchase.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"), "Document Type" = const(Invoice));//, "GST Vendor Type" = const(Unregistered), "GST Credit" = const("Non-Availment"));
            RequestFilterFields = "Posting Date", "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyerSellerRegNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Buyer/Seller Reg. No.")
            {
            }
            column(DocumentNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document No.")
            {
            }
            column(DocumentLineNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document Line No.")
            {
            }
            column(No_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."No.")
            {
            }
            column(PostingDate_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Posting Date")
            {
            }
            column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"
            {
            }
            column(PoS; PoS)
            {
            }
            column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."
            {
            }
            column(GSTPrcnt; GSTPrcnt)
            {
            }
            column(GSTJurisdictionType_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Jurisdiction Type")
            {
            }
            column(GSTComponentCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Component Code")
            {
            }
            column(GST_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST %")
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(GSTCredit_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Credit")
            {
            }
            column(Type_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry".Type)
            {
            }
            column(GSTGroupType_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Group Type")
            {
            }
            column(TotGstAmt; TotGstAmt)
            {
            }
            column(TotalInvoiceValue; TotalInvoiceValue)
            {
            }
            column(TaxableValue; TaxableValue)
            {
            }
            column(CGST_Amount; CGST_Amount)
            {
            }
            column(SGST_Amount; SGST_Amount)
            {
            }
            column(IGST_Amount; IGST_Amount)
            {
            }
            column(ExternalDocNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."External Document No.")
            {
            }
            column(VendorName; VendName)
            {
            }
            column(vendorInvNo; vendorInvNo)
            {
            }
            column(state_code; state_code)
            {
            }
            column(state_; state_)
            {
            }
            column(LocVal; LocVal)
            {
            }
            column(GSTTINRegNo; GSTTINRegNo)
            {
            }
            column(company_name; companyinfo.Name)
            {
            }
            column(periodfilter; periodfilter)
            {
            }
            column(periodstartdate; periodstartdate)
            {
            }
            column(periodenddate; periodenddate)
            {
            }
            column(Eligibility; "Detailed GST Ledger Entry"."GST Credit")
            {
            }

            trigger OnAfterGetRecord()
            begin
                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                TotGstAmt := 0;
                GSTPrcnt := 0;
                TotalInvoiceValue := 0;
                TaxableValue := 0;
                TotGstBasAmt := 0;
                Clear(IGST_Amount);
                Clear(CGST_Amount);
                Clear(SGST_Amount);

                DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                DtGstLdjEnt.SetFilter("GST %", '%1', "Detailed GST Ledger Entry"."GST %");
                if DtGstLdjEnt.Find('-') then begin
                    repeat
                        TaxableValue := TaxableValue + DtGstLdjEnt."GST Base Amount";
                        if DtGstLdjEnt."GST Component Code" = 'Cess' then begin
                            TotGstAmt := TotGstAmt + DtGstLdjEnt."GST Amount";
                        end;
                        if DtGstLdjEnt."GST Component Code" = 'CGST' then begin
                            //TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEnt."Amount to Customer/Vendor";
                            TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEnt."GST Base Amount";
                            CGST_Amount := CGST_Amount + DtGstLdjEnt."GST Amount";
                        end;

                        if DtGstLdjEnt."GST Component Code" = 'CGST' then begin
                            SGST_Amount := SGST_Amount + DtGstLdjEnt."GST Amount";
                        end;

                        if DtGstLdjEnt."GST Component Code" = 'IGST' then begin
                            //TotalInvoiceValue := TotalInvoiceValue +DtGstLdjEnt."Amount to Customer/Vendor";
                            TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEnt."GST Base Amount";
                            IGST_Amount := IGST_Amount + DtGstLdjEnt."GST Amount";
                        end;

                        GSTPrcnt := GSTPrcnt + DtGstLdjEnt."GST %";
                        State.SetRange(Code, DtGstLdjEntInfo."Buyer/Seller State Code");
                        if State.FindFirst then
                            PoS := State."State Code (GST Reg. No.)" + ' ' + State.Description;
                    until DtGstLdjEnt.Next = 0;
                end;


                //location
                location.Reset;
                location.SetRange(location."GST Registration No.", GSTTINRegNo);
                if location.FindFirst then begin
                    LocVal := location.Code;
                end;


                RecGSTRegNo.Reset;
                RecGSTRegNo.SetRange(RecGSTRegNo.Code, GSTTINRegNo);
                if RecGSTRegNo.FindFirst then begin
                    state_code := RecGSTRegNo."State Code";
                end;
                //


                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;

                /*
                "Purchase Header".RESET;
                "Purchase Header".SETRANGE("Purchase Header"."No.","Detailed GST Ledger Entry"."Document No.");
                IF "Purchase Header".FINDFIRST THEN
                  VendName := "Purchase Header"."Pay-to Name";
                */

                RecPurHdr.Reset;
                RecPurHdr.SetRange(RecPurHdr."No.", "Detailed GST Ledger Entry"."Document No.");
                if RecPurHdr.FindFirst then begin
                    RecVendor.Reset;
                    RecVendor.SetRange(RecVendor."No.", RecPurHdr."Buy-from Vendor No.");
                    if RecVendor.FindFirst then begin
                        VendName := RecVendor.Name;
                    end;
                end;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("GSTIN Of Location"; GSTTINRegNo)
                {
                    ApplicationArea = Basic;
                    TableRelation = "GST Registration Nos.".Code;
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
        companyinfo.Get;
        periodfilter := "Detailed GST Ledger Entry".GetFilter("Detailed GST Ledger Entry"."Posting Date");
        periodstartdate := "Detailed GST Ledger Entry".GetRangeMin("Detailed GST Ledger Entry"."Posting Date");
        periodenddate := "Detailed GST Ledger Entry".GetRangemax("Detailed GST Ledger Entry"."Posting Date");
    end;

    var
        InvVal: Decimal;
        PoS: Code[20];
        GSTPrcnt: Decimal;
        TotGstAmt: Decimal;
        DtGstLdjEnt: Record "Detailed GST Ledger Entry";
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
        State: Record State;
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        TotGstBasAmt: Decimal;
        CGST_Amount: Decimal;
        SGST_Amount: Decimal;
        IGST_Amount: Decimal;
        GSTTINRegNo: Code[30];
        "Purchase Header": Record "Purchase Header";
        VendName: Text[200];
        RecPurHdr: Record "Purch. Inv. Header";
        vendorInvNo: Code[30];
        RecVendor: Record Vendor;
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        companyinfo: Record "Company Information";
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
}

