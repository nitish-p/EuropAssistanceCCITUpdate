XmlPort 50005 "Gen. Journal Line Upload"
{
    // Pallavi 01032017
    // modifed xmlport for salary jv
    // 1 added code = OnPreXMLport()
    // 1.1 added code for capturing template name , batch name
    // 1.2 added code for validating blank template name , batch name
    // 1.3  added code for getting document no
    // 1.4  added code for getting document no
    // 2 added code = OnPostXMLport()
    // 2.1 Added code for successful upload message
    // 3 added code =Gen. Journal Line - Import::OnAfterInsertRecord()
    // 3.1  added code for vlaidting field
    // 4 added code =Gen. Journal Line - Import::OnBeforeInsertRecord()
    // 4.1  added code to get line no
    // 4.2  added code for inserting templte,batch ,line no , document
    // prdp 08032017
    // changed the source type from text to Field for DepDim
    // prdp 040517
    // added field DocNo
    // prdp 080517
    // added new column Narration
    // prdp 23062017
    // added two new columns 'ChequeNo' & 'ChequeDate'
    // prdp 06032018
    // added two new columns 'Gen Posting type' & 'Bal gen post type'
    // CCIT-SG-23022022
    // FAPostingType Field added
    Direction = Both;
    Format = VariableText;
    Permissions = TableData "Vendor Ledger Entry" = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                RequestFilterFields = "Journal Template Name", "Journal Batch Name";
                XmlName = 'Gen_Journal_Line';
                fieldelement(PostingDate; "Gen. Journal Line"."Posting Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DocNo; "Gen. Journal Line"."Document No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DocType; "Gen. Journal Line"."Document Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AccType; "Gen. Journal Line"."Account Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AccNo; "Gen. Journal Line"."Account No.")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(Amt; "Gen. Journal Line".Amount)
                {
                    MinOccurs = Zero;
                }
                fieldelement(BalAccType; "Gen. Journal Line"."Bal. Account Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BalAccNo; "Gen. Journal Line"."Bal. Account No.")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(ExtDoc; "Gen. Journal Line"."External Document No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DepDim; "Gen. Journal Line"."Department Code")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(BusinessLineDim; "Gen. Journal Line"."Shortcut Dimension 1 Code")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(Narration; "Gen. Journal Line".Narration)
                {
                    MinOccurs = Zero;
                }
                fieldelement(ChequeNo; "Gen. Journal Line"."Cheque No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ChequeDate; "Gen. Journal Line"."Cheque Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AppDocType; "Gen. Journal Line"."Applies-to Doc. Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(AppDocNo; "Gen. Journal Line"."Applies-to Doc. No.")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(GenPostType; "Gen. Journal Line"."Gen. Posting Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BalGenPostType; "Gen. Journal Line"."Bal. Gen. Posting Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ClientLevelCode; "Gen. Journal Line"."Client Level Code")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(EmployeeCode; "Gen. Journal Line"."Employee Code")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(PONumber; "Gen. Journal Line"."PO Number")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PODate; "Gen. Journal Line"."PO Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(FAPostingType; "Gen. Journal Line"."FA Posting Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(UTRNo; "Gen. Journal Line"."UTR No.")
                {
                    MinOccurs = Zero;
                }

                trigger OnAfterInsertRecord()
                begin

                    // added code for vlaidting fields
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Document Type");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Account No.");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Posting Date");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."External Document No.");
                    "Gen. Journal Line".Validate("Gen. Journal Line".Amount);
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Bal. Account Type");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Bal. Account No.");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Shortcut Dimension 1 Code");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Department Code");
                    //"Gen. Journal Line".VALIDATE("Gen. Journal Line"."Applies-to Doc. Type");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Applies-to Doc. No.");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Client Level Code");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Employee Code");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."PO Number");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."PO Date");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."FA Posting Type");//CCIT-23022022
                end;

                trigger OnBeforeInsertRecord()
                begin


                    // added code to get line no
                    GenJnlLine.SetRange("Journal Template Name", JournalTempName);
                    GenJnlLine.SetRange("Journal Batch Name", JournalBatchName);
                    if GenJnlLine.Find('+') then
                        LineNo := GenJnlLine."Line No."
                    else
                        LineNo := 0;

                    // added code for inserting templte,batch ,line no , document no
                    "Gen. Journal Line"."Journal Template Name" := JournalTempName;
                    "Gen. Journal Line"."Journal Batch Name" := JournalBatchName;
                    LineNo := LineNo + 10000;
                    "Gen. Journal Line"."Line No." := LineNo;
                    //"Gen. Journal Line"."Document No." := NextDocNo;

                    // added code to insert narration
                    GenJnlNarration.Reset;
                    GenJnlNarration.SetRange("Journal Template Name", JournalTempName);
                    GenJnlNarration.SetRange("Journal Batch Name", JournalBatchName);
                    GenJnlNarration.SetRange("Document No.", "Gen. Journal Line"."Document No.");
                    if not GenJnlNarration.FindFirst then begin
                        GenJnlNarration."Journal Template Name" := JournalTempName;
                        GenJnlNarration."Journal Batch Name" := JournalBatchName;
                        GenJnlNarration."Document No." := "Gen. Journal Line"."Document No.";
                        GenJnlNarration."Line No." := 10000;
                        //GenJnlNarration.Narration:="Gen. Journal Line".Narration;
                        //MESSAGE(GenJnlNarration.Narration);
                        GenJnlNarration.Insert;
                    end;

                    //"Gen. Journal Line".Narration:="Gen. Journal Line".Narration;
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Department Code");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Client Level Code");
                    "Gen. Journal Line".Validate("Gen. Journal Line"."Employee Code");

                    decAmountToApply := 0;
                    Clear(recVendLedgerEntry);
                    recVendLedgerEntry.SetRange(recVendLedgerEntry."Document No.", "Gen. Journal Line"."Applies-to Doc. No.");
                    recVendLedgerEntry.SetRange(Open, true);
                    if recVendLedgerEntry.FindFirst then begin
                        decAmountToApply := -1 * ("Gen. Journal Line".Amount);
                        recVendLedgerEntry."Applies-to ID" := UserId;
                        recVendLedgerEntry.Validate("Amount to Apply", decAmountToApply);
                        recVendLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                        if Abs(recVendLedgerEntry."Amount to Apply") > Abs(recVendLedgerEntry."Remaining Amt. (LCY)") then
                            Error(Text002, recVendLedgerEntry."Document No.", recVendLedgerEntry."Remaining Amt. (LCY)", recVendLedgerEntry."Amount to Apply");
                        recVendLedgerEntry.Modify;
                    end;
                end;
            }
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

    trigger OnPostXmlPort()
    begin
        // added code for successful upload message
        Message(Text0001);
    end;

    trigger OnPreXmlPort()
    begin

        // added code for capturing template name , batch name
        JournalTempName := "Gen. Journal Line".GetFilter("Journal Template Name");
        JournalBatchName := "Gen. Journal Line".GetFilter("Journal Batch Name");

        // added code for validating blank template name , batch name
        if JournalTempName = '' then
            Error(' Please select Template Name');
        if JournalBatchName = '' then
            Error('Please select Batch Name ');
        /*
        // added code for getting document no
        GenJnlBatch.RESET;
        GenJnlBatch.GET(JournalTempName,JournalBatchName);
        IF GenJnlBatch."No. Series" = '' THEN
          ERROR(' No series is blank for batch %1',JournalBatchName)
        ELSE BEGIN
          NextDocNo := NoSeriesMgt.GetNextNo(GenJnlBatch."No. Series",WORKDATE,TRUE);
          CLEAR(NoSeriesMgt);
        END;
        */

    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        UserBatch: Record "Vendor Bridge";
        GenJnlBatch: Record "Gen. Journal Batch";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserBatchName: Code[20];
        JournalTempName: Code[20];
        JournalBatchName: Code[20];
        NextDocNo: Code[20];
        LineNo: Integer;
        SchemeDim: Code[20];
        Text002: label 'Invoice No. %1  has only %2  as remaining amount but applied amount is %3';
        Text0001: label 'Entries have been uploaded ';
        GenJnlNarration: Record "Gen. Journal Narration";
        recVendLedgerEntry: Record "Vendor Ledger Entry";
        decAmountToApply: Decimal;
}

