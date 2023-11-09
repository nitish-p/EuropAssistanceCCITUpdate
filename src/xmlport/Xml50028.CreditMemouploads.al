/*
xmlport 50028 "Credit Memo uploads"
{
    // Pallavi 11082017
    // 1 created xmlport for uploading revenue invoice upload
    // 2 added code to initalize = OnPreXMLport()
    // 3 added code to validate rawdata = OnPostXMLport()
    // 4 Added code to insert additionAl information - RawJV - Import::OnBeforeInsertRecord()
    // 5 created fucntion ValidateRawData to validate raw data
    // 6 created function InsertSalesDocument() to copy from raw data into sales
    // Pallavi 12082017
    // added code for valdiating gst regstrn no
    // Pallavi 14082017
    // deleted unwanted functions
    // Pallavi 22082017
    // added new field noseries type
    // prdp 11012017
    // set the MinOccur property for all fields to zero

    Direction = Import;
    FileName = 'Dummy.csv';
    Format = VariableText;
    Permissions = TableData 21 = rimd,
                  TableData 379 = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement(Table50014; Table50014)
            {
                XmlName = 'RawJV';
                fieldelement(PostingDate; "Raw JV Data".Field1)
                {
                    MinOccurs = Zero;
                }
                fieldelement(DocType; "Raw JV Data".Field2)
                {
                    MinOccurs = Zero;
                }
                fieldelement(AccType; "Raw JV Data".Field3)
                {
                    MinOccurs = Zero;
                }
                fieldelement(AccNo; "Raw JV Data".Field4)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Amt; "Raw JV Data".Field5)
                {
                    MinOccurs = Zero;
                }
                textelement(txtvar6)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Narration; "Raw JV Data".Field13)
                {
                    MinOccurs = Zero;
                }
                fieldelement(RegionDim; "Raw JV Data".Field14)
                {
                    MinOccurs = Zero;
                }
                fieldelement(DeptDim; "Raw JV Data".Field15)
                {
                    MinOccurs = Zero;
                }
                fieldelement(EmpCode; "Raw JV Data".Field8)
                {
                    MinOccurs = Zero;
                }
                fieldelement(ChequeNo; "Raw JV Data".Field11)
                {
                    MinOccurs = Zero;
                }
                fieldelement(ChequeDate; "Raw JV Data".Field12)
                {
                    MinOccurs = Zero;
                }
                textelement(DepDate)
                {
                    MinOccurs = Zero;
                }
                fieldelement(EHOPINvNo; "Raw JV Data".Field19)
                {
                    MinOccurs = Zero;
                }
                textelement(txtvr15)
                {
                    MinOccurs = Zero;
                }
                fieldelement(SrvTaxGrpCode; "Raw JV Data".Field20)
                {
                    MinOccurs = Zero;
                }
                fieldelement(ApplyIntNo; "Raw JV Data".Field34)
                {
                    MinOccurs = Zero;
                }
                fieldelement(BalAccType; "Raw JV Data".Field6)
                {
                    MinOccurs = Zero;
                }
                fieldelement(BalAccNo; "Raw JV Data".Field7)
                {
                    MinOccurs = Zero;
                }
                fieldelement(GStGrp; "Raw JV Data".Field22)
                {
                    MinOccurs = Zero;
                }
                fieldelement(HSNSAC; "Raw JV Data".Field23)
                {
                    MinOccurs = Zero;
                }
                fieldelement(InvType; "Raw JV Data".Field31)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    // for inserting additional information
                    Table50014."File Name" := currXMLport.FILENAME;
                    Table50014.CASEID := CASIDTEXT;
                    RowNo := RowNo + 1;
                    Table50014.RowNumber := RowNo;
                    Table50014.Status := 0;
                    Table50014."Imported Date" := TODAY;
                    Table50014."Imported Time" := TIME;
                    Table50014."User ID" := USERID;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        // added code to validate rawdata
        ValidateRawData(CASIDTEXT);
    end;

    trigger OnPreXmlPort()
    begin
        /// intialize
        RowNo := 0;
        CASIDTEXT := USERID + FORMAT(CURRENTDATETIME);
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        UserBatch: Record "Vendor Bridge";
        GenJnlBatch: Record "Gen. Journal Batch";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserBatchName: Code[50];
        JournalTempName: Code[20];
        JournalBatchName: Code[20];
        NextDocNo: Code[20];
        LineNo: Integer;
        SchemeDim: Code[20];
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        GLEntry: Record "G/L Entry";
        GenJnlLine1: Record "Gen. Journal Line";
        CompanyInfo: Record "Company Information";
        RowNo: Integer;
        CASIDTEXT: Text[100];
        PDATE: Date;
        recCustLedgEntry: Record "Cust. Ledger Entry";
        OldSt: Code[30];
        decAmountToApply: Decimal;
        datApplicationDate: Date;
        cduCustApplyEntries: Codeunit "CustEntry-Apply Posted Entries";
        temprecDtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        recDtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        Text0001: Label 'Entries have been uploaded in User Batch %1';
        Text0002: Label 'The Proforma Invoice No. %1 is already posted having Document No. %2';
        Text0003: Label 'The Proforma Invoice No. %1 is already uploaded in User Batch %2';
        Text002: Label 'Entry No. %1  has only %2  as remaining amount but credit memo amount is %3';

    procedure ValidateRawData(CASEID: Code[250])
    var
        RawUpdateLog: Record "50014";
        FoundError: Boolean;
        RawUpdateLog2: Record "B2B Monthwise Client Invoicing";
        CINVALID: Label 'Customer  is Invalid';
        TYPEINVALID: Label 'Type   is Invalid';
        ITEMINVALID: Label 'Item No  is Invalid ';
        CBLOCKED: Label 'Customer is Blocked';
        CPGINVALID: Label 'Customer Posting Group is Invalid';
        GSTGRPINVALID: Label 'GsT Group  is Invalid';
        GLBLOCKED: Label 'GL Account is Blocked';
        AINVALID: Label 'Amount is Invalid';
        UOMINVALID: Label 'Unit of Measure is Invalid';
        IUOMINVALID: Label 'Item Unit of Measure is Invalid';
        GBGINVALID: Label 'Gen Bus. Posting Group is Invalid';
        UPINVALID: Label 'Unit Price is Invalid';
        LOCINVALID: Label 'Location not defined in region';
        DINVALID: Label 'Date is invalid';
        DepINVALID: Label 'Department is invalid';
        LININVALID: Label 'location is invalid';
        SRVINVALID: Label 'Service Tax Grp is invalid';
        PSDINVALID: Label 'Policy StartDate is invalid';
        EDINVALID: Label 'Ext Doc Date is invalid';
        REGINVALID: Label 'Region is invalid';
        DOCINVALID: Label 'Document No is Invalid';
        POLICYEXIST: Label 'Policy No Already exist in Service Master';
        POLICYEXISTCSV: Label 'Policy No Already exist in same csv file';
        POLICYNOTEXIST: Label 'Policy No Does not exist';
        POLICYCANCL: Label 'Policy is already cancelled';
        ITEMCRINVALID: Label 'Item Cross reference No not defined';
        TXGRPINVALID: Label 'Tax Group is Invalid in Item Master';
        STInvlaID: Label 'State is invalid for Customer';
        DTINVALID: Label 'Document Type is Invalid';
        ATINVALID: Label 'Account Type is Invalid';
        GLAcc: Record "G/L Account";
        BATINVALID: Label 'Bal. Account Type is Invalid';
        GLInvalid: Label 'Gl Account is invalid';
        CGSTINInvalid: Label 'Customer GSTIN is invalid';
        LGSTINInvalid: Label 'Location GSTIN is invalid';
        Customer: Record Customer;
        CTYPInvalid: Label 'Customer GSt Regsiter type is invalid';
        Amount: Decimal;
        EDate: Date;
        DimValue: Record "Dimension Value";
        Location: Record Location;
        GSTGrp: Record "GST Group";
        HSNInvalid: Label 'HSN/SAC is invalid';
        "HSN/SAC": Record "HSN/SAC";
        InvTypeInvalid: Label 'Invoice Type is invalid';
        XMLRejectMAster: XMLport IMPS;
        IncGrpINVALID: Label 'Income Group is invalid';
        SalesHeader: Record "Sales Header";
        SaleInvHeader: Record "Sales Invoice Header";
        InvNoInvalid: Label 'Invoice no already exists';
        InvNoPosted: Label 'Invoice No Posted';
        InvNoInserted: Label 'Invoice No in other Invoice';
        ZeroEntryNo: Label 'Zero Entry No';
        EntryNoInvalid: Label 'Entry No is not found in Customer Ledger';
        CLE: Record "Cust. Ledger Entry";
    begin

        // initlaize
        FoundError := FALSE;

        RawUpdateLog.RESET;
        RawUpdateLog.SETRANGE(RawUpdateLog.CASEID, CASEID);
        RawUpdateLog.SETRANGE(RawUpdateLog.Validated, FALSE);
        IF RawUpdateLog.FINDSET THEN
            REPEAT
                // intiliaze
                PDATE := 0D;
                Amount := 0;

                // for posting date invalid
                // for validating Dates

                IF RawUpdateLog.PostingDate <> '' THEN BEGIN
                    EVALUATE(PDATE, RawUpdateLog.PostingDate);
                    IF PDATE = 0D THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DINVALID;
                        FoundError := TRUE;
                    END;
                END;
                IF RawUpdateLog.PostingDate = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DINVALID;
                    FoundError := TRUE;
                END;

                // for  invalid doctype
                IF UPPERCASE(RawUpdateLog.DocType) <> 'CREDIT MEMO' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DTINVALID;
                    FoundError := TRUE;
                END;


                // for invalid acttype
                IF RawUpdateLog.BalAccType <> 'G/L Account' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + ATINVALID;
                    FoundError := TRUE;
                END;

                // for invalid account no
                IF RawUpdateLog.BalAccNo = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GLInvalid;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog.BalAccNo <> '' THEN BEGIN

                    IF NOT GLAcc.GET(RawUpdateLog.BalAccNo) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GLInvalid;
                        FoundError := TRUE;
                    END;

                    IF GLAcc.GET(RawUpdateLog.BalAccNo) THEN BEGIN
                        IF GLAcc.Blocked = TRUE THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GLBLOCKED;
                            FoundError := TRUE;
                        END;
                    END;

                END;

                // for zero amt
                IF RawUpdateLog.Amt = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + AINVALID;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog.Amt <> '' THEN BEGIN
                    EVALUATE(Amount, RawUpdateLog.Amt);
                    IF Amount = 0 THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + AINVALID;
                        FoundError := TRUE;
                    END;
                END;



                // for invalid balacctype
                // for invalid acttype
                IF RawUpdateLog.AccType <> 'Customer' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + BATINVALID;
                    FoundError := TRUE;
                END;


                // for invlaid cusotmer
                // for customer invlaid
                IF NOT Customer.GET(RawUpdateLog.AccNo) THEN BEGIN
                    RawUpdateLog."Error description" := CINVALID;
                    FoundError := TRUE;
                END;

                // for invalid customer parameters
                IF Customer.GET(RawUpdateLog.AccNo) THEN BEGIN
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


                    IF Customer."State Code" = '' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + STInvlaID;
                        FoundError := TRUE;
                    END;

                    IF Customer."GST Registration Type" = 1 THEN BEGIN
                        IF Customer."GST Registration No." = '' THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CGSTINInvalid;
                            FoundError := TRUE;
                        END;
                    END;

                    IF Customer."GST Customer Type" = 0 THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + CTYPInvalid;
                        FoundError := TRUE;
                    END;

                END;

                // for invalid ext doc date
                IF RawUpdateLog.ExtDocDate <> '' THEN BEGIN
                    EVALUATE(EDate, RawUpdateLog.ExtDocDate);
                    IF EDate = 0D THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + EDINVALID;
                        FoundError := TRUE;
                    END;
                END;

                //for invalid region & location
                IF RawUpdateLog.RegionDim = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + REGINVALID;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog.RegionDim <> '' THEN BEGIN

                    IF NOT DimValue.GET('REGION', RawUpdateLog.RegionDim) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + REGINVALID;
                        FoundError := TRUE;
                    END;

                    IF DimValue.GET('REGION', RawUpdateLog.RegionDim) THEN BEGIN

                        IF DimValue."Location Code" = '' THEN BEGIN
                            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + LOCINVALID;
                            FoundError := TRUE;
                        END;

                        IF DimValue."Location Code" <> '' THEN BEGIN
                            IF NOT Location.GET(DimValue."Location Code") THEN BEGIN
                                RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + LININVALID;
                                FoundError := TRUE;
                            END;
                            IF Location.GET(DimValue."Location Code") THEN BEGIN
                                IF Location."GST Registration No." = '' THEN BEGIN
                                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + LGSTINInvalid;
                                    FoundError := TRUE;
                                END;
                            END;
                        END;
                    END;
                END;

                // for invalid department
                IF RawUpdateLog.DeptDim = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DepINVALID;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog.DeptDim <> '' THEN BEGIN
                    IF NOT DimValue.GET('DEPARTMENT', RawUpdateLog.DeptDim) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + DepINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for invalid income group
                IF RawUpdateLog.IncomeGrp <> '' THEN BEGIN
                    IF NOT DimValue.GET('INCOME GROUP', RawUpdateLog.IncomeGrp) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + IncGrpINVALID;
                        FoundError := TRUE;
                    END;

                END;

               
                // for docume nt no ehop no
              //  IF RawUpdateLog.EHOPINvNo = '' THEN BEGIN
                  // RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ DOCINVALID ;
                  // FoundError := TRUE ;
                END;
                 
                // for gst grp
                IF RawUpdateLog.GSTGrp = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GSTGRPINVALID;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog.GSTGrp <> '' THEN BEGIN
                    IF NOT GSTGrp.GET(RawUpdateLog.GSTGrp) THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + GSTGRPINVALID;
                        FoundError := TRUE;
                    END;
                END;

                // for invaslid HSN /SAC
                IF RawUpdateLog."HSN/SAC" = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + HSNInvalid;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog."HSN/SAC" <> '' THEN BEGIN
                    IF NOT "HSN/SAC".GET(RawUpdateLog.GSTGrp, RawUpdateLog."HSN/SAC") THEN BEGIN
                        //  IF NOT "HSN/SAC".GET(RawUpdateLog."HSN/SAC") THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + HSNInvalid;
                        FoundError := TRUE;
                    END;
                END;

                // for invoice type is invalid
                IF RawUpdateLog."Invoice Type" = '' THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + InvTypeInvalid;
                    FoundError := TRUE;
                END;

                IF RawUpdateLog."Invoice Type" <> 'Bill of Supply' THEN BEGIN
                    IF RawUpdateLog."Invoice Type" <> 'Taxable' THEN BEGIN
                        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + InvTypeInvalid;
                        FoundError := TRUE;
                    END;
                END;

                // for ehopinvoie no rep
                RawUpdateLog2.RESET;
                RawUpdateLog2.SETRANGE(RawUpdateLog2.CASEID, RawUpdateLog.CASEID);
                RawUpdateLog2.SETRANGE(RawUpdateLog2.EHOPINvNo, RawUpdateLog.EHOPINvNo);
                RawUpdateLog2.SETFILTER(RawUpdateLog2.RowNumber, '<>%1', RawUpdateLog.RowNumber);
                IF RawUpdateLog2.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + InvNoInvalid;
                    FoundError := TRUE;
                END;

                // for slaeshede   = ehop inv no
                SalesHeader.RESET;
                SalesHeader.SETRANGE(SalesHeader."Document Type", SalesHeader."Document Type"::"3");
                SalesHeader.SETRANGE(SalesHeader."Jv Invoice No", RawUpdateLog.EHOPINvNo);
                IF SalesHeader.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + InvNoInserted;
                    FoundError := TRUE;
                END;


                // for invoice no posted
                SaleInvHeader.RESET;
                SaleInvHeader.SETRANGE(SaleInvHeader."Jv Invoice No", RawUpdateLog.EHOPINvNo);
                IF SaleInvHeader.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + InvNoPosted;
                    FoundError := TRUE;
                END;


                // for zero apply entry no
                IF RawUpdateLog."Apply Entry No" = 0 THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + ZeroEntryNo;
                    FoundError := TRUE;
                END;


                // for not found with invoice in customer ledger
                CLE.RESET;
                CLE.SETRANGE(CLE."Customer No.", RawUpdateLog.AccNo);
                CLE.SETRANGE(CLE."Entry No.", RawUpdateLog."Apply Entry No");
                CLE.SETRANGE(CLE."Document Type", CLE."Document Type"::"2");
                IF NOT CLE.FINDFIRST THEN BEGIN
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; ' + EntryNoInvalid;
                    FoundError := TRUE;
                END;


                // if invoice found  to update in applies doc no
                CLE.RESET;
                CLE.SETRANGE(CLE."Customer No.", RawUpdateLog.AccNo);
                CLE.SETRANGE(CLE."Entry No.", RawUpdateLog."Apply Entry No");
                CLE.SETRANGE(CLE."Document Type", CLE."Document Type"::"2");
                IF CLE.FINDFIRST THEN BEGIN
                    RawUpdateLog."Applies Doc No" := CLE."Document No."
                END;



                RawUpdateLog.Validated := TRUE;
                RawUpdateLog.MODIFY;
            UNTIL RawUpdateLog.NEXT = 0;

        IF FoundError = FALSE THEN BEGIN
            InsertSalesDocument(CASEID);
            MESSAGE(' Imported Successfully');
        END;


        IF FoundError = TRUE THEN BEGIN

            RawUpdateLog.RESET;
            RawUpdateLog.SETRANGE(RawUpdateLog.CASEID, CASEID);
            IF RawUpdateLog.FINDSET THEN
                REPEAT
                    RawUpdateLog.Status := 1;
                    RawUpdateLog.MODIFY;
                UNTIL RawUpdateLog.NEXT = 0;

            MESSAGE('Error occured ; Please check Rejected Log in csv file');


            RawUpdateLog.RESET;
            RawUpdateLog.SETRANGE(RawUpdateLog.CASEID, CASEID);
            IF RawUpdateLog.FINDFIRST THEN BEGIN
                COMMIT;
                XMLRejectMAster.SETTABLEVIEW(RawUpdateLog);
                XMLRejectMAster.RUN;
            END;


        END; // found errror

    end;

    procedure InsertSalesDocument(CASEID: Code[250])
    var
        RawDataLog: Record "B2B Monthwise Client Invoicing";
        RowNumber: Integer;
        UpdateRawData: Codeunit "Update Bank Response";
        PolicyNumber: Code[30];
        RawSalesLog: Record "Documentwise Service Master";
        CaseIdText: Text[250];
        Item: Record Item;
        ItemUOM: Record "Unit of Measure";
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
        Evaluated_PolicyNo_OEMInv_RefNo: Code[30];
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
        XMLRejectMAster: XMLport "Rejected Sales Data Export";
        Rate: Decimal;
        UOM: Record "Unit of Measure";
        ItemCrossRef: Record "Item Cross Reference";
        TaxGroup: Record "Tax Group";
        EvaluatedVatPercent: Decimal;
        EvaluatedMRP: Decimal;
        SalesRecSetup: Record "Sales & Receivables Setup";
        SalesCommentLine: Record "Sales Comment Line";
    begin

        // created function for inserting sales header & Sales line
        RawDataLog.RESET;
        RawDataLog.SETRANGE(RawDataLog.CASEID, CASEID);
        IF RawDataLog.FINDSET THEN
            REPEAT

                insert1 := 0;
                Evaluted_Location_Code := '';
                Sales_HDRInsert.RESET;
                Sales_HDRModify.RESET;
                Sales_HDRModify.SETRANGE(Sales_HDRModify."Document Type", Sales_HDRModify."Document Type"::"3");
                Sales_HDRModify.SETRANGE(Sales_HDRModify."CASE ID", RawDataLog.CASEID);
                Sales_HDRModify.SETRANGE(Sales_HDRModify."Jv Invoice No", RawDataLog.EHOPINvNo);
                IF NOT Sales_HDRModify.FINDFIRST THEN BEGIN
                    Sales_HDRInsert."Document Type" := Sales_HDRInsert."Document Type"::"3";
                    "Sales&RcSetup".GET('');
                    IF "Sales&RcSetup"."Credit Memo Nos." = '' THEN
                        ERROR(' Please enter Credit Memo no.s');
                    Document_No2 := NoSeriesMgmt.GetNextNo("Sales&RcSetup"."Credit Memo Nos.", WORKDATE, TRUE);
                    Sales_HDRInsert."No." := Document_No2;
                    Sales_HDRInsert."CASE ID" := RawDataLog.CASEID;
                    Sales_HDRInsert."Jv Invoice No" := RawDataLog.EHOPINvNo;
                    IF RawDataLog."Invoice Type" = 'Taxable' THEN
                        Sales_HDRInsert.VALIDATE(Sales_HDRInsert."Invoice Type", Sales_HDRInsert."Invoice Type"::"0");
                    IF RawDataLog."Invoice Type" = 'Bill of Supply' THEN
                        Sales_HDRInsert.VALIDATE(Sales_HDRInsert."Invoice Type", Sales_HDRInsert."Invoice Type"::"1");
                    Sales_HDRInsert.INSERT;
                    insert1 := 1;
                END;
                //modify

                IF insert1 = 1 THEN BEGIN

                    Sales_HDRModify.RESET;
                    Sales_HDRModify.SETRANGE(Sales_HDRModify."Document Type", Sales_HDRInsert."Document Type"::"3");
                    Sales_HDRModify.SETRANGE(Sales_HDRModify."CASE ID", RawDataLog.CASEID);
                    Sales_HDRModify.SETRANGE(Sales_HDRModify."Jv Invoice No", RawDataLog.EHOPINvNo);
                    IF Sales_HDRModify.FINDFIRST THEN BEGIN
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Sell-to Customer No.", RawDataLog.AccNo);
                        EVALUATE(Evaluted_Posting_Date, RawDataLog.PostingDate);
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Posting Date", Evaluted_Posting_Date);
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Document Date", Evaluted_Posting_Date);
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 1 Code", RawDataLog.RegionDim);
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code", RawDataLog.DeptDim);
                        Sales_HDRModify.VALIDATE(Sales_HDRModify.Structure, 'GST');
                        Sales_HDRModify.VALIDATE(Sales_HDRModify."External Document No.", RawDataLog.ExtDoc);
                        Sales_HDRInsert."Jv Invoice No" := RawDataLog.EHOPINvNo;
                        Sales_HDRInsert."CASE ID" := RawDataLog.CASEID;
                        IF Sales_HDRModify."Location Code" <> '' THEN
                            Evaluted_Location_Code := Sales_HDRModify."Location Code";
                        IF RawDataLog."Invoice Type" = 'Taxable' THEN
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Invoice Type", Sales_HDRModify."Invoice Type"::"0");
                        IF RawDataLog."Invoice Type" = 'Bill of Supply' THEN
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Invoice Type", Sales_HDRModify."Invoice Type"::"1");
                        IF RawDataLog."Applies Doc No" <> '' THEN BEGIN
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Applies-to Doc. Type", Sales_HDRModify."Applies-to Doc. Type"::"2");
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Applies-to Doc. No.", RawDataLog."Applies Doc No");
                        END;
                        Sales_HDRModify.MODIFY;
                    END; // slaes hdr end


                    // to insert comment
                    SalesCommentLine.RESET;
                    SalesCommentLine."Document Type" := SalesCommentLine."Document Type"::"3";
                    SalesCommentLine."No." := Document_No2;
                    SalesCommentLine."Document Line No." := 0;
                    SalesCommentLine."Line No." := 10000;
                    SalesCommentLine.Date := Evaluted_Posting_Date;
                    SalesCommentLine.Comment := RawDataLog.Narration;
                    SalesCommentLine.INSERT;



                END; // insert - 0


                RecSalesLine2.RESET;
                RecSalesLine2.SETCURRENTKEY("Document Type", "Document No.", "Line No.");
                RecSalesLine2.ASCENDING(TRUE);
                RecSalesLine2.SETRANGE(RecSalesLine2."Document Type", RecSalesLine2."Document Type"::"3");
                RecSalesLine2.SETRANGE(RecSalesLine2."Document No.", Document_No2);
                RecSalesLine2.SETRANGE(RecSalesLine2."Line No.", 10000);
                IF NOT RecSalesLine2.FINDFIRST THEN BEGIN
                    RecSalesLine."Document Type" := RecSalesLine."Document Type"::"3";
                    RecSalesLine."Document No." := Document_No2;
                    RecSalesLine."Line No." := 10000;
                    RecSalesLine.VALIDATE(RecSalesLine.Type, RecSalesLine.Type::"1");
                    RecSalesLine.VALIDATE(RecSalesLine."No.", RawDataLog.BalAccNo);
                    RecSalesLine.VALIDATE(RecSalesLine."Sell-to Customer No.", RawDataLog.AccNo);
                    RecSalesLine.VALIDATE(RecSalesLine."Location Code", Evaluted_Location_Code);
                    RecSalesLine.VALIDATE(RecSalesLine.Quantity, 1);
                    EVALUATE(Evaluated_Unit_Price, RawDataLog.Amt);
                    RecSalesLine.VALIDATE(RecSalesLine."Unit Price", ABS(Evaluated_Unit_Price));
                    RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 1 Code", RawDataLog.RegionDim);
                    RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 2 Code", RawDataLog.DeptDim);
                    RecSalesLine.VALIDATE(RecSalesLine."Gen. Prod. Posting Group", 'OTHERS');
                    RecSalesLine.VALIDATE(RecSalesLine."GST Group Code", RawDataLog.GSTGrp);
                    RecSalesLine.VALIDATE(RecSalesLine."HSN/SAC Code", RawDataLog."HSN/SAC");
                    RecSalesLine."GST Place of Supply" := RecSalesLine."GST Place of Supply"::"1";
                    IF RawDataLog.IncomeGrp <> '' THEN
                        RecSalesLine.VALIDATE(RecSalesLine."Income Group", RawDataLog.IncomeGrp);
                    IF RawDataLog."Applies Doc No" <> '' THEN BEGIN
                        // added code to applu inovoice with credit memo
                        CLEAR(recCustLedgEntry);
                        recCustLedgEntry.SETRANGE(recCustLedgEntry."Document No.", RawDataLog."Applies Doc No");
                        IF recCustLedgEntry.FINDFIRST THEN BEGIN
                            decAmountToApply := ABS(Evaluated_Unit_Price);
                            datApplicationDate := Evaluted_Posting_Date;
                            recCustLedgEntry."Applies-to ID" := Document_No2;
                            ;
                            recCustLedgEntry."Amount to Apply" := decAmountToApply;
                            recCustLedgEntry.CALCFIELDS("Remaining Amt. (LCY)");
                            IF ABS(recCustLedgEntry."Amount to Apply") > ABS(recCustLedgEntry."Remaining Amt. (LCY)") THEN
                                ERROR(Text002, recCustLedgEntry."Entry No.", recCustLedgEntry."Remaining Amt. (LCY)", recCustLedgEntry."Amount to Apply");
                            recCustLedgEntry.MODIFY;
                        END;

                        // added code to apply invoice with credit memo

                    END;

                    RecSalesLine.INSERT;
                END;


            UNTIL RawDataLog.NEXT = 0;
    end;
}
*/
