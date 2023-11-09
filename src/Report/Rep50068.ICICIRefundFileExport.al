Report 50068 "ICICI Refund File Export"
{
    Permissions = TableData "Bank Account Ledger Entry" = rimd;
    ProcessingOnly = true;
    UseRequestPage = false;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = where(Number = const(1));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnPostDataItem()
            var
                TempBlob: Codeunit "Temp Blob";
                FileInStream: InStream;
            begin

                FileName := '';
                FileNo := 0;

                GenLedSetup.Get('');
                BALE.Reset;
                BALE.SetCurrentkey("File Exported On", "File No.");
                BALE.Ascending(true);
                BALE.SetRange("File Exported On", Today);
                BALE.SetRange("Bank Account No.", 'BANK0001');
                BALE.SetFilter("File No.", '<>%1', 0);
                if BALE.FindLast then begin
                    FileNo := BALE."File No." + 1;
                end else begin
                    FileNo := 1;
                end;

                if StrLen(Format(Date2dmy(Today, 1))) = 1 then begin
                    Dt := '0' + Format(Date2dmy(Today, 1));
                end else begin
                    Dt := Format(Date2dmy(Today, 1));
                end;

                Month1 := Format(Date2dmy(Today, 2));
                if StrLen(Month1) < 2 then begin
                    Month1 := '0' + Month1;
                end;

                FileName := 'EUROPQ_EUROPQUPLDH2H_' + Dt + Month1 + Format(Date2dmy(Today, 3)) + '_' + Format(FileNo) + '.txt';
                FinalFileName := GenLedSetup."ICICI H2H File Path" + FileName;
                FinalFileName1 := GenLedSetup."NAV H2H File Path" + FileName;
                OutFiletxt := 'D:/GLdump/' + Format(Integer) + '.csv';
                // FileMgt.DownloadToFile(FileName, OutFiletxt);
                TempBlob.CREATEINSTREAM(FileInStream);
                TempBlob.CREATEOutSTREAM(OutS);
                Xmlp.Export;
                DownloadFromStream(FileInStream, '', '', '', OutFiletxt);
                //xlWorkBook.SaveCopyAs(GenLedSetup."ICICI H2H File Path"+FileName);
                //xlWorkBook.SaveCopyAs(GenLedSetup."NAV H2H File Path"+FileName);

                // TempFileName := FileMgt.ServerTempFileName('TXT');
                // OutFile.Create(TempFileName);
                // OutFile.CreateOutstream(OutS);
                // Xmlp.Filename(TempFileName);
                // Xmlp.SetDestination(OutS);
                // Xmlp.Export;
                // OutFile.Close;

                // FileMgt.DownloadToFile(TempFileName,FinalFileName);
                // FileMgt.DownloadToFile(TempFileName,FinalFileName1);
                Commit;

                BALE.Reset;
                BALE.SetRange(BALE."Document Type", BALE."document type"::Refund);
                BALE.SetRange("Suggsted Payment", true);
                BALE.SetRange("Bank Account No.", 'BANK0001');
                if BALE.FindSet then
                    repeat
                        BALE."Payment File Name" := FileName;
                        BALE."File No." := FileNo;
                        BALE."Suggsted Payment" := false;
                        BALE."File Exported On" := Today;
                        BALE.Modify;
                    until BALE.Next = 0;
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
        GenLedSetup: Record "General Ledger Setup";
        BALE: Record "Bank Account Ledger Entry";
        FileNo: Integer;
        FileName: Text[100];
        Dt: Text[2];
        Month1: Text[2];
        FileMgt: Codeunit "File Management";
        OutFile: File;
        OutS: OutStream;
        Xmlp: XmlPort "Export ICICI Refund File";
        TempFileName: Text[250];
        FinalFileName: Text[100];
        FinalFileName1: Text[100];
        OutFiletxt: Text;
}

