Report 50084 GSTCDNURSales
{
    // Rohit 09.11.2017
    // 1.Modified code as per the requirement.
    // 2.modified layout as per the requirement.
    // 3.added new field vendor invoice no.
    // 4.Added code for datefilter.
    // 5.Modified layout.
    // 6.Modified code for cess inter and cess intra
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTCDNURSales.rdl';

    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = filter(Sales), "GST Customer Type" = filter(registered), "Source Type" = filter(Customer), "Entry Type" = filter("Initial Entry"));
            RequestFilterFields = "Posting Date", "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyerSellerRegNo_DetailedGSTLedgerEntry; Buyer_Seller_Reg_No)
            {
            }
            column(OriginalInvoiceNo_DetailedGSTLedgerEntry; Org_Inv_No)
            {
            }
            column(OriginalInvoiceDate_DetailedGSTLedgerEntry; Org_Inv_Dt_No)
            {
            }
            column(DocumentNo_DetailedGSTLedgerEntry; Doc_No)
            {
            }
            column(PostingDate_DetailedGSTLedgerEntry; Post_Doc_Date)
            {
            }
            column(DocumentType_DetailedGSTLedgerEntry; Doc_Type)
            {
            }
            column(ReasonCode_DetailedGSTLedgerEntry; Reason_Code)
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; GST_Base_Amt)
            {
            }
            column(URTyp; URTyp)
            {
            }
            column(DocTyp; DocTyp)
            {
            }
            column(PoS; PoS)
            {
            }
            column(InvValue; TotInvVal)
            {
            }
            column(GSTPrcnt; GSTPrcnt)
            {
            }
            column(TotGstAmt; TotGstAmt)
            {
            }
            column(PreGST; PreGST)
            {
            }
            column(TotalInvoiceValue; TotalInvoiceValue)
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
            column(LocVal; LocVal)
            {
            }
            column(CustName; CustName)
            {
            }
            column(GST_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST %")
            {
            }
            column(GSTComponentCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Component Code")
            {
            }
            column(BASE_amount; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(GST_Amount; "Detailed GST Ledger Entry"."GST Amount")
            {
            }

            trigger OnAfterGetRecord()
            var
                DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
            begin
                TotGstAmt := 0;
                TotalInvoiceValue := 0;
                tst1 := 0;
                tst2 := 0;
                Clear(Buyer_Seller_Reg_No);
                Clear(Org_Inv_No);
                Clear(Org_Inv_Dt_No);
                Clear(Doc_No);
                Clear(Post_Doc_Date);
                Clear(Doc_Type);
                Clear(Reason_Code);
                Clear(GST_Percent);
                Clear(GST_Base_Amt);
                Clear(URTyp);


                DtGstLdjEnt.Reset();
                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                if (("Detailed GST Ledger Entry"."Document Type" = 2) and (DtGstLdjEntInfo."Sales Invoice Type" = 5)) or ("Detailed GST Ledger Entry"."Document Type" = 3) then begin
                    TotalInvoiceValue := 0;
                    DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");

                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            TotGstAmt := TotGstAmt + DtGstLdjEnt."GST Amount";
                        until DtGstLdjEnt.Next = 0;
                        TotalInvoiceValue := TotGstAmt + "Detailed GST Ledger Entry"."GST Base Amount";
                        if TotalInvoiceValue <= 250000 then begin
                            CurrReport.Skip;
                        end;
                    end;

                    //END ELSE BEGIN
                    TotGstAmt := 0;
                    GSTPrcnt := 0;
                    DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            if DtGstLdjEnt."GST Component Code" = 'Cess' then begin
                                TotGstAmt := TotGstAmt + DtGstLdjEnt."GST Amount";
                            end;
                            GSTPrcnt := GSTPrcnt + DtGstLdjEnt."GST %";
                            State.SetRange(Code, DtGstLdjEntInfo."Buyer/Seller State Code");
                            if State.FindFirst then
                                PoS := State."State Code (GST Reg. No.)" + ' ' + State.Description;
                            if ("Detailed GST Ledger Entry"."Document Type" = 2) and (DtGstLdjEntInfo."Sales Invoice Type" = 5) then
                                DocTyp := 'D'
                            else
                                if "Detailed GST Ledger Entry"."Document Type" = 3 then
                                    DocTyp := 'C';
                            Buyer_Seller_Reg_No := DtGstLdjEnt."Buyer/Seller Reg. No.";
                            Org_Inv_No := DtGstLdjEnt."Original Invoice No.";
                            Org_Inv_Dt_No := DtGstLdjEntInfo."Original Invoice Date";
                            Doc_No := DtGstLdjEnt."Document No.";
                            Post_Doc_Date := DtGstLdjEnt."Posting Date";
                            Doc_Type := DtGstLdjEnt."Document Type";
                            //            Reason_Code :=DtGstLdjEnt."Reason Code";
                            GST_Percent := DtGstLdjEnt."GST %";
                            GST_Base_Amt := DtGstLdjEnt."GST Base Amount";
                        until DtGstLdjEnt.Next = 0;
                        DtGstLdjEnt_1.Reset();
                        DtGstLdjEnt_1.SetFilter("Document No.", '%1', Org_Inv_No);
                        if DtGstLdjEnt_1.FindFirst then begin
                            if DtGstLdjEnt_1."GST Customer Type" = 2 then begin
                                URTyp := 'B2CL'
                            end else
                                if (DtGstLdjEnt_1."GST Customer Type" = 3) and (DtGstLdjEnt_1."GST Without Payment of Duty") = true then
                                    URTyp := 'EXPWOP'

                                else
                                    if (DtGstLdjEnt_1."GST Customer Type" = 3) and (DtGstLdjEnt_1."GST Without Payment of Duty") = false then
                                        URTyp := 'EXPWP'
                        end;
                    end;
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
        DtGstLdjEnt_1: Record "Detailed GST Ledger Entry";
        State: Record State;
        DocTyp: Code[1];
        TotInvVal: Decimal;
        PreGST: Code[1];
        URTyp: Code[10];
        TotalInvoiceValue: Decimal;
        tst1: Decimal;
        tst2: Decimal;
        Buyer_Seller_Reg_No: Text;
        Org_Inv_No: Text;
        Org_Inv_Dt_No: Date;
        Doc_No: Text;
        Post_Doc_Date: Date;
        Doc_Type: Option;
        Reason_Code: Text;
        GST_Percent: Decimal;
        GST_Base_Amt: Decimal;
        GSTTINRegNo: Code[30];
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        CompanyInformation: Record "Company Information";
        location: Record Location;
        state_code: Text[20];
        LocVal: Code[10];
        RecGSTRegNo: Record "GST Registration Nos.";
        RecSalInv: Record "Sales Invoice Header";
        CustName: Text;
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
}

