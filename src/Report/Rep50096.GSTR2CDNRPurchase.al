Report 50096 "GSTR2_CDNR_Purchase"
{
    // priyanka.s 15.11.17
    // 1.Added columns Supply Type,Reason For Issuing document,Supplier Type.
    // 2.Added code for GST filter
    // 3.added code for vendor name.
    // 4.added code foe reason code.
    // 5.added code for note value.
    // 6.added code for posting date filter.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTR2_CDNR_Purchase.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "GST Vendor Type" = const(Registered), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"));
            RequestFilterFields = "Posting Date", "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyerSellerRegNo_DetailedGSTLedgerEntry; Buyer_Seller_Reg_No)
            {
            }
            column(No_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."No.")
            {
            }
            column(GST_DetailedGSTLedgerEntry1; "Detailed GST Ledger Entry"."GST %")
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
            column(GST_DetailedGSTLedgerEntry; GST_Percent)
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; Tot_Taxable_value)
            {
            }
            column(URTyp; URTyp)
            {
            }
            column(Reason_Code; Reason_Code)
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
            column(GSTComponentCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Component Code")
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
            column(PreGST; PreGST)
            {
            }
            column(TotalInvoiceValue; TotalInvoiceValue)
            {
            }
            column(CGST_Amount; CGST_Amount)
            {
            }
            column(IGST_Amount; IGST_Amount)
            {
            }
            column(DocumentType; "Detailed GST Ledger Entry"."Document Type")
            {
            }
            column(GSTJurisdictionType_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Jurisdiction Type")
            {
            }
            column(VendorName; VendName)
            {
            }
            column(vendorInvNo; vendorInvNo)
            {
            }
            column(noteValue; noteValue)
            {
            }
            column(CreeditValue; CreeditValue)
            {
            }
            column(vendore_cr_memo_no; "Detailed GST Ledger Entry"."External Document No.")
            {
            }
            column(company_name; company_info.Name)
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
            column(Eligibility; "Detailed GST Ledger Entry"."GST Credit")
            {
            }
            dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
            {
                DataItemTableView = where("Entry Type" = const("Initial Entry"), "Document Type" = const("Credit Memo"));
                column(ReportForNavId_1000000042; 1000000042)
                {
                }
                column(DVLE_DocNo; "Detailed Vendor Ledg. Entry"."Document No.")
                {
                }
                column(DVLE_Amount; "Detailed Vendor Ledg. Entry".Amount)
                {
                }
                column(DVLEDocNo; DVLEDocNo)
                {
                }
                column(InvoiceDate; Format(InvoiceDate))
                {
                }
                column(ExtDocNo; ExtDocNo)
                {
                }
                column(DVLE_PostingDate; Format("Detailed Vendor Ledg. Entry"."Posting Date"))
                {
                }

                trigger OnAfterGetRecord()
                begin

                    RecPurCrMemoHdr.Reset;
                    RecPurCrMemoHdr.SetRange(RecPurCrMemoHdr."No.", "Detailed Vendor Ledg. Entry"."Document No.");
                    if RecPurCrMemoHdr.FindFirst then begin
                        DVLEDocNo := RecPurCrMemoHdr."Applies-to Doc. No.";
                        ExtDocNo := RecPurCrMemoHdr."Vendor Cr. Memo No.";
                    end;

                    RecPurCrMemoHdr.Reset;
                    RecPurCrMemoHdr.SetRange(RecPurCrMemoHdr."No.", "Detailed Vendor Ledg. Entry"."Document No.");
                    if RecPurCrMemoHdr.FindFirst then begin
                        REcVendLeEntry.Reset;
                        REcVendLeEntry.SetRange(REcVendLeEntry."Document No.", RecPurCrMemoHdr."Applies-to Doc. No.");
                        if REcVendLeEntry.FindFirst then begin
                            InvoiceDate := REcVendLeEntry."Posting Date";
                        end;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                TotalInvoiceValue := 0;
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
                Clear(Tot_Taxable_value);
                Clear(CGST_Amount);
                Clear(IGST_Amount);
                Reason_Code := '';

                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                DtGstLdjEnt.Reset();
                if (("Detailed GST Ledger Entry"."Document Type" = 2) and (DtGstLdjEntInfo."Sales Invoice Type" = 5)) or ("Detailed GST Ledger Entry"."Document Type" = 3) then begin
                    DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                    TotGstAmt := 0;
                    GSTPrcnt := 0;
                    DtGstLdjEnt.SetFilter(DtGstLdjEnt."Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                    DtGstLdjEnt.SetFilter(DtGstLdjEnt."GST %", '%1', "Detailed GST Ledger Entry"."GST %");//
                                                                                                          // DtGstLdjEnt.SETFILTER(DtGstLdjEnt."Posting Date",'%1',"Detailed GST Ledger Entry"."Posting Date");//CCIT AN
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            if DtGstLdjEnt."GST Component Code" = 'CESS INTRA' then begin
                                TotGstAmt := TotGstAmt + DtGstLdjEnt."GST Amount";
                                //MESSAGE('%1',TotGstAmt);
                            end;
                            GSTPrcnt := DtGstLdjEnt."GST %";
                            if DtGstLdjEnt."GST Component Code" = 'CGST' then begin
                                Tot_Taxable_value := Tot_Taxable_value + DtGstLdjEnt."GST Base Amount";
                                CGST_Amount := CGST_Amount + DtGstLdjEnt."GST Amount";
                            end;

                            DtGstLdjEntInfo.Get(DtGstLdjEnt."Entry No."); //NKP--CCIT
                            if DtGstLdjEnt."GST Component Code" = 'IGST' then begin
                                Tot_Taxable_value := Tot_Taxable_value + DtGstLdjEnt."GST Base Amount";
                                IGST_Amount := IGST_Amount + DtGstLdjEnt."GST Amount";
                            end;
                            State.SetRange(Code, DtGstLdjEntInfo."Buyer/Seller State Code");
                            if State.FindFirst then
                                PoS := State."State Code (GST Reg. No.)" + ' ' + State.Description;
                            if ("Detailed GST Ledger Entry"."Document Type" = 2) and (DtGstLdjEntinfo."Sales Invoice Type" = 5) then
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
                        until DtGstLdjEnt.Next = 0;
                        TotalInvoiceValue := "Detailed GST Ledger Entry"."GST Base Amount" + TotGstAmt;
                    end;
                end else
                    CurrReport.Skip;


                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);
                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;


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

                //code for reason code
                CreeditValue := 0;
                purchasecrditmemoline.Reset;
                purchasecrditmemoline.SetRange(purchasecrditmemoline."Document No.", "Detailed GST Ledger Entry"."Document No.");
                purchasecrditmemoline.SetRange("Line No.", "Detailed GST Ledger Entry"."Document Line No.");
                if purchasecrditmemoline.FindSet then begin
                    repeat
                        Reason_Code := purchasecrditmemoline."Return Reason Code";
                    until purchasecrditmemoline.Next = 0;
                end;
                //code for note value
                purchasecrditmemoline.Reset;
                purchasecrditmemoline.SetRange(purchasecrditmemoline."Document No.", "Detailed GST Ledger Entry"."Document No.");
                if purchasecrditmemoline.FindSet then begin
                    repeat
                        CreeditValue := CreeditValue + purchasecrditmemoline."Amount To Vendor";
                    until purchasecrditmemoline.Next = 0;
                end;

                RecVendor.SetRange("No.", "Detailed GST Ledger Entry"."Source No.");
                if RecVendor.FindFirst then
                    VendName := RecVendor.Name;
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
        company_info.Get;
        periodfilter := "Detailed GST Ledger Entry".GetFilter("Detailed GST Ledger Entry"."Posting Date");  //MESSAGE(periodfilter);
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
        DocTyp: Code[1];
        TotInvVal: Decimal;
        PreGST: Code[1];
        URTyp: Code[10];
        TotalInvoiceValue: Decimal;
        Buyer_Seller_Reg_No: Text;
        Org_Inv_No: Text;
        Org_Inv_Dt_No: Date;
        Doc_No: Text;
        Post_Doc_Date: Date;
        Doc_Type: Option;
        Reason_Code: Text;
        GST_Percent: Decimal;
        GST_Base_Amt: Decimal;
        Tot_Taxable_value: Decimal;
        CGST_Amount: Decimal;
        IGST_Amount: Decimal;
        GSTTINRegNo: Code[30];
        vendorInvNo: Code[30];
        RecVendor: Record Vendor;
        "Purchase Header": Record "Purchase Header";
        VendName: Text[200];
        PurInvHeader: Record "Purch. Inv. Header";
        SouircenO: Code[20];
        purchasecrditmemoheader: Record "Purch. Cr. Memo Hdr.";
        noteValue: Decimal;
        CreeditValue: Decimal;
        purchasecrditmemoline: Record "Purch. Cr. Memo Line";
        company_info: Record "Company Information";
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        RecPurCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        DVLEDocNo: Code[30];
        REcVendLeEntry: Record "Vendor Ledger Entry";
        InvoiceDate: Date;
        ExtDocNo: Code[50];
}

