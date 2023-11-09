Page 50038 "E-Invoices Entries"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "E-Invoice Ledger Entries";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(IRN; Rec.IRN)
                {
                    ApplicationArea = Basic;
                }
                field("IRN Ack No"; Rec."IRN Ack No")
                {
                    ApplicationArea = Basic;
                }
                field("IRN Ack Date"; Rec."IRN Ack Date")
                {
                    ApplicationArea = Basic;
                }
                field("Qr Code"; Rec.SignbedQRCode)
                {
                    ApplicationArea = Basic;
                    Caption = 'QR Code';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("IRN Cancellation Date"; Rec.CancelIRNDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'IRN Cancellation Date';
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Base Amount"; Rec."Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("GST Amount"; Rec."GST Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Invoice Amount"; Rec."Total Invoice Amount")
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

