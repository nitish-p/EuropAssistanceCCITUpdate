XmlPort 50043 "FA Uploader Import"
{
    Direction = Import;
    FileName = 'FAUploader.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("FA Uploader Stagging"; "FA Uploader Stagging")
            {
                XmlName = 'FAUploaderStagging';
                fieldelement(Code_Selection; "FA Uploader Stagging"."Code Selection")
                {
                }
                fieldelement(Serial_No; "FA Uploader Stagging"."Serial No.")
                {
                }
                fieldelement(Description; "FA Uploader Stagging".Description)
                {
                }
                fieldelement(Responsible_Emp; "FA Uploader Stagging"."Responsible Employee")
                {
                }
                fieldelement(FA_Class_Code; "FA Uploader Stagging"."FA Class Code")
                {
                }
                fieldelement(FA_Subclass_Code; "FA Uploader Stagging"."FA Subclass Code")
                {
                }
                fieldelement(FA_Location_Code; "FA Uploader Stagging"."FA Location Code")
                {
                }
                fieldelement(FA_Block_Code; "FA Uploader Stagging"."FA Block Code")
                {
                }
                fieldelement(Gen_Prod_Posting_Gr; "FA Uploader Stagging"."Gen.Prod.Posting Gruop")
                {
                }
                fieldelement(Vendor_No; "FA Uploader Stagging"."Vendor No.")
                {
                }
                fieldelement(Maintenance_Vendor_No; "FA Uploader Stagging"."Maintenance Vendor No.")
                {
                }
                fieldelement(Under_Maintenance; "FA Uploader Stagging"."Under Maintenance")
                {
                }
                fieldelement(Depreciation_Book_Code; "FA Uploader Stagging"."Depreciation Book Code")
                {
                }
                fieldelement(FA_Posting_Group; "FA Uploader Stagging"."FA Posting Group")
                {
                }
                fieldelement(Depreciation_Method; "FA Uploader Stagging"."Depreciation Method")
                {
                }
                fieldelement(Depreciation_stating_Date; "FA Uploader Stagging"."Depreciation stating Date")
                {
                }
                fieldelement(NoOfDepreYear; "FA Uploader Stagging"."No. Of Depreciation Years")
                {
                }
                fieldelement(WarrantyDate; "FA Uploader Stagging"."Warranty Date")
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
                    // for inserting additional information
                    "FA Uploader Stagging"."File name" := currXMLport.Filename;
                    RowNumber := RowNumber + 1;
                    "FA Uploader Stagging"."Row number" := RowNumber;
                    "FA Uploader Stagging".Status := 0;
                    "FA Uploader Stagging"."Process In Error" := false;
                    "FA Uploader Stagging"."Imported Date" := Today;
                    "FA Uploader Stagging"."Imported Time" := Time;
                    "FA Uploader Stagging"."Imported By" := UserId;
                    "FA Uploader Stagging".CaseID := CASIDTEXT;

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

        ValidateRawData(CASIDTEXT);
        Message('Done....');
    end;

    trigger OnPreXmlPort()
    begin
        /// intialize
        FirstLine := true;
        RowNumber := 0;
        CASIDTEXT := UserId + Format(CurrentDatetime);
    end;

    var
        RowNumber: Integer;
        CASIDTEXT: Text[100];
        PDATE: Date;
        DDATE: Date;
        LineNo: Integer;
        Document_No2: Code[30];
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        "Sales&RcSetup": Record "Sales & Receivables Setup";
        LineInsert: Integer;
        Evaluated_Vehicle_Identification_No: Code[30];
        CustRec: Record Customer;
        "Documentwise Service Master": Record "Documentwise Service Master";
      //  XMLRejectMAster: XmlPort "Rejected Purchase Data Export";
        DocServMaster: Record "Documentwise Service Master";
        Vendor: Record Vendor;
        ItemVaraint: Record "Item Variant";
        PurchpayablesSetup: Record "Purchases & Payables Setup";
        "Purchase Line": Record "Purchase Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchLine: Record "Purchase Line";
        "------": Integer;
        RecFA: Record "Fixed Asset";
        FAINVALID: label 'FA No Is Invalid';
        RecEmp: Record Employee;
        REMPINVALID1: label 'Responsible Employee Invalid';
        REMPINVALID: label 'Responsible Employee Mandatory';
        RecFAClass: Record "FA Class";
        FACLASSCODEMAN: label 'FA Class Code Mandatory';
        FACLSSCINVALID: label 'FA Class Code Invalid';
        RecFASubClass: Record "FA Subclass";
        FASCLASSCODEMAN: label 'FA Sub Class Code Mandatory';
        FASCLSSCINVALID: label 'FA Sub Class Code Invalid';
        RecFALoc: Record "FA Location";
        FALOCMAN: label 'FA Location Code Mandatory';
        FALOCINVALID: label 'FA Location Code Invalid';
        RecFABlock: Record "Fixed Asset Block";//Naveen
        FABCODEMAN: label 'FA Block Code Mandatory';
        FABCODEINVALID: label 'FA Block Code Invalid';
        RecGenProdPostGr: Record "Gen. Product Posting Group";
        GENPRODPGRMAN: label 'Gen.Prod.Posting Gruop Mandatory';
        GENPRODPGRINVALID: label 'Gen.Prod.Posting Gruop Invalid';
        RecVend: Record Vendor;
        VENNOMAN: label 'Vendor No. Mandatory';
        VENNOINVALID1: label 'Maintenance Vendor No. Invalid';
        VENNOMAN1: label 'Maintenance Vendor No. Mandatory';
        VENNOINVALID: label 'Vendor No. Invalid';
        RecDepreBook: Record "Depreciation Book";
        DBOOKCODEMAN: label 'Depreciation Book Code Mandatory';
        DBKCODEINVALID: label 'Depreciation Book Code Invalid';
        RecFAPostGr: Record "FA Posting Group";
        FAPGRMAN: label 'FA Posting Gruop Mandatory';
        FAPGRINVALID: label 'FA Posting Gruop Invalid';
        DEPREMODMAN: label 'Depreciation Method Mandatory';
        DEPSDATEMAN: label 'Depreciation Start Date Mandatory';
        DESMAN: label 'Description Mandatory';
        DESLEN: label 'Description Exceed 50 Char';
        FirstLine: Boolean;
        SERNOMAN: label 'Serial No. Mandatory';
        RecNoSeries: Record "No. Series";
        CODESMAN: label 'Code Selection Mandatory';
        CODESINVALID: label 'Code Selection Invalid';
        NODPREYERMAN: label 'No. Of Depreciation Years Mandatory';
        WARRDMAN: label 'Warranty Date Mandatory';
        NewNoSeries: Code[30];
        RecFA1: Record "Fixed Asset";
        SERNOPRESENT: label 'Serial No. already exist.';
        FAPOSTGRINVALID: label 'FA Posting Group Invalid For INTANGIBLE';
        FAPOSTGRINVALIDTAN: label 'FA Posting Group Invalid For TANGIBLE';
        VENMAN: label 'Vendor No. Mandatory For Under Maintenance';


    procedure ValidateRawData(CASEID: Code[250])
    var
        RecFAStagging: Record "FA Uploader Stagging";
        FoundError: Boolean;
        RecFAStagging2: Record "FA Uploader Stagging";
        PurchLine: Record "Purchase Line";
        PurchInvLine: Record "Purch. Inv. Line";
    begin
        // initlaize

        FoundError := false;

        RecFAStagging.Reset;
        RecFAStagging.SetRange(RecFAStagging.CaseID, CASEID);
        RecFAStagging.SetRange(RecFAStagging.Validated, false);
        if RecFAStagging.FindSet then
            repeat

                // intiliaze

                PDATE := 0D;

                if RecFAStagging."Code Selection" = '' then begin
                    RecFAStagging."Error description" := CODESMAN;
                    FoundError := true;
                end else begin
                    if not RecNoSeries.Get(RecFAStagging."Code Selection") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + CODESINVALID;
                        FoundError := true;
                    end;
                end;



                if RecFAStagging.Description = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + DESMAN;
                    FoundError := true;
                end else
                    if RecFAStagging.Description <> '' then begin
                        if StrLen(RecFAStagging.Description) > 50 then begin
                            RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + DESLEN;
                            FoundError := true;
                        end;
                    end;

                if RecFAStagging."Responsible Employee" <> '' then begin
                    if not RecEmp.Get(RecFAStagging."Responsible Employee") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + REMPINVALID1;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."FA Class Code" = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FACLASSCODEMAN;
                    FoundError := true;
                end else begin
                    if not RecFAClass.Get(RecFAStagging."FA Class Code") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FACLSSCINVALID;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."FA Class Code" = 'TANGIBLE' then begin
                    if RecFAStagging."Serial No." = '' then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + SERNOMAN;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."FA Class Code" = 'TANGIBLE' then begin
                    if RecFAStagging."Serial No." <> '' then begin
                        RecFA1.Reset;
                        RecFA1.SetRange(RecFA1."Serial No.", RecFAStagging."Serial No.");
                        if RecFA1.FindFirst then begin
                            RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + SERNOPRESENT;
                            FoundError := true;
                        end;
                    end;
                end;

                if RecFAStagging."FA Subclass Code" = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FASCLASSCODEMAN;
                    FoundError := true;
                end else begin
                    if not RecFASubClass.Get(RecFAStagging."FA Subclass Code") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FASCLSSCINVALID;
                        FoundError := true;
                    end;
                end;
                if RecFAStagging."FA Location Code" = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FALOCMAN;
                    FoundError := true;
                end else begin
                    if not RecFALoc.Get(RecFAStagging."FA Location Code") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FALOCINVALID;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."FA Block Code" = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FABCODEMAN;
                    FoundError := true;
                end else begin
                    RecFABlock.Reset;
                    RecFABlock.SetRange(RecFABlock.Code, RecFAStagging."FA Block Code");
                    if not RecFABlock.FindFirst then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FABCODEINVALID;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."Gen.Prod.Posting Gruop" = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + GENPRODPGRMAN;
                    FoundError := true;
                end else begin
                    if not RecGenProdPostGr.Get(RecFAStagging."Gen.Prod.Posting Gruop") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + GENPRODPGRINVALID;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."Under Maintenance" = true then begin
                    if RecFAStagging."Vendor No." = '' then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + VENMAN;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."Vendor No." <> '' then begin
                    if not RecVend.Get(RecFAStagging."Vendor No.") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + VENNOINVALID;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."Maintenance Vendor No." <> '' then begin
                    if not RecVend.Get(RecFAStagging."Maintenance Vendor No.") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + VENNOINVALID1;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."Depreciation Book Code" = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + DBOOKCODEMAN;
                    FoundError := true;
                end else begin
                    if not RecDepreBook.Get(RecFAStagging."Depreciation Book Code") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + DBKCODEINVALID;
                        FoundError := true;
                    end;
                end;

                if RecFAStagging."FA Posting Group" = '' then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FAPGRMAN;
                    FoundError := true;
                end else begin
                    if not RecFAPostGr.Get(RecFAStagging."FA Posting Group") then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FAPGRINVALID;
                        FoundError := true;
                    end;
                end;
                if RecFAStagging."FA Class Code" = 'INTANGIBLE' then begin
                    RecFABlock.Reset;
                    RecFABlock.SetRange(RecFABlock.Code, RecFAStagging."FA Posting Group");
                    if RecFABlock.FindFirst then begin
                        if RecFABlock."FA Class Code" <> 'INTANGIBLE' then begin
                            RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FAPOSTGRINVALID;
                            FoundError := true;
                        end;
                    end;
                end;
                if RecFAStagging."FA Class Code" = 'TANGIBLE' then begin
                    RecFABlock.Reset;
                    RecFABlock.SetRange(RecFABlock.Code, RecFAStagging."FA Posting Group");
                    if RecFABlock.FindFirst then begin
                        if RecFABlock."FA Class Code" <> 'TANGIBLE' then begin
                            RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + FAPOSTGRINVALIDTAN;
                            FoundError := true;
                        end;
                    end;
                end;
                /*IF RecFAStagging."Depreciation Method" = '' THEN
                BEGIN
                     RecFAStagging."Error description":=RecFAStagging."Error description" + ' ; '+  DEPREMODMAN ;
                    FoundError := TRUE ;
                END; */

                // for validating Dates
                /*IF "FA Uploader Stagging"."Depreciation stating Date" <> 0D THEN
                BEGIN
                   EVALUATE(PDATE,"FA Uploader Stagging"."Depreciation stating Date");
                END;*/

                if RecFAStagging."Depreciation stating Date" = 0D then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + DEPSDATEMAN;
                    FoundError := true;
                end;

                if RecFAStagging."No. Of Depreciation Years" = 0 then begin
                    RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + NODPREYERMAN;
                    FoundError := true;
                end;

                if RecFAStagging."FA Class Code" = 'TANGIBLE' then begin
                    if RecFAStagging."Warranty Date" = 0D then begin
                        RecFAStagging."Error description" := RecFAStagging."Error description" + ' ; ' + WARRDMAN;
                        FoundError := true;
                    end;
                end;

                RecFAStagging.Validated := true;
                RecFAStagging.Modify;

            until RecFAStagging.Next = 0;

        //MESSAGE('%1  %2  %3',FoundError,RecFAStagging."Serial No.",RecFAStagging."Process In Error");
        /*
        IF FoundError = FALSE THEN BEGIN
          CreateFADocument(CASEID);
          MESSAGE(' Imported Successfully');
        END;
        
        
        
        
        IF FoundError = TRUE THEN BEGIN
        
        RecFAStagging.RESET;
        RecFAStagging.SETRANGE(RecFAStagging.CaseID,CASEID);
        RecFAStagging.SETFILTER(RecFAStagging."Error description",'<>%1','');
        IF RecFAStagging.FINDSET THEN REPEAT
        RecFAStagging.Status := 1 ;
        RecFAStagging."Process In Error" := TRUE ;
        RecFAStagging.MODIFY;
        UNTIL RecFAStagging.NEXT = 0 ;
        
        //MESSAGE('Error occured ; Please check Rejected Log');
        {
        
        RecFAStagging.RESET;
        RecFAStagging.SETRANGE(RecFAStagging.CaseID,CASEID);
        IF RecFAStagging.FINDFIRST THEN BEGIN
          COMMIT;
        XMLRejectMAster.SETTABLEVIEW(RecFAStagging);
        XMLRejectMAster.RUN;
        END;
        }
        END; // found errror
        */

        RecFAStagging.Reset;
        RecFAStagging.SetRange(RecFAStagging.CaseID, CASEID);
        RecFAStagging.SetRange(RecFAStagging.Validated, true);
        RecFAStagging.SetFilter(RecFAStagging."Error description", '<>%1', '');
        if RecFAStagging.FindSet then
            repeat
                RecFAStagging.Status := 1;
                RecFAStagging."Process In Error" := true;
                RecFAStagging.Modify;
            until RecFAStagging.Next = 0;

        RecFAStagging.Reset;
        RecFAStagging.SetRange(RecFAStagging.CaseID, CASEID);
        RecFAStagging.SetRange(RecFAStagging.Validated, true);
        RecFAStagging.SetRange(RecFAStagging."Process In Error", false);
        RecFAStagging.SetRange(RecFAStagging."Uploader Created", false);
        RecFAStagging.SetFilter(RecFAStagging.Status, '=%1', RecFAStagging.Status::Uploaded);
        if RecFAStagging.FindSet then
            repeat
                CreateFADocument(RecFAStagging.CaseID);
            until RecFAStagging.Next = 0;

    end;


    procedure CreateFADocument(CASEID: Code[250])
    var
        RecFAStagging1: Record "FA Uploader Stagging";
        RecFA: Record "Fixed Asset";
        RecFADePreBook: Record "FA Depreciation Book";
        RecFAStagging2: Record "FA Uploader Stagging";
        RecFADePreBook1: Record "FA Depreciation Book";
    begin

        RecFAStagging1.Reset;
        RecFAStagging1.SetRange(RecFAStagging1.CaseID, CASEID);
        RecFAStagging1.SetRange(RecFAStagging1."Process In Error", false);
        if RecFAStagging1.FindSet then
            repeat

                NewNoSeries := NoSeriesManagement.GetNextNo(RecFAStagging1."Code Selection", WorkDate, true);
                RecFA.Init;
                RecFA."No." := NewNoSeries;
                //RecFA."Integration Doc No" := RecFAStagging1."Integration Doc No" ;
                RecFA.Insert(true);

                RecFA.Validate(RecFA.Description, RecFAStagging1.Description);
                RecFA."Serial No." := RecFAStagging1."Serial No.";
                RecFA."FA Class Code" := RecFAStagging1."FA Class Code";
                RecFA."FA Subclass Code" := RecFAStagging1."FA Subclass Code";
                RecFA.Validate(RecFA."FA Location Code", RecFAStagging1."FA Location Code");
                RecFA."FA Block Code" := RecFAStagging1."FA Block Code";
                RecFA.Validate(RecFA."Gen. Prod. Posting Group", RecFAStagging1."Gen.Prod.Posting Gruop");
                RecFA.Validate(RecFA."Vendor No.", RecFAStagging1."Vendor No.");
                RecFA.Validate(RecFA."Maintenance Vendor No.", RecFAStagging1."Maintenance Vendor No.");
                RecFA."Under Maintenance" := RecFAStagging1."Under Maintenance";
                RecFA.Validate(RecFA."Warranty Date", RecFAStagging1."Warranty Date");
                RecFA."Uploader Created " := true;//Naveen
                if RecFA.Modify(true) then begin
                    // Purch line insert
                    RecFAStagging2.Reset;
                    RecFAStagging2.SetRange(RecFAStagging2.CaseID, RecFAStagging1.CaseID);
                    RecFAStagging2.SetRange(RecFAStagging2."Process In Error", false);
                    if RecFAStagging2.FindFirst then begin
                        RecFADePreBook.Reset;
                        RecFADePreBook.SetRange(RecFADePreBook."FA No.", RecFA."No.");
                        if not RecFADePreBook.FindFirst then begin
                            RecFADePreBook1.Init;
                            RecFADePreBook1."FA No." := RecFA."No.";
                            RecFADePreBook1.Validate(RecFADePreBook1."Depreciation Book Code", RecFAStagging1."Depreciation Book Code");
                            RecFADePreBook1.Validate(RecFADePreBook1."FA Posting Group", RecFAStagging1."FA Posting Group");
                            RecFADePreBook1."Depreciation Method" := RecFAStagging1."Depreciation Method";
                            RecFADePreBook1.Validate(RecFADePreBook1."Depreciation Starting Date", RecFAStagging1."Depreciation stating Date");
                            RecFADePreBook1.Validate(RecFADePreBook1."No. of Depreciation Years", RecFAStagging1."No. Of Depreciation Years");
                            RecFADePreBook1.Insert;
                        end;
                    end;
                end;
                RecFAStagging1."NAV No." := NewNoSeries;
                RecFAStagging1."Uploader Created" := true;
                RecFAStagging1.Modify;
            until RecFAStagging1.Next = 0;
    end;
}

