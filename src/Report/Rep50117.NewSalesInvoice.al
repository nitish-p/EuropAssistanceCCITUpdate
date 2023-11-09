report 50117 "New_Sales_Invoice"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    //RDLCLayout = 'Layout\SALE_ORDER_NEW.rdl';
    RDLCLayout = './Layouts/SALE_INVOICE_NEW.rdl';

    Caption = 'SalesInvoice New Report';

    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(SelltoCustomerNo_SalesInvoiceHeader; "Sales Header"."Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceHeader; "Sales Header"."No.")
            {
            }
            column(PostingDate_SalesInvoiceHeader; Format("Sales Header"."Posting Date"))
            {
            }
            column(SelltoCustomerName_SalesInvoiceHeader; "Sales Header"."Sell-to Customer Name 2")
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
            column(Amount_SalesInvoiceHeader; ROUND("Sales Header".Amount, 0.01))
            {
            }
            column(ExternalDocumentNo_SalesInvoiceHeader; "Sales Header"."External Document No.")
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
            column(ShiptoPostCode_SalesInvoiceHeader; "Sales Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_SalesInvoiceHeader; "Sales Header"."Ship-to County")
            {
            }
            column(ShiptoCountryRegionCode_SalesInvoiceHeader; "Sales Header"."Ship-to Country/Region Code")
            {
            }
            column(ShiptoCode_SalesInvoiceHeader; "Sales Header"."Ship-to Code")
            {
            }
            column(ShiptoName_SalesInvoiceHeader; "Sales Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_SalesInvoiceHeader; "Sales Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesInvoiceHeader; "Sales Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_SalesInvoiceHeader; "Sales Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_SalesInvoiceHeader; "Sales Header"."Ship-to City")
            {
            }
            column(ShiptoContact_SalesInvoiceHeader; "Sales Header"."Ship-to Contact")
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
            column(AmtInWords; Notext[1])
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
            column(Remarks; Remarks)
            {

            }
            column(GrandTotal; GrandTotal)
            {

            }
            dataitem("Sales Line"; "Sales Line")
            {

                // DataItemTableView = SORTING("Document No.", "Line No.") where(Type = filter(<> " "));
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = FIELD("No.");
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Tax_SalesInvoiceLine; '')//"Sales Invoice Line"."Tax %"
                {
                }
                //Naveen
                column(LineNo_SalesInvoiceLine; "Sales Line"."Line No.")
                {
                }
                column(SelltoCustomerNo_SalesInvoiceLine; "Sales Line"."Sell-to Customer No.")
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
                column(KKCessAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."KK Cess Amount"
                {
                }
                //Naveen
                column(No_SalesInvoiceLine; "Sales Line"."No.")
                {
                }
                column(Description_SalesInvoiceLine; "Sales Line".Description)
                {
                }
                column(Quantity_SalesInvoiceLine; "Sales Line".Quantity)
                {
                }
                column(ServiceTaxBase_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax Base"
                {
                }
                //Naveen
                column(UnitPrice_SalesInvoiceLine; ROUND("Sales Line"."Unit Price", 0.01))
                {
                }
                column(Amount_SalesInvoiceLine; ROUND("Sales Line".Amount, 0.01))
                {
                }
                column(LineAmount_SalesInvoiceLine; ROUND("Sales Line"."Line Amount", 0.01))
                {
                }
                column(HSNCode; HSNCode)
                {
                }
                column(AmountToCustomer_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."Amount To Customer",0.01)
                {
                }
                column(ServiceTaxAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax Amount"
                {
                }
                column(ServiceTaxRegistrationNo_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax Registration No."
                {
                }
                //Naveen
                column(Comments_SalesInvoiceLine; "Sales Line".Comments)
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
                column(Particulars_SalesInvoiceLine; "Sales Line".Particulars)
                {
                }



                trigger OnAfterGetRecord()
                begin
                    ClearData();
                    if "Sales Header"."Currency Code" <> '' then begin
                        Currency := "Sales Header"."Currency Code";
                    end else begin
                        Currency := 'INR';
                    end;
                    RecSalesLine.Reset();
                    RecSalesLine.SetRange("Document Type", "Sales Header"."Document Type");
                    RecSalesLine.SetRange("Document No.", "Sales Header"."No.");
                    RecSalesLine.SetFilter("GST Group Code", '<>%1', '');
                    if RecSalesLine.FindSet() then
                        repeat
                            TaxRecordID := RecSalesLine.RecordId();

                            TaxTransactionValue.Reset();
                            TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);
                            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                            TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
                            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                            TaxTransactionValue.SetRange("Visible on Interface", true);
                            TaxTransactionValue.SetFilter("Value ID", '%1 | %2', 6, 2);
                            if TaxTransactionValue.FindSet() then begin
                                TaxComponentCGST := TaxTransactionValue.Percent;  /// 2;
                                TaxComponentSGST := TaxTransactionValue.Percent;   /// 2;
                                CGST := TaxTransactionValue.Amount;  /// 2;
                                SGST := TaxTransactionValue.Amount; // / 2;
                                CGSTAmount += CGST;
                                SGSTAmount += SGST;
                            END
                            ELSE begin
                                TaxTransactionValue.Reset();
                                TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);
                                TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                                TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
                                TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                                TaxTransactionValue.SetRange("Visible on Interface", true);
                                TaxTransactionValue.SetFilter("Value ID", '%1', 3);
                                if TaxTransactionValue.FindSet() then
                                    TaxComponentIGST := TaxTransactionValue.Percent;
                                IGST := TaxTransactionValue.Amount;
                                IGSTAmount += IGST;
                                /*IF ("Sales Line"."GST Jurisdiction Type" = "Sales Line"."GST Jurisdiction Type"::Interstate) THEN BEGIN
                                    IGSTRate := TaxTransactionValue.Percent;
                                    IGST := TaxTransactionValue.Amount; //     IGSTtxt := 'IGST';
                                END;
                                until TaxTransactionValue.Next() = 0;
                                TotalCGST += CGST;
                                TotalSGST += SGST;s
                                TotalIGST += IGST;*/
                            end;
                            Total := Total + RecSalesLine.Amount;
                            TaxTotal := abs(SGSTAmount) + abs(CGSTAmount) + abs(IGSTAmount);
                            GrandTotal := Total + TaxTotal;
                        until RecSalesLine.Next() = 0;

                    // Check.InitTextVariable;
                    // Check.FormatNoText(atext, Round(GrandTotal), Currency);
                    //  AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');

                    if "Sales Header"."Currency Code" <> '' then begin
                        PostedVoucher.InitTextVariable();
                        PostedVoucher.FormatNoText(Notext, ROUND(GrandTotal), Currency);
                    end
                    else begin
                        PostedVoucher.InitTextVariable;
                        PostedVoucher.FormatNoText(Notext, ROUND(GrandTotal), '');
                    end;
                    // if "Sales Header"."Currency Code" <> '' then begin
                    //     PostedVoucher.InitTextVariable();
                    //     PostedVoucher.FormatNoText(atext, ROUND(GrandTotal), Currency);
                    // end
                    // else begin
                    //     PostedVoucher.InitTextVariable;
                    //     PostedVoucher.FormatNoText(atext, ROUND(GrandTotal), '');
                    // end;
                    //AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');

                    HSNCode := '';
                    // AmtToCust:=ROUND((AmtToCust+"Sales Invoice Line"."Amount To Customer"),0.01);
                    //Naveen
                    // Check.InitTextVariable;
                    //Check.FormatNoText(atext, AmtToCust, '');

                    //AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');
                    //Added code for HSN/SAC Code+++
                    if "Sales Line".Type = 2 then begin
                        RecItem.Reset;
                        RecItem.SetRange(RecItem."No.", "Sales Line"."No.");
                        if RecItem.FindFirst then
                            HSNCode := RecItem."HSN/SAC Code";
                    end;

                    if "Sales Line".Type = 1 then begin
                        RecGL.Reset;
                        RecGL.SetRange(RecGL."No.", "Sales Line"."No.");
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

                Customer.Get("Sales Header"."Sell-to Customer No.");
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


                if "Sales Header"."Ship-to Code" <> '' then begin
                    rec222.Reset;
                    rec222.SetRange("Customer No.", "Sales Header"."Sell-to Customer No.");
                    rec222.SetRange(Code, "Sales Header"."Ship-to Code");
                    if rec222.FindFirst then begin
                        CustGSTIN := rec222."GST Registration No.";

                        Customer.Reset;
                        Customer.Get("Sales Header"."Sell-to Customer No.");
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

                if CopyStr("Sales Header"."No.", 1, 2) = 'CN' then
                    ReportCaption := 'CREDIT NOTE';
                if CopyStr("Sales Header"."No.", 1, 2) = 'DN' then begin
                    ReportCaption := 'DEBIT NOTE';
                    TextConst := '';
                end;
                if ReportCaption = '' then
                    ReportCaption := 'DRAFT INVOICE';



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
                // end;
                //naveen


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
                SIL.SetRange(SIL."Document No.", "Sales Header"."No.");
                if SIL.FindSet then
                    repeat
                        TaxBaseAmt := TaxBaseAmt + SIL.Amount;
                    until SIL.Next = 0;

                GLEntry.Reset;
                GLEntry.SetRange("Document No.", "Sales Header"."No.");
                GLEntry.SetRange("G/L Account No.", '410011');
                if GLEntry.FindFirst then begin
                    VolumeDiscount := GLEntry.Amount;
                    TaxBaseAmt1 := TaxBaseAmt;
                end else begin
                    TaxBaseAmt1 := 0;
                end;

                //Rushab++

                // DetailedGSTLedgerEntry.Reset;
                // DetailedGSTLedgerEntry.SetRange(DetailedGSTLedgerEntry."Document No.", "Sales Invoice Header"."No.");
                // if DetailedGSTLedgerEntry.FindSet then
                //     repeat
                //         if DetailedGSTLedgerEntry."GST Component Code" = 'CGST' then begin
                //             TaxComponentCGST := 'CGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                //             CGSTAmount := CGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                //         end;
                //         if DetailedGSTLedgerEntry."GST Component Code" = 'SGST' then begin
                //             TaxComponentSGST := 'SGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                //             SGSTAmount := SGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                //         end;
                //         if DetailedGSTLedgerEntry."GST Component Code" = 'IGST' then begin
                //             TaxComponentIGST := 'IGST @ ' + Format(DetailedGSTLedgerEntry."GST %") + ' % ';
                //             IGSTAmount := IGSTAmount + DetailedGSTLedgerEntry."GST Amount";
                //         end;
                //     until DetailedGSTLedgerEntry.Next = 0;
                //Rushba__
                //Added code for calculate GST fields---

                // 0404201 - to get IRN and QRCode ++
                IRNNumber := '';
                EInvLedger.Reset;
                EInvLedger.SetRange(EInvLedger."Document Type", EInvLedger."document type"::Invoice);
                EInvLedger.SetRange("Document No.", "Sales Header"."No.");
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
        TaxBaseAmt: Decimal;
        AmtToCust: Decimal;
        PrintComments: Boolean;
        SIL: Record "Sales Invoice Line";
        GLEntry: Record "G/L Entry";
        VolumeDiscount: Decimal;
        HSNCode: Code[20];
        RecItem: Record Item;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        TaxComponentCGST: Decimal;
        TaxComponentSGST: Decimal;
        TaxComponentIGST: Decimal;
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        IGSTAmount1: Decimal;
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
        GrandTotal: Decimal;
        TaxTotal: Decimal;
        Total: Decimal;
        TaxRecordID: RecordId;
        TaxTransactionValue: Record "Tax Transaction Value";
        RecSalesLine: Record "Sales Line";
        PostedVoucher: Report "Posted Voucher";
        CGST: Decimal;
        SGST: Decimal;
        IGST: Decimal;
        Currency: Code[20];
        Notext: array[2] of Text;

    local procedure ClearData()
    Begin
        TaxComponentIGST := 0;
        TaxComponentSGST := 0;
        TaxComponentCGST := 0;

        CGSTAmount := 0;
        SGSTAmount := 0;
        IGSTAmount := 0;

        IGST := 0;
        CGST := 0;
        SGST := 0;
        Clear(AmtInWords);

    End;

}