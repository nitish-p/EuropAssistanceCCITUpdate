Report 50003 "Credit Note"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Credit Note.rdl';
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
            column(SelltoCustomerName_SalesInvoiceHeader; "Sales Cr.Memo Header"."Sell-to Customer Name 2")
            {
            }
            column(CINNo; CINNo)
            {
            }
            column(AmounttoCustomer_SalesCrMemoHeader; '')//ROUND("Sales Cr.Memo Header"."Amount to Customer",0.01)
            {
            }
            //Naveen
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
            column(TextConst; TextConst)
            {
            }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLinkReference = "Sales Cr.Memo Header";
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
                column(Type_SalesCrMemoLine; "Type")
                {
                }


                trigger OnAfterGetRecord()
                begin

                    // AmtToCust:=ROUND((AmtToCust+"Sales Cr.Memo Line"."Amount To Customer"),0.01);
                    //Naveen
                    Check.InitTextVariable;
                    Check.FormatNoText(atext, AmtToCust, '');
                    AmtInWords := DelChr((atext[1] + atext[2]), '=', '*');
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

                if BankAccNo = '' then
                    BankAccNo := 'BANK0004';

                BankAcc.Get(BankAccNo);
                BankNm := BankAcc.Name;
                BankAddrs := BankAcc.Address + ' ' + BankAcc."Address 2";
                BankIFSC := BankAcc."IFSC Code";
                BANKSwiftCode := BankAcc."SWIFT Code";
                BankCityPostCode := BankAcc.City + '-' + BankAcc."Post Code";
                BankAccountNo := BankAcc."Bank Account No.";

                //Naveen
                /*ServTaxEntry.Reset;
                ServTaxEntry.SetRange(ServTaxEntry."Document No.","Sales Cr.Memo Header"."No.");
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
        // ServTaxEntry: Record UnknownRecord16473;//Naveen
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
}

