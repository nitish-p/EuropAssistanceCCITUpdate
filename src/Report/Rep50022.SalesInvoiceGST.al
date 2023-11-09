Report 50022 "Sales Invoice GST"
{
    ApplicationArea = all;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sales Invoice GST.rdl';


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Posted Sales Invoice';
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
            column(AmtInWords; Notext[1])
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
            column(ShiptoPostCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to County")
            {
            }
            column(ShiptoCountryRegionCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Country/Region Code")
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
            column(ShiptoCode_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Code")
            {
            }
            column(CustName; CustName)
            {
            }
            column(CustAddrs2; CustAddrs2)
            {
            }
            column(CustAddrs; CustAddrs)
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
            column(LocGstRegNo; Location."GST Registration No.")
            {
            }
            column(CustCityPostCOde; CustCityPostCOde)
            {
            }
            column(CustCity; CustCity)
            {
            }
            column(CustGSTIN; CustGSTIN)
            {
            }
            column(state_Description; state_description)
            {
            }
            column(state_code; state_code)
            {
            }
            column(CustPAN; CustPAN)
            {
            }
            column(Remarks; Remarks)
            {

            }
            column(GrandTotal; GrandTotal)
            {

            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") order(ascending);
                // DataItemTableView = SORTING("Document No.", "Line No.");
                // DataItemLinkReference = "Sales Invoice Header";
                // DataItemLink = "Document No." = FIELD("No.");
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Tax_SalesInvoiceLine; '')//"Sales Invoice Line"."Tax %"
                {
                }
                //Naveen
                column(Line_Amount; "Line Amount") { }
                column(SelltoCustomerNo_SalesInvoiceLine; "Sales Invoice Line"."Sell-to Customer No.")
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
                column(Comments_SalesInvoiceLine; "Sales Invoice Line".Comments)
                {
                }
                //Naveen
                column(ServTaxBaseAmt; Abs(ROUND(ServTaxBaseAmt, 0.01)))
                {
                }
                column(TaxBaseAmt; ROUND(TaxBaseAmt, 0.01))
                {
                }
                column(CGSTRate; CGSTRate) { }
                column(SGSTRate; SGSTRate) { }
                column(IGSTRate; IGSTRate) { }
                column(CGSTAmt; CGSTAmt) { }
                column(SGSTAmt; SGSTAmt) { }
                column(IGSTAmt; IGSTAmt) { }
                //column(AmountToVendor; AmountToVendor) { }
                column(AmountinWords1; AmountinWords[2]) { }
                column(Amtinwrds; Amtinwrds) { }
                //column(TextAmount; TextAmount) { }

                column(AmountinWords; AmountinWords[1]) { }
                column(TaxAmountInWords; TaxNoText[1]) { }
                column(Gtotal; Gtotal) { }

                trigger OnAfterGetRecord()
                var
                    dtlgstlegder: Record "Detailed GST Ledger Entry";
                    gstamount: Decimal;
                    IGSTAMT2: Decimal;
                begin
                    //Naveen--CCIT
                    /* DetailedGSTLedgerEntry.Reset();
                     DetailedGSTLedgerEntry.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                     DetailedGSTLedgerEntry.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                     if DetailedGSTLedgerEntry.FindFirst() then
                         repeat
                             gstamount := gstamount + DetailedGSTLedgerEntry."GST Amount";
                         until DetailedGSTLedgerEntry.Next() = 0;
                     AmtToCust := AmtToCust + "Sales Invoice Line"."Line Amount" + gstamount; //Naveen ---Gst

                     Check.InitTextVariable;
                     Check.FormatNoText(atext,AmtToCust,'');

                     AmtInWords:=DelChr((atext[1]+atext[2]),'=','*');*/
                    //Naveen---CCIT
                    //Nkp++
                    Sno := Sno + 1;
                    if "Sales Invoice Header"."Currency Code" <> '' then begin
                        Currency := "Sales Invoice Header"."Currency Code";
                    end else begin
                        Currency := 'INR';
                    end;
                    DetailedGSTLedgerEntry.RESET;
                    DetailedGSTLedgerEntry.SETRANGE("Document No.", "Document No.");
                    DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                    DetailedGSTLedgerEntry.SETRANGE("GST Group Code", "GST Group Code");
                    DetailedGSTLedgerEntry.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry."Transaction Type"::Sales);
                    DetailedGSTLedgerEntry.SETRANGE("GST Component Code", 'CGST');
                    IF DetailedGSTLedgerEntry.FIND('-') THEN
                        REPEAT
                            CGSTAmt := Abs(DetailedGSTLedgerEntry."GST Amount");
                            CGSTRate := DetailedGSTLedgerEntry."GST %";
                        UNTIL DetailedGSTLedgerEntry.NEXT() = 0;
                    //SGST
                    DetailedGSTLedgerEntry1.RESET;
                    DetailedGSTLedgerEntry1.SETRANGE("Document No.", "Document No.");
                    DetailedGSTLedgerEntry1.SETRANGE("Document Line No.", "Line No.");
                    DetailedGSTLedgerEntry1.SETRANGE("GST Group Code", "GST Group Code");
                    DetailedGSTLedgerEntry1.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry1."Transaction Type"::Sales);
                    DetailedGSTLedgerEntry1.SETRANGE("GST Component Code", 'SGST');
                    IF DetailedGSTLedgerEntry1.FIND('-') THEN
                        REPEAT
                            SGSTAmt := Abs(DetailedGSTLedgerEntry1."GST Amount");
                            SGSTRate := DetailedGSTLedgerEntry1."GST %";
                        UNTIL DetailedGSTLedgerEntry1.NEXT() = 0;
                    //IGST
                    DetailedGSTLedgerEntry2.RESET;
                    DetailedGSTLedgerEntry2.SETRANGE("Document No.", "Document No.");
                    DetailedGSTLedgerEntry2.SETRANGE("Document Line No.", "Line No.");
                    DetailedGSTLedgerEntry2.SETRANGE("GST Group Code", "GST Group Code");
                    DetailedGSTLedgerEntry2.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry2."Transaction Type"::Sales);
                    DetailedGSTLedgerEntry2.SETRANGE("GST Component Code", 'IGST');
                    IF DetailedGSTLedgerEntry2.FindSet() THEN
                        REPEAT
                            IGSTRate := DetailedGSTLedgerEntry2."GST %";
                            IGSTAMT2 := Abs(DetailedGSTLedgerEntry2."GST Amount");

                            if DetailedGSTLedgerEntry2."Currency Code" = '' then
                                IGSTAmt := Abs(DetailedGSTLedgerEntry2."GST Amount")
                            else
                                IGSTAmt := IGSTAMT2 * "Sales Invoice Header"."Currency Factor"
                        UNTIL DetailedGSTLedgerEntry2.NEXT() = 0;
                    if "Sales Invoice Header"."Currency Code" <> '' then begin
                        TaxTotal += (Abs(CGSTAmt) + AbS(SGSTAmt) + Abs(IGSTAmt)) * "Sales Invoice Header"."Currency Factor";
                    end
                    else begin
                        TaxTotal += Abs(CGSTAmt) + AbS(SGSTAmt) + Abs(IGSTAmt);
                    end;
                    if "Sales Invoice Header"."Currency Code" <> '' then begin
                        IGSTAmt := IGSTAmt * "Sales Invoice Header"."Currency Factor";
                        CGSTAmt := CGSTAmt * "Sales Invoice Header"."Currency Factor";
                        SGSTAmt := SGSTAmt * "Sales Invoice Header"."Currency Factor";
                    end;
                    Total := Total + "Sales Invoice Line".Amount;    // Amt;
                                                                     // TaxTotal += Abs(CGSTAmt) + AbS(SGSTAmt) + Abs(IGSTAmt);
                    GrandTotal := Total + TaxTotal;
                    if "Sales Invoice Header"."Currency Code" <> '' then begin
                        PostedVoucher.InitTextVariable();
                        PostedVoucher.FormatNoText(Notext, ROUND(GrandTotal), Currency);
                    end
                    else begin
                        PostedVoucher.InitTextVariable;
                        PostedVoucher.FormatNoText(Notext, ROUND(GrandTotal), '');
                    end;
                    // Check.InitTextVariable;
                    // Check.FormatNoText(atext, GrandTotal, Currency);
                    // AmtInWords := DelChr((atext[1] + atext[2]), '=', '*'); //Abs(CGSTAmt) + Abs(SGSTAmt) + Abs(IGSTAmt);
                    // Clear(maxGrTotal);
                    // maxGrTotal += GrandTotal;
                    // Message('max gr total %1', maxGrTotal);
                    // Message('gr total%1', GrandTotal);

                    // if "Sales Invoice Header"."Currency Code" <> '' then begin
                    //     PostedVoucher1.InitTextVariable();
                    //     PostedVoucher1.FormatNoText(TaxNoText, Round(TaxTotal), Currency);

                    // end else begin
                    //     //PostedVoucher.InitTextVariable;
                    //     //PostedVoucher.FormatNoText(AmountinWords, ROUND(GrandTotal), '');

                    //     PostedVoucher1.InitTextVariable();
                    //     PostedVoucher1.FormatNoText(TaxNoText, Round(TaxTotal), '');
                    // end;


                    //Nkp---

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
                    GrandTotal := 0;
                    AmtToCust := 0;
                end;

                trigger OnPostDataItem()
                begin

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



                if BankAccNo = '' then
                    BankAccNo := 'BANK0004';

                BankAcc.Get(BankAccNo);
                BankNm := BankAcc.Name;
                BankAddrs := BankAcc.Address + ' ' + BankAcc."Address 2";
                BankIFSC := BankAcc."IFSC Code";
                BANKSwiftCode := BankAcc."SWIFT Code";
                BankCityPostCode := BankAcc.City + '-' + BankAcc."Post Code";
                BankAccountNo := BankAcc."Bank Account No.";

                /* ServTaxEntry.Reset;
                 ServTaxEntry.SetRange(ServTaxEntry."Document No.","Sales Invoice Header"."No.");
                 if ServTaxEntry.FindFirst then begin
                 ServTaxPer:=ServTaxEntry."Service Tax %";
                 SBCPer:=ServTaxEntry."Service Tax SBC %";
                 KKCPer:=ServTaxEntry."KK Cess%";
                 ServTaxAmt:=ServTaxEntry."Service Tax Amount";
                 SBCAmt:=ServTaxEntry."Service Tax SBC Amount";
                 KKCAmt:=ServTaxEntry."KK Cess Amount";
                 ServTaxBaseAmt:=ServTaxEntry."Service Tax Base Amount";
                 end;*/


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

                // total sales amount
                // Saleinvline2.Reset();
                // Saleinvline2.SetRange("Document No.", "Sales Invoice Header"."No.");
                // If Saleinvline2.FindFirst() then
                //     repeat
                //         Gtotal := Gtotal + Saleinvline2.Amount;
                //     until Saleinvline2.Next() = 0;
                // Gtotal := Gtotal + abs(CGSTAmount) + Abs(SGSTAmount) + abs(IGSTAmount);

                // if "Sales Invoice Header"."Currency Code" <> '' then begin
                //     PostedVoucher.InitTextVariable();
                //     PostedVoucher.FormatNoText(AmountinWords, Round(Gtotal), Currency);

                //     PostedVoucher1.InitTextVariable();
                //     PostedVoucher1.FormatNoText(TaxNoText, Round(TaxTotal), Currency);

                // end else begin
                //     PostedVoucher.InitTextVariable;
                //     PostedVoucher.FormatNoText(AmountinWords, ROUND(Gtotal), '');

                //     PostedVoucher1.InitTextVariable();
                //     PostedVoucher1.FormatNoText(TaxNoText, Round(TaxTotal), '');
                // end;


                //code for sate name++
                Customer.Get("Sales Invoice Header"."Sell-to Customer No.");
                CustGSTIN := Customer."GST Registration No.";
                CustPAN := Customer."P.A.N. No.";
                if Customer."Name for Invoice" <> '' then begin
                    CustName := Customer."Name for Invoice";
                end else begin
                    CustName := Customer.Name;
                end;

                CustAddrs := Customer.Address;
                CustAddrs2 := Customer."Address 2";
                CustCityPostCOde := Customer.City + '-' + Customer."Post Code";
                state1.Reset;
                state1.SetRange(state1.Code, Customer."State Code");
                if state1.FindFirst then begin
                    state_description := state1.Description;
                    state_code := state1."State Code (GST Reg. No.)";
                end;

                if "Sales Invoice Header"."Ship-to Code" <> '' then begin
                    rec222.Reset;
                    rec222.SetRange("Customer No.", "Sales Invoice Header"."Sell-to Customer No.");
                    rec222.SetRange(Code, "Sales Invoice Header"."Ship-to Code");
                    if rec222.FindFirst then begin
                        CustAddrs := rec222.Address;
                        CustAddrs2 := rec222."Address 2";
                        CustGSTIN := rec222."GST Registration No.";

                        Customer.Reset;
                        Customer.Get("Sales Invoice Header"."Sell-to Customer No.");
                        if Customer."Name for Invoice" <> '' then begin
                            CustName := Customer."Name for Invoice";
                        end else begin
                            CustName := rec222.Name;
                        end;
                        CustCityPostCOde := rec222.City + '-' + rec222."Post Code";

                        state1.Reset;
                        state1.SetRange(state1.Code, rec222.State);
                        if state1.FindFirst then begin
                            state_description := state1.Description;
                            state_code := state1."State Code (GST Reg. No.)";

                        end;
                    end;
                end;
                //code for sate name--
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
                // TaxComponentSGST := 0;
                // TaxComponentCGST := 0;
                GrandTotal := 0;
                CGSTAmount := 0;
                SGSTAmount := 0;
                IGSTAmount := 0;
                // IGSTAMT2 := 0;

                Clear(AmtInWords);
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
        // ServTaxEntry: Record UnknownRecord16473;
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
        // DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
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
        Location: Record Location;
        rec222: Record "Ship-to Address";
        CustPAN: Code[20];
        //Nkp
        PostedVoucher: Report "Posted Voucher";
        Amtinwrds: Text;
        AmountinWords: array[5] of Text;
        currency: Code[20];
        Sno: Integer;
        CGSTAmt: Decimal;
        CGSTRate: Decimal;
        IGSTAmt: Decimal;
        IGSTRate: Decimal;
        SGSTAmt: Decimal;
        SGSTRate: Decimal;
        Total: Decimal;
        GrandTotal: Decimal;
        TotalGST: Decimal;
        RecSalesLine: Record "Sales Invoice Line";
        CGST: Decimal;
        SGST: Decimal;
        IGST: Decimal;
        TotalCGST: Decimal;
        TotalSGST: Decimal;
        TotalIGST: Decimal;
        AmountinWordsINR: array[5] of Text;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        DetailedGSTLedgerEntry1: Record "Detailed GST Ledger Entry";
        DetailedGSTLedgerEntry2: Record "Detailed GST Ledger Entry";
        //PostedVoucher: Report "Posted Voucher";
        PostedVoucher1: Report "Posted Voucher";
        TaxTotal: Decimal;
        TaxNoText: array[2] of Text;

        maxGrTotal: Decimal;

        Gtotal: Decimal;
        Saleinvline2: Record "Sales Invoice Line";
        Notext: array[2] of Text;
}

