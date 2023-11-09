Report 50069 "FA Report Custom"
{
    // prdp
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/FA Report Custom.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("FA Depreciation Book"; "FA Depreciation Book")
        {
            RequestFilterFields = "FA No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(FANo_FADepreciationBook; "FA Depreciation Book"."FA No.")
            {
            }
            column(DepreciationBookCode_FADepreciationBook; "FA Depreciation Book"."Depreciation Book Code")
            {
            }
            column(DepreciationMethod_FADepreciationBook; "FA Depreciation Book"."Depreciation Method")
            {
            }
            column(DepreciationStartingDate_FADepreciationBook; Format("FA Depreciation Book"."Depreciation Starting Date"))
            {
            }
            column(DepreciationEndingDate_FADepreciationBook; Format("FA Depreciation Book"."Depreciation Ending Date"))
            {
            }
            column(FAPostingGroup_FADepreciationBook; "FA Depreciation Book"."FA Posting Group")
            {
            }
            column(AcquisitionCost_FADepreciationBook; "FA Depreciation Book"."Acquisition Cost")
            {
            }
            column(Description; Description)
            {
            }
            column(FAClassCode; FAClassCode)
            {
            }
            column(FAPostDate; FAPostDate)
            {
            }
            column(ExtDocNo; ExtDocNo)
            {
            }
            column(SrNo; SrNo)
            {
            }
            column(LifeOfAsset; LifeOfAsset)
            {
            }
            column(AcqGLNumber; AcqGLNumber)
            {
            }
            column(DepGLNumber; DepGLNumber)
            {
            }
            column(LastYr; LastYr)
            {
            }
            column(mV1; monthVisible[1])
            {
            }
            column(mV2; monthVisible[2])
            {
            }
            column(mV3; monthVisible[3])
            {
            }
            column(mV4; monthVisible[4])
            {
            }
            column(mV5; monthVisible[5])
            {
            }
            column(mV6; monthVisible[6])
            {
            }
            column(mV7; monthVisible[7])
            {
            }
            column(mV8; monthVisible[8])
            {
            }
            column(mV9; monthVisible[9])
            {
            }
            column(mV10; monthVisible[10])
            {
            }
            column(mV11; monthVisible[11])
            {
            }
            column(mV12; monthVisible[12])
            {
            }
            column(deprAmt1; deprAmt[1])
            {
            }
            column(deprAmt2; deprAmt[2])
            {
            }
            column(deprAmt3; deprAmt[3])
            {
            }
            column(deprAmt4; deprAmt[4])
            {
            }
            column(deprAmt5; deprAmt[5])
            {
            }
            column(deprAmt6; deprAmt[6])
            {
            }
            column(deprAmt7; deprAmt[7])
            {
            }
            column(deprAmt8; deprAmt[8])
            {
            }
            column(deprAmt9; deprAmt[9])
            {
            }
            column(deprAmt10; deprAmt[10])
            {
            }
            column(deprAmt11; deprAmt[11])
            {
            }
            column(deprAmt12; deprAmt[12])
            {
            }
            column(LastYearDeprAmt; LastYearDeprAmt)
            {
            }

            trigger OnAfterGetRecord()
            begin
                recFA.Reset;
                recFA.SetRange("No.", "FA Depreciation Book"."FA No.");
                if recFA.FindFirst then begin
                    SrNo := recFA."Serial No.";
                    Description := recFA.Description;
                    FAClassCode := recFA."FA Class Code";
                end;

                LastYr := Date2dmy(CalcDate('<-12M>', Today), 3);
                CurrYr := Date2dmy(Today, 3);

                m := 1;
                while m < 13 do begin
                    i := 0;
                    if m < Date2dmy(Today, 2) then begin
                        monthVisible[m] := true;

                        i := Date2dmy(Today, 2) - m;
                        startDate := CalcDate('-CM', CalcDate(('<-' + Format(i) + 'M>'), Today));
                        endDate := CalcDate('CM', CalcDate(('<-' + Format(i) + 'M>'), Today));

                        DepGLNumber := '';
                        AcqGLNumber := '';
                        deprAmt[m] := 0;


                        recFALE.Reset;
                        recFALE.SetRange("FA No.", "FA Depreciation Book"."FA No.");
                        recFALE.SetRange(recFALE."FA Posting Type", recFALE."fa posting type"::Depreciation);
                        //recFALE.SETFILTER("Posting Date",'%1..%2',startDate,endDate);
                        if recFALE.FindFirst then begin

                            GenLedEntry.Reset;
                            GenLedEntry.SetRange("Entry No.", recFALE."G/L Entry No.");
                            if GenLedEntry.FindFirst then begin
                                DepGLNumber := GenLedEntry."G/L Account No.";
                            end;

                        end;

                        recFALE.Reset;
                        recFALE.SetRange("FA No.", "FA Depreciation Book"."FA No.");
                        recFALE.SetRange(recFALE."FA Posting Type", recFALE."fa posting type"::"Acquisition Cost");
                        //recFALE.SETFILTER("Posting Date",'%1..%2',startDate,endDate);
                        if recFALE.FindFirst then begin

                            GenLedEntry.Reset;
                            GenLedEntry.SetRange("Entry No.", recFALE."G/L Entry No.");
                            if GenLedEntry.FindFirst then begin
                                AcqGLNumber := GenLedEntry."G/L Account No.";
                            end;

                        end;

                        recFALE.Reset;
                        recFALE.SetRange("FA No.", "FA Depreciation Book"."FA No.");
                        recFALE.SetRange(recFALE."FA Posting Type", recFALE."fa posting type"::Depreciation);
                        recFALE.SetFilter("Posting Date", '%1..%2', startDate, endDate);
                        if recFALE.FindSet then
                            repeat

                                deprAmt[m] := deprAmt[m] + recFALE.Amount;

                            until recFALE.Next = 0;

                    end;

                    m := m + 1
                end;


                LastYearDeprAmt := 0;
                LastyrEndDate := 0D;
                Evaluate(LastyrEndDate, '3112' + Format(LastYr) + 'D');

                recFALE.Reset;
                recFALE.SetRange("FA No.", "FA Depreciation Book"."FA No.");
                recFALE.SetRange(recFALE."FA Posting Type", recFALE."fa posting type"::Depreciation);
                recFALE.SetFilter("Posting Date", '%1..%2', 0D, LastyrEndDate);
                if recFALE.FindSet then
                    repeat
                        LastYearDeprAmt := LastYearDeprAmt + recFALE.Amount;
                    until recFALE.Next = 0;

                LifeOfAsset := 0;
                if (("FA Depreciation Book"."Depreciation Starting Date" <> 0D) and ("FA Depreciation Book"."Depreciation Ending Date" <> 0D)) then begin
                    LifeOfAsset := "FA Depreciation Book"."Depreciation Ending Date" - "FA Depreciation Book"."Depreciation Starting Date";
                end;
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

    var
        recFALE: Record "FA Ledger Entry";
        recFA: Record "Fixed Asset";
        Description: Text[50];
        FAClassCode: Code[10];
        FAPostDate: Date;
        ExtDocNo: Code[35];
        SrNo: Text[30];
        LifeOfAsset: Integer;
        AcqGLNumber: Code[20];
        DepGLNumber: Code[20];
        LastYr: Integer;
        monthVisible: array[12] of Boolean;
        m: Integer;
        deprAmt: array[12] of Decimal;
        CurrYr: Integer;
        startDate: Date;
        endDate: Date;
        i: Integer;
        LastyrEndDate: Date;
        LastYearDeprAmt: Decimal;
        GenLedEntry: Record "G/L Entry";
}

