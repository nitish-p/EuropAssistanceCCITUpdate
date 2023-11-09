Report 50033 "Export Input File 2"
{
    ProcessingOnly = true;
    UseRequestPage = true;

    dataset
    {
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

    trigger OnPostReport()
    begin

        FinScanBrd1.Reset;
        FinScanBrd1.SetRange(Exported, false);
        if FinScanBrd1.FindFirst then begin

            GenLedSetup.Get('');
            Destination := GenLedSetup."SFTP Folder (Input)" + '\';

            if StrLen(Format(Date2dmy(Today, 1))) = 1 then begin
                Dt := '0' + Format(Date2dmy(Today, 1));
            end else begin
                Dt := Format(Date2dmy(Today, 1));
            end;

            Month1 := Format(Date2dmy(Today, 2));
            if StrLen(Month1) < 2 then begin
                Month1 := '0' + Month1;
            end;

            InputFileName := 'EuropAssist_' + 'IN' + '_' + Format(Date2dmy(Today, 3)) + Month1 + Dt + '2000' + '_API';


            JobQueueEntry.Reset;
            JobQueueEntry.SetRange("Object ID to Run", 50037);
            if JobQueueEntry.FindFirst then begin
                JobQueueEntry."Input File Name" := InputFileName + '.csv';
                JobQueueEntry.Modify;
            end;

            FinalFileName := Destination + InputFileName + '.csv';

            // varXmlFile.TextMode := true;
            // varXmlFile.WriteMode := true;
            // varXmlFile.Create(FinalFileName, Textencoding::UTF8);

            FinScanBrd.Reset;
            FinScanBrd.SetRange(FinScanBrd.Type, FinScanBrd.Type::Input);
            FinScanBrd.SetRange(Exported, false);
            if FinScanBrd.FindSet then
                repeat

                    Filedata.AddText(Format(FinScanBrd."Source Code") + '|' + FinScanBrd."Record ID" + '|' + Format(FinScanBrd."Status Indicator") + '|' + Format(FinScanBrd."Record Type")
                    + '|' + Format(FinScanBrd.Gender) + '|' + FinScanBrd."Full Name" + '|' + FinScanBrd."Address 1" + '|' + FinScanBrd."Address 2" + '|' + FinScanBrd."Address 3"
                    + '|' + FinScanBrd.City + '|' + FinScanBrd."County / State" + '|' + FinScanBrd."Zip / Postcode" + '|' + FinScanBrd.Country + '|' + FinScanBrd."Date Of Birth"
                    + '|' + FinScanBrd."National ID" + '|' + FinScanBrd."Additional Field 1" + '|' + FinScanBrd."Additional Field 2" + '|' + FinScanBrd."Additional Field 3"
                    + '|' + FinScanBrd."Additional Field 4" + '|' + FinScanBrd."Additional Field 5" + '|' + FinScanBrd."Comment 1" + '|' + FinScanBrd."Comment 2");

                    FinScanBrd."Input File Name" := InputFileName;
                    FinScanBrd.Filedata.CreateOutStream(OutStrm);
                    Filedata.Write(OutStrm);
                    FinScanBrd.Exported := true;
                    FinScanBrd.Modify;

                    Vendor.Reset;
                    Vendor.SetRange("No.", FinScanBrd."Vendor Code");
                    if Vendor.FindFirst then begin
                        Vendor."Input File Name" := InputFileName;
                        Vendor."Bridge Exported" := false;
                        Vendor.Modified := false;
                        Vendor.Modify;
                    end;

                until FinScanBrd.Next = 0;

            //varXmlFile.Close;



            UploadFile(InputFileName);

        end;

        JobQueueEntry.Reset;
        JobQueueEntry.SetRange(JobQueueEntry."Job Queue Category Code", 'FIN SCAN');
        JobQueueEntry.SetFilter(JobQueueEntry.Status, '<>%1', 0);
        if JobQueueEntry.FindSet then
            repeat
                JobQueueEntry.Status := JobQueueEntry.Status::Ready;
                JobQueueEntry.Modify;
            until JobQueueEntry.Next = 0;
    end;

    trigger OnPreReport()
    begin

        recVendor.Reset;
        recVendor.SetRange("Bridge Exported", false);
        recVendor.SetRange(Modified, true);
        if recVendor.FindFirst then begin

            Vendor.Reset;
            Vendor.SetRange("Bridge Exported", false);
            Vendor.SetRange(Modified, true);
            if Vendor.FindSet then
                repeat

                    FinScanBrd.Reset;
                    FinScanBrd.SetCurrentkey("Entry No.");
                    FinScanBrd.Ascending(true);
                    FinScanBrd.SetFilter("Entry No.", '<>%1', 0);
                    if FinScanBrd.FindLast then begin
                        LastEntryNo := FinScanBrd."Entry No." + 1;
                    end else begin
                        LastEntryNo := 1;
                    end;

                    FinScanVendorBridge.Init;
                    FinScanVendorBridge."Entry No." := LastEntryNo;
                    if Vendor."Created On" > 20200605D then begin
                        FinScanVendorBridge."Source Code" := 'EA_IN';
                    end else begin
                        FinScanVendorBridge."Source Code" := Vendor."Source Code";
                    end;
                    FinScanVendorBridge."Record ID" := 'INNAV' + Vendor."No.";
                    FinScanVendorBridge."Status Indicator" := Vendor."Status-Indicator";
                    FinScanVendorBridge."Record Type" := Vendor."Record Type";
                    FinScanVendorBridge.Gender := Vendor.Gender;

                    VendorBankAccount.Reset;
                    VendorBankAccount.SetRange("Vendor No.", Vendor."No.");
                    VendorBankAccount.SetFilter(Name, '<>%1', '');
                    if VendorBankAccount.FindFirst then begin
                        FinScanVendorBridge."Full Name" := ConvertStr(ConvertStr(CopyStr(VendorBankAccount.Name, 1, 30), '|', ' '), ',', ' ');
                    end else begin
                        FinScanVendorBridge."Full Name" := ConvertStr(ConvertStr(CopyStr(Vendor.Name, 1, 30), '|', ' '), ',', ' ');
                    end;

                    FinScanVendorBridge."Address 1" := ConvertStr(ConvertStr(CopyStr(Vendor.Address, 1, 100), '|', ' '), ',', ' ');
                    FinScanVendorBridge."Address 2" := '';
                    FinScanVendorBridge."Address 3" := '';
                    FinScanVendorBridge.City := ConvertStr(ConvertStr(Vendor.City, '|', ' '), ',', ' ');

                    StateRec.Reset;
                    StateRec.SetRange(Code, Vendor."State Code");
                    ;
                    if StateRec.FindFirst then begin
                        FinScanVendorBridge."County / State" := ConvertStr(ConvertStr(StateRec.Description, '|', ' '), ',', ' ');
                    end;

                    FinScanVendorBridge."Zip / Postcode" := Vendor."Post Code";
                    FinScanVendorBridge.Country := Vendor."Country/Region Code";

                    if Vendor."Date Of Birth" <> 0D then begin
                        Month := Format(Date2dmy(Vendor."Date Of Birth", 2));
                        if StrLen(Month) < 2 then
                            Month := '0' + Month;
                        Day := Format(Date2dmy(Vendor."Date Of Birth", 1));
                        if StrLen(Day) < 2 then
                            Day := '0' + Day;
                        Yr := Format(Date2dmy(Vendor."Date Of Birth", 3));
                        FinScanVendorBridge."Date Of Birth" := Yr + Month + Day;
                    end else begin
                        FinScanVendorBridge."Date Of Birth" := '';
                    end;

                    FinScanVendorBridge."National ID" := Vendor."P.A.N. No.";

                    FinScanVendorBridge."Additional Field 1" := '';
                    FinScanVendorBridge."Additional Field 2" := '';
                    FinScanVendorBridge."Additional Field 3" := '';
                    FinScanVendorBridge."Additional Field 4" := '';
                    FinScanVendorBridge."Additional Field 5" := '';
                    FinScanVendorBridge."Comment 1" := '';
                    FinScanVendorBridge."Comment 2" := '';
                    FinScanVendorBridge.Type := FinScanVendorBridge.Type::Input;
                    FinScanVendorBridge."Inserted On" := CurrentDatetime;
                    FinScanVendorBridge."Vendor Code" := Vendor."No.";
                    FinScanVendorBridge.Insert(true);

                    Vendor.Validate("Bridge Exported", true);
                    Vendor.Validate("Record ID", 'INNAV' + Vendor."No.");
                    //Vendor.VALIDATE(Modified,FALSE);
                    Vendor.Modify;

                until Vendor.Next = 0;

        end;
    end;

    var
        FileMgt: Codeunit "File Management";
        FileName: Text[250];
        OutFile: File;
        OutS: OutStream;
        Xmlp: XmlPort 50018;
        Destination: Text[100];
        FinalFileName: Text[100];
        GenLedSetup: Record "General Ledger Setup";
        InputFileName: Text[100];
        Dt: Text[2];
        FinScanVendorBridge: Record 50018;
        Vendor: Record Vendor;
        Month: Code[2];
        Day: Code[2];
        Yr: Code[4];
        FinScanBrd: Record 50018;
        LastEntryNo: Integer;
        VendorBankAccount: Record "Vendor Bank Account";
        StateRec: Record State;
        varXmlFile: File;
        varOutputStream: OutStream;
        varInputStream: InStream;
        ExportInputFile: XmlPort 50021;
        // [RunOnClient]
        streamWriter: Codeunit DotNet_StreamWriter;
        encoding: Codeunit Encoding;
        infile: File;
        instrm: InStream;
        streamReader: Codeunit DotNet_StreamReader;
        newfile: File;
        //[RunOnClient]
        encd: Codeunit DotNet_StreamWriter;
        VendCode: Code[20];
        FinScanBrd1: Record 50018;
        recVendor: Record Vendor;
        Month1: Text[2];
        JobQueueEntry: Record "Job Queue Entry";
        OutputFileName: Text[100];
        AuditFileName: Text[100];
        Filedata: BigText;
        OutStrm: OutStream;

    procedure UploadFile(InputFile: Text[100])
    var
        PostUrl: text;
        Httpclint: HttpClient;
        HttpContnt: HttpContent;
        HttpResponseMsg: HttpResponseMessage;
        HttpHdr: HttpHeaders;
        body: Text;
        ApiResult: Text;
        JObject: JsonObject;
        jtoken: JsonToken;
    begin

        PostUrl := 'Finscan Fin Scan';
        HttpContnt.WriteFrom(body);
        HttpContnt.GetHeaders(HttpHdr);
        HttpHdr.Add('app-name', 'Navision');
        HttpHdr.Add('x-token', '241a4d366da38e2d53361dbe65a36d023065f399');
        HttpHdr.Remove('Content-Type');
        HttpHdr.Add('Content-Type', 'application/json');


        if Httpclint.Post(PostUrl, HttpContnt, HttpResponseMsg) then begin
            HttpResponseMsg.Content.ReadAs(ApiResult);
            JObject.ReadFrom(ApiResult);
            JObject.Get('statusCode', jtoken);
            MESSAGE('statusCode', jtoken.AsValue().AsText());
        end;
    end;

    //     procedure UploadFile(InputFile: Text[100])
    //     var
    //         WinSCPSesh: dotnet Session;
    //         WinSCPSessionOptions: dotnet SessionOptions;
    //         WinSCPTransferOptions: dotnet TransferOptions;
    //         WinSCPTransferResults: dotnet TransferOperationResult;
    //         Directory: Record File;
    //         WinSCPTransferResumeSupport: dotnet TransferResumeSupport;
    //         WinSCPTransferResumeSupportState: dotnet TransferResumeSupportState;
    //         MoveFileDotNet: dotnet File;
    //         WinSCPProtocol: dotnet Protocol;
    //         WinSCPFtpSecure: dotnet FtpSecure;
    //         WinSCPRemoteInfoColl: dotnet RemoteDirectoryInfo;
    //         WinSCPRemoteInfo: dotnet RemoteFileInfo;
    //         JobQueueEntry: Record "Job Queue Entry";
    //     begin

    //         JobQueueEntry.Reset;
    //         JobQueueEntry.SetRange("Object ID to Run", 50037);
    //         //JobQueueEntry.SETRANGE(JobQueueEntry.Status,JobQueueEntry.Status::Ready);
    //         if JobQueueEntry.FindFirst then begin

    //             WinSCPSessionOptions := WinSCPSessionOptions.SessionOptions;
    //             WinSCPSessionOptions.HostName := JobQueueEntry."SFTP Host Name";
    //             WinSCPSessionOptions.UserName := JobQueueEntry."SFTP User Name";
    //             WinSCPSessionOptions.Password := JobQueueEntry."SFTP Password";
    //             WinSCPSessionOptions.SshHostKeyFingerprint := JobQueueEntry."SFTP Host Key";

    //             WinSCPSesh := WinSCPSesh.Session;
    //             WinSCPSesh.Open(WinSCPSessionOptions);

    //             if WinSCPSesh.Opened then begin

    //                 WinSCPTransferOptions := WinSCPTransferOptions.TransferOptions;
    //                 WinSCPTransferOptions.TransferMode := 0;
    //                 WinSCPTransferResumeSupport := WinSCPTransferOptions.ResumeSupport;
    //                 WinSCPTransferResumeSupport.State(WinSCPTransferResumeSupportState.Off);

    //                 if WinSCPSesh.FileExists(JobQueueEntry."Remote Path Folder" + '/' + InputFile) then
    //                     WinSCPSesh.RemoveFiles(JobQueueEntry."Remote Path Folder" + '/' + InputFile);

    //                 WinSCPTransferResults := WinSCPSesh.PutFiles(JobQueueEntry.Folder + InputFile, JobQueueEntry."Remote Path Folder" + '/', false, WinSCPTransferOptions);

    //             end else
    //                 Error('Connection Failed!');

    //             if WinSCPSesh.Opened then WinSCPSesh.Dispose();

    //         end;
    //     end;
}

