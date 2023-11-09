Report 50010 "NTO - Top 15 Customers"
{
    // prdp 28062017
    // latest changes
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NTO - Top 15 Customers.rdl';

    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = where("Source Type" = const(Customer), "G/L Account No." = filter('310000' .. '319999'));
            RequestFilterFields = "Posting Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(SourceNo_GLEntry; "G/L Entry"."Source No.")
            {
            }
            column(PostingDate_GLEntry; "G/L Entry"."Posting Date")
            {
            }
            column(Amount_GLEntry; ROUND("G/L Entry".Amount, 0.01))
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
            column(CustName; CustName)
            {
            }
            column(SalesAmt; SalesAmt)
            {
            }

            trigger OnAfterGetRecord()
            begin

                SalesAmt := 0;
                RecCust.Reset;
                RecCust.SetRange("No.", "G/L Entry"."Source No.");
                if RecCust.FindFirst then begin
                    CustName := RecCust.Name;

                    GLEntry.Reset;
                    GLEntry.SetRange("Source No.", RecCust."No.");
                    GLEntry.SetFilter("G/L Account No.", '310000..319999');
                    //GLEntry.SETFILTER("Posting Date",DateFilter);
                    if GLEntry.FindSet then
                        repeat
                            SalesAmt := SalesAmt + GLEntry.Amount;
                        until GLEntry.Next = 0;

                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
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
        RecCust: Record Customer;
        CustName: Text[100];
        "SrNo.": Integer;
        SalesAmt: Decimal;
        GLEntry: Record "G/L Entry";
}

