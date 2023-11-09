Report 50099 "GSTR2_HSN_Purchase"
{
    // Rohit 28.10.2017
    // 1.Modified code as per the requirement.
    // 2.modified layout as per the requirement.
    // 3.added new field vendor invoice no.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTR2_HSN_Purchase.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"), "Document Type" = filter(Invoice));
            RequestFilterFields = "Posting Date", "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyerSellerRegNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Buyer/Seller Reg. No.")
            {
            }
            column(HSNSACCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."HSN/SAC Code")
            {
            }
            column(DocumentType_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document Type")
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
            column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
            {
            }
            column(InvoiceType_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Invoice Type"//NKP--CCIT
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."//NKP---CCIT
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
            column(TotalInvoiceValue; TotalInvoiceValue)
            {
            }
            column(TaxableValue; TaxableValue)
            {
            }
            column(Quantity_Total; Quantity_Total)
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
            column(HSN_Description; HSN_Description)
            {
            }
            column(UQC_Description; UQC_Description)
            {
            }
            column(Total_Amount_CR; Total_Amount_CR)
            {
            }
            column(Total_Cess_Amount; Total_Cess_Amount)
            {
            }
            column(Quantity_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry".Quantity)
            {
            }
            column(GBA; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(ACV; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"
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
            column(periodfilter; periodfilter)
            {
            }
            column(periodstartdate; periodstartdate)
            {
            }
            column(periodenddate; periodenddate)
            {
            }
            column(Company_name; companyinfo.Name)
            {
            }

            trigger OnAfterGetRecord()
            begin

                Clear(CGST_Amount);
                Clear(SGST_Amount);
                Clear(IGST_Amount);
                Clear(Total_Cess_Amount);

                //CLEAR(Quantity_Total);

                Clear(HSN_Description);
                Clear(UQC_Description);
                Clear(GST_Amount_CR);
                Clear(GST_Base_Amt_CR);
                Clear(Total_Amount_CR);


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
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then begin
                    CGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    IGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' then begin
                    SGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTER' then begin
                    Total_Cess_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTRA' then begin
                    Total_Cess_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;


                Sales_Inv_Line_Record.Reset();
                Sales_Inv_Line_Record.SetRange("Document No.", "Detailed GST Ledger Entry"."Document No.");
                if Sales_Inv_Line_Record.FindFirst then begin
                    UQC_Description := Sales_Inv_Line_Record."Unit of Measure";
                end;
                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                TaxableValue := TaxableValue + "Detailed GST Ledger Entry"."GST Base Amount";

                TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEntInfo."Amount to Customer/Vendor";

                Detailed_GST_Ledger_Entry_CR1_Record.Reset();
                DtGstLdjEnt.Reset();
                DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                if DtGstLdjEnt.Find('-') then begin
                    repeat
                        if DtGstLdjEnt."GST Component Code" = 'CGST' then begin
                            //TaxableValue :=TaxableValue + DtGstLdjEnt."GST Base Amount";
                            //Quantity_Total :=Quantity_Total + DtGstLdjEnt.Quantity;
                            //TotalInvoiceValue :=TotalInvoiceValue + DtGstLdjEnt."Amount to Customer/Vendor";
                            //CGST_Amount :=CGST_Amount +DtGstLdjEnt."GST Amount";
                        end;
                        if DtGstLdjEnt."GST Component Code" = 'IGST' then begin
                            //TaxableValue := TaxableValue + DtGstLdjEnt."GST Base Amount";
                            //Quantity_Total :=Quantity_Total + DtGstLdjEnt.Quantity;
                            //TotalInvoiceValue :=TotalInvoiceValue + DtGstLdjEnt."Amount to Customer/Vendor";
                            //IGST_Amount :=IGST_Amount +DtGstLdjEnt."GST Amount";
                        end;
                        if DtGstLdjEnt."GST Component Code" = 'SGST' then begin
                            //SGST_Amount :=SGST_Amount +DtGstLdjEnt."GST Amount";
                        end;
                        if DtGstLdjEnt."GST Component Code" = 'Cess' then begin
                            //Total_Cess_Amount := Total_Cess_Amount + DtGstLdjEnt."GST Amount";
                        end;

                        //FOR CR VALUE
                        Detailed_GST_Ledger_Entry_CR1_Record.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                        Detailed_GST_Ledger_Entry_CR1_Record.SetFilter("GST Component Code", '%1', 'CGST');
                        Detailed_GST_Ledger_Entry_CR1_Record.SetFilter("Document Type", '%1', 3); //For Credit Memo
                        if Detailed_GST_Ledger_Entry_CR1_Record.Find('-') then begin
                            repeat
                                GST_Amount_CR := GST_Amount_CR + Detailed_GST_Ledger_Entry_CR1_Record."GST Amount";
                                GST_Base_Amt_CR := GST_Base_Amt_CR + Detailed_GST_Ledger_Entry_CR1_Record."GST Base Amount";
                            until Detailed_GST_Ledger_Entry_CR1_Record.Next = 0;
                        end;
                        Detailed_GST_Ledger_Entry_CR1_Record.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                        Detailed_GST_Ledger_Entry_CR1_Record.SetFilter("GST Component Code", '%1', 'IGST');
                        Detailed_GST_Ledger_Entry_CR1_Record.SetFilter("Document Type", '%1', 3); //For Credit Memo
                        if Detailed_GST_Ledger_Entry_CR1_Record.Find('-') then begin
                            repeat
                                GST_Amount_CR := GST_Amount_CR + Detailed_GST_Ledger_Entry_CR1_Record."GST Amount";
                                GST_Base_Amt_CR := GST_Base_Amt_CR + Detailed_GST_Ledger_Entry_CR1_Record."GST Base Amount";
                            until Detailed_GST_Ledger_Entry_CR1_Record.Next = 0;
                        end;
                        //END IGST; END CR VALUE

                        HSN_Record.Reset();
                        HSN_Record.SetFilter(Code, '%1', DtGstLdjEnt."HSN/SAC Code");
                        if HSN_Record.FindFirst then begin
                            HSN_Description := HSN_Record.Description;
                        end;

                    until DtGstLdjEnt.Next = 0;

                    Total_Amount_CR := GST_Amount_CR + GST_Base_Amt_CR;
                end;


                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                Clear(TaxableValue);
                Clear(TotalInvoiceValue);
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
        DtGstLdjEnt: Record "Detailed GST Ledger Entry";
        Detailed_GST_Ledger_Entry_CR1_Record: Record "Detailed GST Ledger Entry";
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        Quantity_Total: Decimal;
        CGST_Amount: Decimal;
        SGST_Amount: Decimal;
        IGST_Amount: Decimal;
        HSN_Record: Record "HSN/SAC";
        HSN_Description: Text;
        Sales_Inv_Line_Record: Record "Purch. Inv. Line";
        UQC_Description: Text;
        GST_Amount_CR: Decimal;
        GST_Base_Amt_CR: Decimal;
        Total_Amount_CR: Decimal;
        Total_Cess_Amount: Decimal;
        GSTTINRegNo: Code[30];
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        companyinfo: Record "Company Information";
}

