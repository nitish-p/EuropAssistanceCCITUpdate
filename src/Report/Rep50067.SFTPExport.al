Report 50067 "SFTP Export"
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

        JobQueueEntry.Reset;
        JobQueueEntry.SetRange("Object ID to Run", 50067);
        //JobQueueEntry.SETRANGE(JobQueueEntry.Status,JobQueueEntry.Status::Ready);
        if JobQueueEntry.FindFirst then begin
            UploadFile(JobQueueEntry."Input File Name");
        end;
    end;

    var
        JobQueueEntry: Record "Job Queue Entry";
        Dt: Text[2];
        Month1: Text[2];
        InputFileName: Text[100];

    local procedure UploadFile(OutputFile: Text[100])

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

    //     local procedure UploadFile(InputFile: Text[100])
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
    //     begin

    //         WinSCPSessionOptions := WinSCPSessionOptions.SessionOptions;
    //         WinSCPSessionOptions.HostName := 's3.amazonaws.com';
    //         WinSCPSessionOptions.UserName := 'Navision_team';
    //         WinSCPSessionOptions.Password := '_%O=W{7y&9jcUrm';
    //         //WinSCPSessionOptions.SshHostKeyFingerprint := JobQueueEntry."SFTP Host Key";
    //         WinSCPSessionOptions.GiveUpSecurityAndAcceptAnyTlsHostCertificate:=true;
    //         WinSCPSessionOptions.GiveUpSecurityAndAcceptAnySshHostKey := true;

    //         WinSCPSesh := WinSCPSesh.Session;
    //         WinSCPSesh.Open(WinSCPSessionOptions);

    //         if WinSCPSesh.Opened then begin
    //         WinSCPTransferOptions := WinSCPTransferOptions.TransferOptions;
    //         WinSCPTransferOptions.TransferMode:=0;
    //         WinSCPTransferResumeSupport := WinSCPTransferOptions.ResumeSupport;
    //         WinSCPTransferResumeSupport.State(WinSCPTransferResumeSupportState.Off);

    //             if WinSCPSesh.FileExists('' + '/' + InputFile) then
    //             //  WinSCPSesh.RemoveFiles(JobQueueEntry."Remote Path Folder" + '/' + InputFile);

    //                 WinSCPTransferResults := WinSCPSesh.PutFiles('\\172.16.5.4\D\Fin Scan\SFTP\Input\'+ InputFile,JobQueueEntry."Remote Path Folder"+'/',false,WinSCPTransferOptions);

    //         end else Error('Connection Failed!');

    //         if WinSCPSesh.Opened then WinSCPSesh.Dispose();
    //     end;
}

