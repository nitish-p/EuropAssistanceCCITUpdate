Report 50002 "Sales Invoice"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sales Invoice.rdl';
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
            column(SelltoCustomerName_SalesInvoiceHeader; CustName)
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
            column(TextConst; TextConst)
            {
            }
            column(CurrCode; CurrCode)
            {
            }
            column(CurrCode1; CurrCode1)
            {
            }
            column(CurrCode2; CurrCode2)
            {
            }
            column(CurrCode3; CurrCode3)
            {
            }
            column(CustPAN; CustPAN)
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_1000000001; 1000000001)
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
                column(Comments_SalesInvoiceLine; "Sales Invoice Line".Comments)
                {
                }
                column(ServTaxBaseAmt; Abs(ROUND(ServTaxBaseAmt, 0.01)))
                {
                }
                column(TaxBaseAmt; ROUND(TaxBaseAmt, 0.01))
                {
                }

                trigger OnAfterGetRecord()
                begin

                    AmtToCust := TaxBaseAmt + VolumeDiscount + SBCAmt + KKCAmt + ServTaxAmt;
                    //Naveen

                    Check.InitTextVariable;
                    Check.FormatNoText(atext, AmtToCust, "Sales Invoice Header"."Currency Code");

                    AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');
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
                if Customer."Name for Invoice" <> '' then begin
                    CustName := Customer."Name for Invoice";
                end else begin
                    CustName := Customer.Name;
                end;

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
                //Naveen


                CurrCode := "Sales Invoice Header"."Currency Code";

                if CurrCode = '' then begin
                    CurrCode := 'INR';
                end;

                if ServTaxAmt <> 0 then begin
                    ServTax := 'Service Tax @ ' + Format(ServTaxPer) + '%';
                    CurrCode1 := CurrCode;
                end else begin
                    ServTax := '';
                    CurrCode1 := '';
                end;

                if KKCAmt <> 0 then begin
                    KKC := 'Krishi Kalyan Cess @ ' + Format(KKCPer) + '%';
                    CurrCode2 := CurrCode;
                end else begin
                    KKC := '';
                    CurrCode2 := '';
                end;

                if SBCAmt <> 0 then begin
                    SBC := 'Swacch Bharat Cess @ ' + Format(SBCPer) + '%';
                    CurrCode3 := CurrCode;
                end else begin
                    SBC := '';
                    CurrCode3 := '';
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

                CurrCode := '';
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
        CurrCode: Code[20];
        CurrCode1: Code[20];
        CurrCode2: Code[20];
        CurrCode3: Code[20];
        CustName: Text[100];
        CustPAN: Code[20];
}

