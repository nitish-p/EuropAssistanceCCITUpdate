XmlPort 50041 "Vendor Uploader"
{
    Direction = Import;
    FileName = 'Vendorimport.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Vendor Upload Stagging"; "Vendor Upload Stagging")
            {
                XmlName = 'VendorUpload';
                fieldelement(VendorName; "Vendor Upload Stagging"."Vendor Name")
                {
                }
                fieldelement(VendPostGr; "Vendor Upload Stagging"."Vendor Posting Group")
                {
                }
                fieldelement(GenBusPostGr; "Vendor Upload Stagging"."General Business Posting Group")
                {
                }
                fieldelement(PanNo; "Vendor Upload Stagging"."Vendor PAN No.")
                {
                }
                fieldelement(BankName; "Vendor Upload Stagging"."Vendor Bank Account Name")
                {
                }
                textelement(BankAccNo)
                {
                }
                fieldelement(IFSCCode; "Vendor Upload Stagging"."IFSC Code")
                {
                }
                fieldelement(GSTRegNo; "Vendor Upload Stagging"."Vendor GST Registration No.")
                {
                }
                fieldelement(Addr; "Vendor Upload Stagging".Address)
                {
                }
                fieldelement(Addr2; "Vendor Upload Stagging"."Address 2")
                {
                }
                fieldelement(PostCode; "Vendor Upload Stagging"."Post Code")
                {
                }
                fieldelement(StateCode; "Vendor Upload Stagging"."Vendor State Code")
                {
                }
                fieldelement(Contact; "Vendor Upload Stagging"."Contact No.")
                {
                }

                trigger OnAfterInitRecord()
                begin
                    if FirstLine then begin
                        FirstLine := false;
                        currXMLport.Skip;
                    end;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    // for insert additional data
                    "Vendor Upload Stagging"."File name" := currXMLport.Filename;
                    RowNumber := RowNumber + 1;
                    "Vendor Upload Stagging"."Row number" := RowNumber;
                    "Vendor Upload Stagging".Status := "Vendor Upload Stagging".Status::Pending;
                    "Vendor Upload Stagging".Flag := 0;
                    "Vendor Upload Stagging"."Vendor Created On" := Today;
                    "Vendor Upload Stagging"."Imported Time" := Time;
                    "Vendor Upload Stagging"."Imported By" := UserId;
                    "Vendor Upload Stagging".CaseID := CASIDTEXT;
                    "Vendor Upload Stagging"."Nav Vendor Status" := 0;

                    if not (BankAccNo = '') then  //new
                    begin
                        if ((CopyStr(BankAccNo, 1, 2) = 'B-')) then
                            "Vendor Upload Stagging"."Bank Account Number" := CopyStr(BankAccNo, 3)
                        else
                            "Vendor Upload Stagging"."Bank Account Number" := 'BankAccNo Must Prefix:B-';
                    end;

                    if "Vendor Upload Stagging"."Vendor Name" = '' then
                        currXMLport.Skip;
                end;
            }
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

    trigger OnPostXmlPort()
    begin
        //VendorValidationAndCreation(CASIDTEXT);
    end;

    trigger OnPreXmlPort()
    begin
        /// intialize
        FirstLine := true;
        RowNumber := 0;
        CASIDTEXT := UserId + Format(CurrentDatetime);
    end;

    var
        FirstLine: Boolean;
        CASIDTEXT: Text[100];
        RowNumber: Integer;
        FoundError: Boolean;
        Response: Text;
        Flag: Integer;
        recGenBusPostGrp: Record "Gen. Business Posting Group";
        recVendorPostGrp: Record "Vendor Posting Group";
        VendNo: Code[20];
        BusGrp: Code[20];
        Vendor1: Record Vendor;
        LastNo: Code[10];
        NewNo: Code[10];
        InitialChar: Code[10];
        SecondChar: Code[10];
        LastNo1: Code[10];
        LastNo2: Code[10];
        GenBusPostGrp: Code[20];
        InsertVendor: Record Vendor;
        // NODHdr: Record UnknownRecord13786;
        // NODLines: Record UnknownRecord13785;
        // NODHdrInsert: Record UnknownRecord13786;//Naveen
        AllowedSection: Record "Allowed Sections";
        AssesseCode: Code[10];
        OrderAddress: Record "Order Address";
        OrderAddr1: Record "Order Address";
        OrderAddr: Record "Order Address";
        recVendorBankAcc: Record "Vendor Bank Account";
        insertVendorBankAcc: Record "Vendor Bank Account";
        RecVend: Record Vendor;
        Text01: label 'VendorNameMust';
        Text02: label 'GenBusPostGrpMust';
        Text03: label 'InvalidGenBusPostGrp';
        Text04: label 'VendorPostGrpMust';
        Text05: label 'InvalidVendorPostGrp';
        Text06: label 'VendorPANNoMust';
        Text07: label 'VendorPANNoAlreadyExists';
        Text08: label 'VendorBankAccNameMust';
        Text09: label 'BankAccNoMust';
        Text10: label 'IFSCcodeMust';
        recState: Record State;
        Text11: label 'AddressLengthExceed250Char';
        Text12: label 'Address2LengthExceed250Char';
        Text13: label 'ContactNoLengthExceed100Char';
        TEXT14: label 'InvalidVendorStateCode';
        RecPostCode: Record "Post Code";
        Text15: label 'InvalidPostCode';
        Text16: label 'PANNoLengthmustbe10Char';
        Text17: label 'For GST Registartion No. State Code Must';
        Text18: label 'GSTRegNoMust';
        Text19: label 'VendorNameExceed50Char';

    local procedure VendorValidationAndCreation(CaseID: Code[250])
    var
        VendorUploaderStagging: Record "Vendor Upload Stagging";
    begin
        // initlaize
        FoundError := false;

        VendorUploaderStagging.Reset;
        //VendorUploaderStagging.SETCURRENTKEY(CaseID,Validated);
        VendorUploaderStagging.SetRange(VendorUploaderStagging.CaseID, CaseID);
        VendorUploaderStagging.SetRange(VendorUploaderStagging.Validated, false);
        if VendorUploaderStagging.FindSet then
            repeat

                // validations +++

                if VendorUploaderStagging."Vendor Name" = '' then begin
                    VendorUploaderStagging."Error description" := Text01;
                    FoundError := true;
                end else
                    if VendorUploaderStagging."Vendor Name" <> '' then begin
                        if StrLen(VendorUploaderStagging."Vendor Name") > 50 then begin
                            VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text19;
                            FoundError := true;
                        end;
                    end;

                if VendorUploaderStagging."General Business Posting Group" = '' then begin
                    VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text02;
                    FoundError := true;
                end else begin
                    if not recGenBusPostGrp.Get(VendorUploaderStagging."General Business Posting Group") then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text03;
                        FoundError := true;
                    end;
                end;


                if VendorUploaderStagging."Vendor Posting Group" = '' then begin

                    VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text04;
                    FoundError := true;
                end else begin
                    if not recVendorPostGrp.Get(VendorUploaderStagging."Vendor Posting Group") then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text05;
                        FoundError := true;
                    end;
                end;

                if VendorUploaderStagging."Vendor PAN No." = '' then begin
                    VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text06;
                    FoundError := true;
                end else begin
                    RecVend.Reset;
                    RecVend.SetRange("P.A.N. No.", VendorUploaderStagging."Vendor PAN No.");
                    if RecVend.FindFirst then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text07;
                        FoundError := true;
                    end;
                end;

                /* IF VendorUploaderStagging."Vendor Bank Account Name" = '' THEN
                 BEGIN
                   VendorUploaderStagging."Error description":=VendorUploaderStagging."Error description" + ' ; '+ Text08 ;
                   FoundError := TRUE;
                 END;*/

                if VendorUploaderStagging."Bank Account Number" = '' then begin
                    VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text09;
                    FoundError := true;
                end;

                if VendorUploaderStagging."IFSC Code" = '' then begin
                    VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text10;
                    FoundError := true;
                end;

                if VendorUploaderStagging.Address <> '' then begin
                    if StrLen(VendorUploaderStagging.Address) > 250 then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text11;
                        FoundError := true;
                    end;
                end;
                if VendorUploaderStagging."Address 2" <> '' then begin
                    if StrLen(VendorUploaderStagging."Address 2") > 250 then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text12;
                        FoundError := true;
                    end;
                end;

                if VendorUploaderStagging."Contact No." <> '' then begin
                    if StrLen(VendorUploaderStagging."Contact No.") > 100 then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text13;
                        FoundError := true;
                    end;
                end;

                if VendorUploaderStagging."Post Code" <> '' then begin
                    if not RecPostCode.Get(VendorUploaderStagging."Post Code") then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text15;
                        FoundError := true;
                    end;
                end;


                if (VendorUploaderStagging."Vendor GST Registration No." <> '') then begin
                    if VendorUploaderStagging."Vendor State Code" = '' then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + Text17;
                        FoundError := true;
                    end;
                end;
                /*IF VendorUploaderStagging."Vendor State Code" <> '' THEN
                BEGIN
                    IF  VendorUploaderStagging."Vendor GST Registration No." = '' THEN
                    BEGIN
                     VendorUploaderStagging."Error description":=VendorUploaderStagging."Error description" + ' ; '+ Text18 ;
                     FoundError := TRUE;
                    END;
                END;*/

                if VendorUploaderStagging."Vendor State Code" <> '' then begin
                    if not recState.Get(VendorUploaderStagging."Vendor State Code") then begin
                        VendorUploaderStagging."Error description" := VendorUploaderStagging."Error description" + ' ; ' + TEXT14;
                        FoundError := true;
                    end;
                end;
                // validations ---


                //VendorUploaderStagging.MODIFY ;
                //MESSAGE('%1  %2',VendorUploaderStagging."Row number",FoundError);
                if FoundError = true then begin
                    VendorUploaderStagging.Status := 1;
                    VendorUploaderStagging.Flag := 1;
                    VendorUploaderStagging."Nav Vendor Status" := 2;
                    VendorUploaderStagging.Validated := true;
                    VendorUploaderStagging.Modify;
                end else
                    if FoundError = false then begin
                        VendorUploaderStagging.Status := 0;
                        VendorUploaderStagging.Flag := 0;
                        VendorUploaderStagging."Nav Vendor Status" := 0;
                        VendorUploaderStagging.Validated := true;
                        VendorUploaderStagging.Modify;
                    end;

            //VendorUploaderStagging.MODIFY ;

            until VendorUploaderStagging.Next = 0;

        VendorUploaderStagging.Reset;
        VendorUploaderStagging.SetRange(VendorUploaderStagging."File name", currXMLport.Filename);
        VendorUploaderStagging.SetFilter(VendorUploaderStagging.Flag, '=%1', VendorUploaderStagging.Flag::" ");
        VendorUploaderStagging.SetRange(VendorUploaderStagging."Vendor Created By Uploader", false);
        if VendorUploaderStagging.FindSet then
            repeat
                CreateVendor(VendorUploaderStagging.CaseID);
            until VendorUploaderStagging.Next = 0;

        Message('Process Done....');

    end;

    local procedure CreateVendor(CASEID: Code[250])
    var
        VendorUploaderStagging1: Record "Vendor Upload Stagging";
    begin

        VendorUploaderStagging1.Reset;
        VendorUploaderStagging1.SetRange(VendorUploaderStagging1."File name", currXMLport.Filename);
        VendorUploaderStagging1.SetFilter(VendorUploaderStagging1.Flag, '=%1', VendorUploaderStagging1.Flag::" ");
        VendorUploaderStagging1.SetRange(VendorUploaderStagging1."Vendor Created By Uploader", false);
        if VendorUploaderStagging1.FindSet then
            repeat

                VendNo := '';
                BusGrp := '';
                InitialChar := '';
                SecondChar := '';
                LastNo := '';
                LastNo1 := '';
                LastNo2 := '';
                NewNo := '';

                InitialChar := CopyStr(VendorUploaderStagging1."Vendor Name", 1, 1);
                SecondChar := CopyStr(VendorUploaderStagging1."Vendor Posting Group", 1, 1);
                // to get business post group code
                if VendorUploaderStagging1."General Business Posting Group" = 'DOM-ADMIN' then begin
                    GenBusPostGrp := 'DOM-ADMIN';
                    BusGrp := 'DAD';
                end;

                if VendorUploaderStagging1."General Business Posting Group" = 'DOM-AUTO' then begin
                    GenBusPostGrp := 'DOM-AUTO';
                    BusGrp := 'DAU';
                end;

                if VendorUploaderStagging1."General Business Posting Group" = 'DOM-DEALEN' then begin
                    GenBusPostGrp := 'DOM-DEALEN|AUTO-RE';
                    BusGrp := 'DRE';
                end;

                if VendorUploaderStagging1."General Business Posting Group" = 'AUTO-RE' then begin
                    GenBusPostGrp := 'DOM-DEALEN|AUTO-RE';
                    BusGrp := 'DRE';
                end;

                if VendorUploaderStagging1."General Business Posting Group" = 'DOM-EXTWAR' then begin
                    GenBusPostGrp := 'DOM-EXTWAR';
                    BusGrp := 'DEW';
                end;

                if VendorUploaderStagging1."General Business Posting Group" = 'DOM-MEDI' then begin
                    GenBusPostGrp := 'DOM-MEDI';
                    BusGrp := 'DME';
                end;

                if VendorUploaderStagging1."General Business Posting Group" = 'FOREIGN-IT' then begin
                    GenBusPostGrp := 'FOREIGN-IT';
                    BusGrp := 'FIT';
                end;

                if VendorUploaderStagging1."General Business Posting Group" = 'FOR-INTCOM' then begin
                    GenBusPostGrp := 'FOR-INTCOM';
                    BusGrp := 'FIC';
                end;

                /*IF UPPERCASE(Type) = 'VENDOR' THEN BEGIN
                  GenBusPostGrp:='DOM-AUTO';
                  BusGrp:='DAU';
                END;

                IF UPPERCASE(Type) = 'DEALER' THEN BEGIN
                  GenBusPostGrp:='DOM-DEALEN|AUTO-RE';
                  BusGrp:='DRE';
                END;*/

                // to get last incremental no.
                Vendor1.Reset;
                Vendor1.SetCurrentkey("No.");
                Vendor1.Ascending(true);
                Vendor1.SetRange(Vendor1."Gen. Bus. Posting Group", VendorUploaderStagging1."General Business Posting Group");
                if Vendor1.FindSet then
                    repeat
                        if ((CopyStr(Vendor1.Name, 1, 1) = InitialChar) and (CopyStr(Vendor1."No.", 2, 3) = BusGrp) and (CopyStr(Vendor1."No.", 5, 1) = InitialChar)) then begin
                            LastNo := CopyStr(Vendor1."No.", 6, 11);
                        end;
                    until Vendor1.Next = 0;

                if GenBusPostGrp = 'DOM-DEALEN|AUTO-RE' then begin
                    Vendor1.Reset;
                    Vendor1.SetCurrentkey("No.");
                    Vendor1.Ascending(true);
                    Vendor1.SetFilter(Vendor1."Gen. Bus. Posting Group", '%1', 'DOM-DEALEN');
                    if Vendor1.FindSet then
                        repeat
                            if ((CopyStr(Vendor1.Name, 1, 1) = InitialChar) and (CopyStr(Vendor1."No.", 2, 3) = BusGrp) and (CopyStr(Vendor1."No.", 5, 1) = InitialChar)) then begin
                                Evaluate(LastNo1, CopyStr(Vendor1."No.", 6, 11));
                            end;
                        until Vendor1.Next = 0;

                    Vendor1.Reset;
                    Vendor1.SetCurrentkey("No.");
                    Vendor1.Ascending(true);
                    Vendor1.SetFilter(Vendor1."Gen. Bus. Posting Group", '%1', 'AUTO-RE');
                    if Vendor1.FindSet then
                        repeat
                            if ((CopyStr(Vendor1.Name, 1, 1) = InitialChar) and (CopyStr(Vendor1."No.", 2, 3) = BusGrp) and (CopyStr(Vendor1."No.", 5, 1) = InitialChar)) then begin
                                Evaluate(LastNo2, CopyStr(Vendor1."No.", 6, 11));
                            end;
                        until Vendor1.Next = 0;

                    if LastNo1 > LastNo2 then
                        LastNo := LastNo1;
                    if LastNo1 < LastNo2 then
                        LastNo := LastNo2;

                end;

                // to get vendor code for current new vendor
                if LastNo <> '' then
                    NewNo := IncStr(LastNo)
                else
                    NewNo := '000001';
                VendNo := 'V' + BusGrp + InitialChar + NewNo;

                InsertVendor.Init;
                InsertVendor."No." := VendNo;
                InsertVendor.Name := UpperCase(VendorUploaderStagging1."Vendor Name");
                InsertVendor.Address := VendorUploaderStagging1.Address;
                InsertVendor."Address 2" := VendorUploaderStagging1."Address 2";
                InsertVendor."Post Code" := VendorUploaderStagging1."Post Code";
                InsertVendor.Contact := VendorUploaderStagging1."Contact No.";
                InsertVendor."State Code" := VendorUploaderStagging1."Vendor State Code";
                InsertVendor.Validate("Gen. Bus. Posting Group", VendorUploaderStagging1."General Business Posting Group");
                InsertVendor.Validate("Vendor Posting Group", VendorUploaderStagging1."Vendor Posting Group");
                //InsertVendor.VALIDATE("State Code",VendorUploaderStagging1."Vendor State Code");
                InsertVendor.Validate("P.A.N. No.", VendorUploaderStagging1."Vendor PAN No.");
                InsertVendor.Validate("GST Registration No.", VendorUploaderStagging1."Vendor GST Registration No.");
                if VendorUploaderStagging1."Vendor GST Registration No." <> '' then
                    //InsertVendor.VALIDATE(InsertVendor."GST Vendor Type",InsertVendor."GST Vendor Type"::Registered)
                    InsertVendor."GST Vendor Type" := InsertVendor."gst vendor type"::Registered
                else
                    //InsertVendor.VALIDATE(InsertVendor."GST Vendor Type",InsertVendor."GST Vendor Type"::Unregistered);
                    InsertVendor."GST Vendor Type" := InsertVendor."gst vendor type"::Unregistered;
                InsertVendor.Validate(InsertVendor."Status-Indicator", InsertVendor."status-indicator"::A);
                //InsertVendor.VALIDATE("Vendor Invoice Type","Vendor Payment Type");
                //InsertVendor.VALIDATE("Date Of Incorporation","Date Of Incorporation");
                if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'P' then begin
                    InsertVendor.Validate("Record Type", 'I');
                end else begin
                    InsertVendor.Validate("Record Type", 'O');
                end;
                InsertVendor.Validate("Uploader Vendor", true);
                InsertVendor."Vendor Created On" := CurrentDatetime;
                InsertVendor.Insert(true);



                // NOD mapping +++
                if VendorUploaderStagging1."Vendor Posting Group" = 'DOM-MKTG' then begin
                    AssesseCode := '';

                    Vendor1.Reset;
                    Vendor1.SetRange("No.", VendNo);
                    if Vendor1.FindFirst then begin
                        If Vendor1."Assessee Code" = '' then begin

                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'A' then begin
                                AssesseCode := 'OTH';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'B' then begin
                                AssesseCode := 'BOI';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'C' then begin
                                AssesseCode := 'COM';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'F' then begin
                                AssesseCode := 'FIRM';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'H' then begin
                                AssesseCode := 'HUF';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'L' then begin
                                AssesseCode := 'OTH';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'J' then begin
                                AssesseCode := 'AJP';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'P' then begin
                                AssesseCode := 'IND';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'T' then begin
                                AssesseCode := 'OTH';
                            end;
                            if CopyStr(VendorUploaderStagging1."Vendor PAN No.", 4, 1) = 'E' then begin
                                AssesseCode := 'FIRM';
                            end;
                            Vendor1."Assessee Code" := AssesseCode;
                            AllowedSection.Init();
                            AllowedSection.Validate("Vendor No", Vendor1."No.");
                            AllowedSection.Validate("TDS Section", '194C');
                            AllowedSection.Validate("Threshold Overlook", TRUE);
                            AllowedSection.VALIDATE("Surcharge Overlook", TRUE);
                            AllowedSection.Insert(true);


                        end;
                    end;
                end;
                // NOD mapping ---



                // vendor bank account creation +++
                recVendorBankAcc.Reset;
                recVendorBankAcc.SetRange("Vendor No.", VendNo);
                if not recVendorBankAcc.FindFirst then begin

                    insertVendorBankAcc.Init;
                    insertVendorBankAcc.Validate("Vendor No.", VendNo);
                    insertVendorBankAcc.Validate(Code, VendNo + '_01');
                    insertVendorBankAcc.Validate(Name, VendorUploaderStagging1."Vendor Bank Account Name");
                    insertVendorBankAcc.Validate("Bank Account No.", VendorUploaderStagging1."Bank Account Number");
                    insertVendorBankAcc.Validate("SWIFT Code", VendorUploaderStagging1."IFSC Code");
                    //insertVendorBankAcc.VALIDATE(Modified,TRUE);//CCIT-31012022
                    insertVendorBankAcc.Validate("Default Account", true);
                    insertVendorBankAcc.Insert(true);

                end;
                // vendor bank account creation ---
                //COMMIT;

                VendorUploaderStagging1."Vendor Created By Uploader" := true;
                VendorUploaderStagging1."Nav Vendor Code" := VendNo;
                VendorUploaderStagging1."Vendor Created On" := Today;
                VendorUploaderStagging1."Nav Vendor Status" := 1;
                VendorUploaderStagging1.Modify;

            until VendorUploaderStagging1.Next = 0;

    end;
}

