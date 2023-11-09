xmlport 50010 "Raw Purchase import"
{
    // Pallavi 24012017
    // created xmlport for raw purhcase data in update log
    // created xmlport to import raw data which will be sent for validations
    // added code for capturing additional information  in OnBeforeInsertRecord()
    // added code for intialize RowNumber = OnPreXMLport()
    // Added code for calling validate function OnPostXMLport()
    // prdp 31012017
    // added new field case no.
    // prdp 03022017
    // set minocuur porperty zero for policy_no
    // prdp 300317
    // modified code for case ID
    // prdp 040417
    // added code to delete * from policy no
    // prdp 280417
    // added code for GL Acc No validation
    // prdp 020517
    // modifed code for G/L Account purcahse invoice import
    // prdp 030517
    // added code for validation mapped for vendor or not
    // prdp 040517
    // modified code for policy does not exist validation
    // prdp 110517
    // latest changes
    // prdp 14062017
    // added two new columns Dept Dim & BusLineDim
    // prdp 18092017
    // added validation for blank policy no
    // prdp 18122017
    // added code to validate blank narration
    // prdp 21122017
    // added two new columns Service date & Service ID
    // prdp 27122017
    // removed blank narration validation

    Direction = Import;
    FieldSeparator = '<,>';
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
                }
                fieldelement(VaraintCode; "Raw Update Log Purchase".Varaint_Code)
                {
                }
                fieldelement(Direct_Unit_Cost; "Raw Update Log Purchase".Direct_Unit_Cost)
                {
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
                fieldelement(VIN_Nocase; "Raw Update Log Purchase"."Vehicle Identification No.")
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
        // added code to valdiate purchase data
        //UpdatePurchaseData.ValidateRawData(CASIDTEXT);

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
        //Structure: Record "13792";
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
        Evaluted_Quatity: Decimal;
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
        //TDSNOD: Record "13726";
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
        //NODLines: Record "13785";
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
        DocPol: Code[50];
        RawPOL: Code[50];
        POLMUSTNOTBLANK: Label 'Policy no must not be blank';

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

                // for invalid TDS NOD
                //Rushab++
                // IF RawUpdateLog.TDS_Nature <> '' THEN BEGIN
                //     IF NOT TDSNOD.GET(RawUpdateLog.TDS_Nature) THEN BEGIN
                //         RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + NODINVALID;
                //         FoundError := TRUE;
                //     END;

                //     NODLines.RESET;
                //     NODLines.SETRANGE(Type, 3);
                //     NODLines.SETRANGE("No.", RawUpdateLog.Buy_From_Vendor_No);
                //     NODLines.SETRANGE("NOD/NOC", RawUpdateLog.TDS_Nature);
                //     IF NOT NODLines.FINDFIRST THEN BEGIN
                //         RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'NOD ' + RawUpdateLog.TDS_Nature + ' not mapped to ' + RawUpdateLog.Buy_From_Vendor_No;
                //     END;
                // END;
                //Rushab--
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

                IF RawUpdateLog.Document_Date <> '' THEN BEGIN
                    EVALUATE(DDATE, RawUpdateLog.Document_Date);
                END;
                IF DDATE = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DINVALID;
                    FoundError := TRUE;
                END;

                // to validate structure
                //Rushab++
                // IF RawUpdateLog.Structure <> '' THEN BEGIN
                //     IF NOT Structure.GET(RawUpdateLog.Structure) THEN BEGIN
                //         RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + STRINVALID;
                //         FoundError := TRUE;
                //     END;
                // END;
                //Rushab--
                // for blank line no
                IF RawUpdateLog.Line_No <> '' THEN BEGIN
                    EVALUATE(LineNo, RawUpdateLog.Line_No);
                END;
                IF LineNo = 0 THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + LININVALID;
                    FoundError := TRUE;
                END;


                // for invalid service tx grop
                //Rushab++
                // IF RawUpdateLog.Service_Tax_Group <> '' THEN BEGIN
                //     IF NOT ServiceTaxGroup.GET(RawUpdateLog.Service_Tax_Group) THEN BEGIN
                //         RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SRVINVALID;
                //         FoundError := TRUE;
                //     END;
                // END;
                //Rushab--
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
                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN

                    PurchInvLine.RESET;
                    PurchInvLine.SETRANGE(PurchInvLine."Buy-from Vendor No.", RawUpdateLog.Buy_From_Vendor_No);
                    PurchInvLine.SETRANGE("No.", RawUpdateLog.Item_No);
                    PurchInvLine.SETRANGE(PurchInvLine."Case No.", RawUpdateLog."Case No.");
                    IF PurchInvLine.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CASENOEXIST;
                    END;

                    PurchLine.RESET;
                    PurchLine.SETRANGE(PurchLine."Buy-from Vendor No.", RawUpdateLog.Buy_From_Vendor_No);
                    PurchLine.SETRANGE("No.", RawUpdateLog.Item_No);
                    PurchLine.SETRANGE(PurchLine."Case No.", RawUpdateLog."Case No.");
                    IF PurchLine.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CASENOEXIST;
                    END;

                END;
                // for case no. ----

                IF RawUpdateLog."Department Dim" <> '' THEN BEGIN
                    DimVal.RESET;
                    DimVal.SETRANGE("Dimension Code", 'DEPARTMENT');
                    DimVal.SETRANGE(Code, RawUpdateLog."Department Dim");
                    IF NOT DimVal.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DepDimNotExist;
                        FoundError := TRUE;
                    END;
                END;

                IF RawUpdateLog."Business Line Dim" <> '' THEN BEGIN
                    DimVal.RESET;
                    DimVal.SETRANGE("Dimension Code", 'BUSINESS LINE');
                    DimVal.SETRANGE(Code, RawUpdateLog."Business Line Dim");
                    IF NOT DimVal.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + BusLineDimNotExist;
                        FoundError := TRUE;
                    END;
                END;

                /*
                //RawUpdateLog2.RESET;
                //RawUpdateLog2.SETRANGE("Integration Doc No",RawUpdateLog."Integration Doc No");
                //IF RawUpdateLog2.FINDFIRST THEN BEGIN
                IF RawUpdateLog.Narration = '' THEN BEGIN
                  RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ NARRATIONBLANK ;
                  FoundError := TRUE ;
                END;
                //END;
                */

                IF RawUpdateLog.Narration = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + NARRATIONBLANK;
                    FoundError := TRUE;
                END;

                // prdp - added code to validate unique service ID +++

                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN

                    IF RawUpdateLog."Service ID" <> '' THEN BEGIN

                        PurchLine.RESET;
                        PurchLine.SETRANGE("Service ID", RawUpdateLog."Service ID");
                        IF PurchLine.FINDFIRST THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDALRIMPORT;
                            FoundError := TRUE;
                        END;

                        PurchInvLine.RESET;
                        PurchInvLine.SETRANGE("Service ID", RawUpdateLog."Service ID");
                        IF PurchInvLine.FINDFIRST THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDPOSTED;
                            FoundError := TRUE;
                        END;

                    END;

                    IF RawUpdateLog."Service ID" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDBLANK;
                        FoundError := TRUE;
                    END;

                END;

                IF UPPERCASE(RawUpdateLog.Type) = 'G/L ACCOUNT' THEN BEGIN
                    IF RawUpdateLog."Service ID" <> '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + SERVIDMUSTBLANK;
                        FoundError := TRUE;
                    END;
                END;
                // prdp - added code to validate unique service ID ---

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
                        //Rushab++
                        // IF RawDataLog.Structure <> '' THEN BEGIN
                        //     Purch_HDRModify.Structure := RawDataLog.Structure;
                        //     Purch_HDRModify.VALIDATE(Purch_HDRModify.Structure, RawDataLog.Structure);
                        // END ELSE BEGIN
                        //     Purch_HDRModify.Structure := '';
                        // END;
                        //Rushab--
                        /*
                        IF RawDataLog."Vehicle Registration No" <> '' THEN BEGIN
                        EVALUATE(Evaluated_Dim2,RawDataLog."Vehicle Registration No");
                        END;

                        IF RawDataLog."Vehicle Registration No" <> '' THEN BEGIN
                         Purch_HDRModify.VALIDATE(Purch_HDRModify."Shortcut Dimension 2 Code",'110000');
                        END;
                        */
                        Purch_HDRModify."Vendor Invoice No." := RawDataLog."Invoice No.";
                        Purch_HDRModify.VALIDATE("Vendor Invoice No.");

                        Purch_HDRModify."Shortcut Dimension 1 Code" := RawDataLog."Business Line Dim";
                        Purch_HDRModify.VALIDATE("Shortcut Dimension 1 Code");

                        Purch_HDRModify.Department := RawDataLog."Department Dim";
                        Purch_HDRModify.VALIDATE(Department);


                        Purch_HDRModify."Location Code" := 'MUMBAI';
                        Purch_HDRModify.VALIDATE(Purch_HDRModify."Location Code", 'MUMBAI');
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

                            // "Purchase Line"."Service Tax Group" := Evaluated_Service_Tax_Group;//Rushab++
                            // "Purchase Line".VALIDATE("Purchase Line"."Service Tax Group", Evaluated_Service_Tax_Group);//Rushab++
                        END;

                        "Purchase Line"."Location Code" := 'MUMBAI';
                        "Purchase Line".VALIDATE("Purchase Line"."Location Code", 'MUMBAI');

                        "Purchase Line"."Gen. Prod. Posting Group" := 'SERVICE';

                        IF RawDataLog.TDS_Nature <> '' THEN BEGIN
                            EVALUATE(Evaluated_TDS_Nature, RawDataLog.TDS_Nature);

                            // "Purchase Line"."TDS Nature of Deduction" := Evaluated_TDS_Nature;//Rushab++
                            // "Purchase Line".VALIDATE("Purchase Line"."TDS Nature of Deduction", Evaluated_TDS_Nature);//Rushab++

                        END;
                        /*
                         IF RawDataLog."Vehicle Registration No" <> '' THEN
                           "Purchase Line".VALIDATE("Purchase Line"."Shortcut Dimension 2 Code",'110000');
                         */

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
                        "Purchase Line"."Service ID" := RawDataLog."Service ID";
                        "Purchase Line"."Service Date" := RawDataLog."Service Date";

                        IF RawDataLog.Type = 'G/L Account' THEN BEGIN
                            EVALUATE(Evaluated_Direct_Unit_Cost, RawDataLog.Direct_Unit_Cost);
                            "Purchase Line"."Direct Unit Cost" := Evaluated_Direct_Unit_Cost;
                            "Purchase Line".VALIDATE("Purchase Line"."Direct Unit Cost", Evaluated_Direct_Unit_Cost);
                        END;

                        IF RawDataLog."Business Line Dim" <> '' THEN BEGIN
                            "Purchase Line"."Shortcut Dimension 1 Code" := RawDataLog."Business Line Dim";
                        END;

                        IF RawDataLog."Department Dim" <> '' THEN BEGIN
                            "Purchase Line"."Department Code" := RawDataLog."Department Dim";
                        END;



                        "Purchase Line".MODIFY;
                    END;
                END; // line inser end
            UNTIL RawDataLog.NEXT = 0;

    end;

    procedure UpdateDocumentServiceMAster(CASEID: Code[250])
    var
        RawDataLog: Record "Raw Update Log Purchase";
    begin
        // created function for updating purhcase document noin docuemnt service master
        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID, CASEID);
        IF RawDataLog.FINDSET THEN
            REPEAT

                DocPol := DELCHR(RawDataLog.PolicyNo_OEMInv_RefNo, '=', '*');

                // for updating document no
                DocServMaster.RESET;
                DocServMaster.SETRANGE(DocServMaster."Policy No/OEM Inv/Ref No", DocPol);
                IF DocServMaster.FINDFIRST THEN BEGIN
                    IF RawDataLog.Line_No <> '' THEN BEGIN
                        EVALUATE(Evaluated_Line_No, RawDataLog.Line_No);
                    END;
                    DocServMaster."Purchase Doc No" := RawDataLog."Integration Doc No";
                    DocServMaster."Purchase Doc Line No" := Evaluated_Line_No;
                    DocServMaster."Case No" := RawDataLog."Case No.";
                    DocServMaster.MODIFY;
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

