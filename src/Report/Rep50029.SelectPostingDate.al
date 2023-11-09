Report 50029 "Select Posting Date"
{
    Permissions = TableData "G/L Entry" = rm,
                  TableData "Cust. Ledger Entry" = rimd,
                  TableData "Vendor Ledger Entry" = rimd,
                  TableData "VAT Entry" = rimd,
                  TableData "Bank Account Ledger Entry" = rimd,
                  TableData "Detailed Cust. Ledg. Entry" = rimd,
                  TableData "Detailed Vendor Ledg. Entry" = rimd,
                  TableData "FA Ledger Entry" = rimd,
                  TableData "Maintenance Ledger Entry" = rimd,
                  // TableData UnknownTableData13723=rimd,
                  TableData "TDS Entry" = rimd,
                  TableData "Detailed GST Ledger Entry" = rimd,
                  TableData "TCS Entry" = rimd;
    //  TableData UnknownTableData16541=rimd;
    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Posting Date"; PostingDate)
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

        GenLedEntry.Reset;
        GenLedEntry.SetRange("Reverse Transaction", true);
        if GenLedEntry.FindFirst then begin

            if PostingDate < GenLedEntry."Posting Date" then begin
                GLE.Reset;
                GLE.SetRange("Reverse Transaction", true);
                if GLE.FindSet then
                    repeat
                        GLE."Reverse Transaction" := false;
                        GLE.Modify;
                    until GLE.Next = 0;
                Error('Reversal posting date must be after initial entry posting date.');
            end;


            GLE.Reset;
            GLE.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if GLE.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        GLE."Posting Date" := PostingDate;
                    end else begin
                        GLE."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    GLE.Modify;
                until GLE.Next = 0;

            CLE.Reset;
            CLE.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if CLE.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        CLE."Posting Date" := PostingDate;
                    end else begin
                        CLE."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    CLE.Modify;
                until CLE.Next = 0;

            VLE.Reset;
            VLE.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if VLE.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        VLE."Posting Date" := PostingDate;
                    end else begin
                        VLE."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    VLE.Modify;
                until VLE.Next = 0;

            VATEntry.Reset;
            VATEntry.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if VATEntry.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        VATEntry."Posting Date" := PostingDate;
                    end else begin
                        VATEntry."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    VATEntry.Modify;
                until VATEntry.Next = 0;

            BALE.Reset;
            BALE.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if BALE.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        BALE."Posting Date" := PostingDate;
                    end else begin
                        BALE."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    BALE.Modify;
                until BALE.Next = 0;

            FALedEntry.Reset;
            FALedEntry.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if FALedEntry.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        FALedEntry."Posting Date" := PostingDate;
                    end else begin
                        FALedEntry."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    FALedEntry.Modify;
                until FALedEntry.Next = 0;

            MainLedEntry.Reset;
            MainLedEntry.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if MainLedEntry.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        MainLedEntry."Posting Date" := PostingDate;
                    end else begin
                        MainLedEntry."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    MainLedEntry.Modify;
                until MainLedEntry.Next = 0;

            /* PLAEntry.Reset;
             PLAEntry.SetRange("Transaction No.",GenLedEntry."Transaction No.");
             if PLAEntry.FindSet then repeat
               if PostingDate <> 0D then begin
                 PLAEntry."Posting Date":= PostingDate;
               end else begin
                 PLAEntry."Posting Date":= GenLedEntry."Posting Date";
               end;
               PLAEntry.Modify;
             until PLAEntry.Next = 0;*/
            //Naveen

            TDSEntry.Reset;
            TDSEntry.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if TDSEntry.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        TDSEntry."Posting Date" := PostingDate;
                    end else begin
                        TDSEntry."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    TDSEntry.Modify;
                until TDSEntry.Next = 0;

            TCSEntry.Reset;
            TCSEntry.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if TCSEntry.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        TCSEntry."Posting Date" := PostingDate;
                    end else begin
                        TCSEntry."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    TCSEntry.Modify;
                until TCSEntry.Next = 0;

            /* FBTEntry.Reset;
             FBTEntry.SetRange("Transaction No.",GenLedEntry."Transaction No.");
             if FBTEntry.FindSet then repeat
               if PostingDate <> 0D then begin
                 FBTEntry."Posting Date":= PostingDate;
               end else begin
                 FBTEntry."Posting Date":= GenLedEntry."Posting Date";
               end;
               FBTEntry.Modify;
             until FBTEntry.Next = 0;*///Naveen

            DetCLE.Reset;
            DetCLE.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if DetCLE.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        DetCLE."Posting Date" := PostingDate;
                    end else begin
                        DetCLE."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    DetCLE.Modify;
                until DetCLE.Next = 0;

            DetVLE.Reset;
            DetVLE.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if DetVLE.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        DetVLE."Posting Date" := PostingDate;
                    end else begin
                        DetVLE."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    DetVLE.Modify;
                until DetVLE.Next = 0;

            DetGstLEdEntry.Reset;
            DetGstLEdEntry.SetRange("Transaction No.", GenLedEntry."Transaction No.");
            if DetGstLEdEntry.FindSet then
                repeat
                    if PostingDate <> 0D then begin
                        DetGstLEdEntry."Posting Date" := PostingDate;
                    end else begin
                        DetGstLEdEntry."Posting Date" := GenLedEntry."Posting Date";
                    end;
                    DetGstLEdEntry.Modify;
                until DetGstLEdEntry.Next = 0;

        end;
    end;

    var
        PostingDate: Date;
        ReversalEntry: Record "Reversal Entry";
        GenLedEntry: Record "G/L Entry";
        GLE: Record "G/L Entry";
        CLE: Record "Cust. Ledger Entry";
        VLE: Record "Vendor Ledger Entry";
        VATEntry: Record "VAT Entry";
        BALE: Record "Bank Account Ledger Entry";
        FALedEntry: Record "FA Ledger Entry";
        MainLedEntry: Record "Maintenance Ledger Entry";
        //PLAEntry: Record UnknownRecord13723;
        TDSEntry: Record "TDS Entry";
        TCSEntry: Record "TCS Entry";
        // FBTEntry: Record UnknownRecord16541;//Naveen
        DetVLE: Record "Detailed Vendor Ledg. Entry";
        DetCLE: Record "Detailed Cust. Ledg. Entry";
        DetGstLEdEntry: Record "Detailed GST Ledger Entry";
}

