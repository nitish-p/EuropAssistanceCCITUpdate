Page 50020 "Fast Close Report"
{
    Editable = true;
    PageType = List;
    SourceTable = "G/L Account";
    SourceTableView = sorting("No.")
                      order(ascending)
                      where(Blocked = const(false),
                            "Account Type" = const(Posting));
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            group(Control1000000006)
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';

                    trigger OnValidate()
                    begin
                        if StartDate = 0D then
                            Error('Start Date must selected');

                        if ((StartDate <> 0D) and (EndDate = 0D)) then
                            EndDate := Today;

                        GLAcc.Reset;
                        GLAcc.SetRange(GLAcc.Blocked, false);
                        GLAcc.SetRange(GLAcc."Account Type", GLAcc."account type"::Posting);
                        if GLAcc.FindSet then
                            repeat

                                FastCloseNetTotal := 0;

                                GenLedEntry.Reset;
                                GenLedEntry.SetRange("G/L Account No.", GLAcc."No.");
                                GenLedEntry.SetRange("Journal Batch Name", 'FAST CLOSE');
                                GenLedEntry.SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                                if GenLedEntry.FindSet then
                                    repeat
                                        FastCloseNetTotal := FastCloseNetTotal + GenLedEntry.Amount;
                                    until GenLedEntry.Next = 0;

                                GLAcc."FAST CLOSE NET TOTAL" := FastCloseNetTotal;
                                GLAcc.Modify;

                            until GLAcc.Next = 0;
                    end;
                }
                field("End Date"; EndDate)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if EndDate = 0D then
                            Error('End Date must selected');
                        if StartDate = 0D then
                            Error('Start Date must selected');


                        GLAcc.Reset;
                        GLAcc.SetRange(GLAcc.Blocked, false);
                        GLAcc.SetRange(GLAcc."Account Type", GLAcc."account type"::Posting);
                        if GLAcc.FindSet then
                            repeat

                                FastCloseNetTotal := 0;

                                GenLedEntry.Reset;
                                GenLedEntry.SetRange("G/L Account No.", GLAcc."No.");
                                GenLedEntry.SetRange("Journal Batch Name", 'FAST CLOSE');
                                GenLedEntry.SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
                                if GenLedEntry.FindSet then
                                    repeat
                                        FastCloseNetTotal := FastCloseNetTotal + GenLedEntry.Amount;
                                    until GenLedEntry.Next = 0;

                                GLAcc."FAST CLOSE NET TOTAL" := FastCloseNetTotal;
                                GLAcc.Modify;

                            until GLAcc.Next = 0;
                    end;
                }
            }
            repeater(Group)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Type"; rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Income/Balance"; rec."Income/Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Fast Close Net Total"; rec."FAST CLOSE NET TOTAL")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin

        GLAcc.Reset;
        GLAcc.SetRange(GLAcc.Blocked, false);
        GLAcc.SetRange(GLAcc."Account Type", GLAcc."account type"::Posting);
        if GLAcc.FindSet then
            repeat

                FastCloseNetTotal := 0;

                GenLedEntry.Reset;
                GenLedEntry.SetRange("G/L Account No.", GLAcc."No.");
                GenLedEntry.SetRange("Journal Batch Name", 'FAST CLOSE');
                if GenLedEntry.FindSet then
                    repeat
                        FastCloseNetTotal := FastCloseNetTotal + GenLedEntry.Amount;
                    until GenLedEntry.Next = 0;

                GLAcc."FAST CLOSE NET TOTAL" := FastCloseNetTotal;
                GLAcc.Modify;

            until GLAcc.Next = 0;
    end;

    var
        GenLedEntry: Record "G/L Entry";
        FastCloseNetTotal: Decimal;
        StartDate: Date;
        EndDate: Date;
        GLAcc: Record "G/L Account";
}

