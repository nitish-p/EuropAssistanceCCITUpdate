pageextension 50047 "Purchases & Payables Setup" extends "Purchases & Payables Setup"
{
    // Pallavi 14022017
    // added field "Revenue Series" to front end
    layout
    {
        addafter("Default Qty. to Receive")
        {
            field("Vendor Notification E-Mail ID"; Rec."Vendor Notification E-Mail ID")
            {
                ApplicationArea = All;
            }
            field("Bank Reject E-mail Notific.ID"; Rec."Bank Reject E-mail Notific.ID")
            {
                ApplicationArea = All;
            }
        }
        addbefore("Delivery Challan Nos.")
        {
            // field("Posted Purch. Inv.(Unreg)";Rec."Posted Purch. Inv.(Unreg)")
            // {
            // }
            field("Revenue Series"; Rec."Revenue Series")
            {
                ApplicationArea = All;
            }
            group("IMPS/NEFT Numbering")
            {
                Caption = 'IMPS/NEFT Numbering';
                field("IMPS No series."; Rec."IMPS No series.")
                {
                    ApplicationArea = All;
                }
                field("Cust Ref No series."; Rec."Cust Ref No series.")
                {
                    ApplicationArea = All;
                }
                field("Payment Ref No series."; Rec."Payment Ref No series.")
                {
                    ApplicationArea = All;
                }
                field("payment Inf ID No series"; Rec."payment Inf ID No series")
                {
                    ApplicationArea = All;
                }
                field("NEFT No Series(MsgID)"; Rec."NEFT No Series(MsgID)")
                {
                    ApplicationArea = All;
                }
                field("Cust Ref No series.(NEFT)"; Rec."Cust Ref No series.(NEFT)")
                {
                    ApplicationArea = All;
                }
                field("Payment Ref No series.(NEFT)"; Rec."Payment Ref No series.(NEFT)")
                {
                    ApplicationArea = All;
                }
                field("payment Inf ID No series(NEFT)"; Rec."payment Inf ID No series(NEFT)")
                {
                    ApplicationArea = All;
                }
            }
        }
        addafter("Credit Acc. for Non-Item Lines")
        {
            group("EzAuto SFTP Setup")
            {
                Caption = 'EzAuto SFTP Setup';
                field("EzAuto SFTP Host Name"; Rec."EzAuto SFTP Host Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("EzAuto SFTP Username"; Rec."EzAuto SFTP Username")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("EZAuto SFTP Password"; Rec."EZAuto SFTP Password")
                {
                    Editable = false;
                    ExtendedDatatype = Masked;
                    ApplicationArea = All;
                }
                field("EzAuto Attachment Folder"; Rec."EzAuto Attachment Folder")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Local Attachment Folder"; Rec."Local Attachment Folder")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("EZ Auto Vendor KYC Path"; Rec."EZ Auto Vendor KYC Path")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vendor KYC Attachments Path"; Rec."Vendor KYC Attachments Path")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }
}

