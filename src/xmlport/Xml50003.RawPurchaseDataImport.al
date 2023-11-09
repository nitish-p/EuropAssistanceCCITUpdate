xmlport 50003 "Raw Purchase Data Import"
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
                fieldelement(ProjectName; "Raw Update Log Purchase"."Project Name")
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
        // Structure: Record "13792";
        LineNo: Integer;
        // ServiceTaxGroup: Record "16471";
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
        XMLRejectMAster: XMLport "Rejected Purchase Data Export";
        DocServMaster: Record "Documentwise Service Master";
        Vendor: Record Vendor;
        ItemVaraint: Record "Item Variant";
        PurchPrice: Record "Purchase Price";
        PurchPriceExist: Boolean;
        //TDSNOD: Record "13726";//RUSHAB
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
        // GSTAccPeriod: Record "16401";
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
        FAINVALID: Label 'FA No Is Invalid';
        RecFA: Record "Fixed Asset";

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
                PurchPriceExist := TRUE;
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
                        IF UPPERCASE(RawUpdateLog.Type) <> 'FIXED ASSET' THEN BEGIN //CCIT-23022022
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + TYPEINVALID;
                            FoundError := TRUE;
                        END;//CCIT-23022022
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

                //CCIT-23022022
                // for Fixed Asset invalid
                IF UPPERCASE(RawUpdateLog.Type) = 'FIXED ASSET' THEN BEGIN
                    IF NOT RecFA.GET(RawUpdateLog.Item_No) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + FAINVALID;
                        FoundError := TRUE;
                    END;
                END;
                //CCIT-23022022

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

                // for invalid TDS NOD

                TDSCode := '';
                IF RawUpdateLog.TDS_Nature <> '' THEN BEGIN
                    //RUSHAB++
                    // IF NOT TDSNOD.GET(RawUpdateLog.TDS_Nature) THEN BEGIN
                    //     RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + NODINVALID;
                    //     FoundError := TRUE;
                    // END;
                    //RUSHAB--
                    TDSCode := RawUpdateLog.TDS_Nature;
                    //RUSHAB++
                    // NODLines.RESET;
                    // NODLines.SETRANGE(Type, 3);
                    // NODLines.SETRANGE("No.", RawUpdateLog.Buy_From_Vendor_No);
                    // NODLines.SETRANGE("NOD/NOC", TDSCode);
                    // IF NOT NODLines.FINDFIRST THEN BEGIN
                    //     RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'NOD ' + TDSCode + ' not mapped to ' + RawUpdateLog.Buy_From_Vendor_No;
                    //     FoundError := TRUE;
                    // END;
                    //RUSHAB--
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
                /*IF LineNo <> 0 THEN BEGIN  //CCIT-16092022 --as per vijay req
                IF ((UPPERCASE(RawUpdateLog.Type) = 'G/L ACCOUNT') AND (RawUpdateLog.Item_No='218212')) THEN BEGIN
                  RawUpdateLog1.RESET;
                  RawUpdateLog1.SETRANGE("Integration Doc No",RawUpdateLog."Integration Doc No");
                  RawUpdateLog1.SETRANGE(Item_No,RawUpdateLog.Item_No);
                  RawUpdateLog1.SETFILTER(Line_No,'<>%1',RawUpdateLog.Line_No);
                  IF RawUpdateLog1.FINDFIRST THEN BEGIN
                    IF UPPERCASE(RawUpdateLog1.Type) = 'G/L ACCOUNT' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ 'MultipleLinesInSingleInvoiceNotAllowedForGL218212' ;
                    FoundError := TRUE ;
                    END;
                  END;
                END;
                END;*/

                // for invalid service tx grop
                IF RawUpdateLog.Service_Tax_Group <> '' THEN BEGIN
                    //RUSHAB++
                    // IF NOT ServiceTaxGroup.GET(RawUpdateLog.Service_Tax_Group) THEN BEGIN
                    //     RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SRVINVALID;
                    //     FoundError := TRUE;
                    // END;

                    //RUSHAB--
                END;

                /*
                // for vehicle reg no does not exist
                DocumentwiseServiceMaster.RESET;
                DocumentwiseServiceMaster.SETRANGE(DocumentwiseServiceMaster."Vehicle Regn No",RawUpdateLog."Vehicle Registration No");
                IF NOT DocumentwiseServiceMaster.FINDFIRST  THEN BEGIN
                  RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ VRNINVALID ;
                FoundError := TRUE ;
                END;
                */

                // for policy no does not exist +++
                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN

                    IF RawUpdateLog.PolicyNo_OEMInv_RefNo = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + POLMUSTNOTBLANK;
                        FoundError := TRUE;
                    END;

                    IF RawUpdateLog.PolicyNo_OEMInv_RefNo <> '' THEN BEGIN

                        EVALUATE(Evaluated_PolicyNo_OEMInv_RefNo, RawUpdateLog.PolicyNo_OEMInv_RefNo);

                        PolNo := DELCHR(Evaluated_PolicyNo_OEMInv_RefNo, '=', '*');
                        PolicyMaster.RESET;
                        PolicyMaster.SETRANGE(PolicyMaster.PolicyNo, PolNo);
                        IF NOT PolicyMaster.FINDFIRST THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + POLICYNOTEXIST;
                            FoundError := TRUE;
                        END;

                        IF Evaluated_PolicyNo_OEMInv_RefNo = '' THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + POLICYNOBLANK;
                            FoundError := TRUE;
                        END;

                    END;
                END;
                // for policy no does not exist ---

                // for case no. +++
                IF ((UPPERCASE(RawUpdateLog.Type) = 'G/L ACCOUNT') AND (RawUpdateLog.Item_No = '218212')) THEN BEGIN
                    IF RawUpdateLog."Case No." = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ';' + 'CaseNoMandatoryForGL218212';
                        FoundError := TRUE;
                    END
                END;

                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN


                    IF RawUpdateLog."Case No." = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ';' + 'CaseNoMustNotBlank';
                        FoundError := TRUE;
                    END ELSE BEGIN

                        CaseInvAmt := 0;
                        CaseCrAmt := 0;

                        PurchInvLine.RESET;
                        PurchInvLine.SETRANGE(PurchInvLine."Buy-from Vendor No.", RawUpdateLog.Buy_From_Vendor_No);
                        PurchInvLine.SETRANGE(PurchInvLine."No.", RawUpdateLog.Item_No);
                        PurchInvLine.SETRANGE(PurchInvLine."Case No.", RawUpdateLog."Case No.");
                        IF PurchInvLine.FINDSET THEN
                            REPEAT
                                CaseInvAmt := CaseInvAmt + PurchInvLine.Amount;
                            UNTIL PurchInvLine.NEXT = 0;

                        PurchCrMemoLine.RESET;
                        PurchCrMemoLine.SETRANGE(PurchCrMemoLine."Buy-from Vendor No.", RawUpdateLog.Buy_From_Vendor_No);
                        PurchCrMemoLine.SETRANGE(PurchCrMemoLine."No.", RawUpdateLog.Item_No);
                        PurchCrMemoLine.SETRANGE(PurchCrMemoLine."Case No.", RawUpdateLog."Case No.");
                        IF PurchCrMemoLine.FINDSET THEN
                            REPEAT
                                CaseCrAmt := CaseCrAmt + PurchCrMemoLine.Amount;
                            UNTIL PurchCrMemoLine.NEXT = 0;

                        IF CaseInvAmt - CaseCrAmt > 0 THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'CaseNo already posted';
                            FoundError := TRUE;
                        END;

                        /*   commeted on 220620
                        PurchInvLine.RESET;
                        PurchInvLine.SETRANGE(PurchInvLine."Buy-from Vendor No.",RawUpdateLog.Buy_From_Vendor_No);
                        PurchInvLine.SETRANGE(PurchInvLine."No.",RawUpdateLog.Item_No);
                        PurchInvLine.SETRANGE(PurchInvLine."Case No.",RawUpdateLog."Case No.");
                        IF PurchInvLine.FINDFIRST THEN BEGIN
                          RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ 'CaseNo already posted';
                          FoundError := TRUE ;
                        END;
                        */
                        PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Buy-from Vendor No.", RawUpdateLog.Buy_From_Vendor_No);
                        PurchLine.SETRANGE(PurchLine."Document Type", 2);
                        PurchLine.SETRANGE(PurchLine."No.", RawUpdateLog.Item_No);
                        PurchLine.SETRANGE(PurchLine."Case No.", RawUpdateLog."Case No.");
                        IF PurchLine.FINDFIRST THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'CASENo.already uploaded';
                            FoundError := TRUE;
                        END;

                        IF RawUpdateLog."Case No." <> '' THEN BEGIN
                            IF STRLEN(RawUpdateLog."Case No.") <> 10 THEN BEGIN
                                RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CASENO10;
                                FoundError := TRUE;
                            END;

                            IF COPYSTR(RawUpdateLog."Case No.", 1, 1) <> 'T' THEN BEGIN
                                RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CASENOT;
                                FoundError := TRUE;
                            END;
                        END;
                    END;
                END;
                // for case no. ----

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

                IF RawUpdateLog."Client Level Code" = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'ClientLevelCodeMandatory';
                    FoundError := TRUE;
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



                // prdp - added code to validate unique service ID +++

                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN

                    IF RawUpdateLog."Service ID" <> '' THEN BEGIN

                        PurchLine.RESET;
                        PurchLine.SETRANGE("Service ID", RawUpdateLog."Service ID");
                        PurchLine.SETRANGE("Document Type", 2);
                        IF PurchLine.FINDFIRST THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDALRIMPORT;
                            FoundError := TRUE;
                        END;

                        ServInvAmt := 0;
                        ServCrAmt := 0;

                        PurchInvLine.RESET;
                        //PurchInvLine.SETRANGE(PurchInvLine."Buy-from Vendor No.",RawUpdateLog.Buy_From_Vendor_No);
                        //PurchInvLine.SETRANGE(PurchInvLine."No.",RawUpdateLog.Item_No);
                        PurchInvLine.SETRANGE(Type, 2);
                        PurchInvLine.SETRANGE(PurchInvLine."Service ID", RawUpdateLog."Service ID");
                        IF PurchInvLine.FINDSET THEN
                            REPEAT
                                ServInvAmt := ServInvAmt + PurchInvLine.Amount;
                            UNTIL PurchInvLine.NEXT = 0;

                        PurchCrMemoLine.RESET;
                        //PurchCrMemoLine.SETRANGE(PurchCrMemoLine."Buy-from Vendor No.",RawUpdateLog.Buy_From_Vendor_No);
                        //PurchCrMemoLine.SETRANGE(PurchCrMemoLine."No.",RawUpdateLog.Item_No);
                        PurchCrMemoLine.SETRANGE(Type, 2);
                        PurchCrMemoLine.SETRANGE(PurchCrMemoLine."Service ID", RawUpdateLog."Service ID");
                        IF PurchCrMemoLine.FINDSET THEN
                            REPEAT
                                ServCrAmt := ServCrAmt + PurchCrMemoLine.Amount;
                            UNTIL PurchCrMemoLine.NEXT = 0;


                        PurchInvLine.RESET;
                        //PurchInvLine.SETRANGE(PurchInvLine."Buy-from Vendor No.",RawUpdateLog.Buy_From_Vendor_No);
                        //PurchInvLine.SETRANGE(PurchInvLine."No.",RawUpdateLog.Item_No);
                        PurchInvLine.SETRANGE(Type, 2);
                        PurchInvLine.SETRANGE(PurchInvLine."Service ID", RawUpdateLog."Service ID");
                        IF PurchInvLine.FINDFIRST THEN BEGIN
                            IF ServInvAmt - ServCrAmt > 0 THEN BEGIN
                                RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDPOSTED;
                                FoundError := TRUE;
                            END;
                        END;


                    END;

                    IF RawUpdateLog."Service ID" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDBLANK;
                        FoundError := TRUE;
                    END;

                    IF RawUpdateLog."Service Date" = 0D THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'ServiceDateMandatoryForItem';
                        FoundError := TRUE;
                    END;

                END;

                IF UPPERCASE(RawUpdateLog.Type) = 'G/L ACCOUNT' THEN BEGIN
                    IF RawUpdateLog."Service ID" <> '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDMUSTBLANK;
                        FoundError := TRUE;
                    END;
                END;

                IF RawUpdateLog."Deferral Code" <> '' THEN BEGIN
                    DefTemp.RESET;
                    DefTemp.SETRANGE("Deferral Code", RawUpdateLog."Deferral Code");
                    IF NOT DefTemp.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'InvalidDeferralCode';
                        FoundError := TRUE;
                    END;
                END;
                // prdp - added code to validate unique service ID ---
                /*
                // to check vend inv no financial year wise

                IF RawUpdateLog."Invoice No." <> '' THEN BEGIN   //  vendor inv no +++

                IF RawUpdateLog."Invoice date" = 0D THEN BEGIN
                 RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+INVDATEBLANK;
                 FoundError := TRUE ;
                END;

                GSTAccPeriod.RESET;
                GSTAccPeriod.SETFILTER("Starting Date",'<>%1',0D);
                GSTAccPeriod.SETFILTER("Ending Date",'<>%1',0D);
                IF GSTAccPeriod.FINDSET THEN REPEAT

                  IF ((RawUpdateLog."Invoice date" <= GSTAccPeriod."Ending Date") AND (RawUpdateLog."Invoice date" >= GSTAccPeriod."Starting Date")) THEN BEGIN
                    Rec38.RESET;
                    Rec38.SETRANGE("Vendor Invoice No.",RawUpdateLog."Invoice No.");
                    Rec38.SETFILTER("Buy-from Vendor No.",'<>%1',RawUpdateLog.Buy_From_Vendor_No);
                    Rec38.SETFILTER("Posting Date",'%1..%2',GSTAccPeriod."Starting Date",GSTAccPeriod."Ending Date");
                    IF Rec38.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ VENDINVNOIMP;
                    FoundError := TRUE ;
                    END;

                    PurchInvHdr.RESET;
                    PurchInvHdr.SETRANGE("Vendor Invoice No.",RawUpdateLog."Invoice No.");
                    PurchInvHdr.SETFILTER("Buy-from Vendor No.",'<>%1',RawUpdateLog.Buy_From_Vendor_No);
                    PurchInvHdr.SETFILTER("Posting Date",'%1..%2',GSTAccPeriod."Starting Date",GSTAccPeriod."Ending Date");
                    IF PurchInvHdr.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ VENDINVNOPOST;
                    FoundError := TRUE ;
                    END;
                  END;

                UNTIL GSTAccPeriod.NEXT=0;

                END; //  vendor inv no ---

                */




                RawUpdateLog.Validated := TRUE;
                RawUpdateLog.MODIFY;

            UNTIL RawUpdateLog.NEXT = 0;

        IF FoundError = FALSE THEN BEGIN
            InsertPurchasesDocument(CASEID);
            UpdateDocumentServiceMAster(CASEID);
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
                Purch_Header.SETRANGE(Purch_Header."Document Type", Purch_Header."Document Type"::Invoice);
                Purch_Header.SETRANGE(Purch_Header."Integration Doc No", RawDataLog."Integration Doc No");
                IF NOT Purch_Header.FINDFIRST THEN BEGIN

                    Purch_HDRInsert."Document Type" := Purch_HDRInsert."Document Type"::Invoice;
                    PurchpayablesSetup.GET('');
                    IF PurchpayablesSetup."Invoice Nos." = '' THEN
                        ERROR(' Please enter invoice nos in Purchase & Payables setup');
                    Document_No2 := NoSeriesManagement.GetNextNo(PurchpayablesSetup."Invoice Nos.", WORKDATE, TRUE);
                    Purch_HDRInsert."No." := Document_No2;
                    Purch_HDRInsert."Integration Doc No" := RawDataLog."Integration Doc No";
                    Purch_HDRInsert.INSERT;
                    insert1 := 1;

                END;


                //modify



                IF insert1 = 1 THEN BEGIN

                    Purch_HDRModify.RESET;
                    Purch_HDRModify.SETRANGE(Purch_HDRModify."Document Type", Purch_HDRInsert."Document Type"::Invoice);
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
                            // Purch_HDRModify.Structure := RawDataLog.Structure;//RUSHAB
                            // Purch_HDRModify.VALIDATE(Purch_HDRModify.Structure, RawDataLog.Structure);//RUSHAB
                        END ELSE BEGIN
                            //  Purch_HDRModify.Structure := '';//RUSHAB
                        END;


                        Purch_HDRModify."Vendor Invoice No." := RawDataLog."Invoice No.";
                        Purch_HDRModify.VALIDATE("Vendor Invoice No.");

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
                        //CCIT-03082022
                        Purch_HDRModify.VALIDATE("Posting No. Series", RawDataLog.PostingNoSeries);
                        Purch_HDRModify.VALIDATE("Posting No.", RawDataLog.PostingNo);
                        //CCIT-03082022
                        Purch_HDRModify.MODIFY;

                    END;
                END;

                // Purch line insert
                LineInsert := 0;

                IF RawDataLog.Line_No <> '' THEN BEGIN
                    EVALUATE(Evaluated_Line_No, RawDataLog.Line_No);
                END;



                "Purchase Line".RESET;
                "Purchase Line".SETRANGE("Purchase Line"."Integration Doc No", RawDataLog."Integration Doc No");
                "Purchase Line".SETRANGE("Purchase Line"."Line No.", Evaluated_Line_No);
                IF NOT "Purchase Line".FINDFIRST THEN BEGIN

                    "Purchase Line"."Document Type" := "Purchase Line"."Document Type"::Invoice;
                    "Purchase Line"."Integration Doc No" := RawDataLog."Integration Doc No";
                    "Purchase Line"."Document No." := Document_No2;
                    "Purchase Line"."Line No." := Evaluated_Line_No;
                    "Purchase Line".INSERT;
                    LineInsert := 1;
                END;

                IF LineInsert = 1 THEN BEGIN
                    "Purchase Line".RESET;
                    "Purchase Line".SETRANGE("Purchase Line"."Integration Doc No", RawDataLog."Integration Doc No");
                    "Purchase Line".SETRANGE("Purchase Line"."Line No.", Evaluated_Line_No);
                    IF "Purchase Line".FINDFIRST THEN BEGIN
                        Evaluated_Service_Tax_Group := '';
                        "Purchase Line"."Document Type" := "Purchase Line"."Document Type"::Invoice;
                        "Purchase Line"."Integration Doc No" := RawDataLog."Integration Doc No";
                        "Purchase Line"."Document No." := Document_No2;
                        "Purchase Line".VALIDATE("Purchase Line"."Line No.", Evaluated_Line_No);

                        IF RawDataLog.Buy_From_Vendor_No <> '' THEN BEGIN
                            EVALUATE(Evaluted_Buy_From_Vendor_No, RawDataLog.Buy_From_Vendor_No);
                        END;
                        "Purchase Line"."Buy-from Vendor No." := Evaluted_Buy_From_Vendor_No;
                        "Purchase Line".VALIDATE("Purchase Line"."Buy-from Vendor No.", Evaluted_Buy_From_Vendor_No);

                        IF RawDataLog.Type = 'Item' THEN BEGIN
                            "Purchase Line".Type := 2;
                            "Purchase Line".VALIDATE("Purchase Line".Type, 2);
                        END;

                        IF RawDataLog.Type = 'G/L Account' THEN BEGIN
                            "Purchase Line".Type := 1;
                            "Purchase Line".VALIDATE("Purchase Line".Type, 1);
                        END;

                        //CCIT-23022022
                        IF UPPERCASE(RawDataLog.Type) = 'FIXED ASSET' THEN BEGIN
                            //"Purchase Line".Type := 3 ;
                            "Purchase Line".VALIDATE("Purchase Line".Type, "Purchase Line".Type::"Fixed Asset");
                        END;
                        //CCIT-23022022

                        IF RawDataLog.Item_No <> '' THEN BEGIN
                            EVALUATE("Evaluated_Item_no.", RawDataLog.Item_No);
                            "Purchase Line"."No." := "Evaluated_Item_no.";
                            "Purchase Line".VALIDATE("Purchase Line"."No.", "Evaluated_Item_no.");
                        END;

                        IF RawDataLog.UOM_Code <> '' THEN BEGIN
                            EVALUATE(Evaluted_Unit_Of_Measure_Code, RawDataLog.UOM_Code);
                        END;
                        "Purchase Line"."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                        "Purchase Line".VALIDATE("Purchase Line"."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);


                        "Purchase Line"."Variant Code" := RawDataLog.Varaint_Code;
                        "Purchase Line".VALIDATE("Purchase Line"."Variant Code", RawDataLog.Varaint_Code);

                        IF RawDataLog.Quantity <> '' THEN BEGIN
                            EVALUATE(Evaluted_Quatity, RawDataLog.Quantity);
                        END;
                        "Purchase Line".Quantity := Evaluted_Quatity;
                        "Purchase Line".VALIDATE("Purchase Line".Quantity, Evaluted_Quatity);

                        IF RawDataLog.Service_Tax_Group <> '' THEN BEGIN
                            EVALUATE(Evaluated_Service_Tax_Group, RawDataLog.Service_Tax_Group);

                            // "Purchase Line"."Service Tax Group" := Evaluated_Service_Tax_Group;//RUSHAB
                            // "Purchase Line".VALIDATE("Purchase Line"."Service Tax Group", Evaluated_Service_Tax_Group);//RUSHAB
                        END;

                        "Purchase Line"."Location Code" := 'MUMBAI';
                        "Purchase Line".VALIDATE("Purchase Line"."Location Code", 'MUMBAI');

                        "Purchase Line"."Gen. Prod. Posting Group" := 'SERVICE';

                        IF RawDataLog.TDS_Nature <> '' THEN BEGIN
                            EVALUATE(Evaluated_TDS_Nature, RawDataLog.TDS_Nature);

                            //"Purchase Line"."TDS Nature of Deduction" := Evaluated_TDS_Nature;//RUSHAB
                            // "Purchase Line".VALIDATE("Purchase Line"."TDS Nature of Deduction", Evaluated_TDS_Nature);//RUSHAB

                        END;

                        IF RawDataLog.UOM_Code <> '' THEN BEGIN
                            EVALUATE(Evaluted_Unit_Of_Measure_Code, RawDataLog.UOM_Code);
                        END;


                        "Purchase Line"."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                        "Purchase Line".VALIDATE("Purchase Line"."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);

                        "Purchase Line"."Gen. Prod. Posting Group" := 'SERVICE';

                        "Purchase Line"."Integration Doc No" := RawDataLog."Integration Doc No";
                        "Purchase Line"."Case No." := RawDataLog."Case No.";
                        "Purchase Line".VALIDATE("Purchase Line"."Case No.");
                        "Purchase Line"."Vehicle Identification No." := RawDataLog."Vehicle Identification No.";
                        "Purchase Line".VALIDATE("Purchase Line"."Vehicle Identification No.");

                        RawPOL := DELCHR(RawDataLog.PolicyNo_OEMInv_RefNo, '=', '*');

                        "Purchase Line"."Policy No." := RawPOL;
                        "Purchase Line".VALIDATE("Purchase Line"."Policy No.", RawPOL);
                        "Purchase Line"."VRN No." := RawDataLog."Vehicle Registration No";
                        "Purchase Line".VALIDATE("Purchase Line"."VRN No.");
                        "Purchase Line".Narration := RawDataLog.Narration;
                        "Purchase Line"."Project Name" := RawDataLog."Project Name";//CCIT-19092022
                        "Purchase Line".VALIDATE("Purchase Line"."Service ID", RawDataLog."Service ID");
                        "Purchase Line"."Service Date" := RawDataLog."Service Date";

                        IF RawDataLog.Type = 'G/L Account' THEN BEGIN
                            EVALUATE(Evaluated_Direct_Unit_Cost, RawDataLog.Direct_Unit_Cost);
                            "Purchase Line"."Direct Unit Cost" := Evaluated_Direct_Unit_Cost;
                            "Purchase Line".VALIDATE("Purchase Line"."Direct Unit Cost", Evaluated_Direct_Unit_Cost);
                        END;

                        //CCIT-23022022
                        IF UPPERCASE(RawDataLog.Type) = 'FIXED ASSET' THEN BEGIN
                            EVALUATE(Evaluated_Direct_Unit_Cost, RawDataLog.Direct_Unit_Cost);
                            "Purchase Line"."Direct Unit Cost" := Evaluated_Direct_Unit_Cost;
                            "Purchase Line".VALIDATE("Purchase Line"."Direct Unit Cost", Evaluated_Direct_Unit_Cost);
                        END;
                        //CCIT-23022022

                        EvaluatedDiscount := 0;
                        IF RawDataLog."Discount Percent" <> '' THEN BEGIN
                            EVALUATE(EvaluatedDiscount, RawDataLog."Discount Percent");
                            "Purchase Line".VALIDATE("Purchase Line"."Line Discount %", EvaluatedDiscount);
                        END;
                        IF RawDataLog."Business Line Dim" <> '' THEN BEGIN
                            "Purchase Line".VALIDATE("Shortcut Dimension 1 Code", RawDataLog."Business Line Dim");
                        END;

                        IF RawDataLog."Department Dim" <> '' THEN BEGIN
                            "Purchase Line".VALIDATE("Department Code", RawDataLog."Department Dim");
                        END;

                        "Purchase Line".VALIDATE("Client Level Code", RawDataLog."Client Level Code");
                        "Purchase Line".VALIDATE("Employee Code", RawDataLog."Employee Code");
                        IF RawDataLog."Deferral Code" <> '' THEN BEGIN
                            "Purchase Line".VALIDATE("Deferral Code", RawDataLog."Deferral Code");
                        END;

                        "Purchase Line".MODIFY;
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

