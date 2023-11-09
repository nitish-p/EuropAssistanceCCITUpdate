Report 50046 "Fin Scan API Consume"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fin Scan API Consume.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
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

        recVendor.Reset;
        recVendor.SetRange("Fin Scan API Screening", false);
        recVendor.SetFilter("Created On", '>%1', 20200605D);
        if recVendor.FindSet then
            repeat
                uploadToFinScan(recVendor."No.");
            until recVendor.Next = 0;

        uploadToFinScan('VDMEM000033');
    end;

    var
        recVendor: Record Vendor;

    [TryFunction]

    procedure uploadToFinScan(VendorNumber: Code[20])
    var
        HttpWebRequestMgt: Codeunit "Http Web Request Mgt.";
        Url: Text;
        Json: Text;
        // HttpStatusCode: dotnet HttpStatusCode;
        // ResponseHeaders: dotnet NameValueCollection;
        REGAccessLevelEnum: Codeunit AccSchedManagement;
        PostUrl: Text;
        Params: Text;
        JObject: jsonObject;
        Registration: Record "Payment Terms";
        ApiResult: Text;
        // TempBlob: Record TempBlob;
        // RequestBlob: Record TempBlob;
        Instr: InStream;
        body: Text;
        vend: Record Vendor;
        RegistrationSuccess: label 'Successfully Created';
        RegistrationError: label 'Error when contacting api';
        //  Url: Text;
        // Json: Text;
        Httpclint: HttpClient;
        HttpContnt: HttpContent;
        HttpResponseMsg: HttpResponseMessage;
        HttpHdr: HttpHeaders;
        SearchType: Text;
        jtoken: JsonToken;
    begin

        SearchType := '';

        vend.Reset;
        vend.SetRange("No.", VendorNumber);
        if vend.FindFirst then begin

            if vend."Record Type" = 'O' then begin
                SearchType := '1';
            end else begin
                SearchType := '0'
            end;
            /*
            //PostUrl:=//'https:
            //hosted5.finscan.com/isi_test/wrapper/v4.8.2/wrapper/lookup';
            */
            PostUrl := 'https://hosted5.finscan.com/isi/wrapper/v4.8.2/wrapper/lookup';

            // HttpWebRequestMgt.Initialize(PostUrl);

            // HttpWebRequestMgt.DisableUI;
            //  HttpContnt.GetHeaders(HttpHdr);
            HttpHdr.Add('user', 'EA_IN');
            HttpHdr.Add('password', 'GcF8XMdsPh');
            HttpHdr.Remove('Content-Type');
            HttpHdr.Add('Content-Type', 'application/json');

            // HttpWebRequestMgt.SetMethod('POST');
            // HttpWebRequestMgt.SetContentType('application/json');
            // HttpWebRequestMgt.SetReturnType('application/json');
            //HttpWebRequestMgt.AddHeader('user','EA_IN');
            //HttpWebRequestMgt.AddHeader('password','GcF8XMdsPh');

            body := '{'
            + '"organizationName":"Europ_assistance",'
            + '"userName":"webservices_IN",'
            + '"password":"GcF8XMdsPh",'
            + '"applicationId":"EA_IN",'
            + '"searchType":"' + SearchType + '",'
            + '"clientId":"' + 'INNAV' + vend."No." + '",'
            + '"clientStatus":' + '0,'
            + '"gender":' + 'null,'
            + '"nameLine":"' + vend.Name + '",'
            + '"addressLine1":"' + vend.Address + '",'
            + '"addressLine2":' + ' ,'
            + '"clientSearchCode":' + '0,'
            + '"returnComplianceRecords":' + '0,'
            + '"addClient":' + '1,'
            + '"sendToReview":' + '1,'
            + '"updateUserFields":' + '0,'
            + '"userField1Label":' + '"Country",'
            + '"userField1Value":' + '"IN",'
            + '"userField3Label":' + '"National Tax",'
            + '"userField3Value":"' + vend."P.A.N. No." + '",'
            + '"returnCategory":' + '0,'
            + '"returnSourceLists":' + '0,'
            + '"generateclientId":' + '0,'
            + '"skipSearch":' + '0,'
            + '"processUBO":' + '0,'
            + '"userFieldsCountry":' + '[1]'
            + '}';

            //MESSAGE(body);
            MESSAGE(body);

            HttpContnt.WriteFrom(body);
            if Httpclint.Post(PostUrl, HttpContnt, HttpResponseMsg) then begin
                // HttpWebRequestMgt.AddBodyAsText(body);

                // TempBlob.Init;

                // TempBlob.Blob.CreateInstream(Instr);

                // if HttpWebRequestMgt.GetResponse(Instr,HttpStatusCode,ResponseHeaders) then begin

                //MESSAGE('httpstatuscode : '+HttpStatusCode.ToString);

                // MESSAGE(ResponseHeaders.ToString);

                // ApiResult := TempBlob.ReadAsText('',Textencoding::UTF8);

                // MESSAGE(ApiResult);

                HttpResponseMsg.Content.ReadAs(ApiResult);
                JObject.ReadFrom(ApiResult);
                // MESSAGE(JObject.GetValue('status').ToString);
                //MESSAGE(JObject.GetValue('message').ToString);
                JObject.Get('status', jtoken);
                if jtoken.AsValue().AsText() = '0' then begin
                    vend."API Screening Result" := vend."api screening result"::PASS;
                    vend."Screening Result" := vend."screening result"::PASS;
                    vend."Fin Scan API Screening" := true;
                end;
                if jtoken.AsValue().AsText() = '1' then begin
                    vend."API Screening Result" := vend."api screening result"::PENDING;
                    vend."Screening Result" := vend."screening result"::PENDING;
                    vend."Fin Scan API Screening" := true;
                end;
                if jtoken.AsValue().AsText() = '2' then begin
                    vend."API Screening Result" := vend."api screening result"::FAIL;
                    vend."Screening Result" := vend."screening result"::FAIL;
                    vend."Fin Scan API Screening" := true;
                end;

                vend.Modify;
            end else
                Message('2' + RegistrationError);

        end;

    end;
}

