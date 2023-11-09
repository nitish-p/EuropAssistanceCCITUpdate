Page 50037 "E-Invoice Error Log"
{
    Editable = false;
    PageType = List;
    Permissions = TableData "Sales Invoice Header" = rimd;
    SourceTable = "E-Invoice Error Log";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Case Id"; Rec."Case Id")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Sales Inv/Cr Memo No."; Rec."Sales Inv/Cr Memo No.")
                {
                    ApplicationArea = Basic;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Integration Document No."; Rec."Integration Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Last Updated On"; Rec."Last Updated On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        AuthToken: Text;
        RecCodeunitAPI: Codeunit 50016;
        SalesInvHdr: Record "Sales Invoice Header";
        SalesInvHdr1: Record "Sales Invoice Header";
        RecLocation: Record Location;
        LocationGSTNo: Code[30];
        REcState: Record state;
        UserIDState: Text[100];
        PasswordState: Text[100];
        RecTrashipHdr: Record "Transfer Shipment Header";
        LocationStateCode: Code[20];
        RecTrashipHdr1: Record "Transfer Shipment Header";
}

