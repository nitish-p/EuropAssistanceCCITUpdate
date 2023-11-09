Report 50009 "Case Wise Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Case Wise Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem(CaseSummarized; "Purch. Inv. Line")
        {
            DataItemTableView = where("Case No." = filter(<> ''));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CaseNo; CaseSummarized."Case No.")
            {
            }
            column(Amount; CaseSummarized.Amount)
            {
            }
            column(DebitNoteAmount; DebitNoteAmount)
            {
            }
            column(Subject; Subject)
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

            trigger OnAfterGetRecord()
            begin


                // added codde to skip detailed
                if ShowDetails = true then
                    CurrReport.Skip;

                // added code to get debit note amount
                DebitNoteAmount := 0;
                SalesInvLine.Reset;
                SalesInvLine.SetRange(SalesInvLine."Case No.", CaseSummarized."Case No.");
                if SalesInvLine.FindFirst then begin
                    DebitNoteAmount := SalesInvLine.Amount;
                end
                else
                    CurrReport.Skip;
            end;
        }
        dataitem(CaseDetailed; "Purch. Inv. Line")
        {
            DataItemTableView = where("Case No." = filter(<> ''));
            column(ReportForNavId_1000000001; 1000000001)
            {
            }
            column(Amount1; CaseDetailed.Amount)
            {
            }
            column(CaseNo1; CaseDetailed."Case No.")
            {
            }
            column(DebitNoteAmount1; DebitNoteAmount1)
            {
            }
            column(DEbitNoteDocNo; DebitNoteDocNo)
            {
            }
            column(PurchaseDocNo; CaseDetailed."Document No.")
            {
            }
            column(ShowDetails; ShowDetails)
            {
            }
            column(SalesDate; Format(SalesDate))
            {
            }
            column(PurchDate; Format(PurchDate))
            {
            }
            column(CustName; CustName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                // added codde to skip dsummarizd
                if ShowDetails = false then
                    CurrReport.Skip;

                PurchDate := CaseDetailed."Posting Date";
                // added code to get debit note amount & debit note doc no
                DebitNoteAmount1 := 0;
                SalesInvLine.Reset;
                SalesInvLine.SetRange(SalesInvLine."Case No.", CaseDetailed."Case No.");
                if SalesInvLine.FindFirst then begin
                    Cust.Get(SalesInvLine."Sell-to Customer No.");
                    CustName := Cust.Name;
                    SalesDate := SalesInvLine."Posting Date";
                    DebitNoteAmount1 := SalesInvLine.Amount;
                    DebitNoteDocNo := SalesInvLine."Document No.";
                end
                else
                    CurrReport.Skip;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(ShowDetails; ShowDetails)
                {
                    ApplicationArea = Basic;
                    Caption = 'Show Details';
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
        ShowDetails: Boolean;
        DebitNoteAmount: Decimal;
        DebitNoteAmount1: Decimal;
        SalesInvLine: Record "Sales Invoice Line";
        DebitNoteDocNo: Code[30];
        Subject: Code[30];
        CustName: Text[100];
        Cust: Record Customer;
        SalesDate: Date;
        PurchDate: Date;
        CompInfo: Record "Company Information";
        CompNm: Text[50];
        CompAddrs: Text[250];
        CompCityPostCode: Text[30];
        CINNo: Code[30];
}

