Report 50097 "GSTR2_CDNUR_Purchase"
{
    // Priyanka 27.10.2017
    // 1.Added columns Document type.Reason For issuing document.Supply type
    // 2.Added code for GST filter.
    // 3.Added code for reason code.
    // 4.added code for note value.
    // 5.Added code for vendor name.
    // 6.Added code for supplier name.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTR2_CDNUR_Purchase.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "GST Vendor Type" = const(Unregistered), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"));
            RequestFilterFields = "Posting Date", "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyerSellerRegNo_DetailedGSTLedgerEntry; Buyer_Seller_Reg_No)
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
            column(Note_Type; Note_Type)
            {
            }
            column(Reason_Code; Reason_Code)
            {
            }
            column(GSTJurisdictionType_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Jurisdiction Type")
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
            column(CGST_Amount; CGST_Amount)
            {
            }
            column(IGST_Amount; IGST_Amount)
            {
            }
            column(Taxable_Value; Taxable_Value)
            {
            }
            column(Total_Cess_Amount; Total_Cess_Amount)
            {
            }
            column(Note_Value; Note_Value)
            {
            }
            column(DocumentType; DtGstLdjEnt."Document Type")
            {
            }
            column(VendorName; VendName)
            {
            }
            column(vendor_cr_memo_no; DtGstLdjEnt."External Document No.")
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(GSTComponentCode; "Detailed GST Ledger Entry"."GST Component Code")
            {
            }
            column(noteValue; noteValue)
            {
            }
            column(CreeditValue; CreeditValue)
            {
            }
            column(Gstamount; "Detailed GST Ledger Entry"."GST Amount")
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
            column(Eligibility1; "Detailed GST Ledger Entry"."GST Credit")
            {
            }

            trigger OnAfterGetRecord()
            begin

                Clear(Buyer_Seller_Reg_No);
                Clear(Org_Inv_No);
                Clear(Org_Inv_Dt_No);
                Clear(Doc_No);
                Clear(Post_Doc_Date);
                Clear(Doc_Type);
                Clear(Reason_Code);
                Clear(CGST_Amount);
                Clear(IGST_Amount);
                Clear(Taxable_Value);
                Clear(Total_Cess_Amount);
                Clear(Note_Value);
                Clear(Note_Value_Temp1);
                Clear(Note_Value_Temp2);
                Reason_Code := '';

                DtGstLdjEnt.Reset();
                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                Detailed_GST_Ledger_Entry_2_Record.Reset();
                Detailed_GST_Ledger_Entry_3_Record.Reset();
                if (("Detailed GST Ledger Entry"."Document Type" = 2) and (DtGstLdjEntInfo."Sales Invoice Type" = 5)) or
                     ("Detailed GST Ledger Entry"."Document Type" = 3) then begin
                    DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                    DtGstLdjEnt.SetFilter("GST %", '%1', "Detailed GST Ledger Entry"."GST %");//
                    if DtGstLdjEnt.FindFirst then begin   //1st Block Start
                        if DtGstLdjEnt.Find('-') then begin
                            repeat //2nd Block Start
                                if DtGstLdjEnt."GST Component Code" = 'Cess' then begin
                                    Total_Cess_Amount := Total_Cess_Amount + DtGstLdjEnt."GST Amount";
                                end;
                                DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                                if DtGstLdjEnt.Find('-') then begin
                                    repeat
                                        Note_Value_Temp1 := Note_Value_Temp1 + DtGstLdjEnt."GST Amount"
   until DtGstLdjEnt.Next = 0;
                                end;
                                Detailed_GST_Ledger_Entry_2_Record.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                                //Detailed_GST_Ledger_Entry_2_Record.SETFILTER("GST Component Code",'%1','CGST');
                                if Detailed_GST_Ledger_Entry_2_Record.Find('-') then begin
                                    repeat
                                        Note_Value_Temp2 := Note_Value_Temp2 + Detailed_GST_Ledger_Entry_2_Record."GST Base Amount";//For Note Value Logic
                                        Taxable_Value := Taxable_Value + Detailed_GST_Ledger_Entry_2_Record."GST Base Amount";
                                    //CGST_Amount :=CGST_Amount + Detailed_GST_Ledger_Entry_2_Record."GST Amount";
                                    until Detailed_GST_Ledger_Entry_2_Record.Next = 0;
                                end;
                                Detailed_GST_Ledger_Entry_3_Record.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                                Detailed_GST_Ledger_Entry_3_Record.SetFilter("GST Component Code", '%1', 'IGST');
                                if Detailed_GST_Ledger_Entry_3_Record.Find('-') then begin
                                    repeat
                                        Note_Value_Temp2 := Note_Value_Temp2 + Detailed_GST_Ledger_Entry_3_Record."GST Base Amount";    //For Note Value Logic
                                        Taxable_Value := Taxable_Value + Detailed_GST_Ledger_Entry_3_Record."GST Base Amount";
                                    // IGST_Amount :=IGST_Amount + Detailed_GST_Ledger_Entry_3_Record."GST Amount";
                                    until Detailed_GST_Ledger_Entry_3_Record.Next = 0;
                                end;
                                // MESSAGE(FORMAT(IGST_Amount));

                                if "GST Component Code" = 'IGST' then // code for IGST++
                                    IGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                                if "GST Component Code" <> 'IGST' then
                                    IGST_Amount := 0;//code for IGST--
                                                     //
                                if "GST Component Code" = 'CGST' then
                                    CGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                                if "GST Component Code" <> 'CGST' then
                                    CGST_Amount := 0;
                                //

                                if ("Detailed GST Ledger Entry"."Document Type" = 2) and (DtGstLdjEntInfo."Sales Invoice Type" = 5) then
                                    Note_Type := 'D'
                                else
                                    if "Detailed GST Ledger Entry"."Document Type" = 3 then
                                        Note_Type := 'C';
                                Buyer_Seller_Reg_No := DtGstLdjEnt."Buyer/Seller Reg. No.";
                                Org_Inv_No := DtGstLdjEnt."Original Invoice No.";
                                Org_Inv_Dt_No := DtGstLdjEntInfo."Original Invoice Date";
                                Doc_No := DtGstLdjEnt."Document No.";
                                Post_Doc_Date := DtGstLdjEnt."Posting Date";
                                Doc_Type := DtGstLdjEnt."Document Type";
                            // Reason_Code :=DtGstLdjEnt."Reason Code";
                            until DtGstLdjEnt.Next = 0;
                            Note_Value := Note_Value_Temp1 + Note_Value_Temp2; //For Note Value Logic
                        end; //2nd Block End
                    end; //1st Block End
                end else
                    CurrReport.Skip;
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

                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;
                //code for vendname
                RecVendor.SetRange("No.", "Detailed GST Ledger Entry"."Source No.");
                if RecVendor.FindFirst then
                    VendName := RecVendor.Name;

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
        Detailed_GST_Ledger_Entry_2_Record: Record "Detailed GST Ledger Entry";
        Detailed_GST_Ledger_Entry_3_Record: Record "Detailed GST Ledger Entry";
        Note_Type: Text;
        Buyer_Seller_Reg_No: Text;
        Org_Inv_No: Text;
        Org_Inv_Dt_No: Date;
        Doc_No: Text;
        Post_Doc_Date: Date;
        Doc_Type: Option;
        Reason_Code: Text;
        Taxable_Value: Decimal;
        CGST_Amount: Decimal;
        IGST_Amount: Decimal;
        Total_Cess_Amount: Decimal;
        Note_Value_Temp1: Decimal;
        Note_Value_Temp2: Decimal;
        Note_Value: Decimal;
        GSTTINRegNo: Code[30];
        VendName: Text[200];
        PurInvHeader: Record "Purch. Inv. Header";
        SouircenO: Code[20];
        RecVendor: Record Vendor;
        vendorInvNo: Code[30];
        purchasecrditmemoline: Record "Purch. Cr. Memo Line";
        purchasecrditmemoheader: Record "Purch. Cr. Memo Hdr.";
        noteValue: Decimal;
        CreeditValue: Decimal;
        companyinfo: Record "Company Information";
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";

}

