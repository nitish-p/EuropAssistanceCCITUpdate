Report 50036 "SFTP Output"
{
    ProcessingOnly = true;

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

        Month := '';
        Day := '';
        Yr := '';
        OutputFileName := '';

        JobQueueEntry.Reset;
        JobQueueEntry.SetRange("Object ID to Run", 50036);
        if JobQueueEntry.FindFirst then begin

            OutputFileName := JobQueueEntry."Expected Rollup File";

            Vend.Reset;
            Vend.SetRange("Rollup File Name", OutputFileName);
            if not Vend.FindFirst then begin
                DownloadFile(OutputFileName);
            end;
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

        if StrLen(Format(Date2dmy(Today, 1))) = 1 then begin
            Dt := '0' + Format(Date2dmy(Today, 1));
        end else begin
            Dt := Format(Date2dmy(Today, 1));
        end;

        Month1 := Format(Date2dmy(Today, 2));
        if StrLen(Month1) < 2 then begin
            Month1 := '0' + Month1;
        end;

        OutputFileName := 'EA_IN_Rollup_' + Format(Date2dmy(Today, 3)) + Month1 + Dt + '.txt';

        JobQueueEntry.Reset;
        JobQueueEntry.SetRange("Object ID to Run", 50036);
        if JobQueueEntry.FindFirst then begin
            JobQueueEntry."Expected Rollup File" := OutputFileName;
            JobQueueEntry.Modify;
        end;

        JobQueueEntry.Reset;
        JobQueueEntry.SetRange("Object ID to Run", 50035);
        if JobQueueEntry.FindFirst then begin
            JobQueueEntry."Expected Rollup File" := OutputFileName;
            JobQueueEntry.Modify;
        end;
    end;

    var
        JobQueueEntry: Record "Job Queue Entry";
        OutputFileName: Text[100];
        DateString: Text[10];
        Month: Text[2];
        Yr: Text[4];
        Day: Text[2];
        Vend: Record Vendor;
        Dt: Text[2];
        Month1: Text[2];

    local procedure DownloadFile(OutputFile: Text[100])

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

    // local procedure DownloadFile(OutputFile: Text[100])
    // var
    //     WinSCPSesh: dotnet Session;
    //     WinSCPSessionOptions: dotnet SessionOptions;
    //     WinSCPTransferOptions: dotnet TransferOptions;
    //     WinSCPTransferResults: dotnet TransferOperationResult;
    //     Directory: Record File;
    //     WinSCPTransferResumeSupport: dotnet TransferResumeSupport;
    //     WinSCPTransferResumeSupportState: dotnet TransferResumeSupportState;
    //     MoveFileDotNet: dotnet File;
    //     WinSCPProtocol: dotnet Protocol;
    //     WinSCPFtpSecure: dotnet FtpSecure;
    //     WinSCPRemoteInfoColl: dotnet RemoteDirectoryInfo;
    //     WinSCPRemoteInfo: dotnet RemoteFileInfo;
    // begin
    //     JobQueueEntry.Reset;
    //     JobQueueEntry.SetRange("Object ID to Run",50036);
    //     if JobQueueEntry.FindFirst then begin

    //     WinSCPSessionOptions := WinSCPSessionOptions.SessionOptions;
    //     WinSCPSessionOptions.HostName := JobQueueEntry."SFTP Host Name";
    //     WinSCPSessionOptions.UserName := JobQueueEntry."SFTP User Name";
    //     WinSCPSessionOptions.Password := JobQueueEntry."SFTP Password";
    //     //WinSCPSessionOptions.SshHostKeyFingerprint := JobQueueEntry."SFTP Host Key";
    //     WinSCPSessionOptions.GiveUpSecurityAndAcceptAnySshHostKey := true;

    //     WinSCPSesh := WinSCPSesh.Session;
    //     WinSCPSesh.Open(WinSCPSessionOptions);

    //     if WinSCPSesh.Opened then begin

    //     WinSCPTransferOptions := WinSCPTransferOptions.TransferOptions;
    //     WinSCPTransferOptions.TransferMode:=0;
    //     WinSCPTransferResumeSupport := WinSCPTransferOptions.ResumeSupport;
    //     WinSCPTransferResumeSupport.State(WinSCPTransferResumeSupportState.Off);

    //     WinSCPTransferResults := WinSCPSesh.GetFiles(JobQueueEntry."Remote Path Folder"+'/'+OutputFile,JobQueueEntry.Folder,false,WinSCPTransferOptions);
    //     WinSCPSesh.RemoveFiles(JobQueueEntry."Remote Path Folder"+'/'+OutputFile)
    //     end else Error('Connection Failed!');

    //     if WinSCPSesh.Opened then WinSCPSesh.Dispose();

    //     end;
    // end;
}

