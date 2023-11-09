Report 50113 savecsv
{
    ApplicationArea = all;
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/savecsv.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            var
                TempBlob: Codeunit "Temp Blob";
                FileInStream: InStream;
            begin
                GLEntry.Reset;
                GLEntry.SetRange("Entry No.", lastentryno + 1, lastentryno + 50000);
                if GLEntry.FindFirst then begin
                    // FileName := FileMgt.ServerTempFileName('CSV');
                    // OutFile.Create(FileName);//
                    // OutFile.CreateOutstream(OutS);//

                    // OutFile.Close;
                    OutFiletxt := 'D:/GLdump/' + Format(Integer) + '.csv';
                    // FileMgt.DownloadToFile(FileName, OutFiletxt);
                    TempBlob.CREATEINSTREAM(FileInStream);
                    TempBlob.CREATEOutSTREAM(OutS);
                    Xmlport.Export(50046, OutS, GLEntry);
                    DownloadFromStream(FileInStream, '', '', '', OutFiletxt);
                end;
                lastentryno := lastentryno + 50000;
            end;

            trigger OnPreDataItem()
            begin
                SetRange(Integer.Number, 92, 100);
                lastentryno := 4506620;
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
        GLEntryData: XmlPort "GL Entry Data";
        GLEntry: Record "G/L Entry";
        lastentryno: Integer;
        FileMgt: Codeunit "File Management";
        OutFile: File;
        OutS: OutStream;
        OutFiletxt: Text;
        FileName: Text;
}

