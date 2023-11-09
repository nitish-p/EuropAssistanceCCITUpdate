page 50099 "Transaction API Edit"
{
    ApplicationArea = All;
    Caption = 'Transaction API Edit';
    PageType = List;
    SourceTable = "Transaction API";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("CASE ID"; Rec."CASE ID")
                {
                    ToolTip = 'Specifies the value of the CASE ID field.';
                }
                field("Vendor Code"; Rec."Vendor Code")
                {
                    ToolTip = 'Specifies the value of the Vendor Code field.';
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    ToolTip = 'Specifies the value of the Transaction No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Item Code"; Rec."Item Code")
                {
                    ToolTip = 'Specifies the value of the Item Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("UOM Code"; Rec."UOM Code")
                {
                    ToolTip = 'Specifies the value of the UOM Code field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Structure; Rec.Structure)
                {
                    ToolTip = 'Specifies the value of the Structure field.';
                }
                field("TDS Nature Of Deduction"; Rec."TDS Nature Of Deduction")
                {
                    ToolTip = 'Specifies the value of the TDS Nature Of Deduction field.';
                }
                field("Vehicle Registration No"; Rec."Vehicle Registration No")
                {
                    ToolTip = 'Specifies the value of the Vehicle Registration No field.';
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ToolTip = 'Specifies the value of the Policy No. field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Case No."; Rec."Case No.")
                {
                    ToolTip = 'Specifies the value of the Case No. field.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Vendor Invoice No. field.';
                }
                field("Vehicle Identification No."; Rec."Vehicle Identification No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle Identification No. field.';
                }
                field("Service ID"; Rec."Service ID")
                {
                    ToolTip = 'Specifies the value of the Service ID field.';
                }
                field("Service Date"; Rec."Service Date")
                {
                    ToolTip = 'Specifies the value of the Service Date field.';
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                    ToolTip = 'Specifies the value of the Invoice Date field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Business Line Code"; Rec."Business Line Code")
                {
                    ToolTip = 'Specifies the value of the Business Line Code field.';
                }
                field("Client Name Code"; Rec."Client Name Code")
                {
                    ToolTip = 'Specifies the value of the Client Name Code field.';
                }
                field(Narration; Rec.Narration)
                {
                    ToolTip = 'Specifies the value of the Narration field.';
                }
                field("Payment Due Date"; Rec."Payment Due Date")
                {
                    ToolTip = 'Specifies the value of the Payment Due Date field.';
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                    ToolTip = 'Specifies the value of the Invoice Type field.';
                }
                field(Response; Rec.Response)
                {
                    ToolTip = 'Specifies the value of the Response field.';
                }
                field(Validated; Rec.Validated)
                {
                    ToolTip = 'Specifies the value of the Validated field.';
                }
                field("Vendor Created"; Rec."Vendor Created")
                {
                    ToolTip = 'Specifies the value of the Vendor Created field.';
                }
                field("Invoice Posted"; Rec."Invoice Posted")
                {
                    ToolTip = 'Specifies the value of the Invoice Posted field.';
                }
                field(Applied; Rec.Applied)
                {
                    ToolTip = 'Specifies the value of the Applied field.';
                }
                field("Applied On"; Rec."Applied On")
                {
                    ToolTip = 'Specifies the value of the Applied On field.';
                }
                field("Applied By Doc No"; Rec."Applied By Doc No")
                {
                    ToolTip = 'Specifies the value of the Applied By Doc No field.';
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ToolTip = 'Specifies the value of the Posted Invoice No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Nav Vendor Code"; Rec."Nav Vendor Code")
                {
                    ToolTip = 'Specifies the value of the Nav Vendor Code field.';
                }
                field(Flag; Rec.Flag)
                {
                    ToolTip = 'Specifies the value of the Flag field.';
                }
                field("Bank Payment Amount"; Rec."Bank Payment Amount")
                {
                    ToolTip = 'Specifies the value of the Bank Payment Amount field.';
                }
                field("Custom Field 1"; Rec."Custom Field 1")
                {
                    ToolTip = 'Specifies the value of the Custom Field 1 field.';
                }
                field("Custom Field 2"; Rec."Custom Field 2")
                {
                    ToolTip = 'Specifies the value of the Custom Field 2 field.';
                }
                field("Custom Field 3"; Rec."Custom Field 3")
                {
                    ToolTip = 'Specifies the value of the Custom Field 3 field.';
                }
                field("Custom Field 4"; Rec."Custom Field 4")
                {
                    ToolTip = 'Specifies the value of the Custom Field 4 field.';
                }
                field("Custom Field 5"; Rec."Custom Field 5")
                {
                    ToolTip = 'Specifies the value of the Custom Field 5 field.';
                }
                field(Final; Rec.Final)
                {
                    ToolTip = 'Specifies the value of the Final field.';
                }
                field("TDS Amount"; Rec."TDS Amount")
                {
                    ToolTip = 'Specifies the value of the TDS Amount field.';
                }
                field("GST Amount"; Rec."GST Amount")
                {
                    ToolTip = 'Specifies the value of the GST Amount field.';
                }
                field("Invoice Amount"; Rec."Invoice Amount")
                {
                    ToolTip = 'Specifies the value of the Invoice Amount field.';
                }
                field("GST Percentage"; Rec."GST Percentage")
                {
                    ToolTip = 'Specifies the value of the GST Percentage field.';
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ToolTip = 'Specifies the value of the Payment Date field.';
                }
                field("Vendor Bank Account Name"; Rec."Vendor Bank Account Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Bank Account Name field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("IFSC Code"; Rec."IFSC Code")
                {
                    ToolTip = 'Specifies the value of the IFSC Code field.';
                }
                field(Process; Rec.Process)
                {
                    ToolTip = 'Specifies the value of the Process field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field("UTR No"; Rec."UTR No")
                {
                    ToolTip = 'Specifies the value of the UTR No field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("Payment Status Code"; Rec."Payment Status Code")
                {
                    ToolTip = 'Specifies the value of the Payment Status Code field.';
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ToolTip = 'Specifies the value of the Payment Status field.';
                }
                field("Preposted Invoice No"; Rec."Preposted Invoice No")
                {
                    ToolTip = 'Specifies the value of the Preposted Invoice No field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Sent To Middleware"; Rec."Sent To Middleware")
                {
                    ToolTip = 'Specifies the value of the Sent To Middleware field.';
                }
                field("Discount Received"; Rec."Discount Received")
                {
                    ToolTip = 'Specifies the value of the Discount Received field.';
                }
                field(DRSA; Rec.DRSA)
                {
                    ToolTip = 'Specifies the value of the DRSA field.';
                }
                field(SLA; Rec.SLA)
                {
                    ToolTip = 'Specifies the value of the SLA field.';
                }
                field(CSAT; Rec.CSAT)
                {
                    ToolTip = 'Specifies the value of the CSAT field.';
                }
                field("Hydra Charges"; Rec."Hydra Charges")
                {
                    ToolTip = 'Specifies the value of the Hydra Charges field.';
                }
                field("Toll Charges"; Rec."Toll Charges")
                {
                    ToolTip = 'Specifies the value of the Toll Charges field.';
                }
                field("Waiting Charges"; Rec."Waiting Charges")
                {
                    ToolTip = 'Specifies the value of the Waiting Charges field.';
                }
                field("Border Charges"; Rec."Border Charges")
                {
                    ToolTip = 'Specifies the value of the Border Charges field.';
                }
                field("Other Charges"; Rec."Other Charges")
                {
                    ToolTip = 'Specifies the value of the Other Charges field.';
                }
                field(PostingNoSeries; Rec.PostingNoSeries)
                {
                    ToolTip = 'Specifies the value of the PostingNoSeries field.';
                }
                field(PostingNo; Rec.PostingNo)
                {
                    ToolTip = 'Specifies the value of the PostingNo field.';
                }
                field(Rebate; Rec.Rebate)
                {
                    ToolTip = 'Specifies the value of the Rebate field.';
                }
            }
        }
    }
}
