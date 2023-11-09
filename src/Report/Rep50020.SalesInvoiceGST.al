Report 50020 "Sales Invoice-GST"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sales Invoice-GST.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

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
            column(CompServTaxRegNo; '')//CompInfo."Service Tax Registration No."
            {
            }
            //Naveen
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
            column(AmtInWords; AmtInWords)
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
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(HSNCode; HSNCode)
                {
                }
                column(Tax_SalesInvoiceLine; '')//"Sales Invoice Line"."Tax %"
                {
                }
                column(ServiceTaxSBC_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax SBC %"
                {
                }
                column(KKCess_SalesInvoiceLine; '')//"Sales Invoice Line"."KK Cess%"
                {
                }
                column(ServiceTaxSBCAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax SBC Amount"
                {
                }
                column(KKCessAmount_SalesInvoiceLine; '')//Sales Invoice Line".KK Cess Amount"
                {
                }
                //Naveen
                column(No_SalesInvoiceLine; "Sales Invoice Line"."No.")
                {
                }
                column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                {
                }
                column(Quantity_SalesInvoiceLine; "Sales Invoice Line".Quantity)
                {
                }
                column(ServiceTaxBase_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax Base"
                {
                }
                //Naveen
                column(UnitPrice_SalesInvoiceLine; "Sales Invoice Line"."Unit Price")
                {
                }
                column(Amount_SalesInvoiceLine; "Sales Invoice Line".Amount)
                {
                }
                // column(AmountToCustomer_SalesInvoiceLine; ROUND("Sales Invoice Line"."Amount To Customer", 0.01))
                // {
                // }
                column(AmountToCustomer_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."Amount To Customer", 0.01))
                {
                }
                // column(ServiceTaxAmount_SalesInvoiceLine; "Sales Invoice Line"."Service Tax Amount")
                // {
                // }
                column(ServiceTaxAmount_SalesInvoiceLine; '')// "Sales Invoice Line"."Service Tax Amount")
                {
                }
                // column(ServiceTaxRegistrationNo_SalesInvoiceLine; "Sales Invoice Line"."Service Tax Registration No.")
                // {
                // }
                column(ServiceTaxRegistrationNo_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax Registration No.")
                {
                }
                //Naven
                column(Comments_SalesInvoiceLine; "Sales Invoice Line".Comments)
                {
                }
                column(ServTaxBaseAmt; Abs(ROUND(ServTaxBaseAmt, 0.01)))
                {
                }
                column(TaxBaseAmt; ROUND(TaxBaseAmt, 0.01))
                {
                }
                column(AmtToCust; AmtToCust) { }

                trigger OnAfterGetRecord()
                var
                    dtlgstlegder: Record "Detailed GST Ledger Entry";
                    gstamount: Decimal;
                begin
                    DetailedGSTLedgerEntry.Reset();
                    DetailedGSTLedgerEntry.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    DetailedGSTLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                    if DetailedGSTLedgerEntry.FindFirst() then
                        repeat
                            gstamount := gstamount + DetailedGSTLedgerEntry."GST Amount";
                        until DetailedGSTLedgerEntry.Next() = 0;
                    AmtToCust := AmtToCust + "Sales Invoice Line"."Line Amount" + Abs(gstamount); //Naveen ---Gst

                    Check.InitTextVariable;
                    Check.FormatNoText(atext, AmtToCust, '');

                    AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');
                    HSNCode := '';
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

                TextConst := '4. Any Dispute has to be raised within 15 days of invoice date.';

                if CopyStr("Sales Invoice Header"."No.", 1, 2) = 'CN' then
                    ReportCaption := 'CREDIT NOTE';
                if CopyStr("Sales Invoice Header"."No.", 1, 2) = 'DN' then begin
                    ReportCaption := 'DEBIT NOTE';
                    TextConst := '';
                end;
                if ReportCaption = '' then
                    ReportCaption := 'INVOICE';

                Customer.Get("Sales Invoice Header"."Sell-to Customer No.");
                CustAddrs := Customer.Address;
                CustAddrs2 := Customer."Address 2";
                CustCityPostCOde := Customer.City + '-' + Customer."Post Code";

                if BankAccNo = '' then
                    BankAccNo := 'BANK0004';

                BankAcc.Get(BankAccNo);
                BankNm := BankAcc.Name;
                BankAddrs := BankAcc.Address + ' ' + BankAcc."Address 2";
                BankIFSC := BankAcc."IFSC Code";
                BANKSwiftCode := BankAcc."SWIFT Code";
                BankCityPostCode := BankAcc.City + '-' + BankAcc."Post Code";
                BankAccountNo := BankAcc."Bank Account No.";
                /*
                ServTaxEntry.RESET;
                ServTaxEntry.SETRANGE(ServTaxEntry."Document No.","Sales Invoice Header"."No.");
                IF ServTaxEntry.FINDFIRST THEN BEGIN
                ServTaxPer:=ServTaxEntry."Service Tax %";
                SBCPer:=ServTaxEntry."Service Tax SBC %";
                KKCPer:=ServTaxEntry."KK Cess%";
                ServTaxAmt:=ServTaxEntry."Service Tax Amount";
                SBCAmt:=ServTaxEntry."Service Tax SBC Amount";
                KKCAmt:=ServTaxEntry."KK Cess Amount";
                ServTaxBaseAmt:=ServTaxEntry."Service Tax Base Amount";
                END;
                
                
                IF ServTaxAmt <> 0 THEN BEGIN
                ServTax:='Service Tax @ ' + FORMAT(ServTaxPer) + '%';
                END ELSE BEGIN
                ServTax:='';
                END;
                
                IF KKCAmt <> 0 THEN BEGIN
                KKC:='Krishi Kalyan Cess @ ' +FORMAT(KKCPer) + '%';
                END ELSE BEGIN
                KKC := '';
                END;
                
                IF SBCAmt <> 0 THEN BEGIN
                SBC:='Swacch Bharat Cess @ '+ FORMAT(SBCPer) + '%';
                END ELSE BEGIN
                SBC := '';
                END;
                
                SIL.SETRANGE(SIL."Document No.","Sales Invoice Header"."No.");
                IF SIL.FINDSET THEN REPEAT
                TaxBaseAmt   := TaxBaseAmt + SIL.Amount ;
                UNTIL SIL.NEXT = 0;
                */
                GLEntry.Reset;
                GLEntry.SetRange("Document No.", "Sales Invoice Header"."No.");
                GLEntry.SetRange("G/L Account No.", '410011');
                if GLEntry.FindFirst then begin
                    VolumeDiscount := GLEntry.Amount;
                end;

                //Added code for calculate GST fields+++
                IGSTAmount := 0;
                SGSTAmount := 0;
                CGSTAmount := 0;

                DetailedGSTLedgerEntry.Reset;
                DetailedGSTLedgerEntry.SetRange(DetailedGSTLedgerEntry."Document No.", "Sales Invoice Header"."No.");
                if DetailedGSTLedgerEntry.FindSet then
                    repeat
                        //MESSAGE(FORMAT(DetailedGSTLedgerEntry."GST Amount"));
                        if DetailedGSTLedgerEntry."GST Component Code" = 'CGST' then begin
                            TaxComponentCGST := 'CGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                            CGSTAmount := CGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                        end else begin
                            TaxComponentCGST := '';
                        end;
                        if DetailedGSTLedgerEntry."GST Component Code" = 'SGST' then begin
                            TaxComponentSGST := 'SGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                            SGSTAmount := SGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                        end else begin
                            TaxComponentSGST := '';
                        end;
                        if DetailedGSTLedgerEntry."GST Component Code" = 'IGST' then begin
                            TaxComponentIGST := 'IGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                            IGSTAmount := IGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                        end else begin
                            TaxComponentIGST := '';
                        end;
                    until DetailedGSTLedgerEntry.Next = 0;
                //Added code for calculate GST fields---

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
}

