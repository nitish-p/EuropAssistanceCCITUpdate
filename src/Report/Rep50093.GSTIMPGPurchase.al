Report 50093 "GSTIMPG_Purchase"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTIMPG_Purchase.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "GST Vendor Type" = const(6), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"), "Document Type" = const(Invoice), "GST Group Type" = const(Goods), "GST Vendor Type" = const(Import));
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
            column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"//Naveen
            {
            }
            column(PoS; PoS)
            {
            }
            column(Bill_No; Bill_No)
            {
            }
            column(Bill_Date; Bill_Date)
            {
            }
            column(Bill_Value; Bill_Value)
            {
            }
            column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."//Nkp--CCIT
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
            column(Type_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry".Type)
            {
            }
            column(GSTCredit_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Credit")
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
            column(Document_type; "Detailed GST Ledger Entry"."Document Type")
            {
            }
            column(External_document_no; "Detailed GST Ledger Entry"."External Document No.")
            {
            }
            column(Supply_type; "Detailed GST Ledger Entry"."GST Jurisdiction Type")
            {
            }
            column(Companyname; companyInfo.Name)
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
                Clear(Bill_No);
                Clear(Bill_Date);
                Clear(Bill_Value);
                Clear(PoS);

                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                DtGstLdjEnt.SetFilter("GST %", '%1', "Detailed GST Ledger Entry"."GST %");
                if DtGstLdjEnt.Find('-') then begin
                    repeat

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

                        Purch_Inv_Header_Record.Reset();
                        Purch_Inv_Header_Record.SetFilter("No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                        if Purch_Inv_Header_Record.FindSet then begin
                            repeat
                                Bill_No := Purch_Inv_Header_Record."Bill of Entry No.";
                                Bill_Date := Purch_Inv_Header_Record."Bill of Entry Date";
                                Bill_Value := Purch_Inv_Header_Record."Bill of Entry Value";
                            until
Purch_Inv_Header_Record.Next = 0;
                        end;

                        State.SetRange(Code, DtGstLdjEntInfo."Buyer/Seller State Code");
                        if State.FindFirst then
                            PoS := State."State Code (GST Reg. No.)" + ' ' + State.Description;
                    until DtGstLdjEnt.Next = 0;
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
        companyInfo.Get;
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
        Purch_Inv_Header_Record: Record "Purch. Inv. Header";
        Bill_No: Text;
        Bill_Date: Date;
        Bill_Value: Decimal;
        State: Record State;
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        TotGstBasAmt: Decimal;
        CGST_Amount: Decimal;
        SGST_Amount: Decimal;
        IGST_Amount: Decimal;
        GSTTINRegNo: Code[30];
        companyInfo: Record "Company Information";
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
}

