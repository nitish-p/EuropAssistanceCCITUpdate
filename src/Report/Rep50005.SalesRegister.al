Report 50005 "Sales Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sales Register.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = where("Debit Note" = const(false));
            RequestFilterFields = "Posting Date", "No.", "Sell-to Customer No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(PostingDate_SalesInvoiceHeader; Format("Sales Invoice Header"."Posting Date"))
            {
            }
            column(EATransactionType_SalesInvoiceHeader; "Sales Invoice Header"."EA Transaction Type")
            {
            }
            column(DocumentDate_SalesInvoiceHeader; "Sales Invoice Header"."Document Date")
            {
            }
            column(ExternalDocumentNo_SalesInvoiceHeader; "Sales Invoice Header"."External Document No.")
            {
            }
            column(Comment_SalesInvoiceHeader; "Sales Invoice Header".Comment)
            {
            }
            column(Amount_SalesInvoiceHeader; "Sales Invoice Header".Amount)
            {
            }
            column(SelltoCustomerNo_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer No.")
            {
            }
            column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
            {
            }
            column(SelltoCustomerName_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer Name")
            {
            }
            column(DebitNote_SalesInvoiceHeader; "Sales Invoice Header"."Debit Note")
            {
            }
            column(AmounttoCustomer_SalesInvoiceHeader; '')//"Sales Invoice Header"."Amount to Customer"
            {
            }
            //Naveen
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
            column(PrintDetails; PrintDetails)
            {
            }
            column(AmtToCust; AmtToCust)
            {
            }
            column(Amt; Amt)
            {
            }
            column(DateFilter; DateFilter)
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                RequestFilterFields = "No.";
                column(ReportForNavId_1000000011; 1000000011)
                {
                }
                column(TaxAmount_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."Tax Amount",0.01)
                {
                }
                column(ServiceTaxGroup_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax Group"
                {
                }
                column(ServiceTaxAmount_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."Service Tax Amount",0.01)
                {
                }
                column(ServiceTaxSBC_SalesInvoiceLine; '')//"Sales Invoice Line"."Service Tax SBC %"
                {
                }
                column(ServiceTaxSBCAmount_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."Service Tax SBC Amount",0.01)
                {
                }
                column(KKCess_SalesInvoiceLine; '')//"Sales Invoice Line"."KK Cess%"
                {
                }
                column(KKCessAmount_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."KK Cess Amount",0.01)
                {
                }
                //Naveen
                column(IntegrationDocNo_SalesInvoiceLine; "Sales Invoice Line"."Integration Doc No")
                {
                }
                column(Comments_SalesInvoiceLine; "Sales Invoice Line".Comments)
                {
                }
                column(CaseNo_SalesInvoiceLine; "Sales Invoice Line"."Case No.")
                {
                }
                column(DocumentNo_SalesInvoiceLine; "Sales Invoice Line"."Document No.")
                {
                }
                column(No_SalesInvoiceLine; "Sales Invoice Line"."No.")
                {
                }
                column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                {
                }
                column(UnitofMeasure_SalesInvoiceLine; "Sales Invoice Line"."Unit of Measure")
                {
                }
                column(Quantity_SalesInvoiceLine; "Sales Invoice Line".Quantity)
                {
                }
                column(UnitPrice_SalesInvoiceLine; "Sales Invoice Line"."Unit Price")
                {
                }
                column(Amount_SalesInvoiceLine; "Sales Invoice Line".Amount)
                {
                }
                column(Tax_SalesInvoiceLine; '')//"Sales Invoice Line"."Tax %"
                {
                }
                column(TaxBaseAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."Tax Base Amount"
                {
                }
                column(TDSTCSAmount_SalesInvoiceLine; '')//"Sales Invoice Line"."TDS/TCS Amount"
                {
                }
                column(AmountToCustomer_SalesInvoiceLine; '')//"Sales Invoice Line"."Amount To Customer"
                {
                }
                //Naveen
            }

            trigger OnAfterGetRecord()
            begin
                //  AmtToCust:=AmtToCust+ROUND("Sales Invoice Header"."Amount to Customer",0.01);
                //Naveen
                Amt := Amt + ROUND("Sales Invoice Header".Amount, 0.01);
            end;

            trigger OnPreDataItem()
            begin
                DateFilter := "Sales Invoice Header".GetFilter("Sales Invoice Header"."Posting Date");
                AmtToCust := 0;
                Amt := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Print Details"; PrintDetails)
                {
                    ApplicationArea = Basic;
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
        GLEntry: Record "G/L Entry";
        PrintDetails: Boolean;
        DateFilter: Text[30];
        AmtToCust: Decimal;
        Amt: Decimal;
}

