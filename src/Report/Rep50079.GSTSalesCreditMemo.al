Report 50079 "GST Sales Credit Memo"
{
    // Rohit 07.11.2017
    // 1.Modified code as per requirement.
    // 2.Modified layour as per requirement.
    // 3.change formula for invoice value.
    // 4.Added period filter.
    // 5.Added company name.
    // 
    // Rohit 24.11.2017
    // 1.Modified report as per the requirement
    // Priyanka 12.12.2017
    // 1.Increased length of ExtDocNo from 30 to 200
    // priyanka .s 170518
    // modified length of POS  from 20 to 30
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GST Sales Credit Memo.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Sales), "GST Customer Type" = const(Registered), "Source Type" = const(Customer), "Entry Type" = const("Initial Entry"), "Document Type" = const("Credit Memo"));
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
            column(PostingDate_DetailedGSTLedgerEntry; Format("Detailed GST Ledger Entry"."Posting Date"))
            {
            }
            column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"
            {
            }
            column(PoS; PoS)
            {
            }
            column(SourceNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Source No.")
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
            column(GSTComponentCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Component Code")
            {
            }
            column(GST_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST %")
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(Gst_Amount; "Detailed GST Ledger Entry"."GST Amount")
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
            column(ReferenceInvoiceNumber_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Reference Invoice Number"
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
            column(Invoice_No; "Detailed GST Ledger Entry"."Document No.")
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
            column(CustName; CustName)
            {
            }
            column(ExtDocNo; "Detailed GST Ledger Entry"."External Document No.")
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
            column(taxvalue; taxvalue)
            {
            }
            column(AmtToCust; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"//naveen
            {
            }
            column(Invoice_Type; '')//"Detailed GST Ledger Entry"."Invoice Type"//Naveen
            {
            }
            column(GST_Credit; "Detailed GST Ledger Entry"."GST Credit")
            {
            }
            column(Rate3; Rate3)
            {
            }
            column(ServiceDescription; ServiceDescription)
            {
            }
            column(SalesGL; SalesGL)
            {
            }
            column(SalesGLDescription; SalesGLDescription)
            {
            }
            column(NatureOfSupply; NatureOfSupply)
            {
            }
            column(HSNSACCode; HSNSACCode)
            {
            }
            column(GSTJuriType; GSTJuriType)
            {
            }
            column(AmtLcy; AmtLcy)
            {
            }
            column(AppliedInvoiceNo; AppliedInvoiceNo)
            {
            }
            column(InvAmount; InvAmount)
            {
            }
            column(InvPostDt; Format(InvPostDt))
            {
            }

            trigger OnAfterGetRecord()
            begin
                Rate3 := 0;
                TotGstAmt := 0;
                GSTPrcnt := 0;
                TotalInvoiceValue := 0;
                TaxableValue := 0;
                TotGstBasAmt := 0;
                Clear(IGST_Amount);
                Clear(CGST_Amount);
                Clear(SGST_Amount);

                // 120620 prdp  +++
                ServiceDescription := '';
                SalesGL := '';
                SalesGLDescription := '';
                NatureOfSupply := '';
                HSNSACCode := '';
                GSTJuriType := '';
                AmtLcy := 0;
                AppliedInvoiceNo := '';
                InvAmount := 0;
                InvPostDt := 0D;

                CLE.Reset;
                CLE.SetRange(CLE."Document Type", CLE."document type"::"Credit Memo");
                CLE.SetRange("Document No.", "Detailed GST Ledger Entry"."Document No.");
                if CLE.FindFirst then begin
                    CLE.CalcFields("Amount (LCY)");
                    AmtLcy := Abs(CLE."Amount (LCY)");
                end;

                SalesInvLine.Reset;
                SalesInvLine.SetRange("Document No.", "Detailed GST Ledger Entry"."Document No.");
                SalesInvLine.SetRange("Line No.", "Detailed GST Ledger Entry"."Document Line No.");
                if SalesInvLine.FindFirst then begin

                    ServiceDescription := SalesInvLine.Description;
                    HSNSACCode := SalesInvLine."HSN/SAC Code";
                    /*
                    HSNSAC.RESET;
                    HSNSAC.SETRANGE(Code,SalesInvLine."HSN/SAC Code");
                    IF HSNSAC.FINDFIRST THEN BEGIN
                    HSNSACCode:=SalesInvLine."HSN/SAC Code"+'-'+HSNSAC.Description;
                    END;
                     */
                    GenPostingSetup.Reset;
                    GenPostingSetup.SetRange("Gen. Bus. Posting Group", SalesInvLine."Gen. Bus. Posting Group");
                    GenPostingSetup.SetRange("Gen. Prod. Posting Group", SalesInvLine."Gen. Prod. Posting Group");
                    if GenPostingSetup.FindFirst then begin
                        SalesGL := GenPostingSetup."Sales Account";
                        recGLAcc.Reset;
                        recGLAcc.SetRange("No.", SalesGL);
                        if recGLAcc.FindFirst then begin
                            SalesGLDescription := recGLAcc.Name;
                        end;
                    end;

                end;

                // 120620 prdp  ---

                /*
                Rate1 := 0;
                Rate2 := 0;
                Rate3 := 0;
                
                RecDGLE.RESET;
                RecDGLE.SETRANGE(RecDGLE."Document No.","Detailed GST Ledger Entry"."Document No.");
                RecDGLE.SETRANGE(RecDGLE."Document Line No.","Detailed GST Ledger Entry"."Document Line No.");
                IF RecDGLE.FINDSET THEN REPEAT
                    Rate3 := Rate3 + RecDGLE."GST %";
                UNTIL RecDGLE.NEXT=0;
                
                
                IF RecDGLE."GST Component Code"='CESS INTRA' THEN BEGIN
                    Rate3 :=15;
                END;
                */
                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                DtGstLdjEnt.SetFilter("Document No.", '%1', "Detailed GST Ledger Entry"."Document No.");
                DtGstLdjEnt.SetFilter("GST %", '%1', "Detailed GST Ledger Entry"."GST %");
                if DtGstLdjEnt.Find('-') then begin
                    repeat

                        TaxableValue := TaxableValue + DtGstLdjEnt."GST Base Amount";

                        if DtGstLdjEnt."GST Component Code" = 'CESS INTRA' then begin
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


                taxvalue := 0;

                taxvalue := "Detailed GST Ledger Entry"."GST Amount" + "Detailed GST Ledger Entry"."GST Base Amount";

                //MESSAGE('%1',taxvalue);

                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;

                // prdp 150620 +++

                RecSalInv.Reset;
                RecSalInv.SetRange(RecSalInv."No.", "Detailed GST Ledger Entry"."Document No.");
                if RecSalInv.FindFirst then begin
                    CustName := RecSalInv."Bill-to Name";
                    ExtDocNo := RecSalInv."External Document No.";
                    NatureOfSupply := Format(RecSalInv."EA Transaction Type");

                    if ((RecSalInv."Applies-to Doc. Type" = RecSalInv."applies-to doc. type"::Invoice) and (RecSalInv."Applies-to Doc. No." <> '')) then begin
                        SalesInvHdr.Reset;
                        SalesInvHdr.SetRange("No.", RecSalInv."Applies-to Doc. No.");
                        if SalesInvHdr.FindFirst then begin
                            // SalesInvHdr.CalcFields("Amount to Customer");
                            // InvAmount:=SalesInvHdr."Amount to Customer";//Nkp
                            AppliedInvoiceNo := SalesInvHdr."No.";
                            InvPostDt := SalesInvHdr."Posting Date";
                        end;
                    end else begin

                        CLE.Reset;
                        CLE.SetRange(CLE."Document Type", CLE."document type"::"Credit Memo");
                        CLE.SetRange(CLE."Document No.", "Detailed GST Ledger Entry"."Document No.");
                        if CLE.FindFirst then begin

                            if CLE."Closed by Entry No." <> 0 then begin

                                CLE2.Reset;
                                CLE2.SetRange(CLE2."Document Type", CLE2."document type"::Invoice);
                                CLE2.SetRange(CLE2."Entry No.", CLE."Closed by Entry No.");
                                if CLE2.FindFirst then begin

                                    SalesInvHdr.Reset;
                                    SalesInvHdr.SetRange("No.", CLE2."Document No.");
                                    if SalesInvHdr.FindFirst then begin
                                        // SalesInvHdr.CalcFields("Amount to Customer");
                                        // InvAmount:=SalesInvHdr."Amount to Customer";//Nkp
                                        AppliedInvoiceNo := SalesInvHdr."No.";
                                        InvPostDt := SalesInvHdr."Posting Date";
                                    end;

                                end;

                            end else begin

                                CLE2.Reset;
                                CLE2.SetRange(CLE2."Document Type", CLE2."document type"::Invoice);
                                CLE2.SetRange(CLE2."Closed by Entry No.", CLE."Entry No.");
                                if CLE2.FindFirst then begin
                                    CLE2.CalcFields(Amount);
                                    InvAmount := CLE2.Amount;
                                    AppliedInvoiceNo := CLE2."Document No.";
                                    InvPostDt := CLE2."Posting Date";
                                end;

                            end;

                        end;

                    end;

                end;

                // prdp 150620 ---

                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    GSTJuriType := 'Interstate';
                    GSTBaseAmt := "Detailed GST Ledger Entry"."GST Base Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then begin
                    GSTJuriType := 'Intrastate';
                    GSTBaseAmt := "Detailed GST Ledger Entry"."GST Base Amount" / 2;
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' then begin
                    GSTJuriType := 'Intrastate';
                    GSTBaseAmt := "Detailed GST Ledger Entry"."GST Base Amount" / 2;
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
                    Visible = true;
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

        if GSTTINRegNo = '' then
            Error('Please select "GSTIN of Location"');
    end;

    var
        InvVal: Decimal;
        PoS: Code[30];
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
        RecSalInv: Record "Sales Cr.Memo Header";
        CusInvNo: Code[10];
        CustName: Text;
        ExtDocNo: Code[200];
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        taxvalue: Decimal;
        RecDGLE: Record "Detailed GST Ledger Entry";
        Rate1: Decimal;
        Rate2: Decimal;
        Rate3: Decimal;
        ServiceDescription: Text[50];
        SalesGL: Text[20];
        SalesGLDescription: Text[50];
        NatureOfSupply: Text[10];
        HSNSACCode: Text[60];
        SalesInvLine: Record "Sales Cr.Memo Line";
        GSTJuriType: Text[10];
        GenPostingSetup: Record "General Posting Setup";
        recGLAcc: Record "G/L Account";
        HSNSAC: Record "HSN/SAC";
        AmtLcy: Decimal;
        CLE: Record "Cust. Ledger Entry";
        AppliedInvoiceNo: Code[20];
        SalesInvHdr: Record "Sales Invoice Header";
        InvAmount: Decimal;
        InvPostDt: Date;
        CLE2: Record "Cust. Ledger Entry";
}

