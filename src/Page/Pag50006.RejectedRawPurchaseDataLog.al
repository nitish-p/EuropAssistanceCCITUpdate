Page 50006 "Rejected Raw Purchase Data Log"
{
    
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Raw Update Log Purchase";
    SourceTableView = where(Status=const(Rejected));

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
                field(Line_No;rec.Line_No)
                {
                    ApplicationArea = Basic;
                }
                field(Buy_From_Vendor_No;rec.Buy_From_Vendor_No)
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
                field(Direct_Unit_Cost;rec.Direct_Unit_Cost)
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
                field(Structure;rec.Structure)
                {
                    ApplicationArea = Basic;
                }
                field(Service_Tax_Group;rec.Service_Tax_Group)
                {
                    ApplicationArea = Basic;
                }
                field(External_Doc_No;rec.External_Doc_No)
                {
                    ApplicationArea = Basic;
                }
                field(TDS_Nature;rec.TDS_Nature)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No";rec."Vehicle Registration No")
                {
                    ApplicationArea = Basic;
                }
                field(PolicyNo_OEMInv_RefNo;rec.PolicyNo_OEMInv_RefNo)
                {
                    ApplicationArea = Basic;
                }
                field("NAV Customer";rec."NAV Customer")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Customer Name";rec."NAV Customer Name")
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
                field(Varaint_Code;rec.Varaint_Code)
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

