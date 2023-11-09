Page 50021 "Uploaded Entries"
{
    PageType = List;
    SourceTable = "Update log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select;rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Generated";rec."Invoice Generated")
                {
                    ApplicationArea = Basic;
                }
                field(CaseID;rec.CaseID)
                {
                    ApplicationArea = Basic;
                }
                field("Row number";rec."Row number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Validated;rec.Validated)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Error description";rec."Error description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Integration Doc No";rec."Integration Doc No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field(Sell_To_Customer_No;rec.Sell_To_Customer_No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Item_No;rec.Item_No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Quantity;rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UOM_Code;rec.UOM_Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Unit_Price;rec.Unit_Price)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Location_Code;rec.Location_Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posting_Date;rec.Posting_Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Document_Date;rec.Document_Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Order_Date;rec.Order_Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Structure;rec.Structure)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Line_No;rec.Line_No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(External_Doc_No;rec.External_Doc_No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Service_Tax_Group;rec.Service_Tax_Group)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PolicyNo_OEMInv_RefNo;rec.PolicyNo_OEMInv_RefNo)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Year Of MFg";rec."Year Of MFg")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Registration No";rec."Vehicle Registration No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Customer_Name;rec.Customer_Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Customer_Contact_No;rec.Customer_Contact_No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Policy_Coverage_Start_Date;rec.Policy_Coverage_Start_Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Policy_Coverage_End_Date;rec.Policy_Coverage_End_Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(City;rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(State;rec.State)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Region;rec.Region)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Destination Country";rec."Destination Country")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Destination Region";rec."Destination Region")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Identification No";rec."Vehicle Identification No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments;rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Dim";rec."Department Dim")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Business Line Dim";rec."Business Line Dim")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Customer Invoice No.";rec."Customer Invoice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting No. Series";rec."Posting No. Series")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Ship To Code";rec."Ship To Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Particulars;rec.Particulars)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("EA Transaction Type";rec."EA Transaction Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Deferral Code";rec."Deferral Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Select All")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;

                trigger OnAction()
                begin

                    if not Confirm ('Do you want to Select all lines ?',false)
                      then
                        exit;

                    SalesInvHeader.Reset;
                    SalesInvHeader.CopyFilters(Rec);
                    //SalesInvHeader.SETRANGE(CaseID,CaseID);
                    //SalesInvHeader.SETRANGE(Validated,TRUE);
                    SalesInvHeader.SetFilter(SalesInvHeader."Integration Doc No",'<>%1','');
                    if SalesInvHeader.FindSet then repeat
                       SalesInvHeader.Select:=true;
                       SalesInvHeader.Modify;
                    until SalesInvHeader.Next = 0;
                end;
            }
            action("Deselect All")
            {
                ApplicationArea = Basic;
                Image = UnApply;
                Promoted = true;

                trigger OnAction()
                begin

                    if not Confirm ('Do you want Deselect all lines ?',false)
                      then
                        exit;

                    SalesInvHeader.Reset;
                    SalesInvHeader.CopyFilters(Rec);
                    SalesInvHeader.SetRange(Select,true);
                    if SalesInvHeader.FindSet then repeat
                       SalesInvHeader.Select:=false;
                       SalesInvHeader.Modify;
                    until SalesInvHeader.Next = 0;
                end;
            }
            group(Functions)
            {
                Caption = 'Functions';
            }
            action(Validate)
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin

                    if not Confirm ('Do you want to validate selected lines ?',false)
                      then
                        exit;

                    if rec.Select then
                       ValidateRawData(rec.Select,rec.CaseID);
                end;
            }
            action(Generate)
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                begin
                    if not Confirm ('Do you want to generate invoices for selected lines ?',false)
                      then
                        exit;

                    if rec.Select then begin

                    InsertPolicyVINMaster(rec.Select,rec.CaseID);
                    InsertSalesDocument(rec.Select,rec.CaseID);
                    InsertDocumentServiceMAster(rec.Select,rec.CaseID);
                    Message('Generated Invoices Successfully at %1',CurrentDatetime);
                    end;
                end;
            }
        }
    }

    trigger OnClosePage()
    begin
        SalesInvHeader.Reset;
        SalesInvHeader.SetRange(SalesInvHeader.Select,true);
        if SalesInvHeader.FindSet then repeat
           SalesInvHeader.Select:=false;
           SalesInvHeader.Modify;
        until SalesInvHeader.Next = 0;
    end;

    trigger OnOpenPage()
    begin
        SalesInvHeader.Reset;
        SalesInvHeader.SetRange(SalesInvHeader.Select,true);
        if SalesInvHeader.FindSet then repeat
           SalesInvHeader.Select:=false;
           SalesInvHeader.Modify;
        until SalesInvHeader.Next = 0;
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
        //StructureHdr: Record UnknownRecord13792;
        LineNo: Integer;
        //ServiceTaxGroup: Record UnknownRecord16471;
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
       // XMLRejectMAster: XmlPort UnknownXmlPort50026;//Naveen
        DocServMaster: Record "Documentwise Service Master";
        Rate: Decimal;
        UOM: Record "Unit of Measure";
        PolicyMaster: Record "Policy Master";
        VINMaster: Record "VIN Master";
       // RawSalesDataImport: XmlPort UnknownXmlPort50023;//Naveen
        Rec50004: Record "Update log";
        PolMaster: Record "Policy Master";
        GLAcc: Record "G/L Account";
        DocServMaster1: Record "Documentwise Service Master";
        NoSer: Record "No. Series";
        EvaluatedBusLineDim: Code[30];
        EvaluatedDepDim: Code[30];
        RawPol: Code[50];
        ShipToCode: Record "Ship-to Address";
        TestFile: File;
        TestStream: OutStream;
        UpdateLog: Record "Update log";
        CINVALID: label 'Customer  is Invalid';
        TYPEINVALID: label 'Type   is Invalid';
        ITEMINVALID: label 'Item No  is Invalid ';
        CBLOCKED: label 'Customer is Blocked';
        CPGINVALID: label 'Customer Posting Group is Invalid';
        IPGINVALID: label 'Gen Prod. Posting Group for item is Invalid';
        IBLOCKED: label 'Item is Blocked';
        QINVALID: label 'Qty is Invalid';
        UOMINVALID: label 'Unit of Measure is Invalid';
        IUOMINVALID: label 'Item Unit of Measure is Invalid';
        GBGINVALID: label 'Gen Bus. Posting Group is Invalid';
        UPINVALID: label 'Unit Price is Invalid';
        LOCINVALID: label 'Location is Invalid';
        DINVALID: label 'Date is invalid';
        STRINVALID: label 'Structure is invalid';
        LININVALID: label 'Line No is invalid';
        SRVINVALID: label 'Service Tax Grp is invalid';
        PSDINVALID: label 'Policy StartDate is invalid';
        PEDINVALID: label 'Policy End Date is invalid';
        REGNOINVALID: label 'Vehicle Reg No and VIN No is Invalid';
        POLNOINVALID: label 'Policy No is Invalid';
        POLICYEXIST: label 'Policy No Already exist';
        POLICYEXISTCSV: label 'Policy No Already exist in same csv file';
        POLICYNOTEXIST: label 'Policy No Does not exist';
        POLICYCANCL: label 'Policy is already cancelled';
        VINExist: label 'VIN No already exist';
        DepDimNotExist: label 'DepDimNotExist';
        BusLineDimNotExist: label 'BusLineDimNotExist';
        GLINVALID: label 'GL Is Invalid';
        INTDOCNOEXIST: label 'Integration Doc No Already Exist';
        NOSERIESNOTEXIST: label 'Invalid Posting No Series';
        NOSERIESBLANK: label 'Blank No Series';
        COMMENTSBLANK: label 'Commnets must not be blank';
        SalesInvHeader: Record "Update log";
        SalesInvHdr: Record "Sales Invoice Header";
        DimSetEntry: Record "Dimension Set Entry";
        SalesHdr: Record "Sales Header";
        EvaluatedInvoiceDate: Date;


    procedure ValidateRawData(SELECT: Boolean;CASEID: Text[50])
    var
        RawUpdateLog: Record "Update log";
        FoundError: Boolean;
        RawUpdateLog2: Record "Update log";
    begin
        // initlaize
        FoundError := false ;

        RawUpdateLog.Reset;
        RawUpdateLog.SetRange(RawUpdateLog.CaseID,CASEID);
        RawUpdateLog.SetRange(Select,true);
        RawUpdateLog.SetRange(RawUpdateLog.Validated,false);
        if RawUpdateLog.FindSet then repeat


        // intiliaze
        UnitPrice := 0;
        Qty := 0 ;
        PDATE := 0D;
        DDATE := 0D;
        ODATE := 0D;
        LineNo := 0 ;

        if RawUpdateLog.PolicyNo_OEMInv_RefNo <> '' then begin
        RawPol:=DelChr(RawUpdateLog.PolicyNo_OEMInv_RefNo,'=','*');
        PolicyMaster.Reset;
        PolicyMaster.SetRange(PolicyMaster.PolicyNo,RawPol);
        PolicyMaster.SetRange(PolicyMaster.CustNo,RawUpdateLog.Sell_To_Customer_No);
        PolicyMaster.SetRange(PolicyMaster."Policy Start Date",RawUpdateLog.Policy_Coverage_Start_Date);
        PolicyMaster.SetRange(PolicyMaster."Policy End Date",RawUpdateLog.Policy_Coverage_End_Date);
        if PolicyMaster.FindFirst then begin
            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ POLICYEXIST ;
            FoundError := true ;
            RawUpdateLog.Status := 1 ;
        end;
        end;
        if RawUpdateLog."Vehicle Identification No" <> ''then begin
        VINMaster.SetRange("VIN No",RawUpdateLog."Vehicle Identification No");
        VINMaster.SetRange(CustNo,RawUpdateLog.Sell_To_Customer_No);
        VINMaster.SetRange("Policy Start Date",RawUpdateLog.Policy_Coverage_Start_Date);
        VINMaster.SetRange("Policy End Date",RawUpdateLog.Policy_Coverage_End_Date);
        if VINMaster.FindFirst then begin
            RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ VINExist ;
            FoundError := true ;
            RawUpdateLog.Status := 1 ;
        end;
        end;

        // for invalid policy coverage date
        if RawUpdateLog.Policy_Coverage_Start_Date <> '' then begin
        Evaluate(PolicySDate,RawUpdateLog.Policy_Coverage_Start_Date);
        if PolicySDate = 0D then begin
          RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ PSDINVALID ;
           FoundError := true ;
           RawUpdateLog.Status := 1 ;
        end;
        end;

        // for invalid policy coverage end date
        if RawUpdateLog.Policy_Coverage_End_Date <> '' then begin
        Evaluate(PolicyEDate,RawUpdateLog.Policy_Coverage_End_Date);
        if PolicyEDate = 0D then begin
          RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ PEDINVALID ;
           FoundError := true ;
           RawUpdateLog.Status := 1 ;
        end;
        end;

        SalesInvHdr.Reset;
        SalesInvHdr.SetRange(SalesInvHdr."Integration Doc No",RawUpdateLog."Integration Doc No");
        if SalesInvHdr.FindFirst then begin
        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ 'IntDocNoAlreadyPosted';
           FoundError := true ;
           RawUpdateLog.Status := 1 ;
        end;

        // for blank vehicle reg no or blank VIN NO
        if UpperCase(RawUpdateLog.Type) = 'ITEM' then begin
        if Customer.Get(RawUpdateLog.Sell_To_Customer_No) then begin
          if ((Customer."Gen. Bus. Posting Group" <> 'TRAVEL-I') and
              (Customer."Gen. Bus. Posting Group" <> 'TRAVEL-R') and
                (Customer."Gen. Bus. Posting Group" <> 'TRAVEL-OR') and
               (Customer."Gen. Bus. Posting Group" <> 'HOME - I')) then begin
                  if ((RawUpdateLog."Vehicle Registration No" = '') and
                    (RawUpdateLog."Vehicle Identification No" = '')) then begin
                    RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ REGNOINVALID ;
                    FoundError := true ;
                    RawUpdateLog.Status := 1 ;
                  end;
             end;
        end;
        end;

        if RawUpdateLog."EA Transaction Type" <> 0 then begin
          if ((RawUpdateLog."EA Transaction Type" <> 1) and (RawUpdateLog."EA Transaction Type" <> 2) and (RawUpdateLog."EA Transaction Type" <> 3)) then begin
              RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ 'InvalidEATransactionType';
              FoundError := true ;
          end;
        end else begin
              RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ 'EATransactionTypeMandatory';
              FoundError := true ;
        end;

        if RawUpdateLog."Invoice Date" = '' then begin
        RawUpdateLog."Error description" := RawUpdateLog."Error description" + ' ; '+ 'IntvoiceDateMandatory';
           FoundError := true ;
           RawUpdateLog.Status := 1 ;
        end;

        RawUpdateLog.Validated := true ;
        RawUpdateLog.Modify ;

        until RawUpdateLog.Next = 0 ;

        Message('Validation Completed at %1', CurrentDatetime);
    end;


    procedure InsertSalesDocument(SELECT: Boolean;CASEID: Text[50])
    var
        RawDataLog: Record "Update log";
    begin
        // created function for inserting sales header & Sales line
        RawDataLog.Reset;
        RawDataLog.SetRange(RawDataLog.CaseID,CASEID);
        RawDataLog.SetRange(RawDataLog.Select,true);
        RawDataLog.SetRange(RawDataLog.Validated,true);
        RawDataLog.SetRange(RawDataLog.Status,0);
        RawDataLog.SetRange(RawDataLog."Error description",'');
        RawDataLog.SetRange("Invoice Generated",false);
        if RawDataLog.FindSet then repeat
        
                    insert1 := 0;
                   Sales_Header.Reset;
                   Sales_HDRInsert.Reset;
                   Sales_HDRModify.Reset;
                   Sales_Header.SetRange(Sales_Header."Document Type",Sales_Header."document type"::Invoice);
                   Sales_Header.SetRange(Sales_Header."Integration Doc No",RawDataLog."Integration Doc No");
                   if not Sales_Header.FindFirst then begin
                    Sales_HDRInsert."Document Type" := Sales_HDRInsert."document type"::Invoice;
                    "Sales&RcSetup".Get('');
                    if "Sales&RcSetup"."Invoice Nos."= '' then
                      Error(' Please enter invoice nos in sales & receivalbe setup');
                     Document_No2   := NoSeriesMgmt.GetNextNo("Sales&RcSetup"."Invoice Nos.",WorkDate,true);
                    Sales_HDRInsert."No." := Document_No2;
                    Sales_HDRInsert."Integration Doc No" := RawDataLog."Integration Doc No" ;
        
        
                    Sales_HDRInsert.Insert;
                    insert1 := 1;
                    end;
                      //modify
        
                   if insert1 = 1 then begin
                    Sales_HDRModify.Reset;
                    Sales_HDRModify.SetRange(Sales_HDRModify."Document Type",Sales_HDRInsert."document type"::Invoice);
                    Sales_HDRModify.SetRange(Sales_HDRModify."Integration Doc No",RawDataLog."Integration Doc No");
                    if Sales_HDRModify.FindFirst then begin
        
                    // Posting Date for Sales Header
                    if RawDataLog.Posting_Date <> '' then begin
                       Evaluate(Evaluted_Posting_Date,RawDataLog.Posting_Date);
                    end;
                       Sales_HDRModify."Posting Date" :=Evaluted_Posting_Date;
                       Sales_HDRModify.Validate(Sales_HDRModify."Posting Date",Evaluted_Posting_Date);
        
                    //doc date
                    if RawDataLog.Document_Date <> '' then begin
                       Evaluate(Evaluted_Document_Date,RawDataLog.Document_Date);
                    end;
                       Sales_HDRModify."Document Date" :=Evaluted_Document_Date;
                       Sales_HDRModify.Validate(Sales_HDRModify."Document Date",Evaluted_Document_Date);
        
                    //Invoice date
                    if RawDataLog.Order_Date <> '' then begin
                       Evaluate(Evaluted_OrderDate,RawDataLog.Order_Date);
                    end;
                       Sales_HDRModify."Order Date" :=Evaluted_OrderDate;
                       Sales_HDRModify.Validate(Sales_HDRModify."Order Date",Evaluted_OrderDate);
                   if RawDataLog.Sell_To_Customer_No <> '' then begin
                       Evaluate(Evaluted_Sell_To_Customer_No,RawDataLog.Sell_To_Customer_No);
                   end;
                       Sales_HDRModify."Sell-to Customer No." :=Evaluted_Sell_To_Customer_No;
                       Sales_HDRModify.Validate(Sales_HDRModify."Sell-to Customer No.",Evaluted_Sell_To_Customer_No);
        
                 /* if RawDataLog.Structure <> '' then begin
                       Evaluate(Evaluated_Structure,RawDataLog.Structure);
                  end;
                       Sales_HDRModify.Structure :=Evaluated_Structure;
                       Sales_HDRModify.Validate(Sales_HDRModify.Structure,Evaluated_Structure);*/
        
        
        
                   if RawDataLog.External_Doc_No <> '' then begin
                       Evaluate(Evaluated_Ext_Doc_No,RawDataLog.External_Doc_No);
                   end;
                       Sales_HDRModify."External Document No." :=Evaluated_Ext_Doc_No;
                       Sales_HDRModify.Validate(Sales_HDRModify."External Document No.",Evaluated_Ext_Doc_No);
        
                      Sales_HDRModify."Customer Invoice No.":=RawDataLog."Customer Invoice No.";
                      Document_No2 := Sales_HDRModify."No." ;
                      EvaluatedInvoiceDate:=0D;
                      if RawDataLog."Invoice Date" <> '' then begin
                        Evaluate(EvaluatedInvoiceDate,RawDataLog."Invoice Date");
                        Sales_HDRModify."Invoice Date":=EvaluatedInvoiceDate;
                      end;
                      //Naveen
                //    IF COPYSTR(RawDataLog.Item_No,1,4) = 'AUTO' THEN
                 //      Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code",'110000');
        
        
                    //IF COPYSTR(RawDataLog.Item_No,1,3) = 'TRV' THEN
                     //  Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code",'210000');
        //Naveen
                    if RawDataLog.Location_Code <> '' then
                    Sales_HDRModify."Location Code":=RawDataLog.Location_Code;
                    Sales_HDRModify.Validate(Sales_HDRModify."Location Code",RawDataLog.Location_Code);
        
                      if UpperCase(CopyStr(RawDataLog."Integration Doc No",1,3)) = 'DEB' then begin
                        Sales_HDRModify."Debit Note":=true;
                        Sales_HDRModify.Validate("Debit Note");
                      end;
        
        if Sales_HDRModify."Dimension Set ID" <> 0 then begin
        DimSetEntry.Reset;
        DimSetEntry.SetRange("Dimension Set ID",Sales_HDRModify."Dimension Set ID");
        DimSetEntry.SetRange("Dimension Code",'BUSINESS LINE');
        DimSetEntry.SetFilter("Dimension Value Code",'<>%1','');
        if not DimSetEntry.FindFirst then begin
        Sales_HDRModify.Validate("Shortcut Dimension 1 Code",RawDataLog."Business Line Dim");
        end;
        DimSetEntry.Reset;
        DimSetEntry.SetRange("Dimension Set ID",Sales_HDRModify."Dimension Set ID");
        DimSetEntry.SetRange("Dimension Code",'DEPARTMENT');
        DimSetEntry.SetFilter("Dimension Value Code",'<>%1','');
        if not DimSetEntry.FindFirst then begin
        Sales_HDRModify.Validate(Department,RawDataLog."Department Dim");
        end;
        DimSetEntry.Reset;
        DimSetEntry.SetRange("Dimension Set ID",Sales_HDRModify."Dimension Set ID");
        DimSetEntry.SetRange("Dimension Code",'CLIENT LEVEL');
        DimSetEntry.SetFilter("Dimension Value Code",'<>%1','');
        if not DimSetEntry.FindFirst then begin
        Sales_HDRModify.Validate("Client Level Code",RawDataLog."Client Level Code");
        end;
        DimSetEntry.Reset;
        DimSetEntry.SetRange("Dimension Set ID",Sales_HDRModify."Dimension Set ID");
        DimSetEntry.SetRange("Dimension Code",'EMPLOYEE');
        DimSetEntry.SetFilter("Dimension Value Code",'<>%1','');
        if not DimSetEntry.FindFirst then begin
        Sales_HDRModify.Validate("Employee Code",RawDataLog."Employee Code");
        end;
        end else begin
         Sales_HDRModify.Validate("Shortcut Dimension 1 Code",RawDataLog."Business Line Dim");
         Sales_HDRModify.Validate(Department,RawDataLog."Department Dim");
         Sales_HDRModify.Validate("Client Level Code",RawDataLog."Client Level Code");
         Sales_HDRModify.Validate("Employee Code",RawDataLog."Employee Code");
        end;
        
                      Evaluate("Evaluated_Posting_No.Series",RawDataLog."Posting No. Series");
                      Sales_HDRModify."Posting No. Series" := "Evaluated_Posting_No.Series";
                      Sales_HDRModify.Validate(Sales_HDRModify."Posting No. Series","Evaluated_Posting_No.Series");
        
                      if RawDataLog."Ship To Code" <> '' then begin
                      Sales_HDRModify.Validate("Ship-to Code",RawDataLog."Ship To Code");
                      end;
                      Sales_HDRModify.Validate("EA Transaction Type",RawDataLog."EA Transaction Type");
        
                    Sales_HDRModify.Modify;
        
                   end;
                   end;
        LineInsert   := 0 ;
        if RawDataLog.Line_No <> '' then begin
         Evaluate(Evaluated_Line_No,RawDataLog.Line_No); // changed line no to doc line no
        end;
              RecSalesLine2.Reset;
              RecSalesLine2.SetCurrentkey("Document Type","Document No.","Line No.");
              RecSalesLine2.Ascending(true);
              RecSalesLine2.SetRange(RecSalesLine2."Document Type",RecSalesLine2."document type"::Invoice);
              RecSalesLine2.SetRange(RecSalesLine2."Document No.",Document_No2);
              RecSalesLine2.SetRange(RecSalesLine2."Line No.",Evaluated_Line_No);
              if not RecSalesLine2.FindFirst then begin
        
                     RecSalesLine."Document Type" := RecSalesLine."document type"::Invoice;
                     RecSalesLine."Document No." := Document_No2;
                     RecSalesLine."Line No." := Evaluated_Line_No;
                     RecSalesLine."Integration Doc No" := RawDataLog."Integration Doc No" ;
                     RecSalesLine.Insert;
        
                 LineInsert := 1 ;
             end;
        
        
        if LineInsert = 1 then begin
              RecSalesLine.Reset;
              RecSalesLine.SetCurrentkey("Document Type","Document No.","Line No.");
              RecSalesLine.Ascending(true);
              RecSalesLine.SetRange(RecSalesLine."Document Type",RecSalesLine."document type"::Invoice);
              RecSalesLine.SetRange(RecSalesLine."Document No.",Document_No2);
              RecSalesLine.SetRange(RecSalesLine."Line No.",Evaluated_Line_No);
              if RecSalesLine.FindFirst then begin
        
        
        
                   if RawDataLog.Type = 'ITEM' then begin
                    RecSalesLine.Type := 2;
                     RecSalesLine.Validate(RecSalesLine.Type,2);
        
                    if RawDataLog.Item_No <> '' then begin
                     Evaluate("Evaluated_Item_no.",RawDataLog.Item_No);
                    end;
                     RecSalesLine."No.":= "Evaluated_Item_no.";
                     RecSalesLine.Validate(RecSalesLine."No.","Evaluated_Item_no.");
                   end;
        
                   if RawDataLog.Type = 'G/L Account' then begin
                    RecSalesLine.Type := 1;
                     RecSalesLine.Validate(RecSalesLine.Type,1);
        
                    if RawDataLog.Item_No <> '' then begin
                     Evaluate("Evaluated_Item_no.",RawDataLog.Item_No);
                    end;
                     RecSalesLine."No.":= "Evaluated_Item_no.";
                     RecSalesLine.Validate(RecSalesLine."No.","Evaluated_Item_no.");
                    end;
        
                      if  RawDataLog.Location_Code <> '' then begin  //PRIYANKA
                      RecSalesLine.Validate(RecSalesLine."Location Code",RawDataLog.Location_Code);
                      end;
        
                     RecSalesLine."Line No." :=Evaluated_Line_No;
                     RecSalesLine.Validate(RecSalesLine."Line No.",Evaluated_Line_No);
        
                     if RawDataLog.Sell_To_Customer_No <> '' then begin
                     Evaluate(Evaluted_Sell_To_Customer_No,RawDataLog.Sell_To_Customer_No);
                     end;
                     RecSalesLine."Sell-to Customer No." :=Evaluted_Sell_To_Customer_No;
                     RecSalesLine.Validate(RecSalesLine."Sell-to Customer No.",Evaluted_Sell_To_Customer_No);
        
        
                     if RawDataLog.Quantity <> '' then begin
                     Evaluate(Evaluted_Quatity,RawDataLog.Quantity);
                     end;
                     RecSalesLine.Quantity:=Evaluted_Quatity;
                     RecSalesLine.Validate(RecSalesLine."Line Discount Amount",Evaluted_Quatity);
        
                     if RawDataLog.UOM_Code <> '' then begin
                     Evaluate(Evaluted_Unit_Of_Measure_Code,RawDataLog.UOM_Code);
                     end;
                     RecSalesLine."Unit of Measure Code":=Evaluted_Unit_Of_Measure_Code;
                     RecSalesLine.Validate(RecSalesLine."Unit of Measure Code",Evaluted_Unit_Of_Measure_Code);
        
                    /* if RawDataLog.Service_Tax_Group <> '' then begin
                     Evaluate(Evaluated_Service_Tax_Group,RawDataLog.Service_Tax_Group);
                     end;
                     RecSalesLine."Service Tax Group":=Evaluated_Service_Tax_Group;
                     RecSalesLine.Validate(RecSalesLine."Service Tax Group",Evaluated_Service_Tax_Group);
        */
        
                    if RawDataLog.Type = 'G/L Account' then begin
                       RecSalesLine."Gen. Prod. Posting Group":='SERVICE';
                       RecSalesLine.Validate("Gen. Prod. Posting Group",'SERVICE');
                     end;
        
        
                     if RawDataLog.Unit_Price <> '' then begin
                     Evaluate(Evaluated_Unit_Price,RawDataLog.Unit_Price);
                     end;
        
                       if RawDataLog.Item_No = 'TRVLMED' then begin
                        Rate:=Evaluated_Unit_Price/100;
                       end else begin
                        Rate:=Evaluated_Unit_Price;
                       end;
        
                     RecSalesLine."Unit Price":=Rate;
                     RecSalesLine.Validate(RecSalesLine."Unit Price",Rate);
        
                     RecSalesLine."Integration Doc No" := RawDataLog."Integration Doc No";
                     RecSalesLine.Validate("Deferral Code",RawDataLog."Deferral Code");
        
        
                 RecSalesLine.Comments:=RawDataLog.Comments;
                 //Naveen
                 /*
                IF  RawDataLog."Business Line Dim"<> '' THEN BEGIN
                  RecSalesLine."Shortcut Dimension 1 Code" :=  RawDataLog."Business Line Dim";
                END;
        
                IF RawDataLog."Department Dim" <> '' THEN BEGIN
                  RecSalesLine."Department Code":=RawDataLog."Department Dim";
                END;
                */
                //Naveen
        
                SalesHdr.Reset;
                SalesHdr.SetRange(SalesHdr."Document Type",SalesHdr."document type"::Invoice);
                SalesHdr.SetRange("No.",Document_No2);
                if SalesHdr.FindFirst then begin
                  RecSalesLine.Validate("Dimension Set ID",SalesHdr."Dimension Set ID");
                end;
        
                if RawDataLog."Ship To Code" <> '' then begin
                  RecSalesLine.Validate("GST Place of Supply",2);
                end;
        
                if RawDataLog.Particulars <> '' then begin
                  RecSalesLine.Particulars:=RawDataLog.Particulars;
                end;
        
                 RecSalesLine.Modify;
              end;
         end; // lineinsert end
        
        RawDataLog."Invoice Generated":=true;
        RawDataLog.Modify;
        
        until RawDataLog.Next = 0;

    end;


    procedure InsertDocumentServiceMAster(SELECT: Boolean;CASEID: Text[50])
    var
        RawDataLog: Record "Update log";
    begin
        RawDataLog.Reset;
        RawDataLog.SetRange(RawDataLog.CaseID,CASEID);
        RawDataLog.SetRange(RawDataLog.Select,true);
        RawDataLog.SetRange(RawDataLog.Validated,true);
        RawDataLog.SetRange(RawDataLog.Status,0);
        RawDataLog.SetRange(RawDataLog."Error description",'');
        if RawDataLog.FindSet then repeat
                Sales_Header.Reset;
                Sales_Header.SetRange(Sales_Header."Integration Doc No",RawDataLog."Integration Doc No");
                if Sales_Header.FindFirst then
                   Document_No2 := Sales_Header."No." ;

        // for dimension
        // forauto
                 if CopyStr(RawDataLog.Item_No,1,4) = 'AUTO' then
                        Evaluated_Dim2 := RawDataLog."Vehicle Registration No" ;

           // for travel
                if CopyStr(RawDataLog.Item_No,1,3) = 'TRV' then
                       Evaluated_Dim2 :=   RawDataLog.PolicyNo_OEMInv_RefNo ;



        // Documentwise service master insert
                      if RawDataLog.Line_No <> '' then begin
                      Evaluate(Evaluated_Line_No,RawDataLog.Line_No);
                      end;
                      if RawDataLog.Sell_To_Customer_No <> '' then begin
                      Evaluate(Evaluted_Sell_To_Customer_No,RawDataLog.Sell_To_Customer_No);
                      end;
                      if RawDataLog."Integration Doc No" <> '' then begin
                      Evaluate(Evaluated_Doc_No,RawDataLog."Integration Doc No");
                      end;
                     "Documentwise Service Master"."Integration doc No":=Evaluated_Doc_No;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Integration doc No",Evaluated_Doc_No);

                      "Documentwise Service Master"."Document No." := Document_No2 ;

                     if RawDataLog.PolicyNo_OEMInv_RefNo <> '' then begin
                     Evaluate(Evaluated_PolicyNo_OEMInv_RefNo,RawDataLog.PolicyNo_OEMInv_RefNo);
                     end;
                     "Documentwise Service Master"."Policy No/OEM Inv/Ref No":=DelChr(Evaluated_PolicyNo_OEMInv_RefNo,'=','*');
                    // "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Policy No/OEM Inv/Ref No",Evaluated_PolicyNo_OEMInv_RefNo);

                     if RawDataLog."Year Of MFg" <> '' then begin
                     Evaluate(Evaluated_Year_of_MFG,RawDataLog."Year Of MFg");
                     end;
                     "Documentwise Service Master"."Year of MFG":=Evaluated_Year_of_MFG;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Year of MFG",Evaluated_Year_of_MFG);

                     if RawDataLog."Vehicle Registration No" <> '' then begin
                     Evaluate(Evaluated_Vehicle_Regn_No,RawDataLog."Vehicle Registration No");
                     end;
                     "Documentwise Service Master"."Vehicle Regn No":=Evaluated_Vehicle_Regn_No;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Vehicle Regn No",Evaluated_Vehicle_Regn_No);

                     if RawDataLog.Customer_Name <> '' then begin
                     Evaluate(Evaluated_Customer_Name,RawDataLog.Customer_Name);
                     end;
                     "Documentwise Service Master"."Customer Name":=Evaluated_Customer_Name;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Customer Name",Evaluated_Customer_Name);

                     if RawDataLog.Customer_Contact_No <> '' then begin
                     Evaluate(Evaluated_Customer_Contact_No,RawDataLog.Customer_Contact_No);
                     end;
                     "Documentwise Service Master"."Customer Contact No":=Evaluated_Customer_Contact_No;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Customer Contact No",Evaluated_Customer_Contact_No);

                     if RawDataLog.Policy_Coverage_Start_Date <> '' then begin
                     Evaluate(Evaluated_Policy_Coverage_Start_Date,RawDataLog.Policy_Coverage_Start_Date);
                     end;
                     "Documentwise Service Master"."Policy / Coverage Start Date":=Evaluated_Policy_Coverage_Start_Date;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Policy / Coverage Start Date",Evaluated_Policy_Coverage_Start_Date);

                     if RawDataLog.Policy_Coverage_End_Date <> '' then begin
                     Evaluate(Evaluated_Policy_Coverage_End_Date,RawDataLog.Policy_Coverage_End_Date);
                     end;
                     "Documentwise Service Master"."Policy / Coverage End Date":=Evaluated_Policy_Coverage_End_Date;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Policy / Coverage End Date",Evaluated_Policy_Coverage_End_Date);

                     if RawDataLog.City <> '' then begin
                     Evaluate(Evaluated_City,RawDataLog.City);
                     end;
                     "Documentwise Service Master".City:=Evaluated_City;
                     "Documentwise Service Master".Validate("Documentwise Service Master".City,Evaluated_City);

                     if RawDataLog.State <> '' then begin
                     Evaluate(Evaluated_State,RawDataLog.State);
                     end;
                     "Documentwise Service Master".State:=Evaluated_State;
                     "Documentwise Service Master".Validate("Documentwise Service Master".State,Evaluated_State);

                     if RawDataLog.Region <> '' then begin
                     Evaluate(Evaluated_Region,RawDataLog.Region);
                     end;
                     "Documentwise Service Master".Region:=Evaluated_Region;
                     "Documentwise Service Master".Validate("Documentwise Service Master".Region,Evaluated_Region);

                     if RawDataLog."Destination Country" <> '' then begin
                     Evaluate(Evaluated_Destination_Country,RawDataLog."Destination Country");
                     end;
                     "Documentwise Service Master"."Destination Country":=Evaluated_Destination_Country;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Destination Country",Evaluated_Destination_Country);

                     if RawDataLog."Destination Region" <> '' then begin
                     Evaluate(Evaluated_Destination_Region,RawDataLog."Destination Region");
                     end;
                     "Documentwise Service Master"."Destination Region":=Evaluated_Destination_Region;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Destination Region",Evaluated_Destination_Region);

                      "Documentwise Service Master"."Document No." := Document_No2 ;
                     "Documentwise Service Master"."Document Line No.":=Evaluated_Line_No;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Document No.",Document_No2);
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Document Line No.",Evaluated_Line_No);
                     "Documentwise Service Master"."Dimension code" := 'SERVICE IDENTIFIER';
                     "Documentwise Service Master"."Dimension Value Code" := Evaluated_Dim2 ;

                     if RawDataLog."Vehicle Identification No" <> '' then begin
                     Evaluate(Evaluated_Vehicle_Identification_No,RawDataLog."Vehicle Identification No");
                     end;
                     "Documentwise Service Master"."Vehicle Identification No":=Evaluated_Vehicle_Identification_No;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."Vehicle Identification No",Evaluated_Vehicle_Identification_No);

                     "Documentwise Service Master"."NAV Customer":=Evaluted_Sell_To_Customer_No;
                     "Documentwise Service Master".Validate("Documentwise Service Master"."NAV Customer",Evaluted_Sell_To_Customer_No);

                     Customer.Get(Evaluted_Sell_To_Customer_No);
                     "Documentwise Service Master"."NAV Customer Name":=Customer.Name;

                     // "Documentwise Service Master"."Purchase Doc No":=RawDataLog.Comments;
                     "Documentwise Service Master"."Integration doc No":=RawDataLog."Integration Doc No";

                     "Documentwise Service Master".Insert(true) ;


        until RawDataLog.Next = 0 ;
    end;

    local procedure InsertPolicyVINMaster(SELECT: Boolean;CASEID: Text[50])
    var
        RawUpdateLog: Record "Update log";
        RawPol1: Code[50];
    begin
        RawUpdateLog.Reset;
        RawUpdateLog.SetRange(RawUpdateLog.CaseID,CASEID);
        RawUpdateLog.SetRange(RawUpdateLog.Select,true);
        RawUpdateLog.SetRange(RawUpdateLog.Validated,true);;
        RawUpdateLog.SetRange(RawUpdateLog.Status,0);
        RawUpdateLog.SetRange(RawUpdateLog."Error description",'');
        if RawUpdateLog.FindSet then repeat

        if RawUpdateLog.PolicyNo_OEMInv_RefNo <> '' then begin
        RawPol1:=DelChr(RawUpdateLog.PolicyNo_OEMInv_RefNo,'=','*');
        PolicyMaster.Reset;
        PolicyMaster.SetRange(PolicyMaster.PolicyNo,RawPol1);
        PolicyMaster.SetRange(PolicyMaster.CustNo,RawUpdateLog.Sell_To_Customer_No);
        PolicyMaster.SetRange(PolicyMaster."Policy Start Date",RawUpdateLog.Policy_Coverage_Start_Date);
        PolicyMaster.SetRange(PolicyMaster."Policy End Date",RawUpdateLog.Policy_Coverage_End_Date);
        if not  PolicyMaster.FindFirst then begin
          PolicyMaster.Init;
          PolicyMaster.PolicyNo := RawPol1;
        PolicyMaster.CustNo   := RawUpdateLog.Sell_To_Customer_No;
        PolicyMaster."Policy Start Date":=RawUpdateLog.Policy_Coverage_Start_Date;
        PolicyMaster."Policy End Date":=RawUpdateLog.Policy_Coverage_End_Date;
        PolicyMaster.Insert  ;
        end;
        end;

        if RawUpdateLog."Vehicle Identification No" <> ''then begin
        VINMaster.SetRange("VIN No",RawUpdateLog."Vehicle Identification No");
        VINMaster.SetRange(CustNo,RawUpdateLog.Sell_To_Customer_No);
        VINMaster.SetRange("Policy Start Date",RawUpdateLog.Policy_Coverage_Start_Date);
        VINMaster.SetRange("Policy End Date",RawUpdateLog.Policy_Coverage_End_Date);
        if not  VINMaster.FindFirst then begin
          VINMaster.Init;
         VINMaster."VIN No" := RawUpdateLog."Vehicle Identification No";
         VINMaster.CustNo:=RawUpdateLog.Sell_To_Customer_No;
         VINMaster."Policy Start Date":=RawUpdateLog.Policy_Coverage_Start_Date;
         VINMaster."Policy End Date":=RawUpdateLog.Policy_Coverage_End_Date;
         VINMaster.Insert;
        end;
        end;

        until RawUpdateLog.Next=0;
    end;
}

