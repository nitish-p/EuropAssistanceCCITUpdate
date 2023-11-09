xmlport 50007 "Sales Cr Memo Import"
{
    // Pallavi 15012017
    // added code for auto and travel dimension
    // added code for dimension value creation
    // Pallavi 16012017
    // optimized code for modifcation
    // prdp 20012017
    // set min occurance to zero for fields City & State

    Direction = Import;
    FileName = 'Salesimport.csv';
    Format = VariableText;
    Permissions = TableData "Sales Header" = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Documentwise Service Master"; "Documentwise Service Master")
            {
                XmlName = 'Documentwise_Service_Master';
                textelement(document_no)
                {
                    XmlName = 'Document_No';
                }
                textelement(Sell_To_Customer_No)
                {
                }
                textelement(Type)
                {
                }
                textelement(Item_No)
                {
                }
                textelement(Quantity)
                {
                }
                textelement(UOM_Code)
                {
                }
                textelement(Unit_Price)
                {
                }
                textelement(Location_Code)
                {

                    trigger OnAfterAssignVariable()
                    begin
                        //to capture location in header+
                        /*
                     IF insert1 = 1 THEN BEGIN
                        Sales_HDRModify.RESET;
                        Sales_HDRModify.SETRANGE(Sales_HDRModify."No.",Document_No);
                        IF Sales_HDRModify.FINDFIRST THEN BEGIN
                         Evaluted_Location_Code:=Location_Code;
                         Sales_HDRModify."Location Code":= Location_Code;
                         Sales_HDRModify.MODIFY;
                        END;
                      END;
                   //to capture location in header-
                       */

                    end;
                }
                textelement(Posting_Date)
                {
                }
                textelement(Document_Date)
                {
                }
                textelement(Order_Date)
                {
                }
                textelement(Structure)
                {
                }
                textelement(Line_No)
                {
                }
                textelement(External_Doc_No)
                {
                }
                textelement(Service_Tax_Group)
                {
                }
                textelement(PolicyNo_OEMInv_RefNo)
                {
                }
                textelement(Year_of_MFG)
                {
                }
                textelement(Vehicle_Regn_No)
                {
                }
                textelement(Customer_Name)
                {
                }
                textelement(Customer_Contact_No)
                {
                }
                textelement(Policy_Coverage_Start_Date)
                {
                }
                textelement(Policy_Coverage_End_Date)
                {
                }
                textelement(City)
                {
                    MinOccurs = Zero;
                }
                textelement(State)
                {
                    MinOccurs = Zero;
                }
                textelement(Region)
                {
                    MinOccurs = Zero;
                }
                textelement(Destination_Country)
                {
                    MinOccurs = Zero;
                }
                textelement(Destination_Region)
                {
                    MinOccurs = Zero;
                }
                textelement(Vehicle_Identification_No)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin


                    IF COPYSTR(Item_No, 1, 4) = 'AUTO' THEN BEGIN
                        IF Vehicle_Regn_No <> '' THEN
                            Evaluated_Dim2 := Evaluated_Dim2
                        ELSE
                            Evaluated_Dim2 := 'NA';
                        EVALUATE(Evaluated_Dim2, Vehicle_Regn_No);
                    END;

                    IF COPYSTR(Item_No, 1, 3) = 'TRV' THEN BEGIN
                        EVALUATE(Evaluated_Dim2, PolicyNo_OEMInv_RefNo);
                        IF PolicyNo_OEMInv_RefNo <> '' THEN
                            Evaluated_Dim2 := Evaluated_Dim2;
                    END;



                    DimVal2.SETRANGE(DimVal2."Dimension Code", 'SERVICE IDENTIFIER');
                    DimVal2.SETRANGE(DimVal2.Code, Evaluated_Dim2);
                    IF NOT DimVal2.FINDFIRST THEN BEGIN
                        DimVal."Dimension Code" := 'SERVICE IDENTIFIER';
                        DimVal.Code := Evaluated_Dim2;
                        DimVal.Name := Evaluated_Dim2;
                        DimVal.INSERT;
                    END;

                    // to get document no as per sales & recevbles setup




                    insert1 := 0;
                    LineInsert := 0;
                    //   Document_No2 := '' ;
                    Sales_Header.RESET;
                    Sales_HDRInsert.RESET;
                    Sales_HDRModify.RESET;
                    Sales_Header.SETRANGE(Sales_Header."Document Type", Sales_Header."Document Type"::"Credit Memo");
                    Sales_Header.SETRANGE(Sales_Header."Integration Doc No", Document_No);
                    IF NOT Sales_Header.FINDFIRST THEN BEGIN

                        Sales_HDRInsert."Document Type" := Sales_HDRInsert."Document Type"::"Credit Memo";
                        "Sales&RcSetup".GET('');
                        IF "Sales&RcSetup"."Credit Memo Nos." = '' THEN
                            ERROR(' Please enter Credit Memo nos in sales & receivalbe setup');
                        Document_No2 := NoSeriesMgmt.GetNextNo("Sales&RcSetup"."Credit Memo Nos.", WORKDATE, TRUE);
                        Sales_HDRInsert."No." := Document_No2;
                        Sales_HDRInsert."Integration Doc No" := Document_No;
                        Sales_HDRInsert.INSERT;
                        insert1 := 1;
                    END;
                    //modify

                    IF insert1 = 1 THEN BEGIN
                        Sales_HDRModify.RESET;
                        Sales_HDRModify.SETRANGE(Sales_HDRModify."Document Type", Sales_HDRInsert."Document Type"::"Credit Memo");
                        Sales_HDRModify.SETRANGE(Sales_HDRModify."Integration Doc No", Document_No);
                        IF Sales_HDRModify.FINDFIRST THEN BEGIN

                            // Posting Date for Sales Header
                            EVALUATE(Evaluted_Posting_Date, Posting_Date);
                            Sales_HDRModify."Posting Date" := Evaluted_Posting_Date;
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Posting Date", Evaluted_Posting_Date);

                            //doc date
                            EVALUATE(Evaluted_Document_Date, Document_Date);
                            Sales_HDRModify."Document Date" := Evaluted_Document_Date;
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Document Date", Evaluted_Document_Date);

                            //Credit Memo date
                            EVALUATE(Evaluted_OrderDate, Order_Date);
                            Sales_HDRModify."Order Date" := Evaluted_OrderDate;
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Order Date", Evaluted_OrderDate);

                            EVALUATE(Evaluted_Sell_To_Customer_No, Sell_To_Customer_No);
                            Sales_HDRModify."Sell-to Customer No." := Evaluted_Sell_To_Customer_No;
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Sell-to Customer No.", Evaluted_Sell_To_Customer_No);

                            EVALUATE(Evaluated_Structure, Structure);
                            //    Sales_HDRModify.Structure :=Evaluated_Structure;//Rushab
                            //    Sales_HDRModify.VALIDATE(Sales_HDRModify.Structure,Evaluated_Structure);//Rushab

                            EVALUATE(Evaluated_Ext_Doc_No, External_Doc_No);
                            Sales_HDRModify."External Document No." := Evaluated_Ext_Doc_No;
                            Sales_HDRModify.VALIDATE(Sales_HDRModify."External Document No.", Evaluated_Ext_Doc_No);

                            Document_No2 := Sales_HDRModify."No.";

                            IF COPYSTR(Item_No, 1, 4) = 'AUTO' THEN
                                IF Vehicle_Regn_No <> '' THEN
                                    Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code", '110000');


                            IF COPYSTR(Item_No, 1, 3) = 'TRV' THEN
                                IF PolicyNo_OEMInv_RefNo <> '' THEN
                                    Sales_HDRModify.VALIDATE(Sales_HDRModify."Shortcut Dimension 2 Code", '210000');

                            Sales_HDRModify.VALIDATE(Sales_HDRModify."Location Code", Location_Code);
                            Sales_HDRModify.MODIFY;

                        END;
                    END;

                    // sales line insert

                    EVALUATE(Evaluated_Line_No, Line_No); // changed line no to doc line no

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
                        RecSalesLine."Integration Doc No" := Document_No;
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
                            IF Type = 'ITEM' THEN
                                RecSalesLine.Type := 2;
                            RecSalesLine.VALIDATE(RecSalesLine.Type, 2);

                            EVALUATE("Evaluated_Item_no.", Item_No);
                            RecSalesLine."No." := "Evaluated_Item_no.";
                            RecSalesLine.VALIDATE(RecSalesLine."No.", "Evaluated_Item_no.");

                            RecSalesLine."Line No." := Evaluated_Line_No;
                            RecSalesLine.VALIDATE(RecSalesLine."Line No.", Evaluated_Line_No);

                            EVALUATE(Evaluted_Sell_To_Customer_No, Sell_To_Customer_No);
                            RecSalesLine."Sell-to Customer No." := Evaluted_Sell_To_Customer_No;
                            RecSalesLine.VALIDATE(RecSalesLine."Sell-to Customer No.", Evaluted_Sell_To_Customer_No);

                            EVALUATE(Evaluted_Location_Code, Location_Code);
                            RecSalesLine."Location Code" := Evaluted_Location_Code;
                            RecSalesLine.VALIDATE(RecSalesLine."Location Code", Evaluted_Location_Code);

                            EVALUATE(Evaluted_Quatity, Quantity);
                            RecSalesLine.Quantity := Evaluted_Quatity;
                            RecSalesLine.VALIDATE(RecSalesLine."Line Discount Amount", Evaluted_Quatity);


                            EVALUATE(Evaluted_Unit_Of_Measure_Code, UOM_Code);
                            RecSalesLine."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                            RecSalesLine.VALIDATE(RecSalesLine."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);

                            EVALUATE(Evaluated_Service_Tax_Group, Service_Tax_Group);
                            //  RecSalesLine."Service Tax Group":=Evaluated_Service_Tax_Group;//Rushab
                            //  RecSalesLine.VALIDATE(RecSalesLine."Service Tax Group",Evaluated_Service_Tax_Group);//Rushab

                            IF COPYSTR(Item_No, 1, 4) = 'AUTO' THEN
                                IF Vehicle_Regn_No <> '' THEN
                                    RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 2 Code", '110000');

                            IF COPYSTR(Item_No, 1, 3) = 'TRV' THEN
                                IF PolicyNo_OEMInv_RefNo <> '' THEN
                                    RecSalesLine.VALIDATE(RecSalesLine."Shortcut Dimension 2 Code", '210000');



                            EVALUATE(Evaluated_Unit_Price, Unit_Price);
                            RecSalesLine."Unit Price" := Evaluated_Unit_Price;
                            RecSalesLine.VALIDATE(RecSalesLine."Unit Price", Evaluated_Unit_Price);

                            RecSalesLine."Integration Doc No" := Document_No;

                            RecSalesLine.MODIFY;
                        END;

                    END;
                    // Documentwise service master insert

                    EVALUATE(Evaluated_Doc_No, Document_No);
                    "Documentwise Service Master"."Integration doc No" := Evaluated_Doc_No;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Integration doc No", Evaluated_Doc_No);

                    "Documentwise Service Master"."Document No." := Document_No2;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Document No.", Document_No2);

                    EVALUATE(Evaluated_PolicyNo_OEMInv_RefNo, PolicyNo_OEMInv_RefNo);
                    "Documentwise Service Master"."Policy No/OEM Inv/Ref No" := Evaluated_PolicyNo_OEMInv_RefNo;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Policy No/OEM Inv/Ref No", Evaluated_PolicyNo_OEMInv_RefNo);

                    EVALUATE(Evaluated_Year_of_MFG, Year_of_MFG);
                    "Documentwise Service Master"."Year of MFG" := Evaluated_Year_of_MFG;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Year of MFG", Evaluated_Year_of_MFG);

                    EVALUATE(Evaluated_Vehicle_Regn_No, Vehicle_Regn_No);
                    "Documentwise Service Master"."Vehicle Regn No" := Evaluated_Vehicle_Regn_No;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Vehicle Regn No", Evaluated_Vehicle_Regn_No);

                    EVALUATE(Evaluated_Customer_Name, Customer_Name);
                    "Documentwise Service Master"."Customer Name" := Evaluated_Customer_Name;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Customer Name", Evaluated_Customer_Name);

                    EVALUATE(Evaluated_Customer_Contact_No, Customer_Contact_No);
                    "Documentwise Service Master"."Customer Contact No" := Evaluated_Customer_Contact_No;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Customer Contact No", Evaluated_Customer_Contact_No);

                    EVALUATE(Evaluated_Policy_Coverage_Start_Date, Policy_Coverage_Start_Date);
                    "Documentwise Service Master"."Policy / Coverage Start Date" := Evaluated_Policy_Coverage_Start_Date;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Policy / Coverage Start Date", Evaluated_Policy_Coverage_Start_Date);

                    IF Evaluated_Policy_Coverage_Start_Date = 0D THEN
                        ERROR('Please provide Policy Coverage Start Date for Policy No. %1', Evaluated_PolicyNo_OEMInv_RefNo);

                    EVALUATE(Evaluated_Policy_Coverage_End_Date, Policy_Coverage_End_Date);
                    "Documentwise Service Master"."Policy / Coverage End Date" := Evaluated_Policy_Coverage_End_Date;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Policy / Coverage End Date", Evaluated_Policy_Coverage_End_Date);

                    IF Evaluated_Policy_Coverage_End_Date = 0D THEN
                        ERROR('Please provide Policy Coverage End Date for Policy No. %1', Evaluated_PolicyNo_OEMInv_RefNo);

                    EVALUATE(Evaluated_City, City);
                    "Documentwise Service Master".City := Evaluated_City;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master".City, Evaluated_City);

                    EVALUATE(Evaluated_State, State);
                    "Documentwise Service Master".State := Evaluated_State;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master".State, Evaluated_State);

                    EVALUATE(Evaluated_Region, Region);
                    "Documentwise Service Master".Region := Evaluated_Region;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master".Region, Evaluated_Region);

                    EVALUATE(Evaluated_Destination_Country, Destination_Country);
                    "Documentwise Service Master"."Destination Country" := Evaluated_Destination_Country;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Destination Country", Evaluated_Destination_Country);

                    EVALUATE(Evaluated_Destination_Region, Destination_Region);
                    "Documentwise Service Master"."Destination Region" := Evaluated_Destination_Region;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Destination Region", Evaluated_Destination_Region);

                    EVALUATE(Evaluated_Vehicle_Identification_No, Vehicle_Identification_No);
                    "Documentwise Service Master"."Vehicle Identification No" := Evaluated_Vehicle_Identification_No;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Vehicle Identification No", Evaluated_Vehicle_Identification_No);

                    "Documentwise Service Master"."Document Line No." := Evaluated_Line_No;
                    "Documentwise Service Master".VALIDATE("Documentwise Service Master"."Line No.", Evaluated_Line_No);
                    "Documentwise Service Master"."Dimension code" := 'SERVICE IDENTIFIER';
                    "Documentwise Service Master"."Dimension Value Code" := Evaluated_Dim2;

                    IF ((Evaluated_Vehicle_Regn_No = '') AND (Evaluated_Vehicle_Identification_No = '')) THEN
                        ERROR('Please provide Vehicle Registration No OR Vehicle Identification No For Policy No. %1', Evaluated_PolicyNo_OEMInv_RefNo);

                    // added code to tick cancelled in Servvice Master

                    DocServMaster.RESET;
                    DocServMaster.SETRANGE(DocServMaster."Policy No/OEM Inv/Ref No", Evaluated_PolicyNo_OEMInv_RefNo);
                    DocServMaster.SETRANGE(DocServMaster."Vehicle Regn No", Vehicle_Regn_No);
                    DocServMaster.SETRANGE(DocServMaster."Vehicle Identification No", Vehicle_Identification_No);
                    IF DocServMaster.FINDFIRST THEN BEGIN

                        DocServMaster.Cancelled := TRUE;
                        DocServMaster.MODIFY;

                    END;
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
        MESSAGE('Sales Credit Memo Imported Successfully.');
    end;

    var
        Sales_Header: Record "Sales Header";
        Sales_HDRInsert: Record "Sales Header";
        Sales_HDRModify: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
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
        RecSalesLine: Record "Sales Line";
        RecSalesLine2: Record "Sales Line";
        RecSalesLine3: Record "Sales Line";
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
        Evaluated_Dim2: Code[20];
        DimVal2: Record "Dimension Value";
        DimVal: Record "Dimension Value";
        Document_No2: Code[30];
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        "Sales&RcSetup": Record "Sales & Receivables Setup";
        LineInsert: Integer;
        Evaluated_Vehicle_Identification_No: Code[30];
        DocServMaster: Record "Documentwise Service Master";
}

