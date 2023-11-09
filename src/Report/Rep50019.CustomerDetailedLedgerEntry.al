Report 50019 "Customer Detailed Ledger Entry"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Customer Detailed Ledger Entry.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    UseRequestPage = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(ReportForNavId_6836; 6836)
            {
            }
            column(DebitAmountLCY_Customer; Customer."Debit Amount (LCY)")
            {
            }
            column(periodfilter; periodfilter)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(compaddr_1_; compaddr[1])
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Currency_CodeCaptionLbl; Currency_CodeCaptionLbl)
            {
            }
            column(Customer_City; City)
            {
            }
            column(Opening_Value; Abs(OpeningDRBal - OpeningCRBal))
            {
            }
            column(DrCrTextBalance; DrCrTextBalance)
            {
            }
            column(startdate; startdate1)
            {
            }
            column(Customer_Detailed_Ledger_entryCaption; Customer_Detailed_Ledger_entryCaptionLbl)
            {
            }
            column(Credit_AmountCaption; Credit_AmountCaptionLbl)
            {
            }
            column(Debit_AmountCaption; Debit_AmountCaptionLbl)
            {
            }
            column(Document_TypeCaption; Document_TypeCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Cust_No_Caption; Cust_No_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(External_Document_No_Caption; External_Document_No_CaptionLbl)
            {
            }
            column(Opening__BalancesCaption; Opening__BalancesCaptionLbl)
            {
            }
            column(CurrencyCode_Customer; Customer."Currency Code")
            {
            }
            column(Customer_Date_Filter; "Date Filter")
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter");
                DataItemTableView = sorting("Posting Date") order(ascending) where(Reversed = filter(false));
                column(ReportForNavId_8503; 8503)
                {
                }
                column(Cust__Ledger_Entry__Posting_Date_; "Cust. Ledger Entry"."Posting Date")
                {
                }
                column(Cust__Ledger_Entry__Document_Type_; "Document Type")
                {
                }
                column(CurrDtTime; Format(CurrDtTime))
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Cust__Ledger_Entry__Debit_Amount_; "Debit Amount")
                {
                }
                column(Cust__Ledger_Entry__Credit_Amount_; "Credit Amount")
                {
                }
                column(ABS_bal_; Abs(bal))
                {
                }
                column(DrCrTextBalance1; DrCrTextBalance)
                {
                }
                column(Cust__Ledger_Entry__External_Document_No__; "Cust. Ledger Entry"."External Document No.")
                {
                }
                column(CurrCode; CurrCode)
                {
                }
                column(Cust__Ledger_Entry__Debit_Amount__LCY__; "Debit Amount (LCY)")
                {
                }
                column(Cust__Ledger_Entry__Credit_Amount__LCY__; "Credit Amount (LCY)")
                {
                }
                column(Cust__Ledger_Entry_Amount; Amount)
                {
                }
                column(DrCrTextBalance2; DrCrTextBalance)
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Debit_Amount__LCY__; "Cust. Ledger Entry"."Debit Amount (LCY)")
                {
                }
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Credit_Amount__LCY__; "Cust. Ledger Entry"."Credit Amount (LCY)")
                {
                }
                column(ABS_bal__Control1000000007; Abs(bal))
                {
                }
                column(enddate; enddate1)
                {
                }
                column(Closing_BalancesCaption; Closing_BalancesCaptionLbl)
                {
                }
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Customer_No_; "Customer No.")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Cust__Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(VoucherNaraation; VoucherNaraation)
                {
                }
                column(bal; bal)
                {
                }
                column(LineNarration; LineNarration)
                {
                }
                column(SalesLCY_CustLedgerEntry; "Cust. Ledger Entry"."Sales (LCY)")
                {
                }
                column(Comments_CustLedgerEntry; "Cust. Ledger Entry".Comments)
                {
                }
                column(IntDocNo; IntDocNo)
                {
                }
                column(CurrencyCode; CurrencyCode)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    // to calculate balance for each transaction
                    bal := bal + "Cust. Ledger Entry"."Debit Amount" - "Cust. Ledger Entry"."Credit Amount";

                    // to print voucher narration using Posted Narration record variable
                    //  IF PrintVoucherNarration THEN BEGIN
                    PostedNarration.Reset;
                    // initialization
                    VoucherNaraation := '';
                    PostedNarration.SetRange(PostedNarration."Document No.", "Cust. Ledger Entry"."Document No.");
                    PostedNarration.SetFilter(PostedNarration."Entry No.", '%1', 0);
                    if PostedNarration.FindSet then
                        repeat
                            if VoucherNaraation <> '' then
                                VoucherNaraation := VoucherNaraation + ' ' + PostedNarration.Narration;
                            if VoucherNaraation = '' then
                                VoucherNaraation := PostedNarration.Narration;
                        until PostedNarration.Next = 0;
                    //   END;


                    //   IF PrintLineNarration THEN BEGIN
                    PostedNarration1.Reset;
                    LineNarration := '';
                    PostedNarration1.SetRange(PostedNarration1."Entry No.", "Cust. Ledger Entry"."Entry No.");
                    if PostedNarration1.FindSet then
                        repeat
                            if LineNarration <> '' then
                                LineNarration := LineNarration + ' ' + PostedNarration1.Narration;
                            if LineNarration = '' then
                                LineNarration := PostedNarration1.Narration;
                        until PostedNarration1.Next = 0;
                    //   END;

                    // to calcuate postingdate
                    PostinfDate := Format("Cust. Ledger Entry"."Posting Date");

                    // prdp -added code for currency code & integratin doc no
                    CurrencyCode := '';
                    RecCust.Reset;
                    RecCust.SetRange("No.", "Cust. Ledger Entry"."Customer No.");
                    if RecCust.FindFirst then begin
                        if RecCust."Currency Code" = '' then begin
                            CurrencyCode := 'INR';
                        end else begin
                            CurrencyCode := RecCust."Currency Code";
                        end;
                    end;

                    SalesInvHdr.Reset;
                    SalesInvHdr.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                    if SalesInvHdr.FindFirst then begin
                        IntDocNo := SalesInvHdr."Integration Doc No";
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    // initialization

                    "Cust. Ledger Entry"."Debit Amount" := 0;
                    "Cust. Ledger Entry"."Credit Amount" := 0;
                    CurrDtTime := Today;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                if customerno <> "No." then begin

                    OpeningDRBal := 0;
                    OpeningCRBal := 0;

                    CustAccLedgEntry.Reset;
                    CustAccLedgEntry.SetCurrentkey("Customer No.", "Posting Date");
                    CustAccLedgEntry.SetRange("Customer No.", "No.");

                    if periodfilter <> '' then begin
                        if GetRangeMin("Date Filter") <> 0D then begin
                            CustAccLedgEntry.SetFilter("Posting Date", '%1..%2', 0D, NormalDate(GetRangeMin("Date Filter")) - 1);


                            CustAccLedgEntry.CalcSums(Amount);
                            if CustAccLedgEntry.Amount > 0 then
                                OpeningDRBal := CustAccLedgEntry.Amount;
                            if CustAccLedgEntry.Amount < 0 then
                                OpeningCRBal := -CustAccLedgEntry.Amount;

                            bal := OpeningDRBal - OpeningCRBal;
                            DrCrTextBalance := '';
                            if OpeningDRBal - OpeningCRBal > 0 then
                                DrCrTextBalance := Text16501;
                            if OpeningDRBal - OpeningCRBal < 0 then
                                DrCrTextBalance := Text16502;

                        end;
                    end;
                    //  customerno := "No.";
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
                group(Control1000000002)
                {
                    field(PrintVoucherNarration; PrintVoucherNarration)
                    {
                        ApplicationArea = Basic;
                        Caption = 'PrintVoucherNarration';
                        Enabled = true;
                        Visible = false;
                    }
                    field(PrintLineNarration; PrintLineNarration)
                    {
                        ApplicationArea = Basic;
                        Caption = 'PrintLineNarration';
                        Visible = false;
                    }
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
        // code to add date filter

        periodfilter := Customer.GetFilter("Date Filter");
        startdate := Customer.GetRangeMin("Date Filter");
        enddate := Customer.GetRangemax("Date Filter");

        // toclaculate start date and end date
        startdate1 := Format(startdate);
        enddate1 := Format(enddate);


        compinfo.Get;
        compaddr[1] := compinfo.Name;
    end;

    var
        OpeningDRBal: Decimal;
        OpeningCRBal: Decimal;
        CustAccLedgEntry: Record "Detailed Cust. Ledg. Entry";
        customerno: Text[10];
        transdebits: Decimal;
        transcredits: Decimal;
        OneEntryRecord: Boolean;
        Text16501: label 'Dr';
        Text16502: label 'Cr';
        DrCrTextBalance: Text[2];
        DrCrtext: Text[2];
        locationcode: Code[10];
        CustAccLedgEntry2: Record "Detailed Cust. Ledg. Entry";
        periodfilter: Text[30];
        compinfo: Record "Company Information";
        compaddr: array[1] of Text[50];
        bal: Decimal;
        startdate: Date;
        enddate: Date;
        PrintVoucherNarration: Boolean;
        CurrCode: Code[50];
        OpeningDRBAl1: Decimal;
        OpeningCRBal1: Decimal;
        Customer_Detailed_Ledger_entryCaptionLbl: label 'Customer Detailed Ledger entry';
        Credit_AmountCaptionLbl: label 'Credit Amount';
        Debit_AmountCaptionLbl: label 'Debit Amount';
        Document_TypeCaptionLbl: label 'Document Type';
        Document_No_CaptionLbl: label 'Document No.';
        DateCaptionLbl: label 'Date';
        Customer_NameCaptionLbl: label 'Customer Name';
        Cust_No_CaptionLbl: label 'Cust No.';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        BalanceCaptionLbl: label 'Balance';
        External_Document_No_CaptionLbl: label 'External Document No.';
        Currency_CodeCaptionLbl: label 'Currency Code';
        Opening__BalancesCaptionLbl: label 'Opening  Balances';
        Closing_BalancesCaptionLbl: label 'Closing Balances';
        OpeningVal: Decimal;
        PostedNarration: Record "Posted Narration";
        VoucherNaraation: Text[500];
        balance: Decimal;
        PrintLineNarration: Boolean;
        LineNarration: Text[500];
        PostedNarration1: Record "Posted Narration";
        DimensionValue: Page "Dimension Values";
        ILE: Record "Item Ledger Entry";
        BatchNo: Text;
        MfgDt: Text;
        ExpDt: Text;
        Dt: Text[50];
        Branch: Text[50];
        Dept: Text[50];
        PostinfDate: Text[30];
        startdate1: Text[30];
        enddate1: Text[30];
        CurrDtTime: Date;
        IntDocNo: Code[30];
        SalesInvHdr: Record "Sales Invoice Header";
        RecCust: Record Customer;
        CurrencyCode: Code[20];
}

