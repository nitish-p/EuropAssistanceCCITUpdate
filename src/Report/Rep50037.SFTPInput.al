Report 50037 "SFTP Input"
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
        JobQueueEntry.SetRange("Object ID to Run", 50037);
        //JobQueueEntry.SETRANGE(JobQueueEntry.Status,JobQueueEntry.Status::Ready);
        if JobQueueEntry.FindFirst then begin
            UploadFile(JobQueueEntry."Input File Name");
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

    var
        JobQueueEntry: Record "Job Queue Entry";
        Dt: Text[2];
        Month1: Text[2];
        InputFileName: Text[100];

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
    // local procedure MoveFile(JobQueueEntry: Record "Job Queue Entry";Outgoing: Boolean)
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
    //     WinSCPSessionOptions := WinSCPSessionOptions.SessionOptions;
    //     WinSCPSessionOptions.HostName := JobQueueEntry."SFTP Host Name";
    //     WinSCPSessionOptions.UserName := JobQueueEntry."SFTP User Name";
    //     WinSCPSessionOptions.Password := JobQueueEntry."SFTP Password";
    //     //WinSCPSessionOptions.SshHostKeyFingerprint := JobQueueEntry."SFTP Host Key";
    //     WinSCPSessionOptions.GiveUpSecurityAndAcceptAnySshHostKey := true;

    //     WinSCPSesh := WinSCPSesh.Session;
    //     WinSCPSesh.Open(WinSCPSessionOptions);
    //     WinSCPTransferOptions := WinSCPTransferOptions.TransferOptions;
    //     WinSCPTransferOptions.TransferMode:=0;
    //     WinSCPTransferResumeSupport := WinSCPTransferOptions.ResumeSupport;
    //     WinSCPTransferResumeSupport.State(WinSCPTransferResumeSupportState.Off);
    //     if Outgoing then begin

    //       Directory.SetRange(Path, JobQueueEntry.Folder);
    //       Directory.SetRange(Directory."Is a file", true);
    //       if Directory.FindSet then repeat


    //         if not WinSCPSesh.FileExists(JobQueueEntry."Remote Path Folder" + '/' + Directory.Name) then begin
    //             WinSCPTransferResults := WinSCPSesh.PutFiles(JobQueueEntry.Folder+ Directory.Name,JobQueueEntry."Remote Path Folder",false,WinSCPTransferOptions);
    //         end;

    //           MoveFileDotNet.Move(Directory.Path + Directory.Name, JobQueueEntry."Archive Folder" + Directory.Name);


    //       until Directory.Next = 0;

    //     end;
    // end;

    // local procedure UploadFile(InputFile: Text[100])
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
    //     JobQueueEntry.SetRange("Object ID to Run",50037);
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

    //         if WinSCPSesh.FileExists(JobQueueEntry."Remote Path Folder" + '/' + InputFile) then
    //           WinSCPSesh.RemoveFiles(JobQueueEntry."Remote Path Folder" + '/' + InputFile);

    //             WinSCPTransferResults := WinSCPSesh.PutFiles(JobQueueEntry.Folder+ InputFile,JobQueueEntry."Remote Path Folder"+'/',false,WinSCPTransferOptions);

    //     end else Error('Connection Failed!');

    //     if WinSCPSesh.Opened then WinSCPSesh.Dispose();

    //     end;
    // end;
}

