XmlPort 50026 "Sales Invoice Export New"
{
    Direction = Export;
    FileName = 'Salesimport.csv';
    Format = VariableText;
    Permissions = TableData "Sales Header"=rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Update log";"Update log")
            {
                XmlName = 'UpdateLog';
                fieldelement(Document_No;"Update log"."Integration Doc No")
                {
                    MinOccurs = Once;
                }
                fieldelement(Sell_To_Customer_No;"Update log".Sell_To_Customer_No)
                {
                }
                fieldelement(Type;"Update log".Type)
                {
                }
                fieldelement(Item_No;"Update log".Item_No)
                {
                }
                fieldelement(Quantity;"Update log".Quantity)
                {
                }
                fieldelement(UOM_Code;"Update log".UOM_Code)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Unit_Price;"Update log".Unit_Price)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Location_Code;"Update log".Location_Code)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Posting_Date;"Update log".Posting_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Document_Date;"Update log".Document_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Order_Date;"Update log".Order_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Structure;"Update log".Structure)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Line_No;"Update log".Line_No)
                {
                    MinOccurs = Zero;
                }
                fieldelement(External_Doc_No;"Update log".External_Doc_No)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Service_Tax_Group;"Update log".Service_Tax_Group)
                {
                    MinOccurs = Zero;
                }
                fieldelement(PolicyNo_OEMInv_RefNo;"Update log".PolicyNo_OEMInv_RefNo)
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(Year_of_MFG;"Update log"."Year Of MFg")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Vehicle_Regn_No;"Update log"."Vehicle Registration No")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Customer_Name;"Update log".Customer_Name)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Customer_Contact_No;"Update log".Customer_Contact_No)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Policy_Coverage_Start_Date;"Update log".Policy_Coverage_Start_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Policy_Coverage_End_Date;"Update log".Policy_Coverage_End_Date)
                {
                    MinOccurs = Zero;
                }
                fieldelement(City;"Update log".City)
                {
                    MinOccurs = Zero;
                }
                fieldelement(State;"Update log".State)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Region;"Update log".Region)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Destination_Country;"Update log"."Destination Country")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Destination_Region;"Update log"."Destination Region")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Vehicle_Identification_No;"Update log"."Vehicle Identification No")
                {
                    FieldValidate = yes;
                    MinOccurs = Zero;
                }
                fieldelement(DeptDim;"Update log"."Department Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BusLineDim;"Update log"."Business Line Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Comments;"Update log".Comments)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Cust_Invoice_No;"Update log"."Customer Invoice No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Posting_No_Series;"Update log"."Posting No. Series")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Ship_To_Code;"Update log"."Ship To Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Particulars;"Update log".Particulars)
                {
                    MinOccurs = Zero;
                }
                fieldelement(EATransactionType;"Update log"."EA Transaction Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ClientLevelCode;"Update log"."Client Level Code")
                {
                }
                fieldelement(EmployeeCode;"Update log"."Employee Code")
                {
                }
                fieldelement(ErrorDescription;"Update log"."Error description")
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
}

