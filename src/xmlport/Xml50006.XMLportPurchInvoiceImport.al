xmlport 50006 "XMLport_Purch_Invoice _Import"
{
    // Pallavi 16012017
    // OPTIMIZED XMLPORT FOR purhcase invoice`
    // Pallavi18012017
    // commented code for direct unit cost
    // prdp 300317
    // latest chnages

    Direction = Import;
    FileName = 'Salesimport.csv';
    Format = VariableText;
    Permissions = TableData 36 = rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Documentwise Service Master"; "Documentwise Service Master")
            {
                XmlName = 'DocServiceMaster';
                textelement(document_no)
                {
                    XmlName = 'Document_No';
                }
                textelement(Line_No)
                {
                }
                textelement(Buy_From_Vendor_No)
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
                textelement(Direct_Unit_Cost)
                {
                }
                textelement(Posting_Date)
                {
                }
                textelement(Document_Date)
                {
                }
                textelement(Structure)
                {
                    MinOccurs = Zero;
                }
                textelement(Service_Tax_Group)
                {
                    MinOccurs = Zero;
                }
                textelement(TDS_Nature)
                {
                    MinOccurs = Zero;
                }
                textelement(Vehicle_Regn_No)
                {
                    MinOccurs = Zero;
                }
                textelement(Policy_No)
                {
                }

                trigger OnBeforeInsertRecord()
                begin


                    insert1 := 0;
                    Purch_Header.RESET;
                    Purch_HDRInsert.RESET;
                    Purch_HDRModify.RESET;
                    Purch_Header.SETRANGE(Purch_Header."Document Type", Purch_Header."Document Type"::Invoice);
                    Purch_Header.SETRANGE(Purch_Header."Integration Doc No", Document_No);
                    IF NOT Purch_Header.FINDFIRST THEN BEGIN
                        Purch_HDRInsert."Document Type" := Purch_HDRInsert."Document Type"::Invoice;
                        PurchpayablesSetup.GET('');
                        IF PurchpayablesSetup."Invoice Nos." = '' THEN
                            ERROR(' Please enter invoice nos in Purchase & Payables setup');
                        Document_No2 := NoSeriesManagement.GetNextNo(PurchpayablesSetup."Invoice Nos.", WORKDATE, TRUE);
                        Purch_HDRInsert."No." := Document_No2;
                        Purch_HDRInsert."Integration Doc No" := Document_No;
                        Purch_HDRInsert.INSERT;
                        insert1 := 1;
                    END;


                    //modify



                    IF insert1 = 1 THEN BEGIN

                        Purch_HDRModify.RESET;
                        Purch_HDRModify.SETRANGE(Purch_HDRModify."Document Type", Purch_HDRInsert."Document Type"::Invoice);
                        Purch_HDRModify.SETRANGE(Purch_HDRModify."Integration Doc No", Document_No);
                        IF Purch_HDRModify.FINDFIRST THEN BEGIN

                            // Posting Date for Purch Header
                            EVALUATE(Evaluted_Posting_Date, Posting_Date);
                            Purch_HDRModify."Posting Date" := Evaluted_Posting_Date;
                            Purch_HDRModify.VALIDATE(Purch_HDRModify."Posting Date", Evaluted_Posting_Date);

                            //doc date
                            EVALUATE(Evaluted_Document_Date, Document_Date);
                            Purch_HDRModify."Document Date" := Evaluted_Document_Date;
                            Purch_HDRModify.VALIDATE(Purch_HDRModify."Document Date", Evaluted_Document_Date);

                            EVALUATE(Evaluted_Buy_From_Vendor_No, Buy_From_Vendor_No);
                            Purch_HDRModify."Buy-from Vendor No." := Evaluted_Buy_From_Vendor_No;
                            Purch_HDRModify.VALIDATE(Purch_HDRModify."Buy-from Vendor No.", Evaluted_Buy_From_Vendor_No);

                            EVALUATE(Evaluated_Structure, Structure);
                            // Purch_HDRModify.Structure := Evaluated_Structure;//RUSHAB
                            // Purch_HDRModify.VALIDATE(Purch_HDRModify.Structure, Evaluated_Structure);//RUSHAB

                            EVALUATE(Evaluated_Dim2, Vehicle_Regn_No);

                            IF Vehicle_Regn_No <> '' THEN BEGIN
                                Purch_HDRModify.VALIDATE(Purch_HDRModify."Shortcut Dimension 2 Code", '110000');
                            END;

                            Purch_HDRModify.MODIFY;

                        END;
                    END;

                    // Purch line insert
                    Lineinsert := 0;

                    EVALUATE(Evaluated_Line_No, Line_No);



                    "Purchase Line".RESET;
                    "Purchase Line".SETRANGE("Purchase Line"."Integration Doc No", Document_No);
                    "Purchase Line".SETRANGE("Purchase Line"."Line No.", Evaluated_Line_No);
                    IF NOT "Purchase Line".FINDFIRST THEN BEGIN

                        "Purchase Line"."Document Type" := "Purchase Line"."Document Type"::Invoice;
                        "Purchase Line"."Integration Doc No" := Document_No;
                        "Purchase Line"."Document No." := Document_No2;
                        "Purchase Line"."Line No." := Evaluated_Line_No;
                        "Purchase Line".INSERT;
                        Lineinsert := 1;
                    END;

                    IF Lineinsert = 1 THEN BEGIN
                        "Purchase Line".RESET;
                        "Purchase Line".SETRANGE("Purchase Line"."Integration Doc No", Document_No);
                        "Purchase Line".SETRANGE("Purchase Line"."Line No.", Evaluated_Line_No);
                        IF "Purchase Line".FINDFIRST THEN BEGIN

                            "Purchase Line"."Document Type" := "Purchase Line"."Document Type"::Invoice;
                            "Purchase Line"."Integration Doc No" := Document_No;
                            "Purchase Line"."Document No." := Document_No2;
                            "Purchase Line".VALIDATE("Purchase Line"."Line No.", Evaluated_Line_No);

                            EVALUATE(Evaluted_Buy_From_Vendor_No, Buy_From_Vendor_No);
                            "Purchase Line"."Buy-from Vendor No." := Evaluted_Buy_From_Vendor_No;
                            "Purchase Line".VALIDATE("Purchase Line"."Buy-from Vendor No.", Evaluted_Buy_From_Vendor_No);

                            IF Type = 'ITEM' THEN
                                "Purchase Line".Type := 2;
                            "Purchase Line".VALIDATE("Purchase Line".Type, 2);

                            EVALUATE("Evaluated_Item_no.", Item_No);
                            "Purchase Line"."No." := "Evaluated_Item_no.";
                            "Purchase Line".VALIDATE("Purchase Line"."No.", "Evaluated_Item_no.");

                            EVALUATE(Evaluted_Unit_Of_Measure_Code, UOM_Code);
                            "Purchase Line"."Unit of Measure Code" := Evaluted_Unit_Of_Measure_Code;
                            "Purchase Line".VALIDATE("Purchase Line"."Unit of Measure Code", Evaluted_Unit_Of_Measure_Code);

                            EVALUATE(Evaluted_Quatity, Quantity);
                            "Purchase Line".Quantity := Evaluted_Quatity;
                            "Purchase Line".VALIDATE("Purchase Line".Quantity, Evaluted_Quatity);

                            EVALUATE(Evaluated_Service_Tax_Group, Service_Tax_Group);
                            // "Purchase Line"."Service Tax Group" := Evaluated_Service_Tax_Group;//RUSHAB
                            //"Purchase Line".VALIDATE("Purchase Line"."Service Tax Group", Evaluated_Service_Tax_Group);//RUSHAB


                            EVALUATE(Evaluated_TDS_Nature, TDS_Nature);
                            // "Purchase Line"."TDS Nature of Deduction" := Evaluated_TDS_Nature;//RUSHAB
                            //"Purchase Line".VALIDATE("Purchase Line"."TDS Nature of Deduction", Evaluated_TDS_Nature);//RUSHAB

                            EVALUATE(Evaluated_Policy_No, Policy_No);

                            IF Vehicle_Regn_No <> '' THEN
                                "Purchase Line".VALIDATE("Purchase Line"."Shortcut Dimension 2 Code", '110000');


                            // EVALUATE(Evaluated_Direct_Unit_Cost,Direct_Unit_Cost);
                            // "Purchase Line"."Direct Unit Cost":=Evaluated_Direct_Unit_Cost;
                            //  "Purchase Line".VALIDATE("Purchase Line"."Direct Unit Cost",Evaluated_Direct_Unit_Cost);
                            "Purchase Line".MODIFY;
                        END;

                    END; // line inser end


                    "Documentwise Service Master"."Integration doc No" := Document_No;
                    "Documentwise Service Master"."Document No." := Document_No2;
                    "Documentwise Service Master"."Document Line No." := Evaluated_Line_No;
                    "Documentwise Service Master"."Dimension code" := 'SERVICE IDENTIFIER';
                    "Documentwise Service Master"."Dimension Value Code" := Vehicle_Regn_No;
                    "Documentwise Service Master"."Policy No/OEM Inv/Ref No" := Policy_No;
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
        MESSAGE('Purchase Invoice Imported Successfully.');
    end;

    var
        Purch_Header: Record "Purchase Header";
        Purch_HDRInsert: Record "Purchase Header";
        Purch_HDRModify: Record "Purchase Header";
        RecPurchaseLine: Record "Purchase Line";
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
        Evaluted_Buy_From_Vendor_No: Code[20];
        Evaluted_Buy_From_Vendor_Name: Text;
        Evaluted_Posting_Date: Date;
        Evaluted_Document_Date: Date;
        Evaluted_OrderDate: Date;
        insert1: Integer;
        Customer: Record Customer;
        "Evaluated_Posting_No.Series": Code[10];
        "Evaluated_Shipping_No.Series": Code[10];
        Evaluated_Direct_Unit_Cost: Decimal;
        Evaluated_Structure: Code[20];
        RecPurchLine: Record "Purchase Line";
        Evaluated_Ext_Doc_No: Code[30];
        Evaluated_Service_Tax_Group: Code[10];
        Evaluated_PolicyNo_OEMInv_RefNo: Code[10];
        Evaluated_Year_of_MFG: Date;
        Evaluated_Vehicle_Regn_No: Code[30];
        Evaluated_Customer_Name: Code[100];
        Evaluated_Customer_Contact_No: Code[20];
        Evaluated_Policy_Coverage_Start_Date: Date;
        Evaluated_Policy_Coverage_End_Date: Date;
        Evaluated_City: Code[10];
        Evaluated_State: Code[20];
        Evaluated_Region: Code[10];
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
        Evaluated_TDS_Nature: Code[20];
        Evaluated_Policy_No: Code[30];
        Document_No2: Code[30];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchpayablesSetup: Record "Purchases & Payables Setup";
        "Purchase Line": Record "Purchase Line";
        Lineinsert: Integer;
}

