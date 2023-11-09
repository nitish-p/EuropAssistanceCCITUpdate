Page 50035 "Dealer Refund"
{
    Caption = 'Dealer Refund Requests';
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = "Dealer Refund";
    SourceTableView = sorting("Entry No.", "Case ID")
                      order(descending);
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case ID"; rec."Case ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Select; rec.Select)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bal. Account No."; rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Integration Document No."; rec."Integration Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Narration; rec.Narration)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Dealer Code"; rec."Dealer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Name"; rec."Dealer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary Name"; rec."Beneficiary Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Beneficiary Account No"; rec."Beneficiary Account No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Beneficiary IFSC Code"; rec."Beneficiary IFSC Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reason For Rejection"; rec."Reason For Rejection")
                {
                    ApplicationArea = Basic;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Refunded; rec.Refunded)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("NAV Refund No."; rec."NAV Refund No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approved Date-Time"; rec."Approved Date-Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Rejected Date-Time"; rec."Rejected Date-Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Middleware Response"; rec."Middleware Response")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Dealer Id"; rec."Dealer Id")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approve)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;

                trigger OnAction()
                begin
                    CASEID := Format(CurrentDatetime);

                    if ((rec.Status <> 3) and (rec.Status <> 4)) then begin  // status begin

                        DealerRefund.Reset;
                        DealerRefund.SetRange(Select, true);
                        DealerRefund.SetRange(Refunded, false);
                        if not DealerRefund.FindFirst then begin
                            Error('No line selected to approve refund');
                        end;

                        if not Confirm('Do you want to Approve selected refund requests ?', false)
                          then
                            exit;

                        if UpperCase(rec.Type) = 'REFUND' then begin

                            DealerRefund.Reset;
                            DealerRefund.SetRange(Select, true);
                            DealerRefund.SetRange(Refunded, false);
                            if DealerRefund.FindSet then
                                repeat

                                    GenJnlLine.Reset;
                                    GenJnlLine.SetRange("Journal Template Name", 'BANK PAYME');
                                    GenJnlLine.SetRange("Journal Batch Name", 'DEFAULT');
                                    if GenJnlLine.Find('+') then begin
                                        LineNo := GenJnlLine."Line No." + 10000;
                                    end else begin
                                        LineNo := 10000;
                                    end;

                                    GenJnlLine.Reset;
                                    GenJnlLine.SetRange("Journal Template Name", 'BANK PAYME');
                                    GenJnlLine.SetRange("Journal Batch Name", 'DEFAULT');
                                    GenJnlLine.SetRange("Document No.", DealerRefund."Document No.");
                                    GenJnlLine.SetRange("External Document No.", DealerRefund."External Document No.");
                                    GenJnlLine.SetRange("Account No.", rec."Bal. Account No.");
                                    if not GenJnlLine.FindFirst then begin

                                        rec81.Reset;
                                        rec81.Init;
                                        rec81.Validate("Journal Template Name", 'BANK PAYME');
                                        rec81.Validate("Journal Batch Name", 'DEFAULT');
                                        rec81.Validate("Line No.", LineNo);
                                        rec81.Validate(rec81."Document Type", rec81."document type"::Refund);
                                        rec81.Validate("Document No.", DealerRefund."Document No.");
                                        rec81.Validate(rec81."Account Type", rec81."account type"::Customer);
                                        rec81.Validate("Account No.", DealerRefund."Bal. Account No.");
                                        rec81.Validate(rec81."Posting Date", Today);
                                        rec81.Validate("Integration Document No.", DealerRefund."Integration Document No.");
                                        rec81.Validate(rec81."External Document No.", DealerRefund."External Document No.");
                                        rec81.Validate(rec81.Amount, DealerRefund.Amount);
                                        rec81.Validate(rec81."Bal. Account Type", rec81."bal. account type"::"Bank Account");
                                        rec81.Validate(rec81."Bal. Account No.", DealerRefund."Account No.");
                                        rec81.Validate(rec81."Shortcut Dimension 1 Code", '12000000');
                                        rec81.Validate(rec81."Department Code", '100001');
                                        rec81.Validate(rec81."Suggested Payment", true);
                                        //rec81.VALIDATE(rec81."Client Level Code",'ROENRTL');
                                        //rec81.VALIDATE(rec81."Employee Code","Employee Code Dimension");
                                        rec81.Validate(Narration, DealerRefund.Narration);
                                        rec81.Validate("Dealer Code", DealerRefund."Dealer Code");
                                        rec81.Validate("Case No.", CASEID);
                                        rec81.Validate("Beneficiary Name", DealerRefund."Beneficiary Name");
                                        rec81.Validate("Beneficiary Acc. No.", DealerRefund."Beneficiary Account No");
                                        rec81.Validate("Beneficiary IFSC Code", DealerRefund."Beneficiary IFSC Code");
                                        rec81.Insert(true);

                                    end;

                                    DealerRefund."Reason For Rejection" := '';
                                    DealerRefund.Validate(DealerRefund.Status, DealerRefund.Status::Approved);
                                    DealerRefund."Approved Date-Time" := CurrentDatetime;
                                    //DealerRefund.Refunded:=TRUE;
                                    DealerRefund.Modify;

                                until DealerRefund.Next = 0;

                        end;

                    end;  // status end

                    DealerRefund.Reset;
                    DealerRefund.SetRange(Select, true);
                    if DealerRefund.FindSet then
                        repeat
                            DealerRefund.Select := false;
                            DealerRefund.Modify;
                        until DealerRefund.Next = 0;

                    rec81.Reset;
                    rec81.SetRange("Case No.", CASEID);
                    Page.Run(16577, rec81);
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;

                trigger OnAction()
                begin
                    DealerRefund.Reset;
                    DealerRefund.SetRange(Select, true);
                    DealerRefund.SetRange(Status, 0);
                    if not DealerRefund.FindFirst then begin
                        Error('No line selected to reject refund');
                    end;

                    if not Confirm('Do you want to Reject selected refund request ?', false)
                      then
                        exit;

                    DealerRefund.Reset;
                    DealerRefund.SetRange(Select, true);
                    DealerRefund.SetRange(Status, 0);
                    if DealerRefund.FindSet then
                        repeat

                            if DealerRefund."Reason For Rejection" = '' then
                                Error('Please add "Reason For Rejection" for Entry No %1', DealerRefund."Entry No.");

                            transactionId := '';
                            transactionId := Lowercase(DealerRefund."Integration Document No.");
                            rec.rejectRefund(DealerRefund."Dealer Code", transactionId, '', Format(DealerRefund.Amount), DealerRefund."Beneficiary Name", DealerRefund."Beneficiary Name", DealerRefund."Beneficiary Account No", DealerRefund."Beneficiary Name",
                            DealerRefund."Beneficiary IFSC Code", '', 'reject', DealerRefund."Reason For Rejection", DealerRefund."Entry No.", DealerRefund."Dealer Id");

                        //DealerRefund.VALIDATE(DealerRefund.Status,DealerRefund.Status::Rejected);
                        //DealerRefund.MODIFY;

                        until DealerRefund.Next = 0;


                    DealerRefund.Reset;
                    DealerRefund.SetRange(Select, true);
                    if DealerRefund.FindSet then
                        repeat
                            DealerRefund.Select := false;
                            DealerRefund.Modify;
                        until DealerRefund.Next = 0;
                end;
            }
        }
    }

    trigger OnClosePage()
    begin
        DealerRefund.Reset;
        DealerRefund.SetRange(Select, true);
        if DealerRefund.FindSet then
            repeat
                DealerRefund.Select := false;
                DealerRefund.Modify;
            until DealerRefund.Next = 0;
    end;

    trigger OnOpenPage()
    begin
        DealerRefund.Reset;
        DealerRefund.SetRange(Select, true);
        if DealerRefund.FindSet then
            repeat
                DealerRefund.Select := false;
                DealerRefund.Modify;
            until DealerRefund.Next = 0;
        rec.SetRange(Status, 0);
    end;

    var
        rec50019: Record "Dealer Refund";
        DealerRefund: Record "Dealer Refund";
        recCust: Record Customer;
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        rec81: Record "Gen. Journal Line";
        recBALE: Record "Bank Account Ledger Entry";
        CASEID: Text;
        // Page16577: Page UnknownPage16577;//Naveen
        transactionId: Text[50];
}

