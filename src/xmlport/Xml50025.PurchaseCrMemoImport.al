xmlport 50025 "Purchase Cr Memo Import"
{
    // prdp 24012017
    // created new xmlport purchase invoice import through bridge

    Direction = Import;
    FileName = 'Purchaseimport.csv';
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Raw Update Log Purchase"; "Raw Update Log Purchase")
            {
                XmlName = 'RawPurchaseData';
                fieldelement(Document_No; "Raw Update Log Purchase"."Integration Doc No")
                {
                }
                fieldelement(Case_No; "Raw Update Log Purchase"."Case No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Invocie_No; "Raw Update Log Purchase"."Invoice No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Line_No; "Raw Update Log Purchase".Line_No)
                {
                }
                fieldelement(Buy_From_Vendor_No; "Raw Update Log Purchase".Buy_From_Vendor_No)
                {
                }
                fieldelement(Type; "Raw Update Log Purchase".Type)
                {
                }
                fieldelement(Item_No; "Raw Update Log Purchase".Item_No)
                {
                }
                fieldelement(Quantity; "Raw Update Log Purchase".Quantity)
                {
                }
                fieldelement(UOM_Code; "Raw Update Log Purchase".UOM_Code)
                {
                    MinOccurs = Zero;
                }
                fieldelement(VaraintCode; "Raw Update Log Purchase".Varaint_Code)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Direct_Unit_Cost; "Raw Update Log Purchase".Direct_Unit_Cost)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Posting_Date; "Raw Update Log Purchase".Posting_Date)
                {
                }
                fieldelement(Document_Date; "Raw Update Log Purchase".Document_Date)
                {
                }
                fieldelement(Structure; "Raw Update Log Purchase".Structure)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Service_Tax_Group; "Raw Update Log Purchase".Service_Tax_Group)
                {
                    MinOccurs = Zero;
                }
                fieldelement(TDS_Nature; "Raw Update Log Purchase".TDS_Nature)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Vehicle_Regn_No; "Raw Update Log Purchase"."Vehicle Registration No")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Policy_No; "Raw Update Log Purchase".PolicyNo_OEMInv_RefNo)
                {
                    MinOccurs = Zero;
                }
                fieldelement(VIN_No; "Raw Update Log Purchase"."Vehicle Identification No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DeptDim; "Raw Update Log Purchase"."Department Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BusLineDim; "Raw Update Log Purchase"."Business Line Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Narration; "Raw Update Log Purchase".Narration)
                {
                    MinOccurs = Zero;
                }
                fieldelement(ServiceID; "Raw Update Log Purchase"."Service ID")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ServiceDate; "Raw Update Log Purchase"."Service Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(InvoiceDate; "Raw Update Log Purchase"."Invoice date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ClientLevelCode; "Raw Update Log Purchase"."Client Level Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(EmployeeCode; "Raw Update Log Purchase"."Employee Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DiscountPercent; "Raw Update Log Purchase"."Discount Percent")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PONumber; "Raw Update Log Purchase"."PO Number")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PODate; "Raw Update Log Purchase"."PO Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BillingType; "Raw Update Log Purchase"."Billing Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PostingNoSeries; "Raw Update Log Purchase".PostingNoSeries)
                {
                    MinOccurs = Zero;
                }
                fieldelement(PostingNo; "Raw Update Log Purchase".PostingNo)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    // for inserting additional information
                    "Raw Update Log Purchase"."File name" := currXMLport.FILENAME;
                    RowNumber := RowNumber + 1;
                    "Raw Update Log Purchase"."Row number" := RowNumber;
                    "Raw Update Log Purchase".Status := 0;
                    "Raw Update Log Purchase"."Imported Date" := TODAY;
                    "Raw Update Log Purchase"."Imported Time" := TIME;
                    "Raw Update Log Purchase"."Imported By" := USERID;
                    "Raw Update Log Purchase".CaseID := CASIDTEXT;
                    "Raw Update Log Purchase"."Manual Invoice" := TRUE;
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
    end;

    trigger OnPreXmlPort()
    begin
        /// intialize
        RowNumber := 0;
        CASIDTEXT := USERID + FORMAT(CURRENTDATETIME);
    end;

    var
        RowNumber: Integer;
        UpdatePurchaseData: Codeunit "Update Bank Response_1";
        CASIDTEXT: Text[100];
        Item: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        Location: Record Location;
        UnitPrice: Decimal;
        Qty: Decimal;
        PDATE: Date;
        DDATE: Date;
        ODATE: Date;
        // Structure: Record "13792";//RUSHAB
        LineNo: Integer;
        // ServiceTaxGroup: Record "16471";//RUSHAB
        PolicySDate: Date;
        PolicyEDate: Date;
        Evaluated_Dim2: Code[20];
        Evaluated_Type: Option;
        "Evaluated_No.Series": Code[10];
        Evaluated_Doc_No: Code[30];
        "Evaluated_Item_no.": Code[30];
        Evaluated_Item_Heading: Code[150];
        Evaluated_VariantCode: Code[30];
        Evaluted_Quatity: Integer;
        Evaluted_Unit_Of_Measure_Code: Code[10];
        Evaluted_Location_Code: Code[10];
        Evaluted_Qty_To_Ship: Decimal;
        "Evaluted_Gen.Bus.Posting_Group": Code[20];
        Evaluted_Businness_Unit_Code: Code[30];
        Evaluted_Cost_Centre_Code: Code[30];
        Evaluted_Department_Code: Code[30];
        Evaluted_Project: Code[30];
        Evaluted_Sell_To_Customer_No: Code[20];
        Evaluted_Sell_To_Customer_NAme: Text;
        Evaluted_Posting_Date: Date;
        Evaluted_Document_Date: Date;
        Evaluted_OrderDate: Date;
        insert1: Integer;
        Customer: Record Customer;
        "Evaluated_Posting_No.Series": Code[10];
        "Evaluated_Shipping_No.Series": Code[10];
        Evaluated_Unit_Price: Decimal;
        Evaluated_Structure: Code[20];
        Evaluated_Ext_Doc_No: Code[30];
        Evaluated_Service_Tax_Group: Code[30];
        Evaluated_PolicyNo_OEMInv_RefNo: Code[30];
        Evaluated_Year_of_MFG: Date;
        Evaluated_Vehicle_Regn_No: Code[30];
        Evaluated_Customer_Name: Code[100];
        Evaluated_Customer_Contact_No: Code[20];
        Evaluated_Policy_Coverage_Start_Date: Date;
        Evaluated_Policy_Coverage_End_Date: Date;
        Evaluated_City: Code[30];
        Evaluated_State: Code[20];
        Evaluated_Region: Code[30];
        Evaluated_Policy_Type: Option;
        Evaluated_Destination_Country: Code[30];
        Evaluated_Destination_Region: Code[30];
        Evaluated_Name: Text[100];
        DocumentwiseServiceMaster: Record "Documentwise Service Master";
        Evaluated_Line_No: Integer;
        Evaluated_Dim1: Code[20];
        DimVal2: Record "Dimension Value";
        DimVal: Record "Dimension Value";
        Document_No2: Code[30];
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        "Sales&RcSetup": Record "Sales & Receivables Setup";
        LineInsert: Integer;
        Evaluated_Vehicle_Identification_No: Code[30];
        CustRec: Record Customer;
        "Documentwise Service Master": Record "Documentwise Service Master";
        XMLRejectMAster: XmlPort "Rejected Purchase Data Export";
        DocServMaster: Record "Documentwise Service Master";
        Vendor: Record Vendor;
        ItemVaraint: Record "Item Variant";
        PurchPrice: Record "Purchase Price";
        PurchPriceExist: Boolean;
        //  TDSNOD: Record "13726";//RUSHAB
        Purch_Header: Record "Purchase Header";
        Purch_HDRInsert: Record "Purchase Header";
        Purch_HDRModify: Record "Purchase Header";
        RecPurchaseLine: Record "Purchase Line";
        PurchpayablesSetup: Record "Purchases & Payables Setup";
        "Purchase Line": Record "Purchase Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Evaluted_Buy_From_Vendor_No: Code[30];
        Evaluated_TDS_Nature: Code[20];
        UOM: Record "Unit of Measure";
        VINVALID: Label 'Vendor  is Invalid';
        TYPEINVALID: Label 'Type   is Invalid';
        ITEMINVALID: Label 'Item No  is Invalid ';
        VBLOCKED: Label 'Customer is Blocked';
        VPGINVALID: Label 'Vendor Posting Group is Invalid';
        IPGINVALID: Label 'Gen Prod. Posting Group for item is Invalid';
        IBLOCKED: Label 'Item is Blocked';
        QINVALID: Label 'Qty is Invalid';
        UOMINVALID: Label 'Unit of Measure is Invalid';
        IUOMINVALID: Label 'Item Unit of Measure is Invalid';
        VARINVALID: Label 'City (Variant Code) is Invalid';
        GBGINVALID: Label 'Gen Bus. Posting Group is Invalid';
        UPINVALID: Label 'Unit Price is Invalid';
        LOCINVALID: Label 'Location is Invalid';
        DINVALID: Label 'Date is invalid';
        STRINVALID: Label 'Structure is invalid';
        LININVALID: Label 'Line No is invalid';
        SRVINVALID: Label 'Service Tax Grp is invalid';
        PSDINVALID: Label 'Policy StartDate is invalid';
        PEDINVALID: Label 'Policy End Date is invalid';
        REGNOINVALID: Label 'Vehicle Reg No and VIN No is Invalid';
        POLNOINVALID: Label 'Policy No is Invalid';
        POLICYEXIST: Label 'Policy No Already exist in Service Master';
        POLICYEXISTCSV: Label 'Policy No Already exist in same csv file';
        POLICYNOTEXIST: Label 'Policy No Does not exist';
        NODINVALID: Label 'TDS Nature of Deduction Code is invalid';
        VRNINVALID: Label 'Vehicle Registration No invalid';
        RawPurchaseDataImport: XMLport "Raw Purchase Data Import";
        PolNo: Code[50];
        GLAcc: Record "G/L Account";
        GLINVALID: Label 'GL Acc No Is Invalid';
        Evaluated_Direct_Unit_Cost: Decimal;
        // NODLines: Record "13785";//RUSHAB
        PolicyMaster: Record "Policy Master";
        NODNOTMAPPED: Label 'NOD %1 not mapped to vendor %2';
        DepDimNotExist: Label 'DepDimNotExist';
        BusLineDimNotExist: Label 'BusLineDimNotExist';
        PurchInvLine: Record "Purch. Inv. Line";
        PurchLine: Record "Purchase Line";
        CASENOEXIST: Label 'CaseNo already exist';
        POLICYNOBLANK: Label 'Blank Policy No';
        NARRATIONBLANK: Label 'Narration must not be blank';
        SERVIDALRIMPORT: Label 'Service ID already imported';
        SERVIDPOSTED: Label 'Service ID already posted';
        SERVIDDUPL: Label 'Service ID exist in same csv';
        SERVIDBLANK: Label 'ServID Must Not Be Blank for Item';
        SERVIDMUSTBLANK: Label 'ServID must be blank for GL';
        POLMUSTNOTBLANK: Label 'Policy no must not be blank';
        RawPOL: Code[50];
        DocPol: Code[50];
        TDSCode: Code[10];
        SERVID10: Label 'Serv ID must not be greater than 10 char';
        SERVID08: Label 'Serv ID 8th char must be .';
        SERVIDS: Label 'Serv ID must start with char S';
        CASENO10: Label 'CASE No must be of 10 char';
        CASENO08: Label 'CASE No 8th char must be .';
        CASENOT: Label 'CASE No must start with char T';
        //GSTAccPeriod: Record "16401";//RUSHAB
        RawLog: Record "Raw Update Log Purchase";
        Rec38: Record "Purchase Header";
        PurchInvHdr: Record "Purch. Inv. Header";
        VENDINVNOPOST: Label 'Vendor Inv No already posted';
        VENDINVNOIMP: Label 'Vendor Inv No already imported';
        INVDATEBLANK: Label 'Select Invoice Date';
        CaseInvAmt: Decimal;
        CaseCrAmt: Decimal;
        ServInvAmt: Decimal;
        ServCrAmt: Decimal;
        PurchCrMemoLine: Record "Purch. Cr. Memo Line";
        RawUpdateLog1: Record "Raw Update Log Purchase";
        DefTemp: Record "Deferral Template";
        EvaluatedDiscount: Decimal;
        PurchaseLine: Record "Purchase Line";

    procedure ValidateRawData(CASEID: Code[250])
    var
        RawUpdateLog: Record "Raw Update Log Purchase";
        FoundError: Boolean;
        RawUpdateLog2: Record "Raw Update Log Purchase";
        PurchLine: Record "Purchase Line";
        PurchInvLine: Record "Purch. Inv. Line";
    begin
        // initlaize
        FoundError := FALSE;

        RawUpdateLog.RESET;
        RawUpdateLog.SETRANGE(RawUpdateLog.CaseID, CASEID);
        RawUpdateLog.SETRANGE(RawUpdateLog.Validated, FALSE);
        IF RawUpdateLog.FINDSET THEN
            REPEAT

                // intiliaze
                UnitPrice := 0;
                Qty := 0;
                PDATE := 0D;
                DDATE := 0D;
                ODATE := 0D;
                LineNo := 0;
                PurchPriceExist := FALSE;
                PolNo := '';
                Evaluated_PolicyNo_OEMInv_RefNo := '';

                // for Vendor invlaid
                IF NOT Vendor.GET(RawUpdateLog.Buy_From_Vendor_No) THEN BEGIN
                    RawUpdateLog."Error description" := VINVALID;
                    FoundError := TRUE;
                END;

                // for invalid Vendor parameters
                IF Vendor.GET(RawUpdateLog.Buy_From_Vendor_No) THEN BEGIN
                    IF Vendor.Blocked = 3 THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + VBLOCKED;
                        FoundError := TRUE;
                    END;
                    IF Vendor."Vendor Posting Group" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + VPGINVALID;
                        FoundError := TRUE;
                    END;
                    IF Vendor."Gen. Bus. Posting Group" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GBGINVALID;
                        FoundError := TRUE;
                    END;
                    IF Vendor."Screening Result" = Vendor."Screening Result"::FAIL THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'ScreeningResultFAIL';
                        FoundError := TRUE;
                    END;
                END;



                // for type invalid
                IF UPPERCASE(RawUpdateLog.Type) <> 'ITEM' THEN BEGIN
                    IF UPPERCASE(RawUpdateLog.Type) <> 'G/L ACCOUNT' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + TYPEINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for item invalid
                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN
                    IF NOT Item.GET(RawUpdateLog.Item_No) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + ITEMINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for G/L code invalid
                IF UPPERCASE(RawUpdateLog.Type) = 'G/L ACCOUNT' THEN BEGIN
                    IF NOT GLAcc.GET(RawUpdateLog.Item_No) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GLINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for checking invalid item parameters
                IF Item.GET THEN BEGIN
                    IF Item.Blocked = TRUE THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + IBLOCKED;
                        FoundError := TRUE;
                    END;

                    IF Item."Gen. Prod. Posting Group" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + IPGINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for zero qty
                IF RawUpdateLog.Quantity <> '' THEN BEGIN
                    EVALUATE(Qty, RawUpdateLog.Quantity);
                END;
                IF Qty = 0 THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + QINVALID;
                    FoundError := TRUE;
                END;

                // for invalid UOM
                IF RawUpdateLog.UOM_Code <> '' THEN BEGIN
                    IF NOT ItemUOM.GET(RawUpdateLog.Item_No, RawUpdateLog.UOM_Code) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + IUOMINVALID;
                        FoundError := TRUE;
                    END;

                    IF NOT UOM.GET(RawUpdateLog.UOM_Code) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + UOMINVALID;
                        FoundError := TRUE;
                    END;

                END;

                // for invlaid variant
                IF RawUpdateLog.Varaint_Code <> '' THEN BEGIN
                    //IF NOT ItemVaraint.GET() THEN BEGIN
                    ItemVaraint.RESET;
                    ItemVaraint.SETRANGE(ItemVaraint.Code, RawUpdateLog.Varaint_Code);
                    IF NOT ItemVaraint.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + VARINVALID;
                        FoundError := TRUE;
                    END;
                END;


                // for zero unit price
                PurchPrice.SETRANGE(PurchPrice."Item No.", RawUpdateLog.Item_No);
                PurchPrice.SETRANGE(PurchPrice."Vendor No.", RawUpdateLog.Buy_From_Vendor_No);
                IF PurchPrice.FINDFIRST THEN
                    PurchPriceExist := TRUE;

                IF PurchPriceExist = FALSE THEN BEGIN
                    IF RawUpdateLog.Direct_Unit_Cost <> '' THEN BEGIN
                        EVALUATE(UnitPrice, RawUpdateLog.Direct_Unit_Cost);
                    END;
                    IF UnitPrice = 0 THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + UPINVALID;
                        FoundError := TRUE;
                    END;
                    IF RawUpdateLog.Direct_Unit_Cost = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'UnitPriceIsMust';
                        FoundError := TRUE;
                    END;
                END;


                // for validating Dates
                IF RawUpdateLog.Posting_Date <> '' THEN BEGIN
                    EVALUATE(PDATE, RawUpdateLog.Posting_Date);
                END;
                IF PDATE = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DINVALID;
                    FoundError := TRUE;
                END;

                IF ((RawUpdateLog."Invoice date" <> 0D) AND (PDATE <> 0D)) THEN BEGIN
                    IF PDATE < RawUpdateLog."Invoice date" THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'PostDateBeforeInvDate';
                        FoundError := TRUE;
                    END;
                END;

                IF RawUpdateLog.Document_Date <> '' THEN BEGIN
                    EVALUATE(DDATE, RawUpdateLog.Document_Date);
                    IF ((RawUpdateLog.Document_Date <> '') AND (PDATE <> 0D)) THEN BEGIN
                        IF PDATE < DDATE THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'PostDateBeforeDocumentDate';
                            FoundError := TRUE;
                        END;
                    END;

                END;
                IF DDATE = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DINVALID;
                    FoundError := TRUE;
                END;

                // to validate structure
                IF RawUpdateLog.Structure <> '' THEN BEGIN
                    //RUSHAB++
                    // IF NOT Structure.GET(RawUpdateLog.Structure) THEN BEGIN
                    //     RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + STRINVALID;
                    //     FoundError := TRUE;
                    // END;
                    //RUSHAB--
                END;

                // for blank line no
                IF RawUpdateLog.Line_No <> '' THEN BEGIN
                    EVALUATE(LineNo, RawUpdateLog.Line_No);
                END;
                IF LineNo = 0 THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + LININVALID;
                    FoundError := TRUE;
                END;

                // for invalid service tx grop
                IF RawUpdateLog.Service_Tax_Group <> '' THEN BEGIN
                    //RUSHAB++
                    // IF NOT ServiceTaxGroup.GET(RawUpdateLog.Service_Tax_Group) THEN BEGIN
                    //     RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SRVINVALID;
                    //     FoundError := TRUE;
                    // END;
                    //RUSHAB--
                END;

                IF RawUpdateLog."Department Dim" <> '' THEN BEGIN
                    DimVal.RESET;
                    DimVal.SETRANGE(Code, RawUpdateLog."Department Dim");
                    DimVal.SETFILTER("Global Dimension No.", '=%1', 3);
                    IF NOT DimVal.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DepDimNotExist;
                        FoundError := TRUE;
                    END;
                END;

                IF RawUpdateLog."Business Line Dim" <> '' THEN BEGIN
                    DimVal.RESET;
                    DimVal.SETRANGE(Code, RawUpdateLog."Business Line Dim");
                    DimVal.SETFILTER("Global Dimension No.", '=%1', 1);
                    IF NOT DimVal.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + BusLineDimNotExist;
                        FoundError := TRUE;
                    END;
                END;

                IF RawUpdateLog."Client Level Code" <> '' THEN BEGIN
                    DimVal.RESET;
                    DimVal.SETRANGE(Code, RawUpdateLog."Client Level Code");
                    DimVal.SETFILTER("Global Dimension No.", '=%1', 4);
                    IF NOT DimVal.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'ClientLevelCodeDoesNotExist';
                        FoundError := TRUE;
                    END;
                END;


                IF RawUpdateLog."Employee Code" <> '' THEN BEGIN
                    DimVal.RESET;
                    DimVal.SETRANGE(Code, RawUpdateLog."Employee Code");
                    DimVal.SETFILTER("Global Dimension No.", '=%1', 5);
                    IF NOT DimVal.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'EmployeeCodeDoesNotExist';
                        FoundError := TRUE;
                    END;
                END;


                IF RawUpdateLog."Integration Doc No" = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'IntDocNo must not blank';
                    FoundError := TRUE;
                END;

                IF RawUpdateLog."Integration Doc No" <> '' THEN BEGIN
                    Rec38.RESET;
                    Rec38.SETRANGE(Rec38."Document Type", Rec38."Document Type"::"Credit Memo");
                    Rec38.SETRANGE("Integration Doc No", RawUpdateLog."Integration Doc No");
                    IF Rec38.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'IntDocNo already uploaded';
                        FoundError := TRUE;
                    END;
                    PurchInvHdr.RESET;
                    PurchInvHdr.SETRANGE("Integration Doc No", RawUpdateLog."Integration Doc No");
                    IF PurchInvHdr.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'IntDocNo already posted';
                        FoundError := TRUE;
                    END;
                END;


                IF RawUpdateLog.Narration = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + NARRATIONBLANK;
                    FoundError := TRUE;
                END;

                RawUpdateLog.Validated := TRUE;
                RawUpdateLog.MODIFY;

            UNTIL RawUpdateLog.NEXT = 0;

        IF FoundError = FALSE THEN BEGIN
            InsertPurchasesDocument(CASEID);
            //UpdateDocumentServiceMAster(CASEID);
            MESSAGE(' Imported Successfully');
        END;

        IF FoundError = TRUE THEN BEGIN

            RawUpdateLog.RESET;
            RawUpdateLog.SETRANGE(RawUpdateLog.CaseID, CASEID);
            IF RawUpdateLog.FINDSET THEN
                REPEAT
                    RawUpdateLog.Status := 1;
                    RawUpdateLog.MODIFY;
                UNTIL RawUpdateLog.NEXT = 0;

            MESSAGE('Error occured ; Please check Rejected Log in csv file');


            RawUpdateLog.RESET;
            RawUpdateLog.SETRANGE(RawUpdateLog.CaseID, CASEID);
            IF RawUpdateLog.FINDFIRST THEN BEGIN
                COMMIT;
                XMLRejectMAster.SETTABLEVIEW(RawUpdateLog);
                XMLRejectMAster.RUN;
            END;

        END; // found errror
    end;

    procedure InsertPurchasesDocument(CASEID: Code[250])
    var
        RawDataLog: Record "Raw Update Log Purchase";
    begin
        // created function for inserting purhcase header & purhcase line

        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID, CASEID);
        //RawDataLog.SETCURRENTKEY("Integration Doc No");
        //RawDataLog.ASCENDING(TRUE);
        IF RawDataLog.FINDSET THEN
            REPEAT


                insert1 := 0;
                Purch_Header.RESET;
                Purch_HDRInsert.RESET;
                Purch_HDRModify.RESET;
                Purch_Header.SETRANGE(Purch_Header."Document Type", Purch_Header."Document Type"::"Credit Memo");
                Purch_Header.SETRANGE(Purch_Header."Integration Doc No", RawDataLog."Integration Doc No");
                IF NOT Purch_Header.FINDFIRST THEN BEGIN

                    Purch_HDRInsert."Document Type" := Purch_HDRInsert."Document Type"::"Credit Memo";
                    PurchpayablesSetup.GET('');
                    IF PurchpayablesSetup."Credit Memo Nos." = '' THEN
                        ERROR(' Please enter cr memo nos in Purchase & Payables setup');
                    Document_No2 := NoSeriesManagement.GetNextNo(PurchpayablesSetup."Credit Memo Nos.", WORKDATE, TRUE);
                    Purch_HDRInsert."No." := Document_No2;
                    Purch_HDRInsert."Integration Doc No" := RawDataLog."Integration Doc No";
                    Purch_HDRInsert.INSERT;
                    insert1 := 1;

                END;


                //modify



                IF insert1 = 1 THEN BEGIN

                    Purch_HDRModify.RESET;
                    Purch_HDRModify.SETRANGE(Purch_HDRModify."Document Type", Purch_HDRInsert."Document Type"::"Credit Memo");
                    Purch_HDRModify.SETRANGE(Purch_HDRModify."Integration Doc No", RawDataLog."Integration Doc No");
                    IF Purch_HDRModify.FINDFIRST THEN BEGIN
                        // Posting Date for Purch Header
                        IF RawDataLog.Posting_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_Posting_Date, RawDataLog.Posting_Date);
                        END;
                        Purch_HDRModify."Posting Date" := Evaluted_Posting_Date;
                        Purch_HDRModify.VALIDATE(Purch_HDRModify."Posting Date", Evaluted_Posting_Date);

                        //doc date
                        IF RawDataLog.Document_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_Document_Date, RawDataLog.Document_Date);
                        END;
                        Purch_HDRModify."Document Date" := Evaluted_Document_Date;
                        Purch_HDRModify.VALIDATE(Purch_HDRModify."Document Date", Evaluted_Document_Date);

                        IF RawDataLog.Buy_From_Vendor_No <> '' THEN BEGIN
                            EVALUATE(Evaluted_Buy_From_Vendor_No, RawDataLog.Buy_From_Vendor_No);
                        END;
                        Purch_HDRModify."Buy-from Vendor No." := Evaluted_Buy_From_Vendor_No;
                        Purch_HDRModify.VALIDATE(Purch_HDRModify."Buy-from Vendor No.", Evaluted_Buy_From_Vendor_No);

                        IF RawDataLog.Structure <> '' THEN BEGIN
                            // Purch_HDRModify.Structure := RawDataLog.Structure;//RUSHAB++
                            //Purch_HDRModify.VALIDATE(Purch_HDRModify.Structure, RawDataLog.Structure);//RUSHAB++
                        END ELSE BEGIN
                            // Purch_HDRModify.Structure := '';//RUSHAB++
                        END;


                        Purch_HDRModify."Vendor Cr. Memo No." := RawDataLog."Invoice No.";
                        Purch_HDRModify.VALIDATE("Vendor Cr. Memo No.");
                        Purch_HDRModify.VALIDATE("Reference Invoice Number", RawDataLog."Invoice No.");
                        Purch_HDRModify."Shortcut Dimension 1 Code" := RawDataLog."Business Line Dim";
                        Purch_HDRModify.VALIDATE("Shortcut Dimension 1 Code");

                        Purch_HDRModify.Department := RawDataLog."Department Dim";
                        Purch_HDRModify.VALIDATE(Department);

                        Purch_HDRModify.VALIDATE("Client Level Code", RawDataLog."Client Level Code");
                        Purch_HDRModify.VALIDATE("Employee Code", RawDataLog."Employee Code");


                        Purch_HDRModify."Location Code" := 'MUMBAI';
                        Purch_HDRModify.VALIDATE(Purch_HDRModify."Location Code", 'MUMBAI');

                        Purch_HDRModify."Manual Invoice" := TRUE;
                        Purch_HDRModify."Invoice Date" := RawDataLog."Invoice date";
                        Purch_HDRModify.VALIDATE("Vendor Order No.", RawDataLog."PO Number");
                        Purch_HDRModify.VALIDATE("Order Date", RawDataLog."PO Date");
                        Purch_HDRModify.VALIDATE("Billing Type", RawDataLog."Billing Type");

                        //CCIT-12082022
                        Purch_HDRModify.VALIDATE("Posting No. Series", RawDataLog.PostingNoSeries);
                        Purch_HDRModify.VALIDATE("Posting No.", RawDataLog.PostingNo);
                        //CCIT-12082022

                        Purch_HDRModify.MODIFY;

                    END;
                END;

                // Purch line insert
                LineInsert := 0;

                IF RawDataLog.Line_No <> '' THEN BEGIN
                    EVALUATE(Evaluated_Line_No, RawDataLog.Line_No);
                END;



                PurchaseLine.RESET;
                PurchaseLine.SETRANGE(PurchaseLine."Document No.", Document_No2);
                PurchaseLine.SETRANGE(PurchaseLine."Integration Doc No", RawDataLog."Integration Doc No");
                PurchaseLine.SETRANGE(PurchaseLine."Line No.", Evaluated_Line_No);
                IF NOT PurchaseLine.FINDFIRST THEN BEGIN

                    PurchaseLine."Document Type" := PurchaseLine."Document Type"::"Credit Memo";
                    PurchaseLine."Integration Doc No" := RawDataLog."Integration Doc No";
                    PurchaseLine."Document No." := Document_No2;
                    PurchaseLine."Line No." := Evaluated_Line_No;
                    PurchaseLine.INSERT;
                    LineInsert := 1;
                END;

                IF LineInsert = 1 THEN BEGIN
                    PurchaseLine.RESET;
                    PurchaseLine.SETRANGE(PurchaseLine."Integration Doc No", RawDataLog."Integration Doc No");
                    PurchaseLine.SETRANGE(PurchaseLine."Line No.", Evaluated_Line_No);
                    IF PurchaseLine.FINDFIRST THEN BEGIN
                        Evaluated_Service_Tax_Group := '';
                        PurchaseLine."Document Type" := PurchaseLine."Document Type"::"Credit Memo";
                        PurchaseLine."Integration Doc No" := RawDataLog."Integration Doc No";
                        PurchaseLine."Document No." := Document_No2;
                        PurchaseLine.VALIDATE(PurchaseLine."Line No.", Evaluated_Line_No);

                        IF RawDataLog.Buy_From_Vendor_No <> '' THEN BEGIN
                            EVALUATE(Evaluted_Buy_From_Vendor_No, RawDataLog.Buy_From_Vendor_No);
                        END;
                        PurchaseLine."Buy-from Vendor No." := Evaluted_Buy_From_Vendor_No;
                        PurchaseLine.VALIDATE(PurchaseLine."Buy-from Vendor No.", Evaluted_Buy_From_Vendor_No);

                        IF RawDataLog.Type = 'Item' THEN BEGIN
                            PurchaseLine.Type := 2;
                            PurchaseLine.VALIDATE(PurchaseLine.Type, 2);
                        END;

                        IF RawDataLog.Type = 'G/L Account' THEN BEGIN
                            PurchaseLine.Type := 1;
                            PurchaseLine.VALIDATE(PurchaseLine.Type, 1);
                        END;

                        IF RawDataLog.Item_No <> '' THEN BEGIN
                            EVALUATE("Evaluated_Item_no.", RawDataLog.Item_No);
                            PurchaseLine."No." := "Evaluated_Item_no.";
                            PurchaseLine.VALIDATE(PurchaseLine."No.", "Evaluated_Item_no.");
                        END;

                        IF RawDataLog.UOM_Code <> '' THEN BEGIN
                            EVALUATE(Evaluted_Unit_Of_Measure_Code, RawDataLog.UOM_Code);
                        END;
                        PurchaseLine."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                        PurchaseLine.VALIDATE(PurchaseLine."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);


                        PurchaseLine."Variant Code" := RawDataLog.Varaint_Code;
                        PurchaseLine.VALIDATE(PurchaseLine."Variant Code", RawDataLog.Varaint_Code);

                        IF RawDataLog.Quantity <> '' THEN BEGIN
                            EVALUATE(Evaluted_Quatity, RawDataLog.Quantity);
                        END;
                        PurchaseLine.Quantity := Evaluted_Quatity;
                        PurchaseLine.VALIDATE(PurchaseLine.Quantity, Evaluted_Quatity);

                        IF RawDataLog.Service_Tax_Group <> '' THEN BEGIN
                            EVALUATE(Evaluated_Service_Tax_Group, RawDataLog.Service_Tax_Group);

                            //  PurchaseLine."Service Tax Group" := Evaluated_Service_Tax_Group;//RUSHAB++
                            //  PurchaseLine.VALIDATE(PurchaseLine."Service Tax Group", Evaluated_Service_Tax_Group);//RUSHAB++
                        END;

                        PurchaseLine."Location Code" := 'MUMBAI';
                        PurchaseLine.VALIDATE(PurchaseLine."Location Code", 'MUMBAI');

                        PurchaseLine."Gen. Prod. Posting Group" := 'SERVICE';

                        IF RawDataLog.TDS_Nature <> '' THEN BEGIN
                            EVALUATE(Evaluated_TDS_Nature, RawDataLog.TDS_Nature);

                            //  PurchaseLine."TDS Nature of Deduction" := Evaluated_TDS_Nature;//RUSHAB++
                            //  PurchaseLine.VALIDATE(PurchaseLine."TDS Nature of Deduction", Evaluated_TDS_Nature);//RUSHAB++

                        END;

                        IF RawDataLog.UOM_Code <> '' THEN BEGIN
                            EVALUATE(Evaluted_Unit_Of_Measure_Code, RawDataLog.UOM_Code);
                        END;


                        PurchaseLine."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                        PurchaseLine.VALIDATE(PurchaseLine."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);

                        PurchaseLine."Gen. Prod. Posting Group" := 'SERVICE';

                        PurchaseLine."Integration Doc No" := RawDataLog."Integration Doc No";
                        PurchaseLine."Case No." := RawDataLog."Case No.";
                        PurchaseLine.VALIDATE(PurchaseLine."Case No.");
                        PurchaseLine."Vehicle Identification No." := RawDataLog."Vehicle Identification No.";
                        PurchaseLine.VALIDATE(PurchaseLine."Vehicle Identification No.");

                        RawPOL := DELCHR(RawDataLog.PolicyNo_OEMInv_RefNo, '=', '*');

                        PurchaseLine."Policy No." := RawPOL;
                        PurchaseLine.VALIDATE(PurchaseLine."Policy No.", RawPOL);
                        PurchaseLine."VRN No." := RawDataLog."Vehicle Registration No";
                        PurchaseLine.VALIDATE(PurchaseLine."VRN No.");
                        PurchaseLine.Narration := RawDataLog.Narration;

                        PurchaseLine.VALIDATE(PurchaseLine."Service ID", RawDataLog."Service ID");
                        PurchaseLine."Service Date" := RawDataLog."Service Date";

                        IF RawDataLog.Direct_Unit_Cost <> '' THEN BEGIN
                            EVALUATE(Evaluated_Direct_Unit_Cost, RawDataLog.Direct_Unit_Cost);
                            PurchaseLine."Direct Unit Cost" := Evaluated_Direct_Unit_Cost;
                            PurchaseLine.VALIDATE(PurchaseLine."Direct Unit Cost", Evaluated_Direct_Unit_Cost);
                        END;

                        EvaluatedDiscount := 0;
                        IF RawDataLog."Discount Percent" <> '' THEN BEGIN
                            EVALUATE(EvaluatedDiscount, RawDataLog."Discount Percent");
                            PurchaseLine.VALIDATE(PurchaseLine."Line Discount %", EvaluatedDiscount);
                        END;
                        IF RawDataLog."Business Line Dim" <> '' THEN BEGIN
                            PurchaseLine.VALIDATE("Shortcut Dimension 1 Code", RawDataLog."Business Line Dim");
                        END;

                        IF RawDataLog."Department Dim" <> '' THEN BEGIN
                            PurchaseLine.VALIDATE("Department Code", RawDataLog."Department Dim");
                        END;

                        PurchaseLine.VALIDATE("Client Level Code", RawDataLog."Client Level Code");
                        PurchaseLine.VALIDATE("Employee Code", RawDataLog."Employee Code");
                        IF RawDataLog."Deferral Code" <> '' THEN BEGIN
                            PurchaseLine.VALIDATE("Deferral Code", RawDataLog."Deferral Code");
                        END;

                        PurchaseLine.MODIFY;
                    END;
                END; // line inser end
            UNTIL RawDataLog.NEXT = 0;
    end;

    procedure UpdateDocumentServiceMAster(CASEID: Code[250])
    var
        RawDataLog: Record "Raw Update Log Purchase";
        PHdr: Record "Purchase Header";
    begin
        // created function for updating purhcase document noin docuemnt service master
        DocPol := '';
        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID, CASEID);
        IF RawDataLog.FINDSET THEN
            REPEAT

                DocPol := DELCHR(RawDataLog.PolicyNo_OEMInv_RefNo, '=', '*');

                // for updating document no
                IF RawDataLog.Item_No <> 'TOLL' THEN BEGIN


                    DocServMaster.RESET;
                    DocServMaster.SETRANGE(DocServMaster."Policy No/OEM Inv/Ref No", DocPol);
                    DocServMaster.SETRANGE(DocServMaster.Cancelled, FALSE);
                    IF DocServMaster.FINDFIRST THEN BEGIN
                        IF RawDataLog.Line_No <> '' THEN BEGIN
                            EVALUATE(Evaluated_Line_No, RawDataLog.Line_No);
                        END;
                        DocServMaster."Purchase Doc No" := RawDataLog."Integration Doc No";
                        DocServMaster."Purchase Doc Line No" := Evaluated_Line_No;
                        DocServMaster."Case No" := RawDataLog."Case No.";
                        DocServMaster."Item No" := RawDataLog.Item_No;

                        PHdr.RESET;
                        PHdr.SETRANGE("Integration Doc No", RawDataLog."Integration Doc No");
                        IF PHdr.FINDFIRST THEN BEGIN
                            DocServMaster."PI No." := PHdr."No.";
                            DocServMaster."PI Posting Date" := PHdr."Posting Date";
                            DocServMaster."Vendor No." := PHdr."Buy-from Vendor No.";
                        END;

                        DocServMaster.MODIFY;
                    END;

                END;
            /*
             // for updating document no
            DocServMaster.RESET;
            DocServMaster.SETRANGE(DocServMaster."Vehicle Regn No",RawDataLog."Vehicle Registration No");
            IF DocServMaster.FINDFIRST THEN BEGIN
              IF RawDataLog.Line_No <> '' THEN BEGIN
              EVALUATE(Evaluated_Line_No,RawDataLog.Line_No);
              END;
              DocServMaster."Purchase Doc No" := RawDataLog."Integration Doc No" ;
            DocServMaster."Purchase Doc Line No"  := Evaluated_Line_No ;
             DocServMaster.MODIFY;
            END;
            */
            UNTIL RawDataLog.NEXT = 0;

    end;
}

