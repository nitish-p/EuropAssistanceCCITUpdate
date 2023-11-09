Report 50108 "DSC Invoice New Temp"
{
    // prdp 25012017
    // created new report for posted sales invoice.
    // prdp 30012017
    // modified report layout for bank & company details
    // prdp 31012017
    // modified report layout for changes asked by mayuri
    // prdp 02022017
    // added thousand seperator property in layout for all amoun fields
    // prdp 13022017
    // modified layout & logic for mayuri's requirement of multiple comments
    // prdp 190417
    // changed dataitemtableview property of salescommentline dataitem for commnets
    // modified layout for two copies Original & Duplicate
    // prdp 21112017
    // modified layout for customer GST Reg No
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/DSC Invoice New Temp.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    Permissions = TableData "Sales Invoice Header" = rimd;
    ShowPrintStatus = false;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(SelltoCustomerNo_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
            {
            }
            column(PostingDate_SalesInvoiceHeader; Format("Sales Invoice Header"."Posting Date"))
            {
            }
            column(SelltoCustomerName_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer Name 2")
            {
            }
            column(CINNo; CINNo)
            {
            }
            column(CompCityPostCode; CompCityPostCode)
            {
            }
            column(CompAddrs; CompAddrs)
            {
            }
            column(CompNm; CompNm)
            {
            }
            column(CompInfoPicture; CompInfo.Picture)
            {
            }
            column(CompServTaxRegNo; CompInfo."GST Registration No.")
            {
            }
            column(CompPANNo; CompInfo."P.A.N. No.")
            {
            }
            column(ReportCaption; ReportCaption)
            {
            }
            column(BankAccNo; BankAccNo)
            {
            }
            column(BankIFSC; BankIFSC)
            {
            }
            column(BANKSwiftCode; BANKSwiftCode)
            {
            }
            column(BankAddrs; BankAddrs)
            {
            }
            column(BankCityPostCode; BankCityPostCode)
            {
            }
            column(BankNm; BankNm)
            {
            }
            column(ServTaxAmt; Abs(ROUND(ServTaxAmt, 0.01)))
            {
            }
            column(ServTaxPer; ServTaxPer)
            {
            }
            column(SBCPer; SBCPer)
            {
            }
            column(SBCAmt; Abs(ROUND(SBCAmt, 0.01)))
            {
            }
            column(KKCPer; KKCPer)
            {
            }
            column(KKCAmt; Abs(ROUND(KKCAmt, 0.01)))
            {
            }
            column(BankAccountNo; BankAccountNo)
            {
            }
            column(PrintComments; PrintComments)
            {
            }
            column(SBC; SBC)
            {
            }
            column(KKC; KKC)
            {
            }
            column(Amount_SalesInvoiceHeader; ROUND("Sales Invoice Header".Amount, 0.01))
            {
            }
            column(ExternalDocumentNo_SalesInvoiceHeader; "Sales Invoice Header"."External Document No.")
            {
            }
            column(VolumeDiscount; VolumeDiscount)
            {
            }
            column(ServTax; ServTax)
            {
            }
            column(TaxComponentCGST; TaxComponentCGST)
            {
            }
            column(TaxComponentSGST; TaxComponentSGST)
            {
            }
            column(TaxComponentIGST; TaxComponentIGST)
            {
            }
            column(ShiptoPostCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to County")
            {
            }
            column(ShiptoCountryRegionCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Code")
            {
            }
            column(ShiptoName_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to City")
            {
            }
            column(ShiptoContact_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Contact")
            {
            }
            column(CGSTAmount; Abs(CGSTAmount))
            {
            }
            column(IGSTAmount; Abs(IGSTAmount))
            {
            }
            column(SGSTAmount; Abs(SGSTAmount))
            {
            }
            column(TextConst; TextConst)
            {
            }
            column(TaxBaseAmt; ROUND(TaxBaseAmt, 0.01))
            {
            }
            column(TaxBaseAmt1; ROUND(TaxBaseAmt1, 0.01))
            {
            }
            column(CustCityPostCOde; CustCityPostCOde)
            {
            }
            column(CustAddrs2; CustAddrs2)
            {
            }
            column(CustCity; CustCity)
            {
            }
            column(CustAddrs; CustAddrs)
            {
            }
            column(CustGSTIN; CustGSTIN)
            {
            }
            column(CustName; CustName)
            {
            }
            column(AmtInWords; AmtInWords)
            {
            }
            column(CustPAN; CustPAN)
            {
            }
            column(IRNNumber; IRNNumber)
            {
            }
            column(QrCode; EInvLedger.SignbedQRCode)
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") order(ascending);
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Tax_SalesInvoiceLine; '')//"Sales Invoice Line"."Tax %"
                {
                }
                column(LineNo_SalesInvoiceLine; "Sales Invoice Line"."Line No.")
                {
                }
                column(SelltoCustomerNo_SalesInvoiceLine; "Sales Invoice Line"."Sell-to Customer No.")
                {
                }
                column(ServiceTaxSBC_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax SBC %"//Nkp
                {
                }
                column(KKCess_SalesInvoiceLine; '')//"Sales Invoice Line"."KK Cess%"
                {
                }
                column(ServiceTaxSBCAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax SBC Amount"
                {
                }
                column(KKCessAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."KK Cess Amount"
                {
                }
                column(No_SalesInvoiceLine; "Sales Invoice Line"."No.")
                {
                }
                column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                {
                }
                column(Quantity_SalesInvoiceLine; "Sales Invoice Line".Quantity)
                {
                }
                column(ServiceTaxBase_SalesInvoiceLine; '')// "Sales Invoice Line"."Service Tax Base"
                {
                }
                column(UnitPrice_SalesInvoiceLine; ROUND("Sales Invoice Line"."Unit Price", 0.01))
                {
                }
                column(Amount_SalesInvoiceLine; ROUND("Sales Invoice Line".Amount, 0.01))
                {
                }
                column(LineAmount_SalesInvoiceLine; ROUND("Sales Invoice Line"."Line Amount", 0.01))
                {
                }
                column(HSNCode; HSNCode)
                {
                }
                column(AmountToCustomer_SalesInvoiceLine; '')// ROUND("Sales Invoice Line"."Amount To Customer", 0.01)
                {
                }
                column(ServiceTaxAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax Amount"
                {
                }
                column(ServiceTaxRegistrationNo_SalesInvoiceLine; '')// "Sales Invoice Line"."Service Tax Registration No."
                {
                }
                column(Comments_SalesInvoiceLine; "Sales Invoice Line".Comments)
                {
                }
                column(ServTaxBaseAmt; Abs(ROUND(ServTaxBaseAmt, 0.01)))
                {
                }
                column(state_Description; state_description)
                {
                }
                column(state_code; state_code)
                {
                }
                column(Particulars_SalesInvoiceLine; "Sales Invoice Line".Particulars)
                {
                }

                trigger OnAfterGetRecord()
                var
                    taxinfo: Codeunit TaxInfo;
                    GSTBaseAmt: Decimal;
                    TDSAmt: Decimal;
                    TDSBaseAmt: Decimal;
                    IGST: Decimal;
                    SGST: Decimal;
                    CGST: Decimal;
                    IGSTPer: Decimal;
                    SGSTPer: Decimal;
                    CGSTPer: Decimal;
                //Naveen

                begin
                    Taxinfo.GetTaxInfo("Sales Invoice Line".RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);
                    HSNCode := '';
                    AmtToCust := ROUND(("Sales Invoice Line"."Line Amount" + (CGST + SGST + IGST + TDSAmt)), 0.01);
                    Check.InitTextVariable;
                    Check.FormatNoText(atext, AmtToCust, '');

                    AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');
                    //Added code for HSN/SAC Code+++
                    if "Sales Invoice Line".Type = 2 then begin
                        RecItem.Reset;
                        RecItem.SetRange(RecItem."No.", "Sales Invoice Line"."No.");
                        if RecItem.FindFirst then
                            HSNCode := RecItem."HSN/SAC Code";
                    end;

                    if "Sales Invoice Line".Type = 1 then begin
                        RecGL.Reset;
                        RecGL.SetRange(RecGL."No.", "Sales Invoice Line"."No.");
                        if RecGL.FindFirst then
                            HSNCode := RecGL."HSN/SAC Code";
                    end;
                    //Added code for HSN/SAC Code---
                end;

                trigger OnPreDataItem()
                begin
                    atext[1] := '';
                    atext[2] := '';

                    AmtToCust := 0;
                end;
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLink = "No." = field("No.");
                DataItemTableView = sorting("Document Type", "No.", "Document Line No.", "Line No.") order(ascending) where("Document Line No." = const(0));
                column(ReportForNavId_1000000054; 1000000054)
                {
                }
                column(Comment_SalesCommentLine; "Sales Comment Line".Comment)
                {
                }
                column(LineNo_SalesCommentLine; "Sales Comment Line"."Line No.")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                Customer.Get("Sales Invoice Header"."Sell-to Customer No.");
                CustAddrs := Customer.Address;
                CustPAN := Customer."P.A.N. No.";
                if Customer."Name for Invoice" <> '' then begin
                    CustName := Customer."Name for Invoice";
                end else begin
                    CustName := Customer.Name;
                end;

                CustAddrs2 := Customer."Address 2";
                CustCityPostCOde := Customer.City + '-' + Customer."Post Code";
                CustGSTIN := Customer."GST Registration No.";
                //CustCity:="Sales Invoice Line".State;
                //AmtToCust:=AmtToCust+"Sales Invoice Line"."Amount To Customer";



                //code for sate name++
                state1.Reset;
                state1.SetRange(state1.Code, Customer."State Code");
                if state1.FindFirst then begin
                    state_description := state1.Description;
                    state_code := state1."State Code (GST Reg. No.)";
                end;
                //code for sate name--


                if "Sales Invoice Header"."Ship-to Code" <> '' then begin
                    rec222.Reset;
                    rec222.SetRange("Customer No.", "Sales Invoice Header"."Sell-to Customer No.");
                    rec222.SetRange(Code, "Sales Invoice Header"."Ship-to Code");
                    if rec222.FindFirst then begin
                        CustGSTIN := rec222."GST Registration No.";

                        Customer.Reset;
                        Customer.Get("Sales Invoice Header"."Sell-to Customer No.");
                        if Customer."Name for Invoice" <> '' then begin
                            CustName := Customer."Name for Invoice";
                        end else begin
                            CustName := rec222.Name;
                        end;

                        CustAddrs := rec222.Address;
                        CustAddrs2 := rec222."Address 2";
                        CustCityPostCOde := rec222.City + '-' + rec222."Post Code";

                        state1.Reset;
                        state1.SetRange(state1.Code, rec222.State);
                        if state1.FindFirst then begin
                            state_description := state1.Description;
                            state_code := state1."State Code (GST Reg. No.)";

                        end;
                    end;
                end;





                TextConst := '4. Any Dispute has to be raised within 15 days of invoice date.';

                if CopyStr("Sales Invoice Header"."No.", 1, 2) = 'CN' then
                    ReportCaption := 'CREDIT NOTE';
                if CopyStr("Sales Invoice Header"."No.", 1, 2) = 'DN' then begin
                    ReportCaption := 'DEBIT NOTE';
                    TextConst := '';
                end;
                if ReportCaption = '' then
                    ReportCaption := 'INVOICE';



                if BankAccNo = '' then
                    BankAccNo := 'BANK0004';

                BankAcc.Get(BankAccNo);
                BankNm := BankAcc.Name;
                BankAddrs := BankAcc.Address + ' ' + BankAcc."Address 2";
                BankIFSC := BankAcc."IFSC Code";
                BANKSwiftCode := BankAcc."SWIFT Code";
                BankCityPostCode := BankAcc.City + '-' + BankAcc."Post Code";
                BankAccountNo := BankAcc."Bank Account No.";

                // ServTaxEntry.Reset;
                // ServTaxEntry.SetRange(ServTaxEntry."Document No.","Sales Invoice Header"."No.");
                // if ServTaxEntry.FindFirst then begin
                // ServTaxPer:=ServTaxEntry."Service Tax %";
                // SBCPer:=ServTaxEntry."Service Tax SBC %";
                // KKCPer:=ServTaxEntry."KK Cess%";
                // ServTaxAmt:=ServTaxEntry."Service Tax Amount";
                // SBCAmt:=ServTaxEntry."Service Tax SBC Amount";
                // KKCAmt:=ServTaxEntry."KK Cess Amount";
                // ServTaxBaseAmt:=ServTaxEntry."Service Tax Base Amount";
                // end;//Nkp


                if ServTaxAmt <> 0 then begin
                    ServTax := 'Service Tax @ ' + Format(ServTaxPer) + '%';
                end else begin
                    ServTax := '';
                end;

                if KKCAmt <> 0 then begin
                    KKC := 'Krishi Kalyan Cess @ ' + Format(KKCPer) + '%';
                end else begin
                    KKC := '';
                end;

                if SBCAmt <> 0 then begin
                    SBC := 'Swacch Bharat Cess @ ' + Format(SBCPer) + '%';
                end else begin
                    SBC := '';
                end;

                SIL.Reset;
                SIL.SetRange(SIL."Document No.", "Sales Invoice Header"."No.");
                if SIL.FindSet then
                    repeat

                        TaxBaseAmt := TaxBaseAmt + SIL.Amount;
                    until SIL.Next = 0;

                GLEntry.Reset;
                GLEntry.SetRange("Document No.", "Sales Invoice Header"."No.");
                GLEntry.SetRange("G/L Account No.", '410011');
                if GLEntry.FindFirst then begin
                    VolumeDiscount := GLEntry.Amount;
                    TaxBaseAmt1 := TaxBaseAmt;
                end else begin
                    TaxBaseAmt1 := 0;
                end;



                DetailedGSTLedgerEntry.Reset;
                DetailedGSTLedgerEntry.SetRange(DetailedGSTLedgerEntry."Document No.", "Sales Invoice Header"."No.");
                if DetailedGSTLedgerEntry.FindSet then
                    repeat
                        if DetailedGSTLedgerEntry."GST Component Code" = 'CGST' then begin
                            TaxComponentCGST := 'CGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                            CGSTAmount := CGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                        end;
                        if DetailedGSTLedgerEntry."GST Component Code" = 'SGST' then begin
                            TaxComponentSGST := 'SGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                            SGSTAmount := SGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                        end;
                        if DetailedGSTLedgerEntry."GST Component Code" = 'IGST' then begin
                            TaxComponentIGST := 'IGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                            IGSTAmount := IGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                        end;
                    until DetailedGSTLedgerEntry.Next = 0;
                //Added code for calculate GST fields---

                // 0404201 - to get IRN and QRCode ++
                IRNNumber := '';
                EInvLedger.Reset;
                EInvLedger.SetRange(EInvLedger."Document Type", EInvLedger."document type"::Invoice);
                EInvLedger.SetRange("Document No.", "Sales Invoice Header"."No.");
                EInvLedger.SetFilter(IRN, '<>%1', '');
                if EInvLedger.FindFirst then begin
                    IRNNumber := EInvLedger.IRN;
                    EInvLedger.CalcFields(SignbedQRCode);
                end;
                // 0404201 - to get IRN and QRCode --
            end;

            trigger OnPreDataItem()
            begin
                ServTaxPer := 0;
                SBCPer := 0;
                KKCPer := 0;
                ServTaxAmt := 0;
                SBCAmt := 0;
                KKCAmt := 0;
                ServTaxBaseAmt := 0;
                ReportCaption := '';
                TextConst := '';
                VolumeDiscount := 0;
                TaxBaseAmt1 := 0;
                TaxComponentCGST := '';
                TaxComponentSGST := '';
                TaxComponentIGST := '';
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Bank Acc No."; BankAccNo)
                {
                    ApplicationArea = Basic;
                    TableRelation = "Bank Account"."No.";
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
        CompInfo.Get('');
        CompInfo.CalcFields(CompInfo.Picture);
        CompNm := CompInfo.Name;
        CompAddrs := CompInfo.Address + ' ' + CompInfo."Address 2";
        CompCityPostCode := CompInfo.City + '-' + CompInfo."Post Code";
        CINNo := CompInfo."CIN No.";
    end;

    var
        CompInfo: Record "Company Information";
        CompNm: Text[50];
        CompAddrs: Text[250];
        CompCityPostCode: Text[30];
        CINNo: Code[30];
        Customer: Record Customer;
        BankAcc: Record "Bank Account";
        CustAddrs: Text[250];
        CustAddrs2: Text[250];
        CustCityPostCOde: Text[30];
        BankAccNo: Code[20];
        BankNm: Text[50];
        BankAddrs: Text[250];
        BankIFSC: Code[20];
        BANKSwiftCode: Code[20];
        BankAccount: Code[20];
        BankCityPostCode: Code[50];
        ServTaxAmt: Decimal;
        ServTaxPer: Decimal;
        KKCAmt: Decimal;
        KKCPer: Decimal;
        SBCAmt: Decimal;
        SBCPer: Decimal;
        ServTaxBaseAmt: Decimal;
        //ServTaxEntry: Record UnknownRecord16473;
        ReportCaption: Text[20];
        TextConst: Text[80];
        Check: Report Check;
        atext: array[2] of Text[250];
        AmtInWords: Text[250];
        BankAccountNo: Code[30];
        ServTax: Text[100];
        KKC: Text[100];
        SBC: Text[100];
        TaxBaseAmt: Decimal;
        AmtToCust: Decimal;
        PrintComments: Boolean;
        SIL: Record "Sales Invoice Line";
        GLEntry: Record "G/L Entry";
        VolumeDiscount: Decimal;
        HSNCode: Code[20];
        RecItem: Record Item;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        TaxComponentCGST: Code[15];
        TaxComponentSGST: Code[15];
        TaxComponentIGST: Code[15];
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        RecGL: Record "G/L Account";
        CustName: Text[100];
        CustGSTIN: Code[20];
        CustCity: Text[50];
        state1: Record State;
        state_code: Code[10];
        state_description: Text;
        TaxBaseAmt1: Decimal;
        SalesInvHeader: Record "Sales Invoice Header";
        rec222: Record "Ship-to Address";
        CustPAN: Code[20];
        IRNNumber: Text;
        EInvLedger: Record "E-Invoice Ledger Entries";
}

