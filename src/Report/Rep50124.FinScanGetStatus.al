report 50124 "FinScan Get Status"
{
    ApplicationArea = All;
    Caption = 'FinScan Get Status';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = where("API Screening Result" = filter(PENDING | PASS));
            column(No; "No.")
            {
            }
            trigger OnAfterGetRecord()
            begin

                if Vendor."Record Type" = 'O' then begin
                    SearchType := '1';
                end else begin
                    SearchType := '0'
                end;

                GetStatus;
                Vendor.Modify();

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    local procedure GetStatus()
    var
        PostUrl: Text;
        Httpclint: HttpClient;
        HttpContnt: HttpContent;
        HttpResponseMsg: HttpResponseMessage;
        HttpHdr: HttpHeaders;
        SearchType: Text;
        jtoken: JsonToken;
        body: Text;
    begin

        //PostUrl := 'https://hosted5.finscan.com/isi/wrapper/v4.8.2/wrapper/clients/status';
        PostUrl := 'https://hosted5.finscan.com/isi_test/wrapper/v4.8.2/wrapper/clients/status';
        body := CreateJSon;
        HttpContnt.WriteFrom(body);
        HttpContnt.GetHeaders(HttpHdr);
        HttpHdr.Add('user', 'EA_IN');
        //HttpHdr.Add('password', 'GcF8XMdsPh');
        HttpHdr.Add('password', 't9SWk8Tc8AAv');//UAT Password
        HttpHdr.Remove('Content-Type');
        HttpHdr.Add('Content-Type', 'application/json');

        if Httpclint.Post(PostUrl, HttpContnt, HttpResponseMsg) then begin

            HttpResponseMsg.Content.ReadAs(ResponseText);
            readStatus()
        end;
    end;

    procedure CreateJSon(): Text
    var
        Jobject: JsonObject;
        Jarray: JsonArray;
        LJobject: JsonObject;
    begin
        Jobject.Add('organizationName', 'Europ_assistance');
        Jobject.Add('userName', 'webservices_IN');
        //Jobject.Add('password', 'GcF8XMdsPh');
        JObject.Add('password', 't9SWk8Tc8AAv');
        Jobject.Add('applicationId', 'EA_IN');
        Jobject.Add('searchType', SearchType);
        Jobject.Add('clientId', 'INNAV' + Vendor."No.");
        //Jobject.Add('clientId', 'INNAVET000000006');
        Jobject.Add('returnComplianceRecords', '0');

        LJobject.Add('statusString', 'Confirmed False Positive');//hard fixed as per excel shared
        LJobject.Add('status', 0);
        Jarray.Add(LJobject);

        Jobject.Add('customStatus', Jarray);
        Jobject.Add('processFinScanPremium', 0);
        exit(Format(Jobject));
    end;

    /*
        { 
              "organizationName":"Europ_assistance",
              "userName":"webservices_HL",
              "password":"******",
              "applicationId":"EA_HL",
              "searchType":1,
              "clientId":"SAX_N_ADRBNK;15701;",
              "returnComplianceRecords":0,
              "customStatus":[
        {
          "statusString" : "Confirmed False Positive",
          "status" : 0
        }
        ],
              "processFinScanPremium":0
        }
    */

    procedure readStatus()
    var
        Jobject: JsonObject;
        Jtoken: JsonToken;
        jarray: JsonArray;
        jvalue: JsonValue;

    begin

        Jobject.ReadFrom(ResponseText);
        if Jobject.Get('status', Jtoken) then begin
            if jtoken.AsValue().AsText() = '0' then begin
                Vendor."API Screening Result" := Vendor."api screening result"::PASS;
                Vendor."Screening Result" := Vendor."screening result"::PASS;
                Vendor."Fin Scan API Screening" := true;
                Vendor.Blocked := Vendor.Blocked::" ";
            end;
            if jtoken.AsValue().AsText() = '1' then begin
                Vendor."API Screening Result" := Vendor."api screening result"::PENDING;
                Vendor."Screening Result" := Vendor."screening result"::PENDING;
                Vendor."Fin Scan API Screening" := true;
                Vendor.Blocked := Vendor.Blocked::Payment;//Np 171223
            end;
            if jtoken.AsValue().AsText() = '2' then begin
                Vendor."API Screening Result" := Vendor."api screening result"::FAIL;
                Vendor."Screening Result" := Vendor."screening result"::FAIL;
                Vendor."Fin Scan API Screening" := true;
                Vendor.Blocked := Vendor.Blocked::Payment;//Np 171223
            end;
        end;

    end;

    var
        ResponseText: Text;
        SearchType: Text;

    /*
    {
        "status": 1,
        "message": "Lookup PENDING:\r\nINFO: 3 PENDING records found",
        "resultsCount": 3,
        "hitCount": 0,
        "pendingCount": 3,
        "safeCount": 0,
        "clientId": "HLMEAD_202203251612",
        "version": "v6.0.0.4 - Released January 24, 2023",
        "isiReserved": "",



        "clientKey": 1169889602,
        "complianceRecords": [
            {
                "pairStatus": "New",
                "pairReason": "New",
                "pairComments": "",
                "applicationDisplayName": "HL_P&S_B2C_Schengen",
                "applicationId": "EA_HL",
                "clientId": "HLMEAD_202203251612",
                "clientKey": 1169889602,
                "clientFullName": "John Defensor",
                "listKey": "2001",
                "listName": "Dow Jones Watchlist",
                "listId": "DJWL",
                "listVersion": "20210201",
                "listModifyDate": "2/2/2021 2:21:06 AM",
                "listProfileId": "1143233",
                "listProfileKey": 99912,
                "linkSingleStringName": "Donald John Trump",
                "listParentSingleStringName": "Donald John Trump",
                "listCategory": "Terror",
                "listPEPCategory": "Politically Exposed Person (PEP);Special Interest Person (SIP)",
                "listDOBs": "14-Jun-1946",
                "listCountries": "United States;Iran;Iraq",
                "rankString": "ECEBBNBBEE",
                "rankScore": 65.0,
                "ranktype": "R",
                "rankweight": "039",
                "pairLoadDate": "4/8/2022 1:04:07 PM",
                "eAddressTo": "",
                "eAddressCC": "",
                "origin": "SEARCH",
                "secondsviewed": "0",
                "initialUser": "",
                "isPairParentFlag": 1,
                "pairMetSearchCriteriaFlag": 1,
                "editableDueToAssignmentFlag": 1,
                "modifyDate": "4/8/2022 1:04:07 PM",
                "modifiedByUser": "webservices_HL",
                "pairReportType": 0,
                "finscanCategory": null,
                "wrapperStatus": 1,
                "sourceLists": null,
                "listRecordDetail": null
            },
            {
                "pairStatus": "New",
                "pairReason": "New",
                "pairComments": "",
                "applicationDisplayName": "HL_P&S_B2C_Schengen",
                "applicationId": "EA_HL",
                "clientId": "HLMEAD_202203251612",
                "clientKey": 1169889602,
                "clientFullName": "John Defensor",
                "listKey": "2001",
                "listName": "Dow Jones Watchlist",
                "listId": "DJWL",
                "listVersion": "20190423",
                "listModifyDate": "4/24/2019 2:14:32 AM",
                "listProfileId": "3379166",
                "listProfileKey": 1136401,
                "linkSingleStringName": "John Defensor",
                "listParentSingleStringName": "John Defensor",
                "listCategory": "",
                "listPEPCategory": "Relative or Close Associate (RCA)",
                "listDOBs": "",
                "listCountries": "Philippines;International",
                "rankString": "EEEBBEBBEE",
                "rankScore": 97.0,
                "ranktype": "R",
                "rankweight": "019",
                "pairLoadDate": "3/25/2022 3:12:44 PM",
                "eAddressTo": "",
                "eAddressCC": "",
                "origin": "SEARCH",
                "secondsviewed": "0",
                "initialUser": "",
                "isPairParentFlag": 1,
                "pairMetSearchCriteriaFlag": 1,
                "editableDueToAssignmentFlag": 1,
                "modifyDate": "3/25/2022 3:12:44 PM",
                "modifiedByUser": "webservices_HL",
                "pairReportType": 0,
                "finscanCategory": null,
                "wrapperStatus": 1,
                "sourceLists": null,
                "listRecordDetail": null
            },
            {
                "pairStatus": "New",
                "pairReason": "New",
                "pairComments": "",
                "applicationDisplayName": "HL_P&S_B2C_Schengen",
                "applicationId": "EA_HL",
                "clientId": "HLMEAD_202203251612",
                "clientKey": 1169889602,
                "clientFullName": "John Defensor",
                "listKey": "2001",
                "listName": "Dow Jones Watchlist",
                "listId": "DJWL",
                "listVersion": "20201103",
                "listModifyDate": "11/4/2020 2:31:27 AM",
                "listProfileId": "11059788",
                "listProfileKey": 5340599,
                "linkSingleStringName": "Benjamin John Soliman Defensor",
                "listParentSingleStringName": "Benjamin John Soliman Defensor",
                "listCategory": "Other Official Lists",
                "listPEPCategory": "Special Interest Person (SIP)",
                "listDOBs": "08-Feb-1972",
                "listCountries": "Not Known",
                "rankString": "EEEBBEBBEE",
                "rankScore": 97.0,
                "ranktype": "R",
                "rankweight": "019",
                "pairLoadDate": "3/25/2022 3:12:44 PM",
                "eAddressTo": "",
                "eAddressCC": "",
                "origin": "SEARCH",
                "secondsviewed": "0",
                "initialUser": "",
                "isPairParentFlag": 1,
                "pairMetSearchCriteriaFlag": 1,
                "editableDueToAssignmentFlag": 1,
                "modifyDate": "3/25/2022 3:12:44 PM",
                "modifiedByUser": "webservices_HL",
                "pairReportType": 0,
                "finscanCategory": null,
                "wrapperStatus": 1,
                "sourceLists": null,
                "listRecordDetail": null
            }
        ]
    }

    */



}
