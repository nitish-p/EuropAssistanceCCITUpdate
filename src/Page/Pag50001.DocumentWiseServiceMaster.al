Page 50001 "Document Wise Service Master"
{
    // Pallavi 15012017
    // created page for service identification master
    // prdp-24012017
    // added style expression property for new fields NAV Customer & NAM Customer Name
    // prdp 27012017
    // 1. added new field comments to front end
    // prdp 02032017
    // deleted extra fields
    // prdp 270417
    // added "Integration doc No" to front end
    // prdp 16062017
    // set styleexp property to 'StyleTxt' for new fields
    ApplicationArea = all;
    UsageCategory = Administration;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Documentwise Service Master";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Document Line No."; rec."Document Line No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Dimension code"; rec."Dimension code")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Dimension Value Code"; rec."Dimension Value Code")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Policy No/OEM Inv/Ref No"; rec."Policy No/OEM Inv/Ref No")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Year of MFG"; rec."Year of MFG")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Vehicle Regn No"; rec."Vehicle Regn No")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Customer Contact No"; rec."Customer Contact No")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Policy / Coverage Start Date"; rec."Policy / Coverage Start Date")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Policy / Coverage End Date"; rec."Policy / Coverage End Date")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(City; rec.City)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(State; rec.State)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(Region; rec.Region)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Policy Type"; rec."Policy Type")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Destination Country"; rec."Destination Country")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Destination Region"; rec."Destination Region")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Vehicle Identification No"; rec."Vehicle Identification No")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("NAV Customer"; rec."NAV Customer")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("NAV Customer Name"; rec."NAV Customer Name")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Purchase Doc No"; rec."Purchase Doc No")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(Cancelled; rec.Cancelled)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field(Comments; rec.Comments)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTxt;
                }
                field("Integration doc No"; rec."Integration doc No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    StyleExpr = StyleTxt;
                }
                field("Case No"; rec."Case No")
                {
                    ApplicationArea = Basic;
                }
                field("Item No"; rec."Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("PI No."; rec."PI No.")
                {
                    ApplicationArea = Basic;
                }
                field("PI Posting Date"; rec."PI Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        StyleTxt := rec.SetStyle;
    end;

    var
        StyleTxt: Text;
}

