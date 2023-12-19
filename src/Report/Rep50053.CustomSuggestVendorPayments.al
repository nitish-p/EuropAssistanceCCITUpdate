Report 50053 "Custom Suggest Vendor Payments"
{
    Caption = 'Suggest Vendor Payments';
    ProcessingOnly = true;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = sorting("No.") order(ascending) where(Blocked = filter(= " "));
            column(ReportForNavId_3182; 3182)
            {
            }

            trigger OnAfterGetRecord()
            begin
                // prdp 240421-added code to skip verification filter for other than ASP vendors ++

                if ((Vendor.Verification <> Vendor.Verification::Success) and (Vendor."Gen. Bus. Posting Group" <> 'DOM-DEALEN')) then begin
                    CurrReport.Skip;
                end;

                //prdp 240421-added code to skip verification filter for other than ASP vendors --

                Clear(VendorBalance);
                CalcFields("Balance (LCY)");
                VendorBalance := "Balance (LCY)";

                if StopPayments then
                    CurrReport.Break;
                Window.Update(1, "No.");
                //IF VendorBalance > 0 THEN BEGIN  //ccit-sg-25012022
                GetVendLedgEntries(true, false);
                GetVendLedgEntries(false, false);
                CheckAmounts(false);
                ClearNegative;
                //END; //ccit-sg-25012022
            end;

            trigger OnPostDataItem()
            begin
                if UsePriority and not StopPayments then begin
                    Reset;
                    CopyFilters(Vend2);
                    SetCurrentkey(Priority);
                    SetRange(Priority, 0);
                    if Find('-') then
                        repeat
                            Clear(VendorBalance);
                            CalcFields("Balance (LCY)");
                            VendorBalance := "Balance (LCY)";
                            if VendorBalance > 0 then begin
                                Window.Update(1, "No.");
                                GetVendLedgEntries(true, false);
                                GetVendLedgEntries(false, false);
                                CheckAmounts(false);
                                ClearNegative;
                            end;
                        until (Next = 0) or StopPayments;
                end;

                if UsePaymentDisc and not StopPayments then begin
                    Reset;
                    CopyFilters(Vend2);
                    Window2.Open(Text007);
                    if Find('-') then
                        repeat
                            Clear(VendorBalance);
                            CalcFields("Balance (LCY)");
                            VendorBalance := "Balance (LCY)";
                            Window2.Update(1, "No.");
                            PayableVendLedgEntry.SetRange("Vendor No.", "No.");
                            if VendorBalance > 0 then begin
                                GetVendLedgEntries(true, true);
                                GetVendLedgEntries(false, true);
                                CheckAmounts(true);
                                ClearNegative;
                            end;
                        until (Next = 0) or StopPayments;
                    Window2.Close;
                end else
                    if Find('-') then
                        repeat
                            ClearNegative;
                        until Next = 0;

                DimSetEntry.LockTable;
                GenJnlLine.LockTable;
                GenJnlTemplate.Get(GenJnlLine."Journal Template Name");
                GenJnlBatch.Get(GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name");
                GenJnlLine.SetRange("Journal Template Name", GenJnlLine."Journal Template Name");
                GenJnlLine.SetRange("Journal Batch Name", GenJnlLine."Journal Batch Name");
                if GenJnlLine.FindLast then begin
                    FirstLineNo := GenJnlLine."Line No.";
                    LastLineNo := GenJnlLine."Line No.";
                    GenJnlLine.Init;
                end;

                Window2.Open(Text008);

                PayableVendLedgEntry.Reset;
                PayableVendLedgEntry.SetRange(Priority, 1, 2147483647);
                MakeGenJnlLines;
                PayableVendLedgEntry.Reset;
                PayableVendLedgEntry.SetRange(Priority, 0);
                MakeGenJnlLines;
                PayableVendLedgEntry.Reset;
                PayableVendLedgEntry.DeleteAll;

                Window2.Close;
                Window.Close;
                ShowMessage(MessageText);
            end;

            trigger OnPreDataItem()
            begin

                // prdp 22022021++

                if ((VendPostGrp <> '') and (VendorNo <> '')) then begin
                    Error('You can either select "Vendor No" or "Vendor Posting Group" filter');
                end;

                if VendPostGrp <> '' then begin
                    Vendor.SetRange("Vendor Posting Group", VendPostGrp);
                end;

                if VendorNo <> '' then begin
                    Vendor.SetRange("No.", VendorNo);
                end;

                // prdp 22022021--

                //IF LastDueDateToPayReq = 0D THEN// prdp commented
                //  ERROR(Text000);  // prdp commented
                // prdp 290620 +++
                if ((StartDate = 0D) or (EndDate = 0D)) then
                    Error('Select start date & end date both');
                if ((BaseAmount = false) and (GSTAmount = false) and (TotalAmount = false)) then
                    Error('Select amount type to pay');

                /*
                IF BalAccType <> BalAccType::"Bank Account" THEN
                  ERROR('BalAccType mjust be Bank Account');
                IF BalAccNo = '' THEN
                  ERROR('BalAccNo must be selected');
                  */

                // prdp 290620 ---

                if (PostingDate = 0D) and (not UseDueDateAsPostingDate) then
                    Error(Text001);

                BankPmtType := GenJnlLine2."Bank Payment Type";
                BalAccType := GenJnlLine2."Bal. Account Type";
                BalAccNo := GenJnlLine2."Bal. Account No.";
                GenJnlLineInserted := false;
                SeveralCurrencies := false;
                MessageText := '';

                if ((BankPmtType = Bankpmttype::" ") or
                    SummarizePerVend) and
                   (NextDocNo = '')
                then
                    Error(Text002);

                if ((BankPmtType = Bankpmttype::"Manual Check") and
                    not SummarizePerVend and
                    not DocNoPerLine)
                then
                    Error(Text017, GenJnlLine2.FieldCaption("Bank Payment Type"), SelectStr(BankPmtType + 1, Text023));

                if UsePaymentDisc and (LastDueDateToPayReq < WorkDate) then
                    if not Confirm(Text003, false, WorkDate) then
                        Error(Text005);

                Vend2.CopyFilters(Vendor);

                OriginalAmtAvailable := AmountAvailable;
                if UsePriority then begin
                    SetCurrentkey(Priority);
                    SetRange(Priority, 1, 2147483647);
                    UsePriority := true;
                end;
                Window.Open(Text006);

                SelectedDim.SetRange("User ID", UserId);
                SelectedDim.SetRange("Object Type", 3);
                SelectedDim.SetRange("Object ID", Report::"Suggest Vendor Payments");
                SummarizePerDim := SelectedDim.Find('-') and SummarizePerVend;

                NextEntryNo := 1;

            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    group("Find Payments")
                    {
                        Caption = 'Find Payments';
                        field(StartDate; StartDate)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Start Date';

                            trigger OnValidate()
                            begin
                                if ((EndDate <> 0D) and (StartDate > EndDate)) then
                                    Error('Start date must before end date');
                            end;
                        }
                        field(EndDate; EndDate)
                        {
                            ApplicationArea = Basic;
                            Caption = 'End Date';

                            trigger OnValidate()
                            begin

                                if ((StartDate <> 0D) and (StartDate > EndDate)) then
                                    Error('End date must after Start date');
                            end;
                        }
                        field("Base Amount"; BaseAmount)
                        {
                            ApplicationArea = Basic;

                            trigger OnValidate()
                            begin
                                if ((BaseAmount = true) and ((GSTAmount = true) or (TotalAmount = true))) then
                                    Error('You can only select one amount type at a time for payment');
                            end;
                        }
                        field("GST Amount"; GSTAmount)
                        {
                            ApplicationArea = Basic;

                            trigger OnValidate()
                            begin
                                if ((GSTAmount = true) and ((BaseAmount = true) or (TotalAmount = true))) then
                                    Error('You can only select one amount type at a time for payment');
                            end;
                        }
                        field("Total Amount"; TotalAmount)
                        {
                            ApplicationArea = Basic;

                            trigger OnValidate()
                            begin
                                if ((TotalAmount = true) and ((GSTAmount = true) or (BaseAmount = true))) then
                                    Error('You can only select one amount type at a time for payment');
                            end;
                        }
                        field("Vendor Posting Group"; VendPostGrp)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Vendor Posting Group';
                            TableRelation = "Vendor Posting Group".Code;
                        }
                        field("Vendor No"; VendorNo)
                        {
                            ApplicationArea = Basic;
                            TableRelation = Vendor."No.";
                        }
                        field(LastPaymentDate; LastDueDateToPayReq)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Last Payment Date';
                            Visible = false;
                        }
                        field(FindPaymentDiscounts; UsePaymentDisc)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Find Payment Discounts';
                            MultiLine = true;
                            Visible = false;

                            trigger OnValidate()
                            begin
                                if UsePaymentDisc and UseDueDateAsPostingDate then
                                    Error(PmtDiscUnavailableErr);
                            end;
                        }
                        field(UseVendorPriority; UsePriority)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Use Vendor Priority';
                            Visible = false;

                            trigger OnValidate()
                            begin
                                if not UsePriority and (AmountAvailable <> 0) then
                                    Error(Text011);
                            end;
                        }
                        field("Available Amount (LCY)"; AmountAvailable)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Available Amount (LCY)';
                            Visible = false;

                            trigger OnValidate()
                            begin
                                if AmountAvailable <> 0 then
                                    UsePriority := true;
                            end;
                        }
                        field(SkipExportedPayments; SkipExportedPayments)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Skip Exported Payments';
                            Visible = false;
                        }
                    }
                    group("Summarize Results")
                    {
                        Caption = 'Summarize Results';
                        field(SummarizePerVendor; SummarizePerVend)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Summarize per Vendor';

                            trigger OnValidate()
                            begin
                                if SummarizePerVend and UseDueDateAsPostingDate then
                                    Error(PmtDiscUnavailableErr);
                            end;
                        }
                        field(SummarizePerDimText; SummarizePerDimText)
                        {
                            ApplicationArea = Basic;
                            Caption = 'By Dimension';
                            Editable = false;
                            Enabled = SummarizePerDimTextEnable;

                            trigger OnAssistEdit()
                            var
                                DimSelectionBuf: Record "Dimension Selection Buffer";
                            begin
                                DimSelectionBuf.SetDimSelectionMultiple(3, Report::"Suggest Vendor Payments", SummarizePerDimText);
                            end;
                        }
                    }
                    group("Fill in Journal Lines")
                    {
                        Caption = 'Fill in Journal Lines';
                        field(PostingDate; PostingDate)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Posting Date';
                            Editable = UseDueDateAsPostingDate = false;

                            trigger OnValidate()
                            begin
                                ValidatePostingDate;
                            end;
                        }
                        field(UseDueDateAsPostingDate; UseDueDateAsPostingDate)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Calculate Posting Date from Applies-to-Doc. Due Date';

                            trigger OnValidate()
                            begin
                                if UseDueDateAsPostingDate and (SummarizePerVend or UsePaymentDisc) then
                                    Error(PmtDiscUnavailableErr);
                                if not UseDueDateAsPostingDate then
                                    Clear(DueDateOffset);
                            end;
                        }
                        field(DueDateOffset; DueDateOffset)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Applies-to-Doc. Due Date Offset';
                            Editable = UseDueDateAsPostingDate;
                            Enabled = UseDueDateAsPostingDate;
                        }
                        field(StartingDocumentNo; NextDocNo)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Starting Document No.';
                            Editable = false;

                            trigger OnValidate()
                            var
                            //TextManagement: Codeunit text;
                            begin
                                if NextDocNo <> '' then
                                    EvaluateIncStr(NextDocNo, StartingDocumentNoErr);
                            end;
                        }
                        field(DocNoPerLine; DocNoPerLine)
                        {
                            ApplicationArea = Basic;
                            Caption = 'New Doc. No. per Line';
                            Editable = false;

                            trigger OnValidate()
                            begin
                                if not UsePriority and (AmountAvailable <> 0) then
                                    Error(Text013);
                            end;
                        }
                        field(BalAccountType; GenJnlLine2."Bal. Account Type")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Bal. Account Type';
                            OptionCaption = 'G/L Account,,,Bank Account';

                            trigger OnValidate()
                            begin
                                GenJnlLine2."Bal. Account No." := '';
                            end;
                        }
                        field(BalAccountNo; GenJnlLine2."Bal. Account No.")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Bal. Account No.';

                            trigger OnLookup(var Text: Text): Boolean
                            begin
                                case GenJnlLine2."Bal. Account Type" of
                                    GenJnlLine2."bal. account type"::"G/L Account":
                                        if Page.RunModal(0, GLAcc) = Action::LookupOK then
                                            GenJnlLine2."Bal. Account No." := GLAcc."No.";
                                    GenJnlLine2."bal. account type"::Customer, GenJnlLine2."bal. account type"::Vendor:
                                        Error(Text009, GenJnlLine2.FieldCaption("Bal. Account Type"));
                                    GenJnlLine2."bal. account type"::"Bank Account":
                                        if Page.RunModal(0, BankAcc) = Action::LookupOK then
                                            GenJnlLine2."Bal. Account No." := BankAcc."No.";
                                end;
                            end;

                            trigger OnValidate()
                            begin
                                if GenJnlLine2."Bal. Account No." <> '' then
                                    case GenJnlLine2."Bal. Account Type" of
                                        GenJnlLine2."bal. account type"::"G/L Account":
                                            GLAcc.Get(GenJnlLine2."Bal. Account No.");
                                        GenJnlLine2."bal. account type"::Customer, GenJnlLine2."bal. account type"::Vendor:
                                            Error(Text009, GenJnlLine2.FieldCaption("Bal. Account Type"));
                                        GenJnlLine2."bal. account type"::"Bank Account":
                                            BankAcc.Get(GenJnlLine2."Bal. Account No.");
                                    end;
                            end;
                        }
                        field(BankPaymentType; GenJnlLine2."Bank Payment Type")
                        {
                            ApplicationArea = Basic;
                            Caption = 'Bank Payment Type';
                            OptionCaption = ' ,Computer Check,Manual Check';

                            trigger OnValidate()
                            begin
                                if (GenJnlLine2."Bal. Account Type" <> GenJnlLine2."bal. account type"::"Bank Account") and
                                   (GenJnlLine2."Bank Payment Type" > 0)
                                then
                                    Error(
                                      Text010,
                                      GenJnlLine2.FieldCaption("Bank Payment Type"),
                                      GenJnlLine2.FieldCaption("Bal. Account Type"));
                            end;
                        }
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            SummarizePerDimTextEnable := true;
            SkipExportedPayments := true;
        end;

        trigger OnOpenPage()
        begin
            if PostingDate = 0D then
                PostingDate := WorkDate;
            ValidatePostingDate;

            // prdp 290620 +++
            StartDate := 0D;
            EndDate := 0D;
            BaseAmount := false;
            GSTAmount := false;
            TotalAmount := false;
            DocNoPerLine := true;
            PostingDate := Today;
            // prdp 290620 ---
            // prdp 22022021++
            VendPostGrp := '';
            VendorNo := '';
            // prdp 22022021--
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        Commit;
        if not VendorLedgEntryTemp.IsEmpty then
            if Confirm(Text024) then
                Page.RunModal(0, VendorLedgEntryTemp);
    end;

    trigger OnPreReport()
    begin
        CompanyInformation.Get;
        VendorLedgEntryTemp.DeleteAll;
        ShowPostingDateWarning := false;
    end;

    var
        Text000: label 'In the Last Payment Date field, specify the last possible date that payments must be made.';
        Text001: label 'In the Posting Date field, specify the date that will be used as the posting date for the journal entries.';
        Text002: label 'In the Starting Document No. field, specify the first document number to be used.';
        Text003: label 'The payment date is earlier than %1.\\Do you still want to run the batch job?', Comment = '%1 is a date';
        Text005: label 'The batch job was interrupted.';
        Text006: label 'Processing vendors     #1##########';
        Text007: label 'Processing vendors for payment discounts #1##########';
        Text008: label 'Inserting payment journal lines #1##########';
        Text009: label '%1 must be G/L Account or Bank Account.';
        Text010: label '%1 must be filled only when %2 is Bank Account.';
        Text011: label 'Use Vendor Priority must be activated when the value in the Amount Available field is not 0.';
        Text013: label 'Use Vendor Priority must be activated when the value in the Amount Available Amount (LCY) field is not 0.';
        Text014: label 'Payment to vendor %1';
        Text015: label 'Payment of %1 %2';
        Text016: label ' is already applied to %1 %2 for vendor %3.';
        Text017: label 'If %1 = %2 and you have not selected the Summarize per Vendor field,\ then you must select the New Doc. No. per Line.', Comment = 'If Bank Payment Type = Computer Check and you have not selected the Summarize per Vendor field,\ then you must select the New Doc. No. per Line.';
        Text020: label 'You have only created suggested vendor payment lines for the %1 %2.\ However, there are other open vendor ledger entries in currencies other than %2.\\', Comment = 'You have only created suggested vendor payment lines for the Currency Code EUR.\ However, there are other open vendor ledger entries in currencies other than EUR.';
        Text021: label 'You have only created suggested vendor payment lines for the %1 %2.\ There are no other open vendor ledger entries in other currencies.\\', Comment = 'You have only created suggested vendor payment lines for the Currency Code EUR\ There are no other open vendor ledger entries in other currencies.\\';
        Text022: label 'You have created suggested vendor payment lines for all currencies.\\';
        Vend2: Record Vendor;
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlLine: Record "Gen. Journal Line";
        DimSetEntry: Record "Dimension Set Entry";
        GenJnlLine2: Record "Gen. Journal Line";
        VendLedgEntry: Record "Vendor Ledger Entry";
        GLAcc: Record "G/L Account";
        BankAcc: Record "Bank Account";
        PayableVendLedgEntry: Record "Payable Vendor Ledger Entry" temporary;
        CompanyInformation: Record "Company Information";
        TempPaymentBuffer: Record "Payment Buffer" temporary;
        OldTempPaymentBuffer: Record "Payment Buffer" temporary;
        SelectedDim: Record "Selected Dimension";
        VendorLedgEntryTemp: Record "Vendor Ledger Entry" temporary;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        VendEntryEdit: Codeunit "Vend. Entry-Edit";
        DimMgt: Codeunit DimensionManagement;
        DimBufMgt: Codeunit "Dimension Buffer Management";
        Window: Dialog;
        Window2: Dialog;
        UsePaymentDisc: Boolean;
        PostingDate: Date;
        LastDueDateToPayReq: Date;
        NextDocNo: Code[20];
        AmountAvailable: Decimal;
        OriginalAmtAvailable: Decimal;
        UsePriority: Boolean;
        SummarizePerVend: Boolean;
        SummarizePerDim: Boolean;
        SummarizePerDimText: Text[250];
        FirstLineNo: Integer;
        LastLineNo: Integer;
        NextEntryNo: Integer;
        DueDateOffset: DateFormula;
        UseDueDateAsPostingDate: Boolean;
        StopPayments: Boolean;
        DocNoPerLine: Boolean;
        BankPmtType: Option " ","Computer Check","Manual Check";
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account";
        BalAccNo: Code[20];
        MessageText: Text;
        GenJnlLineInserted: Boolean;
        SeveralCurrencies: Boolean;
        Text023: label ' ,Computer Check,Manual Check';
        Text024: label 'There are one or more entries for which no payment suggestions have been made because the posting dates of the entries are later than the requested posting date. Do you want to see the entries?';
        [InDataSet]
        SummarizePerDimTextEnable: Boolean;
        Text025: label 'The %1 with the number %2 has a %3 with the number %4.';
        ShowPostingDateWarning: Boolean;
        VendorBalance: Decimal;
        ReplacePostingDateMsg: label 'For one or more entries, the requested posting date is before the work date.\\These posting dates will use the work date.';
        PmtDiscUnavailableErr: label 'You cannot use Find Payment Discounts or Summarize per Vendor together with Calculate Posting Date from Applies-to-Doc. Due Date, because the resulting posting date might not match the payment discount date.';
        SkipExportedPayments: Boolean;
        MessageToRecipientMsg: label 'Payment of %1 %2 ', Comment = '%1 document type, %2 Document No.';
        StartingDocumentNoErr: label 'Starting Document No.';
        StartDate: Date;
        EndDate: Date;
        PostPurchInv: Code[30];
        VendNo: Code[20];
        BaseAmount: Boolean;
        GSTAmount: Boolean;
        TotalAmount: Boolean;
        VendorBankAccount: Record "Vendor Bank Account";
        IFSC: Code[20];
        VLE: Record "Vendor Ledger Entry";
        CrMemoBaseAmt: Decimal;
        CrMemoGSTAmt: Decimal;
        GSTPaid: Boolean;
        VLE1: Record "Vendor Ledger Entry";
        VendPostGrp: Text;
        VendorNo: Code[20];


    procedure SetGenJnlLine(NewGenJnlLine: Record "Gen. Journal Line")
    begin
        GenJnlLine := NewGenJnlLine;
    end;

    local procedure ValidatePostingDate()
    begin
        // GenJnlBatch.Get(GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name");
        // if GenJnlBatch."No. Series" = '' then
        //     NextDocNo := ''
        // else begin
        //     NextDocNo := NoSeriesMgt.GetNextNo(GenJnlBatch."No. Series", PostingDate, false);
        //     Clear(NoSeriesMgt);
        // end;
    end;


    procedure InitializeRequest(LastPmtDate: Date; FindPmtDisc: Boolean; NewAvailableAmount: Decimal; NewSkipExportedPayments: Boolean; NewPostingDate: Date; NewStartDocNo: Code[20]; NewSummarizePerVend: Boolean; BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account"; BalAccNo: Code[20]; BankPmtType: Option " ","Computer Check","Manual Check")
    begin
        LastDueDateToPayReq := LastPmtDate;
        UsePaymentDisc := FindPmtDisc;
        AmountAvailable := NewAvailableAmount;
        SkipExportedPayments := NewSkipExportedPayments;
        PostingDate := NewPostingDate;
        NextDocNo := NewStartDocNo;
        SummarizePerVend := NewSummarizePerVend;
        GenJnlLine2."Bal. Account Type" := BalAccType;
        GenJnlLine2."Bal. Account No." := BalAccNo;
        GenJnlLine2."Bank Payment Type" := BankPmtType;
    end;

    local procedure GetVendLedgEntries(Positive: Boolean; Future: Boolean)
    begin
        VendLedgEntry.Reset;
        VendLedgEntry.SetCurrentkey("Vendor No.", Open, Positive, "Due Date");
        VendLedgEntry.SetRange("Vendor No.", Vendor."No.");
        VendLedgEntry.SetRange(Open, true);
        VendLedgEntry.SetRange(Positive, Positive);
        VendLedgEntry.SetRange("Applies-to ID", '');
        VendLedgEntry.SetRange(VendLedgEntry."Document Type", VendLedgEntry."document type"::Invoice);
        VendLedgEntry.SetRange("Source Code", 'PURCHASES');  // prdp 290620
        if Future then begin
            // VendLedgEntry.SETRANGE("Due Date",LastDueDateToPayReq + 1,99993112D); // prdp commenetd
            VendLedgEntry.SetRange("Due Date", StartDate, EndDate);
            VendLedgEntry.SetRange("Pmt. Discount Date", PostingDate, EndDate);
            VendLedgEntry.SetFilter("Remaining Pmt. Disc. Possible", '<>0');
        end else
            //VendLedgEntry.SETRANGE("Due Date",0D,LastDueDateToPayReq);  // prdp commenetd
            VendLedgEntry.SetRange("Due Date", StartDate, EndDate);
        if SkipExportedPayments then
            VendLedgEntry.SetRange("Exported to Payment File", false);
        VendLedgEntry.SetRange("On Hold", '');
        //prdp060820++
        if GSTAmount = true then begin
            VendLedgEntry.SetRange("GST Paid", false);
        end;
        /*
          IF BaseAmount = TRUE THEN BEGIN
          VendLedgEntry.SETRANGE("Base Paid",FALSE);
        END;
        */
        //prdp060820--
        VendLedgEntry.SetFilter("Currency Code", Vendor.GetFilter("Currency Filter"));
        VendLedgEntry.SetFilter("Global Dimension 1 Code", Vendor.GetFilter("Global Dimension 1 Filter"));
        VendLedgEntry.SetFilter("Global Dimension 2 Code", Vendor.GetFilter("Global Dimension 2 Filter"));

        if VendLedgEntry.Find('-') then
            repeat
                SaveAmount;
                if VendLedgEntry."Accepted Pmt. Disc. Tolerance" or
                   (VendLedgEntry."Accepted Payment Tolerance" <> 0)
                then begin
                    VendLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
                    VendLedgEntry."Accepted Payment Tolerance" := 0;
                    VendEntryEdit.Run(VendLedgEntry);
                end;
            until VendLedgEntry.Next = 0;

    end;

    local procedure SaveAmount()
    var
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
    begin
        with GenJnlLine do begin

            Init;
            SetPostingDate(GenJnlLine, VendLedgEntry."Due Date", PostingDate);
            "Document Type" := "document type"::Payment;
            "Account Type" := "account type"::Vendor;
            Vend2.Get(VendLedgEntry."Vendor No.");
            Vend2.CheckBlockedVendOnJnls(Vend2, "Document Type", false);
            Description := Vend2.Name;
            "Posting Group" := Vend2."Vendor Posting Group";
            "Salespers./Purch. Code" := Vend2."Purchaser Code";
            "Payment Terms Code" := Vend2."Payment Terms Code";
            Validate("Bill-to/Pay-to No.", "Account No.");
            Validate("Sell-to/Buy-from No.", "Account No.");
            "Gen. Posting Type" := 0;
            "Gen. Bus. Posting Group" := '';
            "Gen. Prod. Posting Group" := '';
            "VAT Bus. Posting Group" := '';
            "VAT Prod. Posting Group" := '';
            Validate("Currency Code", VendLedgEntry."Currency Code");
            Validate("Payment Terms Code");
            VendLedgEntry.CalcFields("Remaining Amount");


            // prdp 030820+++
            CrMemoBaseAmt := 0;
            CrMemoGSTAmt := 0;

            VLE.Reset;
            VLE.SetRange(VLE."Document Type", VLE."document type"::"Credit Memo");
            VLE.SetRange("Closed by Entry No.", VendLedgEntry."Entry No.");
            if VLE.FindSet then
                repeat
                    CrMemoBaseAmt := CrMemoBaseAmt + Abs(VLE."Purchase (LCY)");
                    CrMemoGSTAmt := CrMemoGSTAmt + Abs(VLE."GST Amount");
                until VLE.Next = 0;
            // prdp 03083030--

            // for total amount - prdp 29062020
            if TotalAmount = true then begin

                if PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(GenJnlLine, VendLedgEntry, 0, false) then
                    Amount := -(VendLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible")
                else
                    Amount := -VendLedgEntry."Remaining Amount";
                Validate(Amount);
            end;
            // for total amount - prdp 29062020

            // for base amount - prdp 29062020
            if BaseAmount = true then begin

                VendLedgEntry.CalcFields(Amount);
                if PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(GenJnlLine, VendLedgEntry, 0, false) then begin
                    if (-(VendLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible" - (VendLedgEntry."GST Amount" + Abs(CrMemoGSTAmt)))) <= 0 then begin
                        Amount := -(VendLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible")
                    end else begin
                        Amount := -(VendLedgEntry."Remaining Amount" - VendLedgEntry."Remaining Pmt. Disc. Possible" - (VendLedgEntry."GST Amount" + Abs(CrMemoGSTAmt)));
                    end;
                end else begin
                    if -(VendLedgEntry."Remaining Amount" - (VendLedgEntry."GST Amount" + Abs(CrMemoGSTAmt))) <= 0 then begin
                        Amount := -VendLedgEntry."Remaining Amount";
                    end else begin
                        Amount := -(VendLedgEntry."Remaining Amount" - (VendLedgEntry."GST Amount" + Abs(CrMemoGSTAmt)));
                    end;
                    Validate(Amount);
                end;
            end;
            // for base amount - prdp 29062020
            // for gst amount - prdp 29062020

            if GSTAmount = true then begin


                if (Abs(VendLedgEntry."GST Amount") = 0) then begin
                    CurrReport.Skip;
                end else begin

                    if Abs(VendLedgEntry."Remaining Amount") >= (Abs(VendLedgEntry."GST Amount") - Abs(CrMemoGSTAmt)) then begin

                        if PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(GenJnlLine, VendLedgEntry, 0, false) then begin
                            Amount := -(VendLedgEntry."GST Amount" + Abs(CrMemoGSTAmt));
                            Validate(Amount);
                        end else begin
                            Amount := -(VendLedgEntry."GST Amount" + Abs(CrMemoGSTAmt));
                            Validate(Amount);
                        end;
                    end else begin

                        if (Abs(VendLedgEntry."GST Amount") - Abs(CrMemoGSTAmt)) - Abs(VendLedgEntry."Remaining Amount") < 1 then begin

                            if PaymentToleranceMgt.CheckCalcPmtDiscGenJnlVend(GenJnlLine, VendLedgEntry, 0, false) then begin
                                Amount := -(VendLedgEntry."Remaining Amount");
                                Validate(Amount);
                            end else begin
                                Amount := -(VendLedgEntry."Remaining Amount");
                                Validate(Amount);
                            end
                        end else begin
                            CurrReport.Skip;
                        end;
                    end;
                end;
            end;
            // for gst amount - prdp 29062020
        end;


        if UsePriority then
            PayableVendLedgEntry.Priority := Vendor.Priority
        else
            PayableVendLedgEntry.Priority := 0;
        PayableVendLedgEntry."Vendor No." := VendLedgEntry."Vendor No.";
        PayableVendLedgEntry."Entry No." := NextEntryNo;
        PayableVendLedgEntry."Vendor Ledg. Entry No." := VendLedgEntry."Entry No.";
        PayableVendLedgEntry.Amount := GenJnlLine.Amount;
        PayableVendLedgEntry."Amount (LCY)" := GenJnlLine."Amount (LCY)";
        PayableVendLedgEntry.Positive := (PayableVendLedgEntry.Amount > 0);
        PayableVendLedgEntry.Future := (VendLedgEntry."Due Date" > LastDueDateToPayReq);
        PayableVendLedgEntry."Currency Code" := VendLedgEntry."Currency Code";
        PayableVendLedgEntry.Insert;
        NextEntryNo := NextEntryNo + 1;
    end;

    local procedure CheckAmounts(Future: Boolean)
    var
        CurrencyBalance: Decimal;
        PrevCurrency: Code[10];
    begin
        PayableVendLedgEntry.SetRange("Vendor No.", Vendor."No.");
        PayableVendLedgEntry.SetRange(Future, Future);

        if PayableVendLedgEntry.Find('-') then begin
            repeat
                if PayableVendLedgEntry."Currency Code" <> PrevCurrency then begin
                    if CurrencyBalance > 0 then
                        AmountAvailable := AmountAvailable - CurrencyBalance;
                    CurrencyBalance := 0;
                    PrevCurrency := PayableVendLedgEntry."Currency Code";
                end;
                if (OriginalAmtAvailable = 0) or
                   (AmountAvailable >= CurrencyBalance + PayableVendLedgEntry."Amount (LCY)")
                then
                    CurrencyBalance := CurrencyBalance + PayableVendLedgEntry."Amount (LCY)"
                else
                    PayableVendLedgEntry.Delete;
            until PayableVendLedgEntry.Next = 0;
            if OriginalAmtAvailable > 0 then
                AmountAvailable := AmountAvailable - CurrencyBalance;
            if (OriginalAmtAvailable > 0) and (AmountAvailable <= 0) then
                StopPayments := true;
        end;
        PayableVendLedgEntry.Reset;
    end;

    local procedure MakeGenJnlLines()
    var
        GenJnlLine1: Record "Gen. Journal Line";
        DimBuf: Record "Dimension Buffer";
        Vendor: Record Vendor;
        RemainingAmtAvailable: Decimal;
    begin
        TempPaymentBuffer.Reset;
        TempPaymentBuffer.DeleteAll;

        if BalAccType = Balacctype::"Bank Account" then begin
            CheckCurrencies(BalAccType, BalAccNo, PayableVendLedgEntry);
            SetBankAccCurrencyFilter(BalAccType, BalAccNo, PayableVendLedgEntry);
        end;

        if OriginalAmtAvailable <> 0 then begin
            RemainingAmtAvailable := OriginalAmtAvailable;
            RemovePaymentsAboveLimit(PayableVendLedgEntry, RemainingAmtAvailable);
        end;
        if PayableVendLedgEntry.Find('-') then
            repeat
                PayableVendLedgEntry.SetRange("Vendor No.", PayableVendLedgEntry."Vendor No.");
                PayableVendLedgEntry.Find('-');
                repeat
                    VendLedgEntry.Get(PayableVendLedgEntry."Vendor Ledg. Entry No.");

                    SetPostingDate(GenJnlLine1, VendLedgEntry."Due Date", PostingDate);
                    if VendLedgEntry."Posting Date" <= GenJnlLine1."Posting Date" then begin
                        TempPaymentBuffer."Vendor No." := VendLedgEntry."Vendor No.";
                        TempPaymentBuffer."Currency Code" := VendLedgEntry."Currency Code";
                        TempPaymentBuffer."Payment Method Code" := VendLedgEntry."Payment Method Code";
                        TempPaymentBuffer."Creditor No." := VendLedgEntry."Creditor No.";
                        TempPaymentBuffer."Payment Reference" := VendLedgEntry."Payment Reference";
                        TempPaymentBuffer."Exported to Payment File" := VendLedgEntry."Exported to Payment File";
                        TempPaymentBuffer."Applies-to Ext. Doc. No." := VendLedgEntry."External Document No.";

                        SetTempPaymentBufferDims(DimBuf);

                        VendLedgEntry.CalcFields("Remaining Amount");

                        if SummarizePerVend then begin
                            TempPaymentBuffer."Vendor Ledg. Entry No." := 0;
                            if TempPaymentBuffer.Find then begin
                                TempPaymentBuffer.Amount := TempPaymentBuffer.Amount + PayableVendLedgEntry.Amount;
                                TempPaymentBuffer.Modify;
                            end else begin
                                TempPaymentBuffer."Document No." := NextDocNo;
                                NextDocNo := IncStr(NextDocNo);
                                TempPaymentBuffer.Amount := PayableVendLedgEntry.Amount;
                                Window2.Update(1, VendLedgEntry."Vendor No.");
                                TempPaymentBuffer.Insert;
                            end;
                            VendLedgEntry."Applies-to ID" := TempPaymentBuffer."Document No.";
                        end else begin
                            CheckIfEntryAlreadyApplied(GenJnlLine, VendLedgEntry);

                            TempPaymentBuffer."Vendor Ledg. Entry Doc. Type" := VendLedgEntry."Document Type";
                            TempPaymentBuffer."Vendor Ledg. Entry Doc. No." := VendLedgEntry."Document No.";
                            TempPaymentBuffer."Global Dimension 1 Code" := VendLedgEntry."Global Dimension 1 Code";
                            TempPaymentBuffer."Global Dimension 2 Code" := VendLedgEntry."Global Dimension 2 Code";
                            TempPaymentBuffer."Dimension Set ID" := VendLedgEntry."Dimension Set ID";
                            TempPaymentBuffer."Vendor Ledg. Entry No." := VendLedgEntry."Entry No.";
                            TempPaymentBuffer.Amount := PayableVendLedgEntry.Amount;
                            Window2.Update(1, VendLedgEntry."Vendor No.");
                            TempPaymentBuffer.Insert;
                        end;

                        VendLedgEntry."Amount to Apply" := VendLedgEntry."Remaining Amount";
                        VendEntryEdit.Run(VendLedgEntry);
                    end else begin
                        VendorLedgEntryTemp := VendLedgEntry;
                        VendorLedgEntryTemp.Insert;
                    end;

                    PayableVendLedgEntry.Delete;
                    if OriginalAmtAvailable <> 0 then begin
                        RemainingAmtAvailable := RemainingAmtAvailable - PayableVendLedgEntry."Amount (LCY)";
                        RemovePaymentsAboveLimit(PayableVendLedgEntry, RemainingAmtAvailable);
                    end;
                until not PayableVendLedgEntry.FindSet;
                PayableVendLedgEntry.DeleteAll;
                PayableVendLedgEntry.SetRange("Vendor No.");
            until not PayableVendLedgEntry.Find('-');

        Clear(OldTempPaymentBuffer);
        TempPaymentBuffer.SetCurrentkey("Document No.");
        TempPaymentBuffer.SetFilter(
          "Vendor Ledg. Entry Doc. Type", '<>%1&<>%2', TempPaymentBuffer."vendor ledg. entry doc. type"::Refund,
          TempPaymentBuffer."vendor ledg. entry doc. type"::Payment);
        if TempPaymentBuffer.Find('-') then
            repeat
                with GenJnlLine do begin
                    Init;
                    Window2.Update(1, TempPaymentBuffer."Vendor No.");
                    LastLineNo := LastLineNo + 10000;
                    "Line No." := LastLineNo;
                    "Document Type" := "document type"::Payment;
                    "Posting No. Series" := GenJnlBatch."Posting No. Series";
                    if SummarizePerVend then
                        "Document No." := TempPaymentBuffer."Document No."
                    else
                        if DocNoPerLine then begin
                            if TempPaymentBuffer.Amount < 0 then
                                "Document Type" := "document type"::Refund;

                            "Document No." := NextDocNo;
                            NextDocNo := IncStr(NextDocNo);
                        end else
                            if (TempPaymentBuffer."Vendor No." = OldTempPaymentBuffer."Vendor No.") and
                               (TempPaymentBuffer."Currency Code" = OldTempPaymentBuffer."Currency Code")
                            then
                                "Document No." := OldTempPaymentBuffer."Document No."
                            else begin
                                "Document No." := NextDocNo;
                                NextDocNo := IncStr(NextDocNo);
                                OldTempPaymentBuffer := TempPaymentBuffer;
                                OldTempPaymentBuffer."Document No." := "Document No.";
                            end;
                    "Account Type" := "account type"::Vendor;
                    SetHideValidation(true);
                    ShowPostingDateWarning := ShowPostingDateWarning or
                      SetPostingDate(GenJnlLine, GetApplDueDate(TempPaymentBuffer."Vendor Ledg. Entry No."), PostingDate);
                    Validate("Account No.", TempPaymentBuffer."Vendor No.");
                    Vendor.Get(TempPaymentBuffer."Vendor No.");
                    if (Vendor."Pay-to Vendor No." <> '') and (Vendor."Pay-to Vendor No." <> "Account No.") then
                        Message(Text025, Vendor.TableCaption, Vendor."No.", Vendor.FieldCaption("Pay-to Vendor No."),
                          Vendor."Pay-to Vendor No.");
                    "Bal. Account Type" := BalAccType;
                    Validate("Bal. Account No.", BalAccNo);
                    Validate("Currency Code", TempPaymentBuffer."Currency Code");
                    "Message to Recipient" := GetMessageToRecipient(SummarizePerVend);
                    "Bank Payment Type" := BankPmtType;
                    if SummarizePerVend then begin
                        "Applies-to ID" := "Document No.";
                        Description := StrSubstNo(Text014, TempPaymentBuffer."Vendor No.");
                    end else
                        Description :=
                          StrSubstNo(
                            Text015,
                            TempPaymentBuffer."Vendor Ledg. Entry Doc. Type",
                            TempPaymentBuffer."Vendor Ledg. Entry Doc. No.");
                    "Source Line No." := TempPaymentBuffer."Vendor Ledg. Entry No.";
                    "Shortcut Dimension 1 Code" := TempPaymentBuffer."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := TempPaymentBuffer."Global Dimension 2 Code";
                    "Dimension Set ID" := TempPaymentBuffer."Dimension Set ID";
                    "Source Code" := GenJnlTemplate."Source Code";
                    "Reason Code" := GenJnlBatch."Reason Code";
                    Validate(Amount, TempPaymentBuffer.Amount);
                    "Applies-to Doc. Type" := TempPaymentBuffer."Vendor Ledg. Entry Doc. Type";
                    "Applies-to Doc. No." := TempPaymentBuffer."Vendor Ledg. Entry Doc. No.";
                    "Payment Method Code" := TempPaymentBuffer."Payment Method Code";
                    "Creditor No." := TempPaymentBuffer."Creditor No.";
                    "Payment Reference" := TempPaymentBuffer."Payment Reference";
                    "Exported to Payment File" := TempPaymentBuffer."Exported to Payment File";
                    "Applies-to Ext. Doc. No." := TempPaymentBuffer."Applies-to Ext. Doc. No.";

                    // prdp 16072020 +++
                    "Reference Invoice Number" := TempPaymentBuffer."Vendor Ledg. Entry Doc. No.";
                    VLE.Reset;
                    VLE.SetRange(VLE."Document Type", VLE."document type"::Invoice);
                    VLE.SetRange("Document No.", TempPaymentBuffer."Vendor Ledg. Entry Doc. No.");
                    if VLE.FindFirst then begin
                        "Integrated Invoice Type" := VLE."Integrated Invoice Type";
                        Narration := VLE.Narration; // prdp 281020
                    end;
                    //IF BalAccNo = 'BANK0001' THEN BEGIN  comment ccit EA-vijay
                    if (BalAccNo = 'BANK0001') or (BalAccNo = 'BANK0002') then begin  //CCIT-28092022
                        IFSC := '';
                        "Suggested Payment" := true;
                        VendorBankAccount.Reset;
                        VendorBankAccount.SetCurrentkey("Vendor No.", Code);
                        VendorBankAccount.Ascending(true);
                        VendorBankAccount.SetRange("Vendor No.", TempPaymentBuffer."Vendor No.");
                        VendorBankAccount.SetRange("Default Account", true);
                        if VendorBankAccount.FindLast then begin
                            "Beneficiary Name" := VendorBankAccount.Name;
                            "Beneficiary Acc. No." := VendorBankAccount."Bank Account No.";
                            "Beneficiary IFSC Code" := VendorBankAccount."SWIFT Code";
                            IFSC := VendorBankAccount."SWIFT Code";
                        end;

                        if CopyStr(IFSC, 1, 4) = 'ICIC' then begin
                            "Payment Mode" := 'I';
                        end else begin
                            if Abs(Amount) > 100000 then begin
                                "Payment Mode" := 'N';
                            end;
                            if Abs(Amount) <= 100000 then begin
                                "Payment Mode" := 'N';
                            end;
                        end;

                    end;

                    if GSTAmount = true then begin
                        "GST Payment" := true;
                    end;

                    if BaseAmount = true then begin
                        "Base Payment" := true;
                    end;

                    if TotalAmount = true then begin
                        "Total Payment" := true;
                    end;
                    // prdp 16072020 ---
                    UpdateDimensions(GenJnlLine);
                    Insert;
                    GenJnlLineInserted := true;
                end;
            until TempPaymentBuffer.Next = 0;
    end;

    local procedure UpdateDimensions(var GenJnlLine: Record "Gen. Journal Line")
    var
        DimBuf: Record "Dimension Buffer";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        TempDimSetEntry2: Record "Dimension Set Entry" temporary;
        DimVal: Record "Dimension Value";
        NewDimensionID: Integer;
        DimSetIDArr: array[10] of Integer;
        DefaultDimSource: List of [Dictionary of [Integer, Code[20]]];
    begin
        with GenJnlLine do begin
            NewDimensionID := "Dimension Set ID";
            if SummarizePerVend then begin
                DimBuf.Reset;
                DimBuf.DeleteAll;
                DimBufMgt.GetDimensions(TempPaymentBuffer."Dimension Entry No.", DimBuf);
                if DimBuf.FindSet then
                    repeat
                        DimVal.Get(DimBuf."Dimension Code", DimBuf."Dimension Value Code");
                        TempDimSetEntry."Dimension Code" := DimBuf."Dimension Code";
                        TempDimSetEntry."Dimension Value Code" := DimBuf."Dimension Value Code";
                        TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
                        TempDimSetEntry.Insert;
                    until DimBuf.Next = 0;
                NewDimensionID := DimMgt.GetDimensionSetID(TempDimSetEntry);
                "Dimension Set ID" := NewDimensionID;
            end;
            CreateDimFromDefaultDim(FieldNo("Account No."));
            // CreateDim(
            //   DimMgt.TypeToTableID1("Account Type"), "Account No.",
            //   DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
            //   Database::Job, "Job No.",
            //   Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
            //   Database::Campaign, "Campaign No.");

            if NewDimensionID <> "Dimension Set ID" then begin
                DimSetIDArr[1] := "Dimension Set ID";
                DimSetIDArr[2] := NewDimensionID;
                "Dimension Set ID" :=
                  DimMgt.GetCombinedDimensionSetID(DimSetIDArr, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;

            if SummarizePerVend then begin
                DimMgt.GetDimensionSet(TempDimSetEntry, "Dimension Set ID");
                if AdjustAgainstSelectedDim(TempDimSetEntry, TempDimSetEntry2) then
                    "Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry2);
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code",
                  "Shortcut Dimension 2 Code");
            end;
        end;
    end;

    local procedure CheckIfEntryAlreadyApplied(GenJnlLine3: Record "Gen. Journal Line"; VendLedgEntry2: Record "Vendor Ledger Entry")
    var
        GenJnlLine4: Record "Gen. Journal Line";
    begin
        GenJnlLine4.Reset;
        GenJnlLine4.SetCurrentkey(
          "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.");
        GenJnlLine4.SetRange("Journal Template Name", GenJnlLine3."Journal Template Name");
        GenJnlLine4.SetRange("Journal Batch Name", GenJnlLine3."Journal Batch Name");
        GenJnlLine4.SetRange("Account Type", GenJnlLine4."account type"::Vendor);
        GenJnlLine4.SetRange("Account No.", VendLedgEntry2."Vendor No.");
        GenJnlLine4.SetRange("Applies-to Doc. Type", VendLedgEntry2."Document Type");
        GenJnlLine4.SetRange("Applies-to Doc. No.", VendLedgEntry2."Document No.");
        if GenJnlLine4.FindFirst then
            GenJnlLine4.FieldError(
              "Applies-to Doc. No.",
              StrSubstNo(
                Text016,
                VendLedgEntry2."Document Type", VendLedgEntry2."Document No.",
                VendLedgEntry2."Vendor No."));
    end;

    local procedure SetBankAccCurrencyFilter(BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account"; BalAccNo: Code[20]; var TmpPayableVendLedgEntry: Record "Payable Vendor Ledger Entry")
    var
        BankAcc: Record "Bank Account";
    begin
        if BalAccType = Balacctype::"Bank Account" then
            if BalAccNo <> '' then begin
                BankAcc.Get(BalAccNo);
                if BankAcc."Currency Code" <> '' then
                    TmpPayableVendLedgEntry.SetRange("Currency Code", BankAcc."Currency Code");
            end;
    end;

    local procedure ShowMessage(Text: Text)
    begin
        if GenJnlLineInserted then begin
            if ShowPostingDateWarning then
                Text += ReplacePostingDateMsg;
            if Text <> '' then
                Message(Text);
        end;
    end;

    local procedure CheckCurrencies(BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account"; BalAccNo: Code[20]; var TmpPayableVendLedgEntry: Record "Payable Vendor Ledger Entry")
    var
        BankAcc: Record "Bank Account";
        TmpPayableVendLedgEntry2: Record "Payable Vendor Ledger Entry" temporary;
    begin
        if BalAccType = Balacctype::"Bank Account" then
            if BalAccNo <> '' then begin
                BankAcc.Get(BalAccNo);
                if BankAcc."Currency Code" <> '' then begin
                    TmpPayableVendLedgEntry2.Reset;
                    TmpPayableVendLedgEntry2.DeleteAll;
                    if TmpPayableVendLedgEntry.Find('-') then
                        repeat
                            TmpPayableVendLedgEntry2 := TmpPayableVendLedgEntry;
                            TmpPayableVendLedgEntry2.Insert;
                        until TmpPayableVendLedgEntry.Next = 0;

                    TmpPayableVendLedgEntry2.SetFilter("Currency Code", '<>%1', BankAcc."Currency Code");
                    SeveralCurrencies := SeveralCurrencies or TmpPayableVendLedgEntry2.FindFirst;

                    if SeveralCurrencies then
                        MessageText :=
                          StrSubstNo(Text020, BankAcc.FieldCaption("Currency Code"), BankAcc."Currency Code")
                    else
                        MessageText :=
                          StrSubstNo(Text021, BankAcc.FieldCaption("Currency Code"), BankAcc."Currency Code");
                end else
                    MessageText := Text022;
            end;
    end;

    local procedure ClearNegative()
    var
        TempCurrency: Record Currency temporary;
        PayableVendLedgEntry2: Record "Payable Vendor Ledger Entry" temporary;
        CurrencyBalance: Decimal;
    begin
        Clear(PayableVendLedgEntry);
        PayableVendLedgEntry.SetRange("Vendor No.", Vendor."No.");

        while PayableVendLedgEntry.Next <> 0 do begin
            TempCurrency.Code := PayableVendLedgEntry."Currency Code";
            CurrencyBalance := 0;
            if TempCurrency.Insert then begin
                PayableVendLedgEntry2 := PayableVendLedgEntry;
                PayableVendLedgEntry.SetRange("Currency Code", PayableVendLedgEntry."Currency Code");
                repeat
                    CurrencyBalance := CurrencyBalance + PayableVendLedgEntry."Amount (LCY)"
                until PayableVendLedgEntry.Next = 0;
                if CurrencyBalance < 0 then begin
                    PayableVendLedgEntry.DeleteAll;
                    AmountAvailable += CurrencyBalance;
                end;
                PayableVendLedgEntry.SetRange("Currency Code");
                PayableVendLedgEntry := PayableVendLedgEntry2;
            end;
        end;
        PayableVendLedgEntry.Reset;
    end;

    local procedure DimCodeIsInDimBuf(DimCode: Code[20]; DimBuf: Record "Dimension Buffer"): Boolean
    begin
        DimBuf.Reset;
        DimBuf.SetRange("Dimension Code", DimCode);
        exit(not DimBuf.IsEmpty);
    end;

    local procedure RemovePaymentsAboveLimit(var PayableVendLedgEntry: Record "Payable Vendor Ledger Entry"; RemainingAmtAvailable: Decimal)
    begin
        PayableVendLedgEntry.SetFilter("Amount (LCY)", '>%1', RemainingAmtAvailable);
        PayableVendLedgEntry.DeleteAll;
        PayableVendLedgEntry.SetRange("Amount (LCY)");
    end;

    local procedure InsertDimBuf(var DimBuf: Record "Dimension Buffer"; TableID: Integer; EntryNo: Integer; DimCode: Code[20]; DimValue: Code[20])
    begin
        DimBuf.Init;
        DimBuf."Table ID" := TableID;
        DimBuf."Entry No." := EntryNo;
        DimBuf."Dimension Code" := DimCode;
        DimBuf."Dimension Value Code" := DimValue;
        DimBuf.Insert;
    end;

    local procedure GetMessageToRecipient(SummarizePerVend: Boolean): Text[140]
    begin
        if SummarizePerVend then
            exit(CompanyInformation.Name);
        exit(
          StrSubstNo(
            MessageToRecipientMsg,
            TempPaymentBuffer."Vendor Ledg. Entry Doc. Type",
            TempPaymentBuffer."Applies-to Ext. Doc. No."));
    end;

    local procedure SetPostingDate(var GenJnlLine: Record "Gen. Journal Line"; DueDate: Date; PostingDate: Date): Boolean
    begin
        if not UseDueDateAsPostingDate then begin
            GenJnlLine.Validate("Posting Date", PostingDate);
            exit(false);
        end;

        if DueDate = 0D then
            DueDate := GenJnlLine.GetAppliesToDocDueDate;
        exit(GenJnlLine.SetPostingDateAsDueDate(DueDate, DueDateOffset));
    end;

    local procedure GetApplDueDate(VendLedgEntryNo: Integer): Date
    var
        AppliedVendLedgEntry: Record "Vendor Ledger Entry";
    begin
        if AppliedVendLedgEntry.Get(VendLedgEntryNo) then
            exit(AppliedVendLedgEntry."Due Date");

        exit(PostingDate);
    end;

    local procedure EvaluateIncStr(StringToInc: code[20]; ErrorHint: text)
    var
        myInt: Integer;
    begin
        if INCSTR(StringToInc) = '' then
            error('%1 Contains no Number and cannot be Incremented ', ErrorHint)
    end;

    local procedure AdjustAgainstSelectedDim(var TempDimSetEntry: Record "Dimension Set Entry" temporary; var TempDimSetEntry2: Record "Dimension Set Entry" temporary): Boolean
    begin
        if SelectedDim.FindSet then begin
            repeat
                TempDimSetEntry.SetRange("Dimension Code", SelectedDim."Dimension Code");
                if TempDimSetEntry.FindFirst then begin
                    TempDimSetEntry2.TransferFields(TempDimSetEntry, true);
                    TempDimSetEntry2.Insert;
                end;
            until SelectedDim.Next = 0;
            exit(true);
        end;
        exit(false);
    end;

    local procedure SetTempPaymentBufferDims(var DimBuf: Record "Dimension Buffer")
    var
        GLSetup: Record "General Ledger Setup";
        EntryNo: Integer;
    begin
        if SummarizePerDim then begin
            DimBuf.Reset;
            DimBuf.DeleteAll;
            if SelectedDim.Find('-') then
                repeat
                    if DimSetEntry.Get(
                         VendLedgEntry."Dimension Set ID", SelectedDim."Dimension Code")
                    then
                        InsertDimBuf(DimBuf, Database::"Dimension Buffer", 0, DimSetEntry."Dimension Code",
                          DimSetEntry."Dimension Value Code");
                until SelectedDim.Next = 0;
            EntryNo := DimBufMgt.FindDimensions(DimBuf);
            if EntryNo = 0 then
                EntryNo := DimBufMgt.InsertDimensions(DimBuf);
            TempPaymentBuffer."Dimension Entry No." := EntryNo;
            if TempPaymentBuffer."Dimension Entry No." <> 0 then begin
                GLSetup.Get;
                if DimCodeIsInDimBuf(GLSetup."Global Dimension 1 Code", DimBuf) then
                    TempPaymentBuffer."Global Dimension 1 Code" := VendLedgEntry."Global Dimension 1 Code"
                else
                    TempPaymentBuffer."Global Dimension 1 Code" := '';
                if DimCodeIsInDimBuf(GLSetup."Global Dimension 2 Code", DimBuf) then
                    TempPaymentBuffer."Global Dimension 2 Code" := VendLedgEntry."Global Dimension 2 Code"
                else
                    TempPaymentBuffer."Global Dimension 2 Code" := '';
            end else begin
                TempPaymentBuffer."Global Dimension 1 Code" := '';
                TempPaymentBuffer."Global Dimension 2 Code" := '';
            end;
            TempPaymentBuffer."Dimension Set ID" := VendLedgEntry."Dimension Set ID";
        end else begin
            TempPaymentBuffer."Dimension Entry No." := 0;
            TempPaymentBuffer."Global Dimension 1 Code" := '';
            TempPaymentBuffer."Global Dimension 2 Code" := '';
            TempPaymentBuffer."Dimension Set ID" := 0;
        end;
    end;
}

