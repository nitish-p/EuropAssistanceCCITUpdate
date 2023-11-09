Page 50054 "Purch Header"
{
    PageType = List;
    Permissions = TableData "Purchase Header"=rimd;
    SourceTable = "Purchase Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor No.";rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("No.";rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Vendor No.";rec."Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Name";rec."Pay-to Name")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Name 2";rec."Pay-to Name 2")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Address";rec."Pay-to Address")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Address 2";rec."Pay-to Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to City";rec."Pay-to City")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Contact";rec."Pay-to Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Your Reference";rec."Your Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Code";rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Name";rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Name 2";rec."Ship-to Name 2")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Address";rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Address 2";rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to City";rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Contact";rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Order Date";rec."Order Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Receipt Date";rec."Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Description";rec."Posting Description")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Terms Code";rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Discount %";rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Pmt. Discount Date";rec."Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                }
                field("Shipment Method Code";rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code";rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group";rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Factor";rec."Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field("Prices Including VAT";rec."Prices Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Disc. Code";rec."Invoice Disc. Code")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code";rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code";rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("Order Class";rec."Order Class")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field("No. Printed";rec."No. Printed")
                {
                    ApplicationArea = Basic;
                }
                field("On Hold";rec."On Hold")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Doc. Type";rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Doc. No.";rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bal. Account No.";rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Recalculate Invoice Disc.";rec."Recalculate Invoice Disc.")
                {
                    ApplicationArea = Basic;
                }
                field(Receive;rec.Receive)
                {
                    ApplicationArea = Basic;
                }
                field(Invoice;rec.Invoice)
                {
                    ApplicationArea = Basic;
                }
                field("Print Posted Documents";rec."Print Posted Documents")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including VAT";rec."Amount Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Receiving No.";rec."Receiving No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting No.";rec."Posting No.")
                {
                    ApplicationArea = Basic;
                }
                field("Last Receiving No.";rec."Last Receiving No.")
                {
                    ApplicationArea = Basic;
                }
                field("Last Posting No.";rec."Last Posting No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Order No.";rec."Vendor Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Shipment No.";rec."Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Invoice No.";rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Cr. Memo No.";rec."Vendor Cr. Memo No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Registration No.";rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sell-to Customer No.";rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reason Code";rec."Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group";rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Type";rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transport Method";rec."Transport Method")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Country/Region Code";rec."VAT Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor Name";rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor Name 2";rec."Buy-from Vendor Name 2")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Address";rec."Buy-from Address")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Address 2";rec."Buy-from Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from City";rec."Buy-from City")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Contact";rec."Buy-from Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Post Code";rec."Pay-to Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to County";rec."Pay-to County")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Country/Region Code";rec."Pay-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Post Code";rec."Buy-from Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from County";rec."Buy-from County")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Country/Region Code";rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Post Code";rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to County";rec."Ship-to County")
                {
                    ApplicationArea = Basic;
                }
                field("Ship-to Country/Region Code";rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bal. Account Type";rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Order Address Code";rec."Order Address Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Point";rec."Entry Point")
                {
                    ApplicationArea = Basic;
                }
                field(Correction;rec.Correction)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Area";rec.Area)
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Specification";rec."Transaction Specification")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Method Code";rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Posting No. Series";rec."Posting No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Receiving No. Series";rec."Receiving No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Area Code";rec."Tax Area Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Liable";rec."Tax Liable")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group";rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to ID";rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Base Discount %";rec."VAT Base Discount %")
                {
                    ApplicationArea = Basic;
                }
                field(Status;rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Discount Calculation";rec."Invoice Discount Calculation")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Discount Value";rec."Invoice Discount Value")
                {
                    ApplicationArea = Basic;
                }
                field("Send IC Document";rec."Send IC Document")
                {
                    ApplicationArea = Basic;
                }
                field("IC Status";rec."IC Status")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from IC Partner Code";rec."Buy-from IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to IC Partner Code";rec."Pay-to IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
                field("IC Direction";rec."IC Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment No.";rec."Prepayment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Last Prepayment No.";rec."Last Prepayment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Cr. Memo No.";rec."Prepmt. Cr. Memo No.")
                {
                    ApplicationArea = Basic;
                }
                field("Last Prepmt. Cr. Memo No.";rec."Last Prepmt. Cr. Memo No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment %";rec."Prepayment %")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment No. Series";rec."Prepayment No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Compress Prepayment";rec."Compress Prepayment")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Due Date";rec."Prepayment Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Cr. Memo No. Series";rec."Prepmt. Cr. Memo No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Posting Description";rec."Prepmt. Posting Description")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Pmt. Discount Date";rec."Prepmt. Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Payment Terms Code";rec."Prepmt. Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Payment Discount %";rec."Prepmt. Payment Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Quote No.";rec."Quote No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Queue Status";rec."Job Queue Status")
                {
                    ApplicationArea = Basic;
                }
                field("Job Queue Entry ID";rec."Job Queue Entry ID")
                {
                    ApplicationArea = Basic;
                }
                field("Incoming Document Entry No.";rec."Incoming Document Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Creditor No.";rec."Creditor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference";rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Discount Amount";rec."Invoice Discount Amount")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Archived Versions";rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                }
                field("Doc. No. Occurrence";rec."Doc. No. Occurrence")
                {
                    ApplicationArea = Basic;
                }
                field("Campaign No.";rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Contact No.";rec."Buy-from Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Contact No.";rec."Pay-to Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Completely Received";rec."Completely Received")
                {
                    ApplicationArea = Basic;
                }
                field("Posting from Whse. Ref.";rec."Posting from Whse. Ref.")
                {
                    ApplicationArea = Basic;
                }
                field("Location Filter";rec."Location Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Receipt Date";rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field("Promised Receipt Date";rec."Promised Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Time Calculation";rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                }
                field("Inbound Whse. Handling Time";rec."Inbound Whse. Handling Time")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filter";rec."Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Authorization No.";rec."Vendor Authorization No.")
                {
                    ApplicationArea = Basic;
                }
                field("Return Shipment No.";rec."Return Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Return Shipment No. Series";rec."Return Shipment No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Ship;rec.Ship)
                {
                    ApplicationArea = Basic;
                }
                field("Last Return Shipment No.";rec."Last Return Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned User ID";rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Approvals";rec."Pending Approvals")
                {
                    ApplicationArea = Basic;
                }
               /* field("Assessee Code";Rec."Assessee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Bus. Posting Group";rec."Excise Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Amount to Vendor";rec."Amount to Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Form Code";rec."Form Code")
                {
                    ApplicationArea = Basic;
                }
                field("Form No.";rec."Form No.")
                {
                    ApplicationArea = Basic;
                }
                field("Transit Document";rec."Transit Document")
                {
                    ApplicationArea = Basic;
                }
                field("LC No.";rec."LC No.")
                {
                    ApplicationArea = Basic;
                }
                field(State;rec.State)
                {
                    ApplicationArea = Basic;
                }
                field(Structure;rec.Structure)
                {
                    ApplicationArea = Basic;
                }*/
                field(Subcontracting;rec.Subcontracting)
                {
                    ApplicationArea = Basic;
                }
                field("Subcon. Order No.";rec."Subcon. Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Subcon. Order Line No.";rec."Subcon. Order Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(SubConPostLine;rec.SubConPostLine)
                {
                    ApplicationArea = Basic;
                }
               /* field("Vendor Shipment Date";rec."Vendor Shipment Date")
                {
                    ApplicationArea = Basic;
                }
                field("C Form";rec."C Form")
                {
                    ApplicationArea = Basic;
                }
                field("Consignment Note No.";rec."Consignment Note No.")
                {
                    ApplicationArea = Basic;
                }
                field("Declaration Form (GTA)";rec."Declaration Form (GTA)")
                {
                    ApplicationArea = Basic;
                }
                field("Service Type (Rev. Chrg.)";rec."Service Type (Rev. Chrg.)")
                {
                    ApplicationArea = Basic;
                }
                field("Manufacturer E.C.C. No.";rec."Manufacturer E.C.C. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Manufacturer Name";rec."Manufacturer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Manufacturer Address";rec."Manufacturer Address")
                {
                    ApplicationArea = Basic;
                }*/
                field(Trading;rec.Trading)
                {
                    ApplicationArea = Basic;
                }
                /*field("Transaction No. Serv. Tax";rec."Transaction No. Serv. Tax")
                {
                    ApplicationArea = Basic;
                }
                field(CVD;rec.CVD)
                {
                    ApplicationArea = Basic;
                }
                field("Input Service Distribution";rec."Input Service Distribution")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Rounding Precision";rec."Service Tax Rounding Precision")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Rounding Type";rec."Service Tax Rounding Type")
                {
                    ApplicationArea = Basic;
                }
                field(PoT;rec.PoT)
                {
                    ApplicationArea = Basic;
                }*/
                field("Nature of Supply";rec."Nature of Supply")
                {
                    ApplicationArea = Basic;
                }
                field("Bill of Entry No.";rec."Bill of Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bill of Entry Date";rec."Bill of Entry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bill of Entry Value";rec."Bill of Entry Value")
                {
                    ApplicationArea = Basic;
                }
                field("GST Vendor Type";rec."GST Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Associated Enterprises";rec."Associated Enterprises")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Type";rec."Invoice Type")
                {
                    ApplicationArea = Basic;
                }
               /* field("GST Rounding Precision";rec."GST Rounding Precision")
                {
                    ApplicationArea = Basic;
                }
                field("GST Rounding Type";rec."GST Rounding Type")
                {
                    ApplicationArea = Basic;
                }*/
                //Naveen
                field("Integration Doc No";rec."Integration Doc No")
                {
                    ApplicationArea = Basic;
                }
                field(Department;rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Manual Invoice";rec."Manual Invoice")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Date";rec."Invoice Date")
                {
                    ApplicationArea = Basic;
                }
                field("Integrated Invoice Type";rec."Integrated Invoice Type")
                {
                    ApplicationArea = Basic;
                }
                field("Reference Invoice Number";rec."Reference Invoice Number")
                {
                    ApplicationArea = Basic;
                }
                field("Client Level Code";rec."Client Level Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code";rec."Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(Select;rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Due Date";rec."Payment Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Billing Type";rec."Billing Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purch Cr Recall Doc";rec."Purch Cr Recall Doc")
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

