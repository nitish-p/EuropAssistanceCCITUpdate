xmlport 50050 "Raw Sales Data Import"
{
    // Pallavi 21012017
    // created xmlport for rawsales data in update log
    // created xmlport to import raw data which will be sent for validations
    // added code for capturing additional information  in OnBeforeInsertRecord()
    // added code for intialize RowNumber = OnPreXMLport()
    // Added code for calling validate function OnPostXMLport()
    // prdp 27012017
    // added field comments
    // prdp 30012017
    // set minoccurs property to zero for field comments
    // prdp 31012017
    // latest changes
    // prdp 10022017
    // no changes
    // prdp 16032017
    // latest changes
    // prdp 21032017
    // latest changes
    // pradip 29032017
    // added code for caseid
    // prdp 300317
    // added all the Variables & functions of Update raw sales data codeunit & changed code on OnPostXMLPort
    // Pradip 0142017
    // added code for rejected logic in function vlaidatrrawdata()
    // prdp 050417
    // modified the dupicacy validation check for VIN & POLICY No. according to policy covrg strt dt & end dt
    // Pradip 27042017
    // no changes
    // pradip 14062017
    // latest changes
    // pradip 19062017
    // no changes
    // prdp 22062017
    // modified port logic to avoid validationsfor gl account type upload
    // prdp 14072017
    // added validation for already exist of integration doc no
    // prdp 170720176
    // added columns for dimensions
    // prdp 280917
    // added two new fields Cust Inv no & Posting No Series
    // prdp 311017:modified code for posting no series imported via CSV file
    // prdp 18122017
    // added code to validate blank comments
    // prdp 27122017
    // removed blank comments validation
    // prdp 150117
    // midfied code of delete * from document service master policy no
    // CCIT 21012022
    // added Policy Month Field

    Direction = Import;
    FileName = 'Salesimport.csv';
    Format = VariableText;
    Permissions = TableData 36 = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Raw Update Log"; "Raw Update Log")
            {
                XmlName = 'UpdateLog';
                fieldelement(Document_No; "Raw Update Log"."Integration Doc No")
                {
                    MinOccurs = Once;
                }
                fieldelement(Sell_To_Customer_No; "Raw Update Log".Sell_To_Customer_No)
                {
                }
                fieldelement(Type; "Raw Update Log".Type)
                {
                }
                fieldelement(Item_No; "Raw Update Log".Item_No)
                {
                }
                fieldelement(Quantity; "Raw Update Log".Quantity)
                {
                }
                fieldelement(UOM_Code; "Raw Update Log".UOM_Code)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Unit_Price; "Raw Update Log".Unit_Price)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Location_Code; "Raw Update Log".Location_Code)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Posting_Date; "Raw Update Log".Posting_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Document_Date; "Raw Update Log".Document_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Order_Date; "Raw Update Log".Order_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Structure; "Raw Update Log".Structure)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Line_No; "Raw Update Log".Line_No)
                {
                    MinOccurs = Zero;
                }
                fieldelement(External_Doc_No; "Raw Update Log".External_Doc_No)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Service_Tax_Group; "Raw Update Log".Service_Tax_Group)
                {
                    MinOccurs = Zero;
                }
                fieldelement(PolicyNo_OEMInv_RefNo; "Raw Update Log".PolicyNo_OEMInv_RefNo)
                {
                    FieldValidate = Yes;
                    MinOccurs = Zero;
                }
                fieldelement(Year_of_MFG; "Raw Update Log"."Year Of MFg")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Vehicle_Regn_No; "Raw Update Log"."Vehicle Registration No")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Customer_Name; "Raw Update Log".Customer_Name)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Customer_Contact_No; "Raw Update Log".Customer_Contact_No)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Policy_Coverage_Start_Date; "Raw Update Log".Policy_Coverage_Start_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Policy_Coverage_End_Date; "Raw Update Log".Policy_Coverage_End_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(City; "Raw Update Log".City)
                {
                    MinOccurs = Zero;
                }
                fieldelement(State; "Raw Update Log".State)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Region; "Raw Update Log".Region)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Destination_Country; "Raw Update Log"."Destination Country")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Destination_Region; "Raw Update Log"."Destination Region")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Vehicle_Identification_No; "Raw Update Log"."Vehicle Identification No")
                {
                    FieldValidate = Yes;
                    MinOccurs = Zero;
                }
                fieldelement(DeptDim; "Raw Update Log"."Department Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BusLineDim; "Raw Update Log"."Business Line Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Comments; "Raw Update Log".Comments)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Cust_Invoice_No; "Raw Update Log"."Customer Invoice No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Posting_No_Series; "Raw Update Log"."Posting No. Series")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Ship_To_Code; "Raw Update Log"."Ship To Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Particulars; "Raw Update Log".Particulars)
                {
                    MinOccurs = Zero;
                }
                fieldelement(EATransactionType; "Raw Update Log"."EA Transaction Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ClientLevelCode; "Raw Update Log"."Client Level Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(EmployeeCode; "Raw Update Log"."Employee Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DeferralCode; "Raw Update Log"."Deferral Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(InvoiceDate; "Raw Update Log"."Invoice Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PolicyMonth; "Raw Update Log"."Policy Month")
                {
                }
                fieldelement(PostingNo; "Raw Update Log".PostingNo)
                {
                    MinOccurs = Zero;
                }
                fieldelement(CaseNo; "Raw Update Log"."Case No.")
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin

                    // for inserting additional information
                    "Raw Update Log"."File name" := currXMLport.FILENAME;
                    "Raw Update Log".CaseID := CASIDTEXT;
                    RowNumber := RowNumber + 1;
                    "Raw Update Log"."Row number" := RowNumber;
                    "Raw Update Log".Status := 0;
                    "Raw Update Log"."Imported Date" := TODAY;
                    "Raw Update Log"."Imported Time" := TIME;
                    "Raw Update Log"."Imported By" := USERID;

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
        //UpdateRawData.ValidateRawData(CASIDTEXT);

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
        UpdateRawData: Codeunit "Update Bank Response";
        PolicyNumber: Code[30];
        CASIDTEXT: Text[50];
        Item: Record Item;
        ItemUOM: Record "Item Unit of Measure";
        Location: Record Location;
        UnitPrice: Decimal;
        Qty: Decimal;
        PDATE: Date;
        DDATE: Date;
        ODATE: Date;
        //  Structure: Record "13792";
        LineNo: Integer;
        //ServiceTaxGroup: Record "16471";
        PolicySDate: Date;
        PolicyEDate: Date;
        Evaluated_Dim2: Code[50];
        Sales_Header: Record "Sales Header";
        Sales_HDRInsert: Record "Sales Header";
        Sales_HDRModify: Record "Sales Header";
        SalesLine: Record "Sales Line";
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
        RecSalesLine: Record "Sales Line";
        RecSalesLine2: Record "Sales Line";
        RecSalesLine3: Record "Sales Line";
        Evaluated_Ext_Doc_No: Code[250];
        Evaluated_Service_Tax_Group: Code[30];
        Evaluated_PolicyNo_OEMInv_RefNo: Code[50];
        Evaluated_Year_of_MFG: Date;
        Evaluated_Vehicle_Regn_No: Code[30];
        Evaluated_Customer_Name: Code[100];
        Evaluated_Customer_Contact_No: Code[20];
        Evaluated_Policy_Coverage_Start_Date: Date;
        Evaluated_Policy_Coverage_End_Date: Date;
        Evaluated_City: Code[50];
        Evaluated_State: Code[50];
        Evaluated_Region: Code[30];
        Evaluated_Policy_Type: Option;
        Evaluated_Destination_Country: Code[30];
        Evaluated_Destination_Region: Code[30];
        Evaluated_Name: Text[100];
        DocumentwiseServiceMaster: Record "Documentwise Service Master";
        Evaluated_Line_No: Integer;
        Evaluated_Dim1: Code[50];
        DimVal2: Record "Dimension Value";
        DimVal: Record "Dimension Value";
        Document_No2: Code[30];
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        "Sales&RcSetup": Record "Sales & Receivables Setup";
        LineInsert: Integer;
        Evaluated_Vehicle_Identification_No: Code[50];
        CustRec: Record Customer;
        "Documentwise Service Master": Record "Documentwise Service Master";
        XMLRejectMAster: XMLport "Rejected Sales Data Export";
        DocServMaster: Record "Documentwise Service Master";
        Rate: Decimal;
        UOM: Record "Unit of Measure";
        PolicyMaster: Record "Policy Master";
        VINMaster: Record "VIN Master";
        CINVALID: Label 'Customer  is Invalid';
        TYPEINVALID: Label 'Type   is Invalid';
        ITEMINVALID: Label 'Item No  is Invalid ';
        CBLOCKED: Label 'Customer is Blocked';
        CPGINVALID: Label 'Customer Posting Group is Invalid';
        IPGINVALID: Label 'Gen Prod. Posting Group for item is Invalid';
        IBLOCKED: Label 'Item is Blocked';
        QINVALID: Label 'Qty is Invalid';
        UOMINVALID: Label 'Unit of Measure is Invalid';
        IUOMINVALID: Label 'Item Unit of Measure is Invalid';
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
        POLICYEXIST: Label 'Policy No Already exist';
        POLICYEXISTCSV: Label 'Policy No Already exist in same csv file';
        POLICYNOTEXIST: Label 'Policy No Does not exist';
        POLICYCANCL: Label 'Policy is already cancelled';
        VINExist: Label 'VIN No already exist';
        RawSalesDataImport: XMLport "Raw Sales Data Import";
        Rec50004: Record "Raw Update Log";
        DepDimNotExist: Label 'DepDimNotExist';
        BusLineDimNotExist: Label 'BusLineDimNotExist';
        PolMaster: Record "Policy Master";
        GLINVALID: Label 'GL Is Invalid';
        GLAcc: Record "G/L Account";
        DocServMaster1: Record "Documentwise Service Master";
        INTDOCNOEXIST: Label 'Integration Doc No Already Exist';
        NoSer: Record "No. Series";
        NOSERIESNOTEXIST: Label 'Invalid Posting No Series';
        NOSERIESBLANK: Label 'Blank No Series';
        EvaluatedBusLineDim: Code[30];
        EvaluatedDepDim: Code[30];
        COMMENTSBLANK: Label 'Commnets must not be blank';
        RawPol: Code[50];
        ShipToCode: Record "Ship-to Address";
        DimSetEntry: Record "Dimension Set Entry";
        SalesHdr: Record "Sales Header";
        DefTemp: Record "Deferral Template";
        EvaluatedInvoiceDate: Date;
        PolicyDate: Date;
        EvaluatedPolicyMonth: Date;
        Evaluated_Posting_No: Code[100];

    procedure ValidateRawData(CASEID: Code[250])
    var
        RawUpdateLog: Record "Raw Update Log";
        FoundError: Boolean;
        RawUpdateLog2: Record "Raw Update Log";
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
                PolicyDate := 0D;//CCIT
                LineNo := 0;

                // for customer invlaid
                IF NOT Customer.GET(RawUpdateLog.Sell_To_Customer_No) THEN BEGIN
                    RawUpdateLog."Error description" := CINVALID;
                    FoundError := TRUE;
                END;



                // for invalid customer parameters
                IF Customer.GET(RawUpdateLog.Sell_To_Customer_No) THEN BEGIN
                    IF Customer.Blocked = 3 THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CBLOCKED;
                        FoundError := TRUE;
                    END;
                    IF Customer."Customer Posting Group" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CPGINVALID;
                        FoundError := TRUE;
                    END;
                    IF Customer."Gen. Bus. Posting Group" = '' THEN BEGIN
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
                // FOR invlid gl
                IF UPPERCASE(RawUpdateLog.Type) = 'G/L ACCOUNT' THEN BEGIN
                    IF NOT GLAcc.GET(RawUpdateLog.Item_No) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GLINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for checking invalid item parameters
                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN
                    IF Item.GET(RawUpdateLog.Item_No) THEN BEGIN
                        IF Item.Blocked = TRUE THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + IBLOCKED;
                            FoundError := TRUE;
                        END;
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


                // for zero unit price
                IF RawUpdateLog.Unit_Price <> '' THEN BEGIN
                    EVALUATE(UnitPrice, RawUpdateLog.Unit_Price);
                END;
                IF UnitPrice = 0 THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + UPINVALID;
                    FoundError := TRUE;
                END;

                // for lcoation invalid
                IF RawUpdateLog.Location_Code <> '' THEN BEGIN
                    IF NOT Location.GET(RawUpdateLog.Location_Code) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + LOCINVALID;
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


                IF RawUpdateLog.Order_Date <> '' THEN BEGIN
                    EVALUATE(ODATE, RawUpdateLog.Order_Date);
                END;
                IF ODATE = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DINVALID;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog."Invoice Date" = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'InvoiceDateMandatory';
                    FoundError := TRUE;
                END;

                //CCIT
                IF RawUpdateLog."Policy Month" <> '' THEN BEGIN
                    EVALUATE(PolicyDate, RawUpdateLog."Policy Month");
                END;
                IF PolicyDate = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'PolicyMonthMandatory';
                    FoundError := TRUE;
                END;
                //CCIT

                //to validate structure
                IF RawUpdateLog.Structure <> '' THEN BEGIN
                    //Rushab++
                    // IF NOT Structure.GET(RawUpdateLog.Structure) THEN BEGIN
                    //   RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ STRINVALID ;
                    //   FoundError := TRUE ;
                    // END;
                    //Rushab--
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
                    //Rushab++
                    // IF NOT ServiceTaxGroup.GET(RawUpdateLog.Service_Tax_Group) THEN BEGIN
                    // RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ SRVINVALID ;
                    // FoundError := TRUE ;
                    // END;
                    //Rushab--
                END;

                // for invalid policy coverage date
                IF RawUpdateLog.Policy_Coverage_Start_Date <> '' THEN BEGIN
                    EVALUATE(PolicySDate, RawUpdateLog.Policy_Coverage_Start_Date);
                    IF PolicySDate = 0D THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + PSDINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for invalid policy coverage end date
                IF RawUpdateLog.Policy_Coverage_End_Date <> '' THEN BEGIN
                    EVALUATE(PolicyEDate, RawUpdateLog.Policy_Coverage_End_Date);
                    IF PolicyEDate = 0D THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + PEDINVALID;
                        FoundError := TRUE;
                    END;
                END;

                DocServMaster1.RESET;
                DocServMaster1.SETRANGE("Integration doc No", RawUpdateLog."Integration Doc No");
                IF DocServMaster1.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + INTDOCNOEXIST;
                    FoundError := TRUE;
                END;

                // for blank vehicle reg no or blank VIN NO
                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN
                    IF Customer.GET(RawUpdateLog.Sell_To_Customer_No) THEN BEGIN
                        IF ((Customer."Gen. Bus. Posting Group" <> 'TRAVEL-I') AND
                            (Customer."Gen. Bus. Posting Group" <> 'TRAVEL-R') AND
                              (Customer."Gen. Bus. Posting Group" <> 'TRAVEL-OR') AND
                             (Customer."Gen. Bus. Posting Group" <> 'HOME - I')) THEN BEGIN
                            IF ((RawUpdateLog."Vehicle Registration No" = '') AND
                              (RawUpdateLog."Vehicle Identification No" = '')) THEN BEGIN
                                RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + REGNOINVALID;
                                FoundError := TRUE;
                            END;
                        END;
                    END;
                END;
                /*
                // for poilicy alrady exist
                IF RawUpdateLog.Policy_Coverage_Start_Date <> '' THEN BEGIN
                EVALUATE(Evaluated_Policy_Coverage_Start_Date,RawUpdateLog.Policy_Coverage_Start_Date);
                  END;
                IF RawUpdateLog.Policy_Coverage_End_Date <> '' THEN BEGIN
                EVALUATE(Evaluated_Policy_Coverage_End_Date,RawUpdateLog.Policy_Coverage_End_Date);
                  END;


                DocServMaster.RESET;
                DocServMaster.SETRANGE(DocServMaster."Policy No/OEM Inv/Ref No",RawUpdateLog.PolicyNo_OEMInv_RefNo);
                IF Evaluated_Policy_Coverage_Start_Date <> 0D THEN
                DocServMaster.SETRANGE(DocServMaster."Policy / Coverage Start Date",Evaluated_Policy_Coverage_Start_Date);
                IF Evaluated_Policy_Coverage_End_Date <> 0D THEN
                DocServMaster.SETRANGE(DocServMaster."Policy / Coverage End Date",Evaluated_Policy_Coverage_End_Date);
                IF DocServMaster.FINDFIRST THEN BEGIN
                     RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ POLICYEXIST ;
                     FoundError := TRUE ;
                END;


                // for same policy in same csv
                RawUpdateLog2.RESET;
                RawUpdateLog2.SETCURRENTKEY(Policy_Coverage_Start_Date,Policy_Coverage_End_Date,PolicyNo_OEMInv_RefNo);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.CaseID,RawUpdateLog.CaseID);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.PolicyNo_OEMInv_RefNo,RawUpdateLog.PolicyNo_OEMInv_RefNo);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.Policy_Coverage_Start_Date,RawUpdateLog.Policy_Coverage_Start_Date);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.Policy_Coverage_End_Date,RawUpdateLog.Policy_Coverage_End_Date);
                RawUpdateLog2.SETFILTER(RawUpdateLog2."Row number",'<>%1',RawUpdateLog."Row number");
                IF RawUpdateLog2.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ POLICYEXISTCSV ;
                    FoundError := TRUE ;
                END;

                // for same VIN No in same csv
                RawUpdateLog2.RESET;
                RawUpdateLog.SETCURRENTKEY("Vehicle Identification No");
                RawUpdateLog2.SETRANGE(RawUpdateLog2.CaseID,RawUpdateLog.CaseID);
                RawUpdateLog2.SETRANGE(RawUpdateLog2."Vehicle Identification No",RawUpdateLog."Vehicle Identification No");
                RawUpdateLog2.SETRANGE(RawUpdateLog2.Policy_Coverage_Start_Date,RawUpdateLog.Policy_Coverage_Start_Date);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.Policy_Coverage_End_Date,RawUpdateLog.Policy_Coverage_End_Date);
                RawUpdateLog2.SETFILTER(RawUpdateLog2."Row number",'<>%1',RawUpdateLog."Row number");
                IF RawUpdateLog2.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ VINExist ;
                    FoundError := TRUE ;
                END;
                */


                IF RawUpdateLog.PolicyNo_OEMInv_RefNo <> '' THEN BEGIN

                    RawPol := DELCHR(RawUpdateLog.PolicyNo_OEMInv_RefNo, '=', '*');

                    PolicyMaster.RESET;
                    PolicyMaster.SETRANGE(PolicyMaster.PolicyNo, RawPol);
                    PolicyMaster.SETRANGE(PolicyMaster.CustNo, RawUpdateLog.Sell_To_Customer_No);
                    PolicyMaster.SETRANGE(PolicyMaster."Policy Start Date", RawUpdateLog.Policy_Coverage_Start_Date);
                    PolicyMaster.SETRANGE(PolicyMaster."Policy End Date", RawUpdateLog.Policy_Coverage_End_Date);
                    IF NOT PolicyMaster.FINDFIRST THEN BEGIN
                        PolicyMaster.INIT;
                        PolicyMaster.PolicyNo := RawPol;
                        PolicyMaster.CustNo := RawUpdateLog.Sell_To_Customer_No;
                        PolicyMaster."Policy Start Date" := RawUpdateLog.Policy_Coverage_Start_Date;
                        PolicyMaster."Policy End Date" := RawUpdateLog.Policy_Coverage_End_Date;
                        PolicyMaster.Rejected := TRUE;
                        PolicyMaster.INSERT(TRUE);
                    END
                    ELSE BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + POLICYEXIST;
                        FoundError := TRUE;
                    END;
                END;


                IF RawUpdateLog."Vehicle Identification No" <> '' THEN BEGIN
                    VINMaster.SETRANGE("VIN No", RawUpdateLog."Vehicle Identification No");
                    VINMaster.SETRANGE(CustNo, RawUpdateLog.Sell_To_Customer_No);
                    VINMaster.SETRANGE("Policy Start Date", RawUpdateLog.Policy_Coverage_Start_Date);
                    VINMaster.SETRANGE("Policy End Date", RawUpdateLog.Policy_Coverage_End_Date);
                    IF NOT VINMaster.FINDFIRST THEN BEGIN
                        VINMaster.INIT;
                        VINMaster."VIN No" := RawUpdateLog."Vehicle Identification No";
                        VINMaster.CustNo := RawUpdateLog.Sell_To_Customer_No;
                        VINMaster."Policy Start Date" := RawUpdateLog.Policy_Coverage_Start_Date;
                        VINMaster."Policy End Date" := RawUpdateLog.Policy_Coverage_End_Date;
                        VINMaster.Rejected := TRUE;
                        VINMaster.INSERT(TRUE);
                    END
                    ELSE BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + VINExist;
                        FoundError := TRUE;
                    END;
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


                IF RawUpdateLog."Posting No. Series" <> '' THEN BEGIN
                    IF NOT NoSer.GET(RawUpdateLog."Posting No. Series") THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + NOSERIESNOTEXIST;
                        FoundError := TRUE;
                    END;
                END;

                IF RawUpdateLog.Comments = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + COMMENTSBLANK;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog."Posting No. Series" = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + NOSERIESBLANK;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog."Ship To Code" <> '' THEN BEGIN
                    ShipToCode.RESET;
                    ShipToCode.SETRANGE("Customer No.", RawUpdateLog.Sell_To_Customer_No);
                    ShipToCode.SETRANGE(Code, RawUpdateLog."Ship To Code");
                    IF NOT ShipToCode.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'Invalid ShipToCode';
                        FoundError := TRUE;
                    END;
                END;

                IF RawUpdateLog."EA Transaction Type" <> 0 THEN BEGIN
                    IF ((RawUpdateLog."EA Transaction Type" <> 1) AND (RawUpdateLog."EA Transaction Type" <> 2) AND (RawUpdateLog."EA Transaction Type" <> 3)) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'InvalidEATransactionType';
                        FoundError := TRUE;
                    END;
                END ELSE BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'EATransactionTypeMandatory';
                    FoundError := TRUE;
                END;

                IF RawUpdateLog."Deferral Code" <> '' THEN BEGIN
                    DefTemp.RESET;
                    DefTemp.SETRANGE("Deferral Code", RawUpdateLog."Deferral Code");
                    IF NOT DefTemp.FINDFIRST THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + 'InvalidDeferralCode';
                        FoundError := TRUE;
                    END;
                END;

                /*

                //RawUpdateLog2.RESET;
                //RawUpdateLog2.SETRANGE("Integration Doc No",RawUpdateLog."Integration Doc No");
                //IF RawUpdateLog2.FINDFIRST THEN BEGIN
                IF RawUpdateLog.Comments = '' THEN BEGIN
                  RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ COMMENTSBLANK;
                  FoundError := TRUE ;
                END;
                //END;
                */
                RawUpdateLog.Validated := TRUE;
                RawUpdateLog.MODIFY;

            UNTIL RawUpdateLog.NEXT = 0;




        IF FoundError = FALSE THEN BEGIN
            //InsertDimension(CASEID);
            PolicyMaster.RESET;
            PolicyMaster.SETRANGE(PolicyMaster.Rejected, TRUE);
            IF PolicyMaster.FINDSET THEN
                REPEAT
                    PolicyMaster.Rejected := FALSE;
                    PolicyMaster.MODIFY;
                UNTIL PolicyMaster.NEXT = 0;
            VINMaster.RESET;
            VINMaster.SETRANGE(VINMaster.Rejected, TRUE);
            IF VINMaster.FINDSET THEN
                REPEAT
                    VINMaster.Rejected := FALSE;
                    VINMaster.MODIFY;
                UNTIL VINMaster.NEXT = 0;
            InsertSalesDocument(CASEID);

            InsertDocumentServiceMAster(CASEID);
            MESSAGE(' Imported Successfully at %1', TIME);
        END;


        IF FoundError = TRUE THEN BEGIN
            PolicyMaster.RESET;
            PolicyMaster.SETRANGE(PolicyMaster.Rejected, TRUE);
            IF PolicyMaster.FINDSET THEN
                REPEAT
                    PolicyMaster.DELETE;
                UNTIL PolicyMaster.NEXT = 0;
            VINMaster.RESET;
            VINMaster.SETRANGE(VINMaster.Rejected, TRUE);
            IF VINMaster.FINDSET THEN
                REPEAT
                    VINMaster.DELETE;
                UNTIL VINMaster.NEXT = 0;
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

    procedure InsertSalesDocument(CASEID: Code[250])
    var
        RawDataLog: Record "Raw Update Log";
    begin
        // created function for inserting sales header & Sales line
        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID, CASEID);
        IF RawDataLog.FINDSET THEN
            REPEAT

                insert1 := 0;
                Sales_Header.RESET;
                Sales_HDRInsert.RESET;
                Sales_HDRModify.RESET;
                Sales_Header.SETRANGE(Sales_Header."Document Type", Sales_Header."Document Type"::Invoice);
                Sales_Header.SETRANGE(Sales_Header."Integration Doc No", RawDataLog."Integration Doc No");
                IF NOT Sales_Header.FINDFIRST THEN BEGIN
                    Sales_HDRInsert."Document Type" := Sales_HDRInsert."Document Type"::Invoice;
                    "Sales&RcSetup".GET('');
                    IF "Sales&RcSetup"."Invoice Nos." = '' THEN
                        ERROR(' Please enter invoice nos in sales & receivalbe setup');
                    Document_No2 := NoSeriesMgmt.GetNextNo("Sales&RcSetup"."Invoice Nos.", WORKDATE, TRUE);
                    Sales_HDRInsert."No." := Document_No2;
                    Sales_HDRInsert."Integration Doc No" := RawDataLog."Integration Doc No";
                    /*
         //Sales_HDRModify."Posting No. Series" := 'SM001';
                      EVALUATE("Evaluated_Posting_No.Series",RawDataLog."Posting No. Series");
                      Sales_HDRModify."Posting No. Series" := "Evaluated_Posting_No.Series";
                      //Sales_HDRModify.VALIDATE(Sales_HDRModify."Posting No. Series","Evaluated_Posting_No.Series");
                       MESSAGE(Sales_HDRModify."Posting No. Series");
                       */

                    Sales_HDRInsert.INSERT;
                    insert1 := 1;
                END;
                //modify

                IF insert1 = 1 THEN BEGIN
                    Sales_HDRModify.RESET;
                    Sales_HDRModify.SETRANGE(Sales_HDRModify."Document Type", Sales_HDRInsert."Document Type"::Invoice);
                    Sales_HDRModify.SETRANGE(Sales_HDRModify."Integration Doc No", RawDataLog."Integration Doc No");
                    IF Sales_HDRModify.FINDFIRST THEN BEGIN

                        // Posting Date for Sales Header
                        IF RawDataLog.Posting_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_Posting_Date, RawDataLog.Posting_Date);
                        END;
                        Sales_HDRModify."Posting Date" := Evaluted_Posting_Date;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Posting Date", Evaluted_Posting_Date);

                        //doc date
                        IF RawDataLog.Document_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_Document_Date, RawDataLog.Document_Date);
                        END;
                        Sales_HDRModify."Document Date" := Evaluted_Document_Date;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Document Date", Evaluted_Document_Date);

                        //Invoice date
                        IF RawDataLog.Order_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_OrderDate, RawDataLog.Order_Date);
                        END;
                        Sales_HDRModify."Order Date" := Evaluted_OrderDate;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Order Date", Evaluted_OrderDate);
                        IF RawDataLog.Sell_To_Customer_No <> '' THEN BEGIN
                            EVALUATE(Evaluted_Sell_To_Customer_No, RawDataLog.Sell_To_Customer_No);
                        END;
                        //    Sales_HDRModify."Sell-to Customer No." :=Evaluted_Sell_To_Customer_No;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Sell-to Customer No.", Evaluted_Sell_To_Customer_No);

                        IF RawDataLog.Structure <> '' THEN BEGIN
                            EVALUATE(Evaluated_Structure, RawDataLog.Structure);
                        END;
                        //  Sales_HDRModify.Structure :=Evaluated_Structure;//Rushab
                        //  Sales_HDRModify.VALIDATE(Sales_HDRModify.Structure,Evaluated_Structure);//Rushab



                        /*IF RawDataLog.External_Doc_No <> '' THEN BEGIN
                            EVALUATE(Evaluated_Ext_Doc_No,RawDataLog.External_Doc_No);
                        END;
                            Sales_HDRModify."External Document No." :=Evaluated_Ext_Doc_No;
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."External Document No.",Evaluated_Ext_Doc_No);*///CCIT-12082022

                        //CCIT-12082022
                        IF RawDataLog.External_Doc_No <> '' THEN BEGIN
                            EVALUATE(Evaluated_Ext_Doc_No, RawDataLog.External_Doc_No)
                        END ELSE BEGIN
                            Evaluated_Ext_Doc_No := '';
                        END;
                        Sales_HDRModify."External Document No." := Evaluated_Ext_Doc_No;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."External Document No.", Evaluated_Ext_Doc_No);
                        //CCIT-12082022

                        Sales_HDRModify."Customer Invoice No." := RawDataLog."Customer Invoice No.";
                        Document_No2 := Sales_HDRModify."No.";

                        //    IF COPYSTR(RawDataLog.Item_No,1,4) = 'AUTO' THEN
                        //      Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code",'110000');


                        //IF COPYSTR(RawDataLog.Item_No,1,3) = 'TRV' THEN
                        //  Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code",'210000');

                        IF RawDataLog.Location_Code <> '' THEN
                            Sales_HDRModify."Location Code" := RawDataLog.Location_Code;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Location Code", RawDataLog.Location_Code);

                        IF UPPERCASE(COPYSTR(RawDataLog."Integration Doc No", 1, 3)) = 'DEB' THEN BEGIN
                            Sales_HDRModify."Debit Note" := TRUE;
                            Sales_HDRModify.VALIDATE("Debit Note");
                        END;

                        IF Sales_HDRModify."Dimension Set ID" <> 0 THEN BEGIN
                            DimSetEntry.RESET;
                            DimSetEntry.SETRANGE("Dimension Set ID", Sales_HDRModify."Dimension Set ID");
                            DimSetEntry.SETRANGE("Dimension Code", 'BUSINESS LINE');
                            DimSetEntry.SETFILTER("Dimension Value Code", '<>%1', '');
                            IF NOT DimSetEntry.FINDFIRST THEN BEGIN
                                Sales_HDRModify.VALIDATE("Shortcut Dimension 1 Code", RawDataLog."Business Line Dim");
                            END;
                            DimSetEntry.RESET;
                            DimSetEntry.SETRANGE("Dimension Set ID", Sales_HDRModify."Dimension Set ID");
                            DimSetEntry.SETRANGE("Dimension Code", 'DEPARTMENT');
                            DimSetEntry.SETFILTER("Dimension Value Code", '<>%1', '');
                            IF NOT DimSetEntry.FINDFIRST THEN BEGIN
                                Sales_HDRModify.VALIDATE(Department, RawDataLog."Department Dim");
                            END;
                            DimSetEntry.RESET;
                            DimSetEntry.SETRANGE("Dimension Set ID", Sales_HDRModify."Dimension Set ID");
                            DimSetEntry.SETRANGE("Dimension Code", 'CLIENT LEVEL');
                            DimSetEntry.SETFILTER("Dimension Value Code", '<>%1', '');
                            IF NOT DimSetEntry.FINDFIRST THEN BEGIN
                                Sales_HDRModify.VALIDATE("Client Level Code", RawDataLog."Client Level Code");
                            END;
                            DimSetEntry.RESET;
                            DimSetEntry.SETRANGE("Dimension Set ID", Sales_HDRModify."Dimension Set ID");
                            DimSetEntry.SETRANGE("Dimension Code", 'EMPLOYEE');
                            DimSetEntry.SETFILTER("Dimension Value Code", '<>%1', '');
                            IF NOT DimSetEntry.FINDFIRST THEN BEGIN
                                Sales_HDRModify.VALIDATE("Employee Code", RawDataLog."Employee Code");
                            END;
                        END ELSE BEGIN
                            Sales_HDRModify.VALIDATE("Shortcut Dimension 1 Code", RawDataLog."Business Line Dim");
                            Sales_HDRModify.VALIDATE(Department, RawDataLog."Department Dim");
                            Sales_HDRModify.VALIDATE("Client Level Code", RawDataLog."Client Level Code");
                            Sales_HDRModify.VALIDATE("Employee Code", RawDataLog."Employee Code");
                        END;

                        EVALUATE("Evaluated_Posting_No.Series", RawDataLog."Posting No. Series");
                        Sales_HDRModify."Posting No. Series" := "Evaluated_Posting_No.Series";
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Posting No. Series", "Evaluated_Posting_No.Series");

                        //Sales_HDRModify.VALIDATE("Posting No.",RawDataLog.PostingNo);//CCIT-03082022
                        //CCIT-03082022
                        IF RawDataLog.PostingNo <> '' THEN BEGIN
                            EVALUATE(Evaluated_Posting_No, RawDataLog.PostingNo)
                        END ELSE BEGIN
                            Evaluated_Posting_No := '';
                        END;
                        Sales_HDRModify."Posting No." := Evaluated_Posting_No;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Posting No.", Evaluated_Posting_No);
                        //CCIT-03082022

                        IF RawDataLog."Ship To Code" <> '' THEN BEGIN
                            Sales_HDRModify.VALIDATE("Ship-to Code", RawDataLog."Ship To Code");
                        END;
                        IF RawDataLog."EA Transaction Type" <> 0 THEN BEGIN
                            Sales_HDRModify.VALIDATE("EA Transaction Type", RawDataLog."EA Transaction Type");
                        END;
                        EvaluatedInvoiceDate := 0D;
                        IF RawDataLog."Invoice Date" <> '' THEN BEGIN
                            EVALUATE(EvaluatedInvoiceDate, RawDataLog."Invoice Date");
                            Sales_HDRModify.VALIDATE("Invoice Date", EvaluatedInvoiceDate);
                        END;

                        Sales_HDRModify.MODIFY;

                    END;
                END;
                LineInsert := 0;
                IF RawDataLog.Line_No <> '' THEN BEGIN
                    EVALUATE(Evaluated_Line_No, RawDataLog.Line_No); // changed line no to doc line no
                END;
                RecSalesLine2.RESET;
                RecSalesLine2.SETCURRENTKEY("Document Type", "Document No.", "Line No.");
                RecSalesLine2.ASCENDING(TRUE);
                RecSalesLine2.SETRANGE(RecSalesLine2."Document Type", RecSalesLine2."Document Type"::Invoice);
                RecSalesLine2.SETRANGE(RecSalesLine2."Document No.", Document_No2);
                RecSalesLine2.SETRANGE(RecSalesLine2."Line No.", Evaluated_Line_No);
                IF NOT RecSalesLine2.FINDFIRST THEN BEGIN

                    RecSalesLine."Document Type" := RecSalesLine."Document Type"::Invoice;
                    RecSalesLine."Document No." := Document_No2;
                    RecSalesLine."Line No." := Evaluated_Line_No;
                    RecSalesLine."Integration Doc No" := RawDataLog."Integration Doc No";
                    RecSalesLine.INSERT;

                    LineInsert := 1;
                END;


                IF LineInsert = 1 THEN BEGIN
                    RecSalesLine.RESET;
                    RecSalesLine.SETCURRENTKEY("Document Type", "Document No.", "Line No.");
                    RecSalesLine.ASCENDING(TRUE);
                    RecSalesLine.SETRANGE(RecSalesLine."Document Type", RecSalesLine."Document Type"::Invoice);
                    RecSalesLine.SETRANGE(RecSalesLine."Document No.", Document_No2);
                    RecSalesLine.SETRANGE(RecSalesLine."Line No.", Evaluated_Line_No);
                    IF RecSalesLine.FINDFIRST THEN BEGIN



                        IF UPPERCASE(RawDataLog.Type) = 'ITEM' THEN BEGIN
                            RecSalesLine.Type := 2;
                            RecSalesLine.VALIDATE(RecSalesLine.Type, 2);

                            IF RawDataLog.Item_No <> '' THEN BEGIN
                                EVALUATE("Evaluated_Item_no.", RawDataLog.Item_No);
                            END;
                            RecSalesLine."No." := "Evaluated_Item_no.";
                            RecSalesLine.VALIDATE(RecSalesLine."No.", "Evaluated_Item_no.");
                        END;

                        IF UPPERCASE(RawDataLog.Type) = 'G/L ACCOUNT' THEN BEGIN
                            RecSalesLine.Type := 1;
                            RecSalesLine.VALIDATE(RecSalesLine.Type, 1);

                            IF RawDataLog.Item_No <> '' THEN BEGIN
                                EVALUATE("Evaluated_Item_no.", RawDataLog.Item_No);
                            END;
                            RecSalesLine."No." := "Evaluated_Item_no.";
                            RecSalesLine.VALIDATE(RecSalesLine."No.", "Evaluated_Item_no.");
                        END;

                        IF RawDataLog.Location_Code <> '' THEN BEGIN  //PRIYANKA
                            RecSalesLine.VALIDATE(RecSalesLine."Location Code", RawDataLog.Location_Code);
                        END;

                        RecSalesLine."Line No." := Evaluated_Line_No;
                        RecSalesLine.VALIDATE(RecSalesLine."Line No.", Evaluated_Line_No);

                        IF RawDataLog.Sell_To_Customer_No <> '' THEN BEGIN
                            EVALUATE(Evaluted_Sell_To_Customer_No, RawDataLog.Sell_To_Customer_No);
                        END;
                        RecSalesLine."Sell-to Customer No." := Evaluted_Sell_To_Customer_No;
                        RecSalesLine.VALIDATE(RecSalesLine."Sell-to Customer No.", Evaluted_Sell_To_Customer_No);


                        IF RawDataLog.Quantity <> '' THEN BEGIN
                            EVALUATE(Evaluted_Quatity, RawDataLog.Quantity);
                        END;
                        RecSalesLine.Quantity := Evaluted_Quatity;
                        RecSalesLine.VALIDATE(RecSalesLine."Line Discount Amount", Evaluted_Quatity);

                        IF RawDataLog.UOM_Code <> '' THEN BEGIN
                            EVALUATE(Evaluted_Unit_Of_Measure_Code, RawDataLog.UOM_Code);
                        END;
                        RecSalesLine."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                        RecSalesLine.VALIDATE(RecSalesLine."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);
                        IF RawDataLog.UOM_Code = '' then
                            RecSalesLine.VALIDATE(RecSalesLine."Unit of Measure Code", 'NOS');
                        IF RawDataLog.Service_Tax_Group <> '' THEN BEGIN
                            EVALUATE(Evaluated_Service_Tax_Group, RawDataLog.Service_Tax_Group);
                        END;
                        //  RecSalesLine."Service Tax Group":=Evaluated_Service_Tax_Group;//Rushab
                        //  RecSalesLine.VALIDATE(RecSalesLine."Service Tax Group",Evaluated_Service_Tax_Group);//Rushab


                        IF RawDataLog.Type = 'G/L Account' THEN BEGIN
                            RecSalesLine."Gen. Prod. Posting Group" := 'SERVICE';
                            RecSalesLine.VALIDATE("Gen. Prod. Posting Group", 'SERVICE');
                        END;

                        //   IF COPYSTR(RawDataLog.Item_No,1,4) = 'AUTO' THEN
                        //    RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 2 Code",'110000');

                        //IF COPYSTR(RawDataLog.Item_No,1,3) = 'TRV' THEN
                        //  RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 2 Code",'210000');

                        IF RawDataLog.Unit_Price <> '' THEN BEGIN
                            EVALUATE(Evaluated_Unit_Price, RawDataLog.Unit_Price);
                        END;

                        IF RawDataLog.Item_No = 'TRVLMED' THEN BEGIN
                            Rate := Evaluated_Unit_Price / 100;
                        END ELSE BEGIN
                            Rate := Evaluated_Unit_Price;
                        END;

                        RecSalesLine."Unit Price" := Rate;
                        RecSalesLine.VALIDATE(RecSalesLine."Unit Price", Rate);

                        RecSalesLine."Integration Doc No" := RawDataLog."Integration Doc No";
                        RecSalesLine."Case No." := RawDataLog."Case No.";//CCIT-20092022
                                                                         //CCIT
                        EvaluatedPolicyMonth := 0D;
                        IF RawDataLog."Policy Month" <> '' THEN BEGIN
                            EVALUATE(EvaluatedPolicyMonth, RawDataLog."Policy Month");
                            RecSalesLine.VALIDATE("Policy Month", EvaluatedPolicyMonth);
                        END;
                        //CCIT

                        RecSalesLine.Comments := RawDataLog.Comments;
                        RecSalesLine.Narration := RawDataLog.Comments;
                        /*
                        IF  RawDataLog."Business Line Dim"<> '' THEN BEGIN
                          RecSalesLine.VALIDATE("Shortcut Dimension 1 Code",RawDataLog."Business Line Dim");
                        END;

                        IF RawDataLog."Department Dim" <> '' THEN BEGIN
                          RecSalesLine.VALIDATE("Department Code",RawDataLog."Department Dim");
                        END;

                        IF RawDataLog."Client Level Code" <> '' THEN BEGIN
                          RecSalesLine.VALIDATE("Client Level Code",RawDataLog."Client Level Code");
                        END;

                        IF RawDataLog."Employee Code" <> '' THEN BEGIN
                          RecSalesLine.VALIDATE("Employee Code",RawDataLog."Employee Code");
                        END;
                        */
                        SalesHdr.RESET;
                        SalesHdr.SETRANGE(SalesHdr."Document Type", SalesHdr."Document Type"::Invoice);
                        SalesHdr.SETRANGE("No.", Document_No2);
                        IF SalesHdr.FINDFIRST THEN BEGIN
                            RecSalesLine.VALIDATE("Dimension Set ID", SalesHdr."Dimension Set ID");
                        END;

                        IF RawDataLog."Ship To Code" <> '' THEN BEGIN
                            RecSalesLine.VALIDATE("GST Place of Supply", 2);
                        END;

                        IF RawDataLog.Particulars <> '' THEN BEGIN
                            RecSalesLine.Particulars := RawDataLog.Particulars;
                        END;
                        IF RawDataLog."Deferral Code" <> '' THEN BEGIN
                            RecSalesLine.VALIDATE("Deferral Code", RawDataLog."Deferral Code");
                        END;
                        RecSalesLine.MODIFY;
                    END;
                END; // lineinsert end



            UNTIL RawDataLog.NEXT = 0;

    end;

    procedure InsertDocumentServiceMAster(CASEID: Code[250])
    var
        RawDataLog: Record "Raw Update Log";
    begin

        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID, CASEID);
        IF RawDataLog.FINDSET THEN
            REPEAT
                Sales_Header.RESET;
                Sales_Header.SETRANGE(Sales_Header."Integration Doc No", RawDataLog."Integration Doc No");
                IF Sales_Header.FINDFIRST THEN
                    Document_No2 := Sales_Header."No.";

                // for dimension
                // forauto
                IF COPYSTR(RawDataLog.Item_No, 1, 4) = 'AUTO' THEN
                    Evaluated_Dim2 := RawDataLog."Vehicle Registration No";

                // for travel
                IF COPYSTR(RawDataLog.Item_No, 1, 3) = 'TRV' THEN
                    Evaluated_Dim2 := RawDataLog.PolicyNo_OEMInv_RefNo;



                // Documentwise service master insert
                IF RawDataLog.Line_No <> '' THEN BEGIN
                    EVALUATE(Evaluated_Line_No, RawDataLog.Line_No);
                END;
                IF RawDataLog.Sell_To_Customer_No <> '' THEN BEGIN
                    EVALUATE(Evaluted_Sell_To_Customer_No, RawDataLog.Sell_To_Customer_No);
                END;
                IF RawDataLog."Integration Doc No" <> '' THEN BEGIN
                    EVALUATE(Evaluated_Doc_No, RawDataLog."Integration Doc No");
                END;
                "Documentwise Service Master"."Integration doc No" := Evaluated_Doc_No;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Integration doc No", Evaluated_Doc_No);

                "Documentwise Service Master"."Document No." := Document_No2;

                IF RawDataLog.PolicyNo_OEMInv_RefNo <> '' THEN BEGIN
                    EVALUATE(Evaluated_PolicyNo_OEMInv_RefNo, RawDataLog.PolicyNo_OEMInv_RefNo);
                END;
                "Documentwise Service Master"."Policy No/OEM Inv/Ref No" := DELCHR(Evaluated_PolicyNo_OEMInv_RefNo, '=', '*');
                // "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Policy No/OEM Inv/Ref No",Evaluated_PolicyNo_OEMInv_RefNo);

                IF RawDataLog."Year Of MFg" <> '' THEN BEGIN
                    EVALUATE(Evaluated_Year_of_MFG, RawDataLog."Year Of MFg");
                END;
                "Documentwise Service Master"."Year of MFG" := Evaluated_Year_of_MFG;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Year of MFG", Evaluated_Year_of_MFG);

                IF RawDataLog."Vehicle Registration No" <> '' THEN BEGIN
                    EVALUATE(Evaluated_Vehicle_Regn_No, RawDataLog."Vehicle Registration No");
                END;
                "Documentwise Service Master"."Vehicle Regn No" := Evaluated_Vehicle_Regn_No;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Vehicle Regn No", Evaluated_Vehicle_Regn_No);

                IF RawDataLog.Customer_Name <> '' THEN BEGIN
                    EVALUATE(Evaluated_Customer_Name, RawDataLog.Customer_Name);
                END;
                "Documentwise Service Master"."Customer Name" := Evaluated_Customer_Name;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Customer Name", Evaluated_Customer_Name);

                IF RawDataLog.Customer_Contact_No <> '' THEN BEGIN
                    EVALUATE(Evaluated_Customer_Contact_No, RawDataLog.Customer_Contact_No);
                END;
                "Documentwise Service Master"."Customer Contact No" := Evaluated_Customer_Contact_No;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Customer Contact No", Evaluated_Customer_Contact_No);

                IF RawDataLog.Policy_Coverage_Start_Date <> '' THEN BEGIN
                    EVALUATE(Evaluated_Policy_Coverage_Start_Date, RawDataLog.Policy_Coverage_Start_Date);
                END;
                "Documentwise Service Master"."Policy / Coverage Start Date" := Evaluated_Policy_Coverage_Start_Date;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Policy / Coverage Start Date", Evaluated_Policy_Coverage_Start_Date);

                IF RawDataLog.Policy_Coverage_End_Date <> '' THEN BEGIN
                    EVALUATE(Evaluated_Policy_Coverage_End_Date, RawDataLog.Policy_Coverage_End_Date);
                END;
                "Documentwise Service Master"."Policy / Coverage End Date" := Evaluated_Policy_Coverage_End_Date;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Policy / Coverage End Date", Evaluated_Policy_Coverage_End_Date);

                IF RawDataLog.City <> '' THEN BEGIN
                    EVALUATE(Evaluated_City, RawDataLog.City);
                END;
                "Documentwise Service Master".City := Evaluated_City;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master".City, Evaluated_City);

                IF RawDataLog.State <> '' THEN BEGIN
                    EVALUATE(Evaluated_State, RawDataLog.State);
                END;
                "Documentwise Service Master".State := Evaluated_State;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master".State, Evaluated_State);

                IF RawDataLog.Region <> '' THEN BEGIN
                    EVALUATE(Evaluated_Region, RawDataLog.Region);
                END;
                "Documentwise Service Master".Region := Evaluated_Region;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master".Region, Evaluated_Region);

                IF RawDataLog."Destination Country" <> '' THEN BEGIN
                    EVALUATE(Evaluated_Destination_Country, RawDataLog."Destination Country");
                END;
                "Documentwise Service Master"."Destination Country" := Evaluated_Destination_Country;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Destination Country", Evaluated_Destination_Country);

                IF RawDataLog."Destination Region" <> '' THEN BEGIN
                    EVALUATE(Evaluated_Destination_Region, RawDataLog."Destination Region");
                END;
                "Documentwise Service Master"."Destination Region" := Evaluated_Destination_Region;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Destination Region", Evaluated_Destination_Region);

                "Documentwise Service Master"."Document No." := Document_No2;
                "Documentwise Service Master"."Document Line No." := Evaluated_Line_No;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Document No.", Document_No2);
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Document Line No.", Evaluated_Line_No);
                "Documentwise Service Master"."Dimension code" := 'SERVICE IDENTIFIER';
                "Documentwise Service Master"."Dimension Value Code" := Evaluated_Dim2;

                IF RawDataLog."Vehicle Identification No" <> '' THEN BEGIN
                    EVALUATE(Evaluated_Vehicle_Identification_No, RawDataLog."Vehicle Identification No");
                END;
                "Documentwise Service Master"."Vehicle Identification No" := Evaluated_Vehicle_Identification_No;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Vehicle Identification No", Evaluated_Vehicle_Identification_No);

                "Documentwise Service Master"."NAV Customer" := Evaluted_Sell_To_Customer_No;
                "Documentwise Service Master".VALIDATE("Documentwise Service Master"."NAV Customer", Evaluted_Sell_To_Customer_No);

                Customer.GET(Evaluted_Sell_To_Customer_No);
                "Documentwise Service Master"."NAV Customer Name" := Customer.Name;

                // "Documentwise Service Master"."Purchase Doc No":=RawDataLog.Comments;
                "Documentwise Service Master"."Integration doc No" := RawDataLog."Integration Doc No";

                "Documentwise Service Master".INSERT(TRUE);


            UNTIL RawDataLog.NEXT = 0;
    end;

    procedure InsertDimension(CASEID: Code[250])
    var
        DimensionValue: Record "Dimension Value";
        RawDataLog: Record "Raw Update Log";
        DimensionValue2: Record "Dimension Value";
    begin
        // created function for insert dimension

        /*
        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID,CASEID);
        IF RawDataLog.FINDSET THEN REPEAT
        
              // forauto
                 IF COPYSTR(RawDataLog.Item_No,1,4) = 'AUTO' THEN
                        Evaluated_Dim2 := RawDataLog."Vehicle Registration No" ;
        
           // for travel
                IF COPYSTR(RawDataLog.Item_No,1,3) = 'TRV' THEN
                       Evaluated_Dim2 :=   DELCHR(Evaluated_PolicyNo_OEMInv_RefNo,'=','*') ;
        
          // for dimension insertion
          DimensionValue.RESET;
          DimensionValue.SETRANGE(DimensionValue."Dimension Code",'SERVICE IDENTIFIER');
          DimensionValue.SETRANGE(DimensionValue.Code,Evaluated_Dim2);
          IF NOT DimensionValue.FINDFIRST THEN BEGIN
                  DimensionValue2."Dimension Code" := 'SERVICE IDENTIFIER' ;
                  DimensionValue2.Code := Evaluated_Dim2 ;
                  DimensionValue2.Name := Evaluated_Dim2 ;
                  DimensionValue2.INSERT;
          END;
        
        
        
        UNTIL RawDataLog.NEXT = 0 ;
        */

    end;

    procedure ValidateRawDataCreditMemo(CASEID: Code[250])
    var
        RawUpdateLog: Record "Raw Update Log";
        FoundError: Boolean;
        RawUpdateLog2: Record "Raw Update Log";
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

                // for customer invlaid
                IF NOT Customer.GET(RawUpdateLog.Sell_To_Customer_No) THEN BEGIN
                    RawUpdateLog."Error description" := CINVALID;
                    FoundError := TRUE;
                END;

                // for invalid customer parameters
                IF Customer.GET(RawUpdateLog.Sell_To_Customer_No) THEN BEGIN
                    IF Customer.Blocked = 3 THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CBLOCKED;
                        FoundError := TRUE;
                    END;
                    IF Customer."Customer Posting Group" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CPGINVALID;
                        FoundError := TRUE;
                    END;
                    IF Customer."Gen. Bus. Posting Group" = '' THEN BEGIN
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
                IF NOT Item.GET(RawUpdateLog.Item_No) THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + ITEMINVALID;
                    FoundError := TRUE;
                END;

                // for checking invalid item parameters
                IF Item.GET(RawUpdateLog.Item_No) THEN BEGIN
                    IF Item.Blocked = TRUE THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CBLOCKED;
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

                // for zero unit price
                IF RawUpdateLog.Unit_Price <> '' THEN BEGIN
                    EVALUATE(UnitPrice, RawUpdateLog.Unit_Price);
                END;
                IF UnitPrice = 0 THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + UPINVALID;
                    FoundError := TRUE;
                END;

                // for lcoation invalid
                IF RawUpdateLog.Location_Code <> '' THEN BEGIN
                    IF NOT Location.GET(RawUpdateLog.Location_Code) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + LOCINVALID;
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

                IF RawUpdateLog.Order_Date <> '' THEN BEGIN
                    EVALUATE(ODATE, RawUpdateLog.Order_Date);
                END;
                IF ODATE = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DINVALID;
                    FoundError := TRUE;
                END;

                // to validate structure
                IF RawUpdateLog.Structure <> '' THEN BEGIN
                    //Rushab++
                    // IF NOT Structure.GET(RawUpdateLog.Structure) THEN BEGIN
                    //   RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ STRINVALID ;
                    //   FoundError := TRUE ;
                    // END;
                    //Rushab--
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
                    //Rushab++
                    // IF NOT ServiceTaxGroup.GET(RawUpdateLog.Service_Tax_Group) THEN BEGIN
                    // RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ SRVINVALID ;
                    // FoundError := TRUE ;
                    // END;
                    //Rushab--
                END;

                // for invalid policy coverage date
                IF RawUpdateLog.Policy_Coverage_Start_Date <> '' THEN BEGIN
                    EVALUATE(PolicySDate, RawUpdateLog.Policy_Coverage_Start_Date);
                END;
                IF PolicySDate = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + PSDINVALID;
                    FoundError := TRUE;
                END;

                // for invalid policy coverage end date
                IF RawUpdateLog.Policy_Coverage_End_Date <> '' THEN BEGIN
                    EVALUATE(PolicyEDate, RawUpdateLog.Policy_Coverage_End_Date);
                END;
                IF PolicyEDate = 0D THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + PEDINVALID;
                    FoundError := TRUE;
                END;



                // for blank vehicle reg no or blank VIN NO
                IF UPPERCASE(RawUpdateLog.Type) = 'ITEM' THEN BEGIN
                    IF Customer.GET(RawUpdateLog.Sell_To_Customer_No) THEN BEGIN
                        IF ((Customer."Gen. Bus. Posting Group" <> 'TRAVEL-I') AND
                            (Customer."Gen. Bus. Posting Group" <> 'TRAVEL-R') AND
                              (Customer."Gen. Bus. Posting Group" <> 'TRAVEL-OR')) THEN BEGIN
                            IF ((RawUpdateLog."Vehicle Registration No" = '') AND
                              (RawUpdateLog."Vehicle Identification No" = '')) THEN BEGIN
                                RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + REGNOINVALID;
                                FoundError := TRUE;
                            END;
                        END;
                    END;
                END;
                // for poilicy does not exist
                IF RawUpdateLog.Policy_Coverage_Start_Date <> '' THEN BEGIN
                    EVALUATE(Evaluated_Policy_Coverage_Start_Date, RawUpdateLog.Policy_Coverage_Start_Date);
                END;
                IF RawUpdateLog.Policy_Coverage_End_Date <> '' THEN BEGIN
                    EVALUATE(Evaluated_Policy_Coverage_End_Date, RawUpdateLog.Policy_Coverage_End_Date);
                END;

                DocServMaster.RESET;
                DocServMaster.SETRANGE(DocServMaster."Policy No/OEM Inv/Ref No", RawUpdateLog.PolicyNo_OEMInv_RefNo);
                DocServMaster.SETRANGE(DocServMaster."Policy / Coverage Start Date", Evaluated_Policy_Coverage_Start_Date);
                DocServMaster.SETRANGE(DocServMaster."Policy / Coverage End Date", Evaluated_Policy_Coverage_End_Date);
                IF NOT DocServMaster.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + POLICYNOTEXIST;
                    FoundError := TRUE;
                END;

                // for poilicy  canceeled for other credit memo
                IF RawUpdateLog.Policy_Coverage_Start_Date <> '' THEN BEGIN
                    EVALUATE(Evaluated_Policy_Coverage_Start_Date, RawUpdateLog.Policy_Coverage_Start_Date);
                END;
                IF RawUpdateLog.Policy_Coverage_End_Date <> '' THEN BEGIN
                    EVALUATE(Evaluated_Policy_Coverage_End_Date, RawUpdateLog.Policy_Coverage_End_Date);
                END;
                DocServMaster.RESET;
                DocServMaster.SETRANGE(DocServMaster."Policy No/OEM Inv/Ref No", RawUpdateLog.PolicyNo_OEMInv_RefNo);
                DocServMaster.SETRANGE(DocServMaster."Policy / Coverage Start Date", Evaluated_Policy_Coverage_Start_Date);
                DocServMaster.SETRANGE(DocServMaster."Policy / Coverage End Date", Evaluated_Policy_Coverage_End_Date);
                DocServMaster.SETRANGE(DocServMaster.Cancelled, TRUE);
                IF DocServMaster.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + POLICYCANCL;
                    FoundError := TRUE;
                END;

                // for same policy in same csv
                RawUpdateLog2.RESET;
                RawUpdateLog2.SETRANGE(RawUpdateLog2.CaseID, RawUpdateLog.CaseID);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.PolicyNo_OEMInv_RefNo, RawUpdateLog.PolicyNo_OEMInv_RefNo);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.Policy_Coverage_Start_Date, RawUpdateLog.Policy_Coverage_Start_Date);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.Policy_Coverage_End_Date, RawUpdateLog.Policy_Coverage_End_Date);
                RawUpdateLog2.SETFILTER(RawUpdateLog2."Row number", '<>%1', RawUpdateLog."Row number");
                IF RawUpdateLog2.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + POLICYEXISTCSV;
                    FoundError := TRUE;
                END;
                IF RawUpdateLog.Comments = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + COMMENTSBLANK;
                    FoundError := TRUE;
                END;
                /*
                //RawUpdateLog2.RESET;
                //RawUpdateLog2.SETRANGE("Integration Doc No",RawUpdateLog."Integration Doc No");
                //IF RawUpdateLog2.FINDFIRST THEN BEGIN
                IF RawUpdateLog.Comments = '' THEN BEGIN
                  RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ COMMENTSBLANK ;
                  FoundError := TRUE ;
                END;
                //END;
                */

                RawUpdateLog.Validated := TRUE;
                RawUpdateLog.MODIFY;
            UNTIL RawUpdateLog.NEXT = 0;

        IF FoundError = FALSE THEN BEGIN
            InsertSalesDocumentCreditMemo(CASEID);
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

    procedure InsertSalesDocumentCreditMemo(CASEID: Code[250])
    var
        RawDataLog: Record "Raw Update Log";
    begin
        // created function for inserting sales header & Sales line for credit memo
        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID, CASEID);
        IF RawDataLog.FINDSET THEN
            REPEAT

                insert1 := 0;
                Sales_Header.RESET;
                Sales_HDRInsert.RESET;
                Sales_HDRModify.RESET;
                Sales_Header.SETRANGE(Sales_Header."Document Type", Sales_Header."Document Type"::"Credit Memo");
                Sales_Header.SETRANGE(Sales_Header."Integration Doc No", RawDataLog."Integration Doc No");
                IF NOT Sales_Header.FINDFIRST THEN BEGIN
                    Sales_HDRInsert."Document Type" := Sales_HDRInsert."Document Type"::"Credit Memo";
                    "Sales&RcSetup".GET('');
                    IF "Sales&RcSetup"."Credit Memo Nos." = '' THEN
                        ERROR(' Please enter Credit Memo nos in sales & receivalbe setup');
                    Document_No2 := NoSeriesMgmt.GetNextNo("Sales&RcSetup"."Credit Memo Nos.", WORKDATE, TRUE);
                    Sales_HDRInsert."No." := Document_No2;
                    Sales_HDRInsert."Integration Doc No" := RawDataLog."Integration Doc No";
                    Sales_HDRInsert.INSERT;
                    insert1 := 1;
                END;
                //modify

                IF insert1 = 1 THEN BEGIN
                    Sales_HDRModify.RESET;
                    Sales_HDRModify.SETRANGE(Sales_HDRModify."Document Type", Sales_HDRInsert."Document Type"::"Credit Memo");
                    Sales_HDRModify.SETRANGE(Sales_HDRModify."Integration Doc No", RawDataLog."Integration Doc No");
                    IF Sales_HDRModify.FINDFIRST THEN BEGIN

                        // Posting Date for Sales Header
                        IF RawDataLog.Posting_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_Posting_Date, RawDataLog.Posting_Date);
                        END;
                        Sales_HDRModify."Posting Date" := Evaluted_Posting_Date;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Posting Date", Evaluted_Posting_Date);

                        //doc date
                        IF RawDataLog.Document_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_Document_Date, RawDataLog.Document_Date);
                        END;
                        Sales_HDRModify."Document Date" := Evaluted_Document_Date;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Document Date", Evaluted_Document_Date);

                        //Invoice date
                        IF RawDataLog.Order_Date <> '' THEN BEGIN
                            EVALUATE(Evaluted_OrderDate, RawDataLog.Order_Date);
                        END;
                        Sales_HDRModify."Order Date" := Evaluted_OrderDate;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Order Date", Evaluted_OrderDate);

                        IF RawDataLog.Sell_To_Customer_No <> '' THEN BEGIN
                            EVALUATE(Evaluted_Sell_To_Customer_No, RawDataLog.Sell_To_Customer_No);
                        END;
                        Sales_HDRModify."Sell-to Customer No." := Evaluted_Sell_To_Customer_No;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Sell-to Customer No.", Evaluted_Sell_To_Customer_No);

                        IF RawDataLog.Structure <> '' THEN BEGIN
                            EVALUATE(Evaluated_Structure, RawDataLog.Structure);
                        END;

                        Sales_HDRModify."Posting No. Series" := 'PSCN';
                        Sales_HDRModify.VALIDATE("Posting No. Series");

                        //  Sales_HDRModify.Structure :=Evaluated_Structure;//Rushab
                        //  Sales_HDRModify.VALIDATE(Sales_HDRModify.Structure,Evaluated_Structure);//Rushab

                        /*IF RawDataLog.External_Doc_No <> '' THEN BEGIN
                        EVALUATE(Evaluated_Ext_Doc_No,RawDataLog.External_Doc_No);
                        END;
                        Sales_HDRModify."External Document No." :=Evaluated_Ext_Doc_No;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."External Document No.",Evaluated_Ext_Doc_No);*///CCIT-12082022

                        //CCIT-12082022
                        IF RawDataLog.External_Doc_No <> '' THEN BEGIN
                            EVALUATE(Evaluated_Ext_Doc_No, RawDataLog.External_Doc_No);
                        END ELSE BEGIN
                            Evaluated_Ext_Doc_No := '';
                        END;
                        Sales_HDRModify."External Document No." := Evaluated_Ext_Doc_No;
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."External Document No.", Evaluated_Ext_Doc_No);
                        //CCIT-12082022

                        Document_No2 := Sales_HDRModify."No.";

                        //  IF COPYSTR(RawDataLog.Item_No,1,4) = 'AUTO' THEN
                        //    Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code",'110000');


                        //  IF COPYSTR(RawDataLog.Item_No,1,3) = 'TRV' THEN
                        //    Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code",'210000');

                        IF RawDataLog.Location_Code <> '' THEN
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Location Code", RawDataLog.Location_Code);
                        Sales_HDRModify.MODIFY;

                    END;
                END;
                LineInsert := 0;
                IF RawDataLog.Line_No <> '' THEN BEGIN
                    EVALUATE(Evaluated_Line_No, RawDataLog.Line_No); // changed line no to doc line no
                END;
                RecSalesLine2.RESET;
                RecSalesLine2.SETCURRENTKEY("Document Type", "Document No.", "Line No.");
                RecSalesLine2.ASCENDING(TRUE);
                RecSalesLine2.SETRANGE(RecSalesLine2."Document Type", RecSalesLine2."Document Type"::"Credit Memo");
                RecSalesLine2.SETRANGE(RecSalesLine2."Document No.", Document_No2);
                RecSalesLine2.SETRANGE(RecSalesLine2."Line No.", Evaluated_Line_No);
                IF NOT RecSalesLine2.FINDFIRST THEN BEGIN

                    RecSalesLine."Document Type" := RecSalesLine."Document Type"::"Credit Memo";
                    RecSalesLine."Document No." := Document_No2;
                    RecSalesLine."Line No." := Evaluated_Line_No;
                    RecSalesLine."Integration Doc No" := RawDataLog."Integration Doc No";
                    ;
                    RecSalesLine.INSERT;



                    LineInsert := 1;
                END;


                IF LineInsert = 1 THEN BEGIN
                    RecSalesLine.RESET;
                    RecSalesLine.SETCURRENTKEY("Document Type", "Document No.", "Line No.");
                    RecSalesLine.ASCENDING(TRUE);
                    RecSalesLine.SETRANGE(RecSalesLine."Document Type", RecSalesLine."Document Type"::"Credit Memo");
                    RecSalesLine.SETRANGE(RecSalesLine."Document No.", Document_No2);
                    RecSalesLine.SETRANGE(RecSalesLine."Line No.", Evaluated_Line_No);
                    IF RecSalesLine.FINDFIRST THEN BEGIN

                        IF RawDataLog.Type = 'ITEM' THEN
                            RecSalesLine.Type := 2;
                        RecSalesLine.VALIDATE(RecSalesLine.Type, 2);

                        IF RawDataLog.Item_No <> '' THEN BEGIN
                            EVALUATE("Evaluated_Item_no.", RawDataLog.Item_No);
                        END;
                        RecSalesLine."No." := "Evaluated_Item_no.";
                        //     RecSalesLine.VALIDATE(RecSalesLine."No.","Evaluated_Item_no.");
                        RecSalesLine.VALIDATE(RecSalesLine."No.", RawDataLog.Item_No);
                        RecSalesLine."Line No." := Evaluated_Line_No;
                        RecSalesLine.VALIDATE(RecSalesLine."Line No.", Evaluated_Line_No);

                        IF RawDataLog.Sell_To_Customer_No <> '' THEN BEGIN
                            EVALUATE(Evaluted_Sell_To_Customer_No, RawDataLog.Sell_To_Customer_No);
                        END;
                        RecSalesLine."Sell-to Customer No." := Evaluted_Sell_To_Customer_No;
                        RecSalesLine.VALIDATE(RecSalesLine."Sell-to Customer No.", Evaluted_Sell_To_Customer_No);


                        IF RawDataLog.Quantity <> '' THEN BEGIN
                            EVALUATE(Evaluted_Quatity, RawDataLog.Quantity);
                        END;
                        RecSalesLine.Quantity := Evaluted_Quatity;
                        RecSalesLine.VALIDATE(RecSalesLine."Line Discount Amount", Evaluted_Quatity);
                        IF RawDataLog.Location_Code <> '' THEN BEGIN
                            EVALUATE(Evaluted_Location_Code, RawDataLog.Location_Code);
                        END;
                        RecSalesLine."Location Code" := Evaluted_Location_Code;
                        RecSalesLine.VALIDATE(RecSalesLine."Location Code", Evaluted_Location_Code);


                        IF RawDataLog.UOM_Code <> '' THEN BEGIN
                            EVALUATE(Evaluted_Unit_Of_Measure_Code, RawDataLog.UOM_Code);
                        END;
                        RecSalesLine."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                        RecSalesLine.VALIDATE(RecSalesLine."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);
                        if RawDataLog.UOM_Code = '' then begin
                            RecSalesLine.VALIDATE(RecSalesLine."Unit of Measure Code", 'NOS');
                        end;

                        RecSalesLine.VALIDATE(RecSalesLine."No.", RawDataLog.Item_No);

                        IF RawDataLog.Service_Tax_Group <> '' THEN BEGIN
                            EVALUATE(Evaluated_Service_Tax_Group, RawDataLog.Service_Tax_Group);
                        END;
                        //  RecSalesLine."Service Tax Group":=Evaluated_Service_Tax_Group;//Rushab
                        //  RecSalesLine.VALIDATE(RecSalesLine."Service Tax Group",Evaluated_Service_Tax_Group);//Rushab

                        //    IF COPYSTR(RawDataLog.Item_No,1,4) = 'AUTO' THEN
                        //    RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 2 Code",'110000');

                        //      IF COPYSTR(RawDataLog.Item_No,1,3) = 'TRV' THEN
                        //     RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 2 Code",'210000');



                        IF RawDataLog.Unit_Price <> '' THEN BEGIN
                            EVALUATE(Evaluated_Unit_Price, RawDataLog.Unit_Price);
                        END;
                        RecSalesLine."Unit Price" := Evaluated_Unit_Price;
                        RecSalesLine.VALIDATE(RecSalesLine."Unit Price", Evaluated_Unit_Price);

                        RecSalesLine."Integration Doc No" := RawDataLog."Integration Doc No";
                        RecSalesLine.Particulars := RawDataLog.Particulars;

                        RecSalesLine.Comments := RawDataLog.Comments;
                        RecSalesLine.Narration := RawDataLog.Comments;
                        RecSalesLine.MODIFY;
                    END;
                END; // lineinsert end



            UNTIL RawDataLog.NEXT = 0;

    end;

    procedure UpdateDocumentServiceMAster(CASEID: Code[250])
    var
        RawDataLog: Record "Raw Update Log";
    begin
        // created function for updating cancel status in docuemnt service master
        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CaseID, CASEID);
        IF RawDataLog.FINDSET THEN
            REPEAT

                // for cancelling status
                DocServMaster.RESET;
                DocServMaster.SETRANGE(DocServMaster."Policy No/OEM Inv/Ref No", RawDataLog.PolicyNo_OEMInv_RefNo);
                DocServMaster.SETRANGE(DocServMaster."Vehicle Regn No", RawDataLog."Vehicle Registration No");
                DocServMaster.SETRANGE(DocServMaster."Vehicle Identification No", RawDataLog."Vehicle Identification No");
                IF DocServMaster.FINDFIRST THEN BEGIN

                    DocServMaster."Credit Memo Doc No" := RawDataLog."Integration Doc No";
                    EVALUATE(Evaluated_Line_No, RawDataLog.Line_No);
                    DocServMaster."Credit Memo Line No" := Evaluated_Line_No;
                    DocServMaster.Cancelled := TRUE;
                    DocServMaster.MODIFY;

                END;

            UNTIL RawDataLog.NEXT = 0;
    end;
}

