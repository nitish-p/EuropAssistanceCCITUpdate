Report 50115 "Adjust Customer Entries 2"
{
    //   Pallavi 18022016
    //     created report for adjsuting application entries
    // Suryya 190216:
    // 1.added new boolean variable POST
    // 2.Added condition to insert only for post for HO & Branch Dimension;added code ro increment SrNo & to capture
    // Application Type  in Detailed Vendor Ledg. Entry - OnAfterGetRecord() and added code to Modify only for post in  Detailed Vendor Ledg. Entry - OnPostDataItem()
    // Pallavi 23022016
    // modifed code for branch code in onaftergetrecord()
    // added property for permissions
    // pallavi 26022016
    // added condition for entry type application - Detailed Cust. Ledg. Entry - OnPostDataItem()
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Adjust Customer Entries 2.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    Permissions = TableData "Cust. Ledger Entry" = rimd,
                  TableData "Detailed Cust. Ledg. Entry" = rimd;

    dataset
    {
        dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
        {
            DataItemTableView = where("Entry Type" = const(Application), "Application Adjusted" = const(false), "Initial Document Type" = filter(Invoice | "Credit Memo"));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CustomerNo; "Detailed Cust. Ledg. Entry"."Customer No.")
            {
            }
            column(DocumentNo; "Detailed Cust. Ledg. Entry"."Document No.")
            {
            }
            column(ApplicationType; ApplicationType)
            {
            }
            column(srno; srno)
            {
            }
            column(BranchCode; BranchCode)
            {
            }
            column(HOAmount; ((-1) * ("Detailed Cust. Ledg. Entry".Amount)))
            {
            }
            column(BranchAmount; "Detailed Cust. Ledg. Entry".Amount)
            {
            }
            column(DATE; Format(Today))
            {
            }

            trigger OnAfterGetRecord()
            var
                GenJnlLine: Record "Gen. Journal Line";
            begin

                // for HO Dimension   ++
                GenJnlLine."Journal Template Name" := 'JOURNAL';
                GenJnlLine."Journal Batch Name" := 'BACKEND';
                GenJnlLine."Line No." := LineNo;
                LineNo := LineNo + 10000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::Customer;
                GenJnlLine.Validate(GenJnlLine."Account No.", "Detailed Cust. Ledg. Entry"."Customer No.");
                GenJnlLine."Posting Date" := "Detailed Cust. Ledg. Entry"."Posting Date";
                GenJnlLine."Document No." := "Detailed Cust. Ledg. Entry"."Document No.";
                GenJnlLine."External Document No." := 'BACKEND';
                DCLE2.Reset;
                DCLE2.SetRange(DCLE2."Entry Type", DCLE2."entry type"::Application);
                DCLE2.SetRange(DCLE2."Applied Cust. Ledger Entry No.", "Detailed Cust. Ledg. Entry"."Applied Cust. Ledger Entry No.");
                DCLE2.SetFilter(DCLE2."Initial Document Type", '<>%1&<>%2', DCLE2."initial document type"::"Credit Memo", DCLE2."initial document type"::Invoice);
                if DCLE2.FindFirst then begin
                    CLE2.Reset;
                    CLE2.Get(DCLE2."Cust. Ledger Entry No.");
                    GenJnlLine."Dimension Set ID" := CLE2."Dimension Set ID";
                    GenJnlLine."Shortcut Dimension 1 Code" := CLE2."Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := CLE2."Global Dimension 2 Code";
                end;
                GenJnlLine.Validate(GenJnlLine.Amount, ((-1) * "Detailed Cust. Ledg. Entry".Amount));
                // for application type
                if "Detailed Cust. Ledg. Entry"."Source Code" = 'UNAPPSALES' then begin
                    ApplicationType := 'Un Applied Entry';
                    GenJnlLine.Description := 'Un Applied Entry for ' + "Detailed Cust. Ledg. Entry"."Document No.";
                end
                else begin
                    ApplicationType := 'Applied Entry';
                    GenJnlLine.Description := ' Applied Entry for ' + "Detailed Cust. Ledg. Entry"."Document No.";
                end;

                if POST = true then
                    GenJnlLine.Insert;
                // for HO Dimension   --

                //  for Branch dimension  ++
                GenJnlLine."Journal Template Name" := 'JOURNAL';
                GenJnlLine."Journal Batch Name" := 'BACKEND';
                GenJnlLine."Line No." := LineNo;
                LineNo := LineNo + 10000;
                GenJnlLine."Account Type" := GenJnlLine."account type"::Customer;
                GenJnlLine.Validate(GenJnlLine."Account No.", "Detailed Cust. Ledg. Entry"."Customer No.");
                GenJnlLine."Posting Date" := "Detailed Cust. Ledg. Entry"."Posting Date";
                GenJnlLine."Document No." := "Detailed Cust. Ledg. Entry"."Document No.";
                GenJnlLine."External Document No." := 'BACKEND';
                CLE2.Reset;
                CLE2.Get("Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.");
                GenJnlLine."Dimension Set ID" := CLE2."Dimension Set ID";
                GenJnlLine."Shortcut Dimension 1 Code" := CLE2."Global Dimension 1 Code";
                GenJnlLine."Shortcut Dimension 2 Code" := CLE2."Global Dimension 2 Code";
                BranchCode := CLE2."Global Dimension 1 Code";
                GenJnlLine.Validate(GenJnlLine.Amount, "Detailed Cust. Ledg. Entry".Amount);
                // for application type
                if "Detailed Cust. Ledg. Entry"."Source Code" = 'UNAPPSALES' then begin
                    ApplicationType := 'Un Applied Entry';
                    GenJnlLine.Description := 'Un Applied Entry for ' + "Detailed Cust. Ledg. Entry"."Document No.";
                end
                else begin
                    ApplicationType := 'Applied Entry';
                    GenJnlLine.Description := ' Applied Entry for ' + "Detailed Cust. Ledg. Entry"."Document No.";
                end;
                if POST = true then
                    GenJnlLine.Insert;
                //  for Branch dimension  --

                //srno
                srno := srno + 1;
            end;

            trigger OnPostDataItem()
            begin

                // to insert back end entries
                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'JOURNAL');
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'BACKEND');
                if GenJnlLine.FindSet then
                    repeat
                        Counter := Counter + 1;
                    until GenJnlLine.Next = 0;



                if (Counter >= 1) and (POST = true) then begin

                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'JOURNAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'BACKEND');
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

                    // modify the open status in CLE
                    CLE.Reset;
                    CLE.SetRange(CLE."External Document No.", 'BACKEND');
                    CLE.SetRange(CLE.Open, true);
                    if CLE.FindSet then
                        repeat
                            CLE.Open := false;
                            CLE.Modify;
                        until CLE.Next = 0;


                    // to modify application adjusted
                    DCLE2.Reset;
                    DCLE2.SetRange(DCLE2."Entry Type", DCLE2."entry type"::Application);
                    DCLE2.SetRange(DCLE2."Application Adjusted", false);
                    DCLE2.CopyFilters("Detailed Cust. Ledg. Entry");
                    if DCLE2.FindSet then
                        repeat
                            DCLE2."Application Adjusted" := true;
                            DCLE2.Modify;
                        until DCLE2.Next = 0;

                end; // counter end

                // to delete extra record
                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'JOURNAL');
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'BACKEND');
                if GenJnlLine.FindSet then
                    repeat
                        GenJnlLine.Delete;
                    until GenJnlLine.Next = 0;
            end;

            trigger OnPreDataItem()
            begin
                LineNo := 10000;
                // modify the open status in CLE
                CLE.Reset;
                CLE.SetRange(CLE."External Document No.", 'BACKEND');
                CLE.SetRange(CLE.Open, true);
                if CLE.FindSet then
                    repeat
                        CLE.Open := false;
                        CLE.Modify;
                    until CLE.Next = 0;

                //srno
                srno := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Post; POST)
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

    var
        CLE: Record "Cust. Ledger Entry";
        LineNo: Integer;
        CLE2: Record "Cust. Ledger Entry";
        DCLE2: Record "Detailed Cust. Ledg. Entry";
        GenJnlLine: Record "Gen. Journal Line";
        Counter: Integer;
        srno: Integer;
        ApplicationType: Code[30];
        POST: Boolean;
        BranchCode: Code[30];

}

