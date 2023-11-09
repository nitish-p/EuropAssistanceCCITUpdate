Report 50011 "Ledger_Extract"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Ledger_Extract.rdl';

    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = order(ascending) where("Account Type" = filter(Posting));
            RequestFilterFields = "Date Filter", "No.";
            column(ReportForNavId_1000000001; 1000000001)
            {
            }
            column(Opeiningasofdate; Abs(OpeningDRBal - OpeningCRBal))
            {
            }
            column(OP_BAL; "Opening Balance")
            {
            }
            column(Desc; 'Opening Balance As On' + ' ' + Format(GetRangeMin("Date Filter")))
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = field("No."), "Posting Date" = field("Date Filter"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter");
                DataItemTableView = sorting("G/L Account No.", "Posting Date") order(ascending);
                RequestFilterFields = "Posting Date";
                column(ReportForNavId_1000000002; 1000000002)
                {
                }
                column(Posting_Date; "Posting Date")
                {
                }
                column(Document_Date; "Document Date")
                {
                }
                column(NAV_Acc_Code; NAV_Acc_Code)
                {
                }
                column(NAV_Acc_Type; NAV_Acc_Type)
                {
                }
                column(Description; SourceName)
                {
                }
                column(Doc_TYpe; Doc_TYpe)
                {
                }
                column(Ref_No; "Ref.No")
                {
                    //OptionCaption = 'External Document Number/Vendor Invoice Number';
                }
                column(Integrated_Doc_No; Integrated_Doc_No)
                {
                }
                column(Debit_Amt; "Debit Amount")
                {
                }
                column(Credit_Amt; "Credit Amount")
                {
                }
                column(transactions; "Closing Balance")
                {
                }
                column(Dimension1; "Global Dimension 1 Code")
                {
                }
                column(Dimension2; "Global Dimension 2 Code")
                {
                }
                column(test; "Opening Balance" + TransDeb - TransCrd)
                {
                }
                column(Closing; "Closing Balance")
                {
                }
                column(Narration; Narration)
                {
                }
                column(UserID; "User ID")
                {
                }
                column(Entrymadeby; "Entered by")
                {
                }
                column(Documentr; "Document No.")
                {
                }
                column(PrintDetail; "Print Detail")
                {
                }
                column(Currency_Code; CurrCode)
                {
                }
                column(Transcred; TransCrd)
                {
                }
                column(Transdebit; TransDeb)
                {
                }
                column(bal; (OpeningDRBal - OpeningCRBal) + "Opening Balance")
                {
                }
                column(DRCR; DrCrTextBalance)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    Doc_TYpe := '';

                    if "Document Type" <> 0 then begin
                        NAV_Acc_Code := "Source No.";

                        if "Document Type" = "document type"::Invoice then begin
                            if "Source Type" = "source type"::Vendor then begin
                                Doc_TYpe := 'Purchase Invoice';
                                NAV_Acc_Type := 'Vendor';
                                Tab23.Reset;
                                Tab23.SetRange(Tab23."No.", "Source No.");
                                if Tab23.FindFirst then
                                    SourceName := Tab23.Name;
                                CurrCode := Tab23."Currency Code";
                            end
                            else
                                if "Source Type" = "source type"::Customer then begin
                                    Doc_TYpe := 'Sales Invoice';
                                    NAV_Acc_Type := 'Customer';
                                    Tab18.Reset;
                                    Tab18.SetRange(Tab18."No.", "Source No.");
                                    if Tab18.FindFirst then
                                        SourceName := Tab18.Name;
                                    CurrCode := Tab18."Currency Code";
                                end;
                        end
                        else
                            if "Document Type" = "document type"::Payment then begin
                                NAV_Acc_Code := "Source No.";
                                NAV_Acc_Type := Format("Source Type");
                                Doc_TYpe := Format("Document Type");
                            end
                    end;

                    Tab271.Reset;
                    Tab271.SetRange(Tab271."No.", "Source No.");
                    if Tab271.FindFirst then
                        SourceName := Tab271.Name;
                    CurrCode := Tab271."Currency Code";


                    Narration := '';
                    PN.Reset;
                    PN.SetRange(PN."Document No.", "Document No.");
                    PN.SetFilter(PN."Line No.", '<>%1', 0);
                    if PN.FindSet then begin
                        repeat
                            Narration := PN.Narration;
                        until PN.Next = 0;
                    end else begin
                        SIL.Reset;
                        SIL.SetRange(SIL."Document No.", "Document No.");
                        if SIL.FindSet then
                            repeat
                                Narration := Narration + SIL.Narration;
                            until SIL.Next = 0;
                    end;

                    //for ref.no from gL,Purchase & sales invoices
                    "Ref.No" := '';
                    Integrated_Doc_No := '';
                    SIH.Reset;
                    SIH.SetRange(SIH."No.", "Document No.");
                    if SIH.FindFirst then begin
                        "Ref.No" := SIH."External Document No.";
                        Integrated_Doc_No := SIH."Integration Doc No";
                    end else
                        PIH.Reset;
                    PIH.SetRange(PIH."No.", "Document No.");
                    if PIH.FindFirst then begin
                        "Ref.No" := PIH."Vendor Invoice No.";
                        Integrated_Doc_No := PIH."Integration Doc No";
                    end else begin
                        "Ref.No" := "External Document No.";
                    end;
                    //ref no end

                    //user/entered by+

                    "Entered by" := "User ID";

                    //user / entered by-

                    //clsoing closing balance+

                    //IF AccountNo<>"G/L Account"."No." THEN BEGIN
                    "Closing Balance" := 0;
                    GLE2.Reset;
                    GLE2.SetRange("Transaction No.", "Transaction No.");
                    GLE2.SetFilter("Entry No.", '<>%1', "Entry No.");
                    "Closing Balance" := "Opening Balance";
                    if GLE2.Find('-') then;

                    if Amount < 0 then
                        TransCrd := TransCrd - Amount
                    else
                        if Amount > 0 then
                            TransDeb := TransDeb + Amount;

                    "Closing Balance" := "Closing Balance" + TransDeb - TransCrd;
                    //END
                    /*ELSE
                   IF AccountNo="G/L Account"."No." THEN BEGIN
                     "Closing Balance":="Opening Balance";
                     GLE2.RESET;
                   GLE2.SETRANGE("Transaction No.","Transaction No.");
                   GLE2.SETFILTER("Entry No.",'<>%1',"Entry No.");
                   IF GLE2.FIND('-') THEN ;

                    IF Amount<0 THEN
                      TransCrd:=TransCrd-Amount
                    ELSE IF Amount>0 THEN
                      TransDeb:=TransDeb+Amount;

                   "Closing Balance":="Closing Balance"+ TransDeb-TransCrd;
                   END;*/
                    if OpeningDRBal - OpeningCRBal + TransDeb - TransCrd > 0 then
                        DrCrTextBalance := 'Dr';
                    if OpeningDRBal - OpeningCRBal + TransDeb - TransCrd < 0 then
                        DrCrTextBalance := 'Cr';

                end;
            }

            trigger OnAfterGetRecord()
            begin
                "Opening Balance" := 0;
                if AccountNo <> "G/L Account"."No." then begin
                    AccountNo := "G/L Account"."No.";

                    GLE1.Reset;
                    GLE1.SetCurrentkey("G/L Account No.", "Posting Date");
                    GLE1.SetRange("G/L Account No.", "No.");
                    GLE1.SetFilter("Posting Date", '%1..%2', 0D, NormalDate(GetRangeMin("Date Filter") - 1));

                    GLE1.CalcSums(Amount);

                    "Opening Balance" := GLE1.Amount;
                end else
                    //for same Accoutn no+ as while removing account no filter report is calculating worng closng balance
                    if AccountNo = "G/L Account"."No." then begin

                        GLE1.Reset;
                        GLE1.SetCurrentkey("G/L Account No.", "Posting Date");
                        GLE1.SetRange("G/L Account No.", "No.");
                        GLE1.SetFilter("Posting Date", '%1..%2', 0D, NormalDate(GetRangeMin("Date Filter") - 1));
                        GLE1.CalcSums(Amount);
                        "Opening Balance" := GLE1.Amount;
                    end;
                //for same Accoutn no-
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(TransCrd, TransDeb, "G/L Entry"."Credit Amount", "G/L Entry"."Debit Amount");
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
        StartDate := "G/L Account".GetRangeMin("G/L Account"."Date Filter");
        EndDate := "G/L Account".GetRangemax("G/L Account"."Date Filter");
    end;

    var
        NAV_Acc_Code: Text[50];
        NAV_Acc_Type: Text[30];
        "Ref.No": Text[100];
        Integrated_Doc_No: Text[150];
        Doc_TYpe: Text[50];
        "Opening Balance": Decimal;
        "Closing Balance": Decimal;
        Narration: Text[250];
        SIH: Record "Sales Invoice Header";
        SIL: Record "Sales Invoice Line";
        PIH: Record "Purch. Inv. Header";
        PIL: Record "Purch. Inv. Line";
        PN: Record "Posted Narration";
        user: Record User;
        "Entered by": Text[60];
        SourceName: Text[200];
        Tab23: Record Vendor;
        Tab18: Record Customer;
        Tab271: Record "Bank Account";
        "Print Detail": Boolean;
        AccountNo: Code[30];
        OpeningDRBal: Decimal;
        OpeningCRBal: Decimal;
        GLE1: Record "G/L Entry";
        DrCrTextBalance: Text[10];
        CurrCode: Code[10];
        GLE2: Record "G/L Entry";
        StartDate: Date;
        EndDate: Date;
        TransDeb: Decimal;
        TransCrd: Decimal;
        NOSLine: Record "No. Series Line";
        bal: Decimal;
        VendorNo: Code[30];
        CustomerNO: Code[30];
        BankNo: Code[30];
        CLE: Record "Cust. Ledger Entry";
        VLE: Record "Vendor Ledger Entry";
}

