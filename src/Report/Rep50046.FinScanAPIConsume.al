Report 50046 "Fin Scan API Consume"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './Layouts/Fin Scan API Consume.rdl';
    ProcessingOnly = true;
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
        //recVendor.SetFilter("Created On", '>%1', 20200605D);
        //recVendor.SetRange("No.", 'ET000000006');
        if recVendor.FindSet then
            repeat
                uploadToFinScan(recVendor."No.");
            until recVendor.Next = 0;

        //uploadToFinScan('VDMEM000033');
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
            //PostUrl := 'https://hosted5.finscan.com/isi/wrapper/v4.8.2/wrapper/lookup';
            PostUrl := 'https://hosted5.finscan.com/isi_test/wrapper/v4.8.2/wrapper/lookup';

            JObject.Add('organizationName', 'Europ_assistance,');
            JObject.Add('userName', 'webservices_IN');
            JObject.Add('password', 't9SWk8Tc8AAv');
            //JObject.Add('password', 'GcF8XMdsPh');
            JObject.Add('applicationId', 'EA_IN');
            JObject.Add('searchType', SearchType);
            JObject.Add('clientId', 'INNAV' + vend."No.");
            JObject.Add('clientStatus', 0);
            JObject.Add('gender', '');
            JObject.Add('nameLine', vend.Name);
            JObject.Add('addressLine1', vend.Address);
            JObject.Add('addressLine2', '');
            JObject.Add('clientSearchCode', 0);
            JObject.Add('returnComplianceRecords', 0);
            JObject.Add('addClient', 1);
            JObject.Add('sendToReview', 1);
            JObject.Add('updateUserFields', 0);
            JObject.Add('userField1Label', 'Country');
            JObject.Add('userField1Value', 'IN');
            JObject.Add('userField3Label', 'National Tax');
            JObject.Add('userField3Value', vend."P.A.N. No.");
            JObject.Add('returnCategory', 0);
            JObject.Add('returnSourceLists', 0);
            JObject.Add('generateclientId', 0);
            JObject.Add('skipSearch', 0);
            JObject.Add('processUBO', 0);
            JObject.Add('userFieldsCountry', '[1]');


            /*body := '{'
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
            + '}';*/

            //MESSAGE(body);
            body := Format(Json);
            MESSAGE(body);

            HttpContnt.WriteFrom(body);
            HttpContnt.GetHeaders(HttpHdr);
            HttpHdr.Add('user', 'EA_IN');
            //HttpHdr.Add('password', 'GcF8XMdsPh');
            HttpHdr.Add('password', 't9SWk8Tc8AAv');
            HttpHdr.Remove('Content-Type');
            HttpHdr.Add('Content-Type', 'application/json');

            if Httpclint.Post(PostUrl, HttpContnt, HttpResponseMsg) then begin
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
                    vend.Blocked := vend.Blocked::Payment;//Np 171123
                end;
                if jtoken.AsValue().AsText() = '2' then begin
                    vend."API Screening Result" := vend."api screening result"::FAIL;
                    vend."Screening Result" := vend."screening result"::FAIL;
                    vend."Fin Scan API Screening" := true;
                    vend.Blocked := vend.Blocked::Payment;//Np 171123
                end;

                vend.Modify;
            end else
                Message('2' + RegistrationError);

        end;

    end;
}

