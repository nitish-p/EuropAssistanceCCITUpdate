Report 50082 GSTB2CSSales
{
    // Rohit 08.11.2017
    // 1.Modified code as per requirement.
    // 2.Modified layour as per requirement.
    // 3.change formula for invoice value.
    // 4.Added period filter.
    // 5.Added company name.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTB2CSSales.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Sales), "Source Type" = const(Customer), "Entry Type" = const("Initial Entry"), "GST Customer Type" = const(unregistered), "Document Type" = const(Invoice));//
            RequestFilterFields = "Posting Date";
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
            column(InvoiceType_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Invoice Type"//Naveen
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."
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
            column(GSTBaseAmount_DetailedGSTLedgerEntryvy; "Detailed GST Ledger Entry"."GST Base Amount")
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
            column(Typ; Typ)
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
            column(CustName; CustName)
            {
            }
            column(documentNo; "Detailed GST Ledger Entry"."Document No.")
            {
            }
            column(CessAmt; CessAmt)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalInvoiceValue := 0;

                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                TotalInvoiceValue := DtGstLdjEntInfo."Amount to Customer/Vendor";
                /*
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("Document No.",'%1',"Detailed GST Ledger Entry"."Document No.");
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',1);
                IF DtGstLdjEnt.FIND('-') THEN REPEAT
                  TotalInvoiceValue :=TotalInvoiceValue + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                */

                if "Detailed GST Ledger Entry"."GST Jurisdiction Type" = "Detailed GST Ledger Entry"."gst jurisdiction type"::Interstate then begin
                    if TotalInvoiceValue > 250000 then begin
                        CurrReport.Skip;
                    end;
                end;

                TotGstAmt := 0;
                GSTPrcnt := 0;
                TotalInvoiceValue := 0;
                TaxableValue := 0;

                DtGstLdjEnt.Reset;
                DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                if DtGstLdjEnt.Find('-') then begin
                    repeat
                        TaxableValue := DtGstLdjEnt."GST Base Amount";
                        /*
                          IF DtGstLdjEnt."GST Component Code"='Cess' THEN BEGIN
                            TotGstAmt := TotGstAmt + DtGstLdjEnt."GST Amount";
                          END;
                          */
                        // cess value
                        CessAmt := 0;
                        if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTRA' then begin
                            CessAmt := "Detailed GST Ledger Entry"."GST Amount"
                        end;

                        if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTER' then begin
                            CessAmt := "Detailed GST Ledger Entry"."GST Amount"
                        end;
                        //cess value

                        //TotalInvoiceValue :=TotalInvoiceValue + DtGstLdjEnt."Amount to Customer/Vendor";

                        GSTPrcnt := GSTPrcnt + DtGstLdjEnt."GST %";

                        State.SetRange(Code, DtGstLdjEntInfo."Buyer/Seller State Code");
                        if State.FindFirst then
                            PoS := State."State Code (GST Reg. No.)" + ' ' + State.Description;

                        if DtGstLdjEntInfo."e-Comm. Operator GST Reg. No." <> '' then
                            Typ := 'E'
                        else
                            Typ := 'OE';
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
                //code for customer name,ext doc no
                RecSalInv.Reset;
                RecSalInv.SetRange(RecSalInv."No.", "Detailed GST Ledger Entry"."Document No.");
                if RecSalInv.FindFirst then begin
                    CustName := RecSalInv."Bill-to Name";
                    //ExtDocNo := RecSalInv."External Document No.";
                end;
                //
                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;

            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get('');
                OldDocNo := '';
                OldGSTPer := 0;
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
                    Visible = true;
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
        PoS: Code[20];
        GSTPrcnt: Decimal;
        TotGstAmt: Decimal;
        DtGstLdjEnt: Record "Detailed GST Ledger Entry";
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
        State: Record State;
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        Typ: Text;
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        CompanyInformation: Record "Company Information";
        GSTTINRegNo: Code[30];
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        RecSalInv: Record "Sales Invoice Header";
        CusInvNo: Code[10];
        CustName: Text;
        ExtDocNo: Code[30];
        OldDocNo: Code[30];
        CurrDocNo: Code[30];
        OldGSTPer: Decimal;
        CurrGSTPer: Decimal;
        CessAmt: Decimal;
}

