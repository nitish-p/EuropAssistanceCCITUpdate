Page 50055 "Approval Entry"
{
    PageType = List;
    Permissions = TableData "Approval Entry" = rimd;
    SourceTable = "Approval Entry";
    ApplicationArea=all;
    UsageCategory=Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Table ID"; rec."Table ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sequence No."; rec."Sequence No.")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Code"; rec."Approval Code")
                {
                    ApplicationArea = Basic;
                }
                field("Sender ID"; rec."Sender ID")
                {
                    ApplicationArea = Basic;
                }
                field("Salespers./Purch. Code"; rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approver ID"; rec."Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Date-Time Sent for Approval"; rec."Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date-Time Modified"; rec."Last Date-Time Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified By User ID"; rec."Last Modified By User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount (LCY)"; rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Type"; rec."Approval Type")
                {
                    ApplicationArea = Basic;
                }
                field("Limit Type"; rec."Limit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Available Credit Limit (LCY)"; rec."Available Credit Limit (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Approvals"; rec."Pending Approvals")
                {
                    ApplicationArea = Basic;
                }
                field("Record ID to Approve"; rec."Record ID to Approve")
                {
                    ApplicationArea = Basic;
                }
                field("Delegation Date Formula"; rec."Delegation Date Formula")
                {
                    ApplicationArea = Basic;
                }
                field("Number of Approved Requests"; rec."Number of Approved Requests")
                {
                    ApplicationArea = Basic;
                }
                field("Number of Rejected Requests"; rec."Number of Rejected Requests")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Workflow Step Instance ID"; rec."Workflow Step Instance ID")
                {
                    ApplicationArea = Basic;
                }
                field("Related to Change"; rec."Related to Change")
                {
                    ApplicationArea = Basic;
                }
                /* field(Select;rec.Select)
                 {
                     ApplicationArea = Basic;
                 }
                 field("Client Computer Name";rec."Client Computer Name")
                 {
                     ApplicationArea = Basic;
                 }*/
            }
        }
    }

    actions
    {
    }
    var
    err: Page 43;
    
}

