Report 50006 "Revenue Recognition Report"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Revenue Recognition Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Documentwise Service Master"; "Documentwise Service Master")
        {
            DataItemTableView = sorting("NAV Customer") order(ascending);
            RequestFilterFields = "NAV Customer", "Policy No/OEM Inv/Ref No";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(PolicyNo; "Documentwise Service Master"."Policy No/OEM Inv/Ref No")
            {
            }
            column(PStartDate; Format("Documentwise Service Master"."Policy / Coverage Start Date"))
            {
            }
            column(PEndDate; Format("Documentwise Service Master"."Policy / Coverage End Date"))
            {
            }
            column(ReqStartDate; Format(StartDate))
            {
            }
            column(ReqEndDate; Format(EndDate))
            {
            }
            column(Rate; Rate)
            {
            }
            column(DayWiseRevenue; ROUND(DayWiseRevenue, 0.01))
            {
            }
            column(MonthWiseRevenue; ROUND(MonthWiseRevenue, 0.01))
            {
            }
            column(PolicyCoverageStartDate; "Documentwise Service Master"."Policy / Coverage Start Date")
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
            column(StartDate; StartDate)
            {
            }
            column(NAVCustomer_DocumentwiseServiceMaster; "Documentwise Service Master"."NAV Customer")
            {
            }
            column(NAVCustomerName_DocumentwiseServiceMaster; "Documentwise Service Master"."NAV Customer Name")
            {
            }
            column(SrNo; SrNo)
            {
            }
            column(YearWiseRevenue; ROUND(YearWiseRevenue, 0.01))
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(ShowMonth; ShowMonth)
            {
            }
            column(ShowYear; ShowYear)
            {
            }

            trigger OnAfterGetRecord()
            begin
                // intialize
                Rate := 0;
                DayWiseRevenue := 0;
                MonthWiseRevenue := 0;
                YearWiseRevenue := 0;
                NoOfDays := 0;
                // added code to get rate from SIL
                SalesInvoiceLine.Reset;
                SalesInvoiceLine.SetRange("Integration Doc No", "Documentwise Service Master"."Integration doc No");
                SalesInvoiceLine.SetRange(SalesInvoiceLine."Line No.", "Documentwise Service Master"."Document Line No.");
                if SalesInvoiceLine.FindFirst then begin
                    Rate := SalesInvoiceLine."Unit Price";
                end;

                // to skip zero rate
                if Rate = 0 then
                    CurrReport.Skip;

                if "Documentwise Service Master"."Policy / Coverage Start Date" = 0D then
                    CurrReport.Skip;

                if "Documentwise Service Master"."Policy / Coverage End Date" = 0D then
                    CurrReport.Skip;

                // to skip records having policy start date after end date filter
                if "Documentwise Service Master"."Policy / Coverage Start Date" > EndDate then
                    CurrReport.Skip;

                // to skip records having policy end date before start date filter
                if "Documentwise Service Master"."Policy / Coverage End Date" < StartDate then
                    CurrReport.Skip;


                // added code to get policy ratio
                PolicyRatio := ("Documentwise Service Master"."Policy / Coverage End Date" - "Documentwise Service Master"."Policy / Coverage Start Date") + 1;

                // added code to get filtered period ratio
                PeriodRatio := (EndDate - StartDate) + 1;





                // added code to get revenue
                DayWiseRevenue := Rate / PolicyRatio;
                MonthWiseRevenue := DayWiseRevenue * PeriodRatio;

                NoOfDays := EndDate - "Documentwise Service Master"."Policy / Coverage Start Date" + 1;
                YearWiseRevenue := Rate * NoOfDays / PolicyRatio;

                if MonthWiseRevenue > Rate then begin
                    MonthWiseRevenue := Rate;
                end;

                if YearWiseRevenue > Rate then begin
                    YearWiseRevenue := Rate;
                end;

                if EndDate - StartDate <= 31 then begin
                    ShowMonth := true;
                    Amt := Amt + ROUND(MonthWiseRevenue, 0.01);
                end else begin
                    ShowMonth := false;
                    Amt := Amt + ROUND(YearWiseRevenue, 0.01);
                end;


                FinalAmt := ROUND(Amt, 1, '=');
                SrNo := SrNo + 1;
            end;

            trigger OnPostDataItem()
            var
                Cust: Record Customer;
            begin
                // to deleteall standing lines to avoid line already exist error
                GenJnlLn.Reset;
                GenJnlLn.SetRange(GenJnlLn."Journal Template Name", 'GENERAL');
                GenJnlLn.SetRange(GenJnlLn."Journal Batch Name", 'REVENUEADJ');
                GenJnlLn.SetFilter("Line No.", '=%1', 10000);
                if GenJnlLn.FindFirst then begin
                    GenJnlLn.DeleteAll;
                end;

                if GenerateLines = true then begin
                    LineNo := LineNo + 10000;
                    GenJnlLine."Journal Template Name" := 'GENERAL';
                    GenJnlLine."Journal Batch Name" := 'REVENUEADJ';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine.Validate("Document Type", 2);
                    GenJnlLine.Validate(GenJnlLine."Account Type", 0);
                    GenJnlLine.Validate(GenJnlLine."Account No.", AccountNo);
                    GenJnlLine.Validate(GenJnlLine."Posting Date", WorkDate);
                    //GenJnlLine."Document Type" := 0 ;
                    GenJnlLine."Document No." := DocNo;
                    GenJnlLine.Validate(GenJnlLine."Bal. Account Type", 0);
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.", BalAccountNo);
                    GenJnlLine.Validate(GenJnlLine.Amount, FinalAmt);
                    GenJnlLine.Validate("Gen. Posting Type", 2);
                    GenJnlLine.Validate("Gen. Prod. Posting Group", 'SERVICE');
                    Cust.Get(CustNo);
                    GenJnlLine.Validate("Gen. Bus. Posting Group", Cust."Gen. Bus. Posting Group");
                    GenJnlLine.Validate("Source No.", CustNo);

                    // GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code","Documentwise Service Master"."Policy No/OEM Inv/Ref No");
                    GenJnlLine."External Document No." := 'REVENUE RECOGNITION REPORT';
                    GenJnlLine.Insert;
                end;
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.Get('');
                //CompInfo.CALCFIELDS(CompInfo.Picture);
                CompNm := CompInfo.Name;
                CompAddrs := CompInfo.Address + ' ' + CompInfo."Address 2";
                CompCityPostCode := CompInfo.City + '-' + CompInfo."Post Code";
                CINNo := CompInfo."CIN No.";
                CustNo := "Documentwise Service Master".GetFilter("Documentwise Service Master"."NAV Customer");

                // initliaze
                Amt := 0;
                FinalAmt := 0;
                LineNo := 0;
                OldCustomer := '';
                LastCustomer := '';
                ClientRevenue := 0;
                if GenerateLines = true then begin
                    PurchPayablesSetup.Get('');
                    DocNo := NoSeriesMgmt.GetNextNo(PurchPayablesSetup."Revenue Series", WorkDate, true);
                end;

                // to validate blank cusotmer
                if "Documentwise Service Master".GetFilter("Documentwise Service Master"."NAV Customer") = '' then
                    Error('kindly select NAV Customer');

                SrNo := 0;

                if EndDate - StartDate <= 31 then begin
                    ShowMonth := true;
                end else begin
                    ShowMonth := false
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(StartDate; StartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'End Date';
                }
                field(AccountNo; AccountNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Account No';
                    TableRelation = "G/L Account";
                }
                field(BalAccountNo; BalAccountNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bal Account No';
                    TableRelation = "G/L Account";
                }
                field("Generate Lines"; GenerateLines)
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

    trigger OnPostReport()
    begin
        // added code for running page
        if GenerateLines = true then begin
            GenJnlLine.Reset;
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'REVENUEADJ');
            GenJnlLine.SetRange(GenJnlLine."Document No.", DocNo);
            Page.Run(39, GenJnlLine);
        end;
    end;

    trigger OnPreReport()
    begin
        ShowMonth := false;
        ShowYear := false;
    end;

    var
        StartDate: Date;
        EndDate: Date;
        RawData: Record "Raw Update Log";
        i: Integer;
        Rate: Decimal;
        LineNoText: Text[30];
        DateRatio: Decimal;
        PolicyRatio: Decimal;
        PeriodRatio: Decimal;
        GenerateLines: Boolean;
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        PurchPayablesSetup: Record "Purchases & Payables Setup";
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        DocNo: Code[30];
        DayWiseRevenue: Decimal;
        MonthWiseRevenue: Decimal;
        AccountNo: Code[30];
        BalAccountNo: Code[30];
        SalesInvoiceLine: Record "Sales Invoice Line";
        CompInfo: Record "Company Information";
        CompNm: Text[50];
        CompAddrs: Text[250];
        CompCityPostCode: Text[30];
        CINNo: Code[30];
        OldCustomer: Code[30];
        LastCustomer: Code[30];
        ClientRevenue: Decimal;
        DocServiceMaster: Record "Documentwise Service Master";
        DayWiseRevenue2: Decimal;
        MonthWiseRevenue2: Decimal;
        Rate2: Decimal;
        DateRatio2: Decimal;
        PolicyRatio2: Decimal;
        PeriodRatio2: Decimal;
        SIL: Record "Sales Invoice Line";
        Counter: Integer;
        Dcounter: Integer;
        Amt: Decimal;
        FinalAmt: Decimal;
        GenJnlLn: Record "Gen. Journal Line";
        SrNo: Integer;
        YearWiseRevenue: Decimal;
        YearWiseRevenue2: Decimal;
        NoOfDays: Integer;
        ShowMonth: Boolean;
        ShowYear: Boolean;
        CustNo: Code[30];
}

