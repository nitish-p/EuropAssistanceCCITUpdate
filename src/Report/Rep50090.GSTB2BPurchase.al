Report 50090 GSTB2BPurchase
{
    // Rohit 26.10.17
    // 1.Modified code as per requirement.
    // 2.Modified layour as per requirement.
    // 
    // Rohit 06.11.2017
    // 1.change formula for invoice value.
    // 2.Added period filter.
    // 3.Added company name.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTB2BPurchase.rdl';

    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "GST Vendor Type" = const(Registered), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"), "Document Type" = const(Invoice), "GST Credit" = const(Availment));
            RequestFilterFields = "Posting Date", "Document No.", "Location  Reg. No.";
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
            column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"//Naveen
            {
            }
            column(PoS; PoS)
            {
            }
            column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."//Naveen
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
            column(GSTTINRegNo; GSTTINRegNo)
            {
            }
            column(vendorInvNo; vendorInvNo)
            {
            }
            column(SumCgst; SumCgst)
            {
            }
            column(SumSgst; SumSgst)
            {
            }
            column(SumIgst; SumIgst)
            {
            }
            column(SupplierName; SupplierName)
            {
            }
            column(GSTBaseAmt; GSTBaseAmt)
            {
            }
            column(periodstartdate; Format(periodstartdate))
            {
            }
            column(periodenddate; Format(periodenddate))
            {
            }
            column(Comp_Name; CompanyInformation.Name)
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

            trigger OnAfterGetRecord()
            begin

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
                        DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                        TaxableValue := TaxableValue + DtGstLdjEnt."GST Base Amount";

                        if DtGstLdjEnt."GST Component Code" = 'Cess' then begin
                            TotGstAmt := TotGstAmt + DtGstLdjEnt."GST Amount";
                        end;
                        if DtGstLdjEnt."GST Component Code" = 'CGST' then begin
                            TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEntInfo."Amount to Customer/Vendor";
                            CGST_Amount := CGST_Amount + DtGstLdjEnt."GST Amount";
                        end;

                        if DtGstLdjEnt."GST Component Code" = 'CGST' then begin
                            SGST_Amount := SGST_Amount + DtGstLdjEnt."GST Amount";
                        end;

                        if DtGstLdjEnt."GST Component Code" = 'IGST' then begin
                            TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEntInfo."Amount to Customer/Vendor";
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


                SumCgst += CGST_Amount;
                SumSgst += SGST_Amount;
                SumIgst += IGST_Amount;

                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;

                RecPurHdr.Reset;
                RecPurHdr.SetRange(RecPurHdr."No.", "Detailed GST Ledger Entry"."Document No.");
                if RecPurHdr.FindFirst then begin
                    vendorInvNo := RecPurHdr."Vendor Invoice No.";
                    SupplierName := RecPurHdr."Buy-from Vendor Name";
                end;


                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    GSTBaseAmt := "Detailed GST Ledger Entry"."GST Base Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then begin
                    GSTBaseAmt := "Detailed GST Ledger Entry"."GST Base Amount" / 2;
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' then begin
                    GSTBaseAmt := "Detailed GST Ledger Entry"."GST Base Amount" / 2;
                end;
            end;

            trigger OnPreDataItem()
            begin
                //"Detailed GST Ledger Entry".RESET;
                //"Detailed GST Ledger Entry".SETRANGE("Detailed GST Ledger Entry"."Location  Reg. No.",GSTTINRegNo);
                //"Detailed GST Ledger Entry".SETFILTER("Detailed GST Ledger Entry"."Location  Reg. No.",'%1',GSTTINRegNo);
                CompanyInformation.Get('');
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
                field("From Date"; periodstartdate)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("To Date"; periodenddate)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("From Date..To Date"; periodfilter)
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
        State: Record State;
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        TotGstBasAmt: Decimal;
        CGST_Amount: Decimal;
        SGST_Amount: Decimal;
        IGST_Amount: Decimal;
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        GSTTINRegNo: Code[30];
        RecPurHdr: Record "Purch. Inv. Header";
        vendorInvNo: Code[30];
        SumCgst: Decimal;
        SumSgst: Decimal;
        SumIgst: Decimal;
        SupplierName: Text[75];
        GSTBaseAmt: Decimal;
        CompanyInformation: Record "Company Information";
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
}

