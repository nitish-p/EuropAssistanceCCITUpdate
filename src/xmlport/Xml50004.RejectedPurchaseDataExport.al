xmlport 50004 "Rejected Purchase Data Export"
{
    // Pallavi 24012017
    // created xmlport for exporting rejected  purhcase data from update log
    // set export property to no
    // prdp 14062017
    // added two new columns Dept Dim & BusLineDim
    // prdp 21122017
    // added two new columns Service date & Service ID

    Direction = Export;
    FileName = 'PurchaseExport.csv';
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
                }
                fieldelement(Invoice_No; "Raw Update Log Purchase"."Invoice No.")
                {
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
                fieldelement(VariantCode; "Raw Update Log Purchase".Varaint_Code)
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
                }
                fieldelement(VIN_No; "Raw Update Log Purchase"."Vehicle Identification No.")
                {
                }
                fieldelement(DeptDim; "Raw Update Log Purchase"."Department Dim")
                {
                }
                fieldelement(BusLineDim; "Raw Update Log Purchase"."Business Line Dim")
                {
                }
                fieldelement(Narration; "Raw Update Log Purchase".Narration)
                {
                }
                fieldelement(ServiceID; "Raw Update Log Purchase"."Service ID")
                {
                }
                fieldelement(ServiceDate; "Raw Update Log Purchase"."Service Date")
                {
                }
                fieldelement(InvoiceDate; "Raw Update Log Purchase"."Invoice date")
                {
                }
                fieldelement(ClientLevelCode; "Raw Update Log Purchase"."Client Level Code")
                {
                }
                fieldelement(EmployeeCode; "Raw Update Log Purchase"."Employee Code")
                {
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
                fieldelement(ErrorDesc; "Raw Update Log Purchase"."Error description")
                {
                }
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

    var
        RowNumber: Integer;
        UpdatePurchaseData: Codeunit "Update Bank Response_1";
}

