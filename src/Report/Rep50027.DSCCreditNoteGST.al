Report 50027 "DSC Credit Note-GST"
{
    // Priyanka 17082019
    // Added field HSNCode
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/DSC Credit Note-GST.rdl';

    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(SelltoCustomerNo_SalesInvoiceHeader; "Sales Cr.Memo Header"."Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceHeader; "Sales Cr.Memo Header"."No.")
            {
            }
            column(PostingDate_SalesInvoiceHeader; Format("Sales Cr.Memo Header"."Posting Date"))
            {
            }
            column(SelltoCustomerName_SalesInvoiceHeader; CUstName)
            {
            }
            column(CINNo; CINNo)
            {
            }
            column(AmounttoCustomer_SalesCrMemoHeader; '')//ROUND("Sales Cr.Memo Header"."Amount to Customer",0.01)
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
            column(CompServTaxRegNo; '')//CompInfo."Service Tax Registration No."
            {
            }
            column(CompPANNo; CompInfo."P.A.N. No.")
            {
            }
            column(CompanyGSTRegistrationNo; CompInfo."GST Registration No.")
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
            column(CustGSTIN; CustGSTIN)
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
            column(CustCityPostCOde; CustCityPostCOde)
            {
            }
            column(CustAddrs2; CustAddrs2)
            {
            }
            column(CustAddrs; CustAddrs)
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
            column(ServTaxBaseAmt; Abs(ROUND(ServTaxBaseAmt, 0.01)))
            {
            }
            column(BankAccountNo; BankAccountNo)
            {
            }
            column(ExternalDocumentNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."External Document No.")
            {
            }
            column(SBC; SBC)
            {
            }
            column(KKC; KKC)
            {
            }
            column(ServTax; ServTax)
            {
            }
            column(CUstName; CUstName)
            {
            }
            column(ShiptoAddress_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to City")
            {
            }
            column(ShiptoContact_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Contact")
            {
            }
            column(ShiptoPostCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Ship-to Post Code")
            {
            }
            column(TextConst; TextConst)
            {
            }
            column(SelltoPostCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Sell-to Post Code")
            {
            }
            column(state_description; state_description)
            {
            }
            column(state_code; state_code)
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
            column(CGSTAmount; CGSTAmount)
            {
            }
            column(IGSTAmount; IGSTAmount)
            {
            }
            column(SGSTAmount; SGSTAmount)
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
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(No_SalesInvoiceLine; "Sales Cr.Memo Line"."No.")
                {
                }
                column(Description_SalesInvoiceLine; "Sales Cr.Memo Line".Description)
                {
                }
                column(Quantity_SalesInvoiceLine; "Sales Cr.Memo Line".Quantity)
                {
                }
                column(UnitPrice_SalesInvoiceLine; "Sales Cr.Memo Line"."Unit Price")
                {
                }
                column(Amount_SalesInvoiceLine; "Sales Cr.Memo Line".Amount)
                {
                }
                column(AmountToCustomer_SalesInvoiceLine; '')//ROUND("Sales Cr.Memo Line"."Amount To Customer",0.01)
                {
                }
                column(ServiceTaxAmount_SalesInvoiceLine; '')//"Sales Cr.Memo Line"."Service Tax Amount"
                {
                }
                column(ServiceTaxRegistrationNo_SalesInvoiceLine; '')//"Sales Cr.Memo Line"."Service Tax Registration No."
                {
                }
                //Naveen
                column(Comments_SalesInvoiceLine; "Sales Cr.Memo Line".Comments)
                {
                }
                column(AmtInWords; AmtInWords)
                {
                }
                column(AmtToCust; AmtToCust)
                {
                }
                column(HSNCode; "Sales Cr.Memo Line"."HSN/SAC Code")
                {
                }
                column(LineAmount_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Amount")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    //  AmtToCust:=ROUND((AmtToCust+"Sales Cr.Memo Line"."Amount To Customer"),0.01);//Naveen

                    Check.InitTextVariable;
                    Check.FormatNoText(atext, AmtToCust, '');
                    AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');

                    //Added code for HSN/SAC Code+++
                    RecItem.Reset;
                    RecItem.SetRange(RecItem."No.", "Sales Cr.Memo Line"."No.");
                    if RecItem.FindFirst then
                        HSNCode := RecItem."HSN/SAC Code";
                    //Added code for HSN/SAC Code---
                end;

                trigger OnPreDataItem()
                begin
                    AmtToCust := 0;
                    atext[1] := '';
                    atext[2] := '';
                    AmtInWords := '';
                end;
            }

            trigger OnAfterGetRecord()
            begin


                Customer.Get("Sales Cr.Memo Header"."Sell-to Customer No.");
                CustAddrs := Customer.Address;
                CustAddrs2 := Customer."Address 2";
                CustCityPostCOde := Customer.City + '-' + Customer."Post Code";
                CustPAN := Customer."P.A.N. No.";
                if Customer."Name for Invoice" <> '' then begin
                    CUstName := Customer."Name for Invoice";
                end else begin
                    CUstName := Customer.Name;
                end;

                if Customer."GST Registration No." <> '' then begin
                    CustGSTIN := 'GST Reg No. ' + Customer."GST Registration No.";
                    CustomerGSTIN := Customer."GST Registration No.";
                end;
                //code for sate name++
                state1.Reset;
                state1.SetRange(state1.Code, Customer."State Code");
                if state1.FindFirst then begin
                    state_description := state1.Description;
                    state_code := state1."State Code (GST Reg. No.)";
                end;

                if "Sales Cr.Memo Header"."Ship-to Code" <> '' then begin
                    rec222.Reset;
                    rec222.SetRange("Customer No.", "Sales Cr.Memo Header"."Sell-to Customer No.");
                    rec222.SetRange(Code, "Sales Cr.Memo Header"."Ship-to Code");
                    if rec222.FindFirst then begin
                        CustAddrs := rec222.Address;
                        CustAddrs2 := rec222."Address 2";
                        CustGSTIN := 'GST Reg No. ' + rec222."GST Registration No.";
                        CustCityPostCOde := rec222.City + '-' + rec222."Post Code";

                        Customer.Reset;
                        Customer.Get("Sales Cr.Memo Header"."Sell-to Customer No.");
                        if Customer."Name for Invoice" <> '' then begin
                            CUstName := Customer."Name for Invoice";
                        end else begin
                            CUstName := rec222.Name;
                        end;

                        state1.Reset;
                        state1.SetRange(state1.Code, rec222.State);
                        if state1.FindFirst then begin
                            state_description := state1.Description;
                            state_code := state1."State Code (GST Reg. No.)";

                        end;
                    end;
                end;
                //code for sate name--

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
                // ServTaxEntry.SetRange(ServTaxEntry."Document No.","Sales Cr.Memo Header"."No.");
                // if ServTaxEntry.FindFirst then begin
                // ServTaxPer:=ServTaxEntry."Service Tax %";
                // SBCPer:=ServTaxEntry."Service Tax SBC %";
                // KKCPer:=ServTaxEntry."KK Cess%";
                // ServTaxAmt:=ServTaxEntry."Service Tax Amount";
                // SBCAmt:=ServTaxEntry."Service Tax SBC Amount";
                // KKCAmt:=ServTaxEntry."KK Cess Amount";
                // ServTaxBaseAmt:=ServTaxEntry."Service Tax Base Amount";
                // end;
                //Naveen
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


                //Added code for calculate GST fields+++
                CGSTAmount := 0;
                SGSTAmount := 0;
                IGSTAmount := 0;
                TaxComponentCGST := '';
                TaxComponentIGST := '';
                TaxComponentSGST := '';

                DetailedGSTLedgerEntry.Reset;
                DetailedGSTLedgerEntry.SetRange(DetailedGSTLedgerEntry."Document No.", "Sales Cr.Memo Header"."No.");
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
                EInvLedger.SetRange(EInvLedger."Document Type", EInvLedger."document type"::CreditNote);
                EInvLedger.SetRange("Document No.", "Sales Cr.Memo Header"."No.");
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
        //ServTaxEntry: Record UnknownRecord16473;//Naveen
        ReportCaption: Text[20];
        TextConst: Text[80];
        Check: Report Check;
        atext: array[2] of Text[250];
        AmtInWords: Text[250];
        BankAccountNo: Code[30];
        ServTax: Text[100];
        KKC: Text[100];
        SBC: Text[100];
        AmtToCust: Decimal;
        HSNCode: Code[20];
        RecItem: Record Item;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        TaxComponentCGST: Code[20];
        TaxComponentSGST: Code[20];
        TaxComponentIGST: Code[20];
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        CustGSTIN: Text[50];
        CUstName: Text[100];
        state1: Record State;
        state_description: Text;
        state_code: Code[10];
        CustomerGSTIN: Text[50];
        rec222: Record "Ship-to Address";
        CustPAN: Code[20];
        IRNNumber: Text;
        EInvLedger: Record "E-Invoice Ledger Entries";
}

