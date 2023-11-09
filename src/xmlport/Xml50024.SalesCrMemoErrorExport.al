XmlPort 50024 "Sales Cr Memo Error Export"
{
    // PRDP 21012020

    Direction = Export;
    FileName = 'SaleCrMemoErrorExport.csv';
    Format = VariableText;
    Permissions = TableData "Sales Header"=rimd;

    schema
    {
        textelement(Root)
        {
            tableelement("Raw Update Log";"Raw Update Log")
            {
                XmlName = 'UpdateLog';
                fieldelement(Document_No;"Raw Update Log"."Integration Doc No")
                {
                }
                fieldelement(Sell_To_Customer_No;"Raw Update Log".Sell_To_Customer_No)
                {
                }
                fieldelement(Type;"Raw Update Log".Type)
                {
                }
                fieldelement(Item_No;"Raw Update Log".Item_No)
                {
                }
                fieldelement(Quantity;"Raw Update Log".Quantity)
                {
                }
                fieldelement(UOM_Code;"Raw Update Log".UOM_Code)
                {
                }
                fieldelement(Unit_Price;"Raw Update Log".Unit_Price)
                {
                }
                fieldelement(Location_Code;"Raw Update Log".Location_Code)
                {
                }
                fieldelement(Posting_Date;"Raw Update Log".Posting_Date)
                {
                }
                fieldelement(Document_Date;"Raw Update Log".Document_Date)
                {
                }
                fieldelement(Order_Date;"Raw Update Log".Order_Date)
                {
                }
                fieldelement(Structure;"Raw Update Log".Structure)
                {
                }
                fieldelement(Line_No;"Raw Update Log".Line_No)
                {
                }
                fieldelement(External_Doc_No;"Raw Update Log".External_Doc_No)
                {
                }
                fieldelement(Service_Tax_Group;"Raw Update Log".Service_Tax_Group)
                {
                }
                fieldelement(PolicyNo_OEMInv_RefNo;"Raw Update Log".PolicyNo_OEMInv_RefNo)
                {
                }
                fieldelement(Year_of_MFG;"Raw Update Log"."Year Of MFg")
                {
                }
                fieldelement(Vehicle_Regn_No;"Raw Update Log"."Vehicle Registration No")
                {
                }
                fieldelement(Customer_Name;"Raw Update Log".Customer_Name)
                {
                }
                fieldelement(Customer_Contact_No;"Raw Update Log".Customer_Contact_No)
                {
                }
                fieldelement(Policy_Coverage_Start_Date;"Raw Update Log".Policy_Coverage_Start_Date)
                {
                }
                fieldelement(Policy_Coverage_End_Date;"Raw Update Log".Policy_Coverage_End_Date)
                {
                }
                fieldelement(City;"Raw Update Log".City)
                {
                    MinOccurs = Zero;
                }
                fieldelement(State;"Raw Update Log".State)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Region;"Raw Update Log".Region)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Destination_Country;"Raw Update Log"."Destination Country")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Destination_Region;"Raw Update Log"."Destination Region")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Vehicle_Identification_No;"Raw Update Log"."Vehicle Identification No")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Comments;"Raw Update Log".Comments)
                {
                    MinOccurs = Zero;
                }
                fieldelement(DeptDim;"Raw Update Log"."Department Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BusLineDim;"Raw Update Log"."Business Line Dim")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Ship_To_Code;"Raw Update Log"."Ship To Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ReferenceInvNo;"Raw Update Log"."Reference Invoice Number")
                {
                }
                fieldelement(ClientLevelCode;"Raw Update Log"."Client Level Code")
                {
                }
                fieldelement(EmployeeCode;"Raw Update Log"."Employee Code")
                {
                }
                fieldelement(DeferralCode;"Raw Update Log"."Deferral Code")
                {
                }
                fieldelement(InvoiceDate;"Raw Update Log"."Invoice Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(EATransactioType;"Raw Update Log"."EA Transaction Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ErrorDescription;"Raw Update Log"."Error description")
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

