Report 50092 "GSTIMPS_Purchase"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTIMPS_Purchase.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "GST Vendor Type" = const(Import), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"), "Document Type" = const(Invoice), "GST Group Type" = const(Service), "GST Credit" = const(Availment));
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
            column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"//NKP--CCIT
            {
            }
            column(PoS; PoS)
            {
            }
            column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."//NKP--CCIT
            {
            }
            column(GSTPrcnt; GSTPrcnt)
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
            column(VendName; VendName)
            {
            }
            column(Location_State; '')//"Detailed GST Ledger Entry"."Location State Code"//NKP--CCIT
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
            column(GSTTINRegNo; GSTTINRegNo)
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
            column(TotInvVal; TotInvVal)
            {
            }
            column(TotTaxVal; TotTaxVal)
            {
            }

            trigger OnAfterGetRecord()
            begin

                TotGstAmt := 0;
                GSTPrcnt := 0;
                //TotalInvoiceValue :=0;
                TaxableValue := 0;
                TotGstBasAmt := 0;
                Clear(IGST_Amount);
                Clear(CGST_Amount);
                Clear(SGST_Amount);

                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT

                TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEntInfo."Amount to Customer/Vendor";

                if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTER' then begin
                    //TotalInvoiceValue := TotalInvoiceValue +DtGstLdjEnt."Amount to Customer/Vendor";
                    TotGstAmt := TotGstAmt + "Detailed GST Ledger Entry"."GST Amount";
                    IGST_Amount := 0;
                end;

                if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTRA' then begin
                    //TotalInvoiceValue := TotalInvoiceValue +DtGstLdjEnt."Amount to Customer/Vendor";
                    TotGstAmt := TotGstAmt + "Detailed GST Ledger Entry"."GST Amount";
                    IGST_Amount := 0;
                end;

                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    //TotalInvoiceValue := TotalInvoiceValue +DtGstLdjEnt."Amount to Customer/Vendor";
                    IGST_Amount := IGST_Amount + "Detailed GST Ledger Entry"."GST Amount";
                    TotGstAmt := 0;
                end;


                TotInvVal := 0;
                TotTaxVal := 0;
                TotInvVal := "Detailed GST Ledger Entry"."GST Amount" + "Detailed GST Ledger Entry"."GST Base Amount";
                TotTaxVal := "Detailed GST Ledger Entry"."GST Base Amount";


                DtGstLdjEnt.Reset;
                DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                if DtGstLdjEnt.Find('-') then begin
                    repeat

                        TaxableValue := TaxableValue + DtGstLdjEnt."GST Base Amount";

                        GSTPrcnt := GSTPrcnt + DtGstLdjEnt."GST %";
                        PoS := '';
                        State.Reset;
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

                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;

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
                field("GSTIN of Location"; GSTTINRegNo)
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
        PoS: Code[50];
        GSTPrcnt: Decimal;
        TotGstAmt: Decimal;
        DtGstLdjEnt: Record "Detailed GST Ledger Entry";
        State: Record State;
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        TotGstBasAmt: Decimal;
        CGST_Amount: Decimal;
        SGST_Amount: Decimal;
        IGST_Amount: Decimal;
        GSTTINRegNo: Code[30];
        RecPurHdr: Record "Purch. Inv. Header";
        RecVendor: Record Vendor;
        VendName: Text;
        companyinfo: Record "Company Information";
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        TotInvVal: Decimal;
        TotTaxVal: Decimal;
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
}

