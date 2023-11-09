xmlport 50001 "Rejected Sales Data Export"
{
    // Pallavi 21012017
    // Created xmlport for exporting rejected sales data
    // set file type to export
    // prdp 27012017
    // added field comments to export

    Direction = Export;
    FileName = 'SalesExport.csv';
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
                }
                fieldelement(Particulars; "Raw Update Log".Particulars)
                {
                }
                fieldelement(EATransactionType; "Raw Update Log"."EA Transaction Type")
                {
                }
                fieldelement(ClientLevelCode; "Raw Update Log"."Client Level Code")
                {
                }
                fieldelement(EmployeeCode; "Raw Update Log"."Employee Code")
                {
                }
                fieldelement(DeferralCode; "Raw Update Log"."Deferral Code")
                {
                }
                fieldelement(InvoiceDate; "Raw Update Log"."Invoice Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ErrorDescription; "Raw Update Log"."Error description")
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
        UpdateRawData: Codeunit "Update Bank Response";
}

