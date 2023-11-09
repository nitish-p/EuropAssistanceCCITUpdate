Page 50002 "Uploaded Raw Sales Data Log"
{
    // Pallavi 25012017
    // created list page for uploaded raw sales data log
    // set soucre table view =Status=CONST(Uploaded)
    // set editable proeprty to no
    // set insert allowed to no
    // set delete allowed to no
    // set modify allowed to no

    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Raw Update Log";
    SourceTableView = where(Status=const(Uploaded));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Integration Doc No";rec."Integration Doc No")
                {
                    ApplicationArea = Basic;
                }
                field(Sell_To_Customer_No;rec.Sell_To_Customer_No)
                {
                    ApplicationArea = Basic;
                }
                field(Type;rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Item_No;rec.Item_No)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(UOM_Code;rec.UOM_Code)
                {
                    ApplicationArea = Basic;
                }
                field(Unit_Price;rec.Unit_Price)
                {
                    ApplicationArea = Basic;
                }
                field(Location_Code;rec.Location_Code)
                {
                    ApplicationArea = Basic;
                }
                field(Posting_Date;rec.Posting_Date)
                {
                    ApplicationArea = Basic;
                }
                field(Document_Date;rec.Document_Date)
                {
                    ApplicationArea = Basic;
                }
                field(Order_Date;rec.Order_Date)
                {
                    ApplicationArea = Basic;
                }
                field(Structure;rec.Structure)
                {
                    ApplicationArea = Basic;
                }
                field(Line_No;rec.Line_No)
                {
                    ApplicationArea = Basic;
                }
                field(External_Doc_No;rec.External_Doc_No)
                {
                    ApplicationArea = Basic;
                }
                field(Service_Tax_Group;rec.Service_Tax_Group)
                {
                    ApplicationArea = Basic;
                }
                field(PolicyNo_OEMInv_RefNo;rec.PolicyNo_OEMInv_RefNo)
                {
                    ApplicationArea = Basic;
                }
                field("Year Of MFg";rec."Year Of MFg")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No";rec."Vehicle Registration No")
                {
                    ApplicationArea = Basic;
                }
                field(Customer_Name;rec.Customer_Name)
                {
                    ApplicationArea = Basic;
                }
                field(Customer_Contact_No;rec.Customer_Contact_No)
                {
                    ApplicationArea = Basic;
                }
                field(Policy_Coverage_Start_Date;rec.Policy_Coverage_Start_Date)
                {
                    ApplicationArea = Basic;
                }
                field(Policy_Coverage_End_Date;rec.Policy_Coverage_End_Date)
                {
                    ApplicationArea = Basic;
                }
                field(City;rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(State;rec.State)
                {
                    ApplicationArea = Basic;
                }
                field(Region;rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Destination Country";rec."Destination Country")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Region";rec."Destination Region")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Identification No";rec."Vehicle Identification No")
                {
                    ApplicationArea = Basic;
                }
                field("File name";rec."File name")
                {
                    ApplicationArea = Basic;
                }
                field("Error description";rec."Error description")
                {
                    ApplicationArea = Basic;
                }
                field("Row number";rec."Row number")
                {
                    ApplicationArea = Basic;
                }
                field(Status;rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Imported Date";rec."Imported Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Time";rec."Imported Time")
                {
                    ApplicationArea = Basic;
                }
                field("Imported By";rec."Imported By")
                {
                    ApplicationArea = Basic;
                }
                field(Validated;rec.Validated)
                {
                    ApplicationArea = Basic;
                }
                field(CaseID;rec.CaseID)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

