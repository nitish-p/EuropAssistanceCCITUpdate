Page 50062 "ITEM LEDG ENTRY PAGE"
{
    PageType = List;
    Permissions = TableData "Item Ledger Entry" = rimd;
    SourceTable = "Item Ledger Entry";
    ApplicationArea = all;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Item No."; rec."Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Type"; rec."Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source No."; rec."Source No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Quantity"; rec."Remaining Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Invoiced Quantity"; rec."Invoiced Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Entry"; rec."Applies-to Entry")
                {
                    ApplicationArea = Basic;
                }
                field(Open; rec.Open)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Positive; rec.Positive)
                {
                    ApplicationArea = Basic;
                }
                field("Source Type"; rec."Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Drop Shipment"; rec."Drop Shipment")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Type"; rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Transport Method"; rec."Transport Method")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry/Exit Point"; rec."Entry/Exit Point")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Area"; rec.Area)
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Specification"; rec."Transaction Specification")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Reserved Quantity"; rec."Reserved Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Line No."; rec."Document Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Order Type"; rec."Order Type")
                {
                    ApplicationArea = Basic;
                }
                field("Order No."; rec."Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Order Line No."; rec."Order Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Assemble to Order"; rec."Assemble to Order")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Purchase"; rec."Job Purchase")
                {
                    ApplicationArea = Basic;
                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. per Unit of Measure"; rec."Qty. per Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Derived from Blanket Order"; rec."Derived from Blanket Order")
                {
                    ApplicationArea = Basic;
                }
                // field("Cross-Reference No."; rec."Cross-Reference No.")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Originally Ordered No."; rec."Originally Ordered No.")
                {
                    ApplicationArea = Basic;
                }
                field("Originally Ordered Var. Code"; rec."Originally Ordered Var. Code")
                {
                    ApplicationArea = Basic;
                }
                field("Out-of-Stock Substitution"; rec."Out-of-Stock Substitution")
                {
                    ApplicationArea = Basic;
                }
                field("Item Category Code"; rec."Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Nonstock; rec.Nonstock)
                {
                    ApplicationArea = Basic;
                }
                field("Purchasing Code"; rec."Purchasing Code")
                {
                    ApplicationArea = Basic;
                }
                // field("Product Group Code";rec."Product Group Code")
                // {
                //     ApplicationArea = Basic;
                // }
                //Naveen
                field("Completely Invoiced"; rec."Completely Invoiced")
                {
                    ApplicationArea = Basic;
                }
                field("Last Invoice Date"; rec."Last Invoice Date")
                {
                    ApplicationArea = Basic;
                }
                field("Applied Entry to Adjust"; rec."Applied Entry to Adjust")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount (Expected)"; rec."Cost Amount (Expected)")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount (Actual)"; rec."Cost Amount (Actual)")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount (Non-Invtbl.)"; rec."Cost Amount (Non-Invtbl.)")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount (Expected) (ACY)"; rec."Cost Amount (Expected) (ACY)")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount (Actual) (ACY)"; rec."Cost Amount (Actual) (ACY)")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount (Non-Invtbl.)(ACY)"; rec."Cost Amount (Non-Invtbl.)(ACY)")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Amount (Expected)"; rec."Purchase Amount (Expected)")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Amount (Actual)"; rec."Purchase Amount (Actual)")
                {
                    ApplicationArea = Basic;
                }
                field("Sales Amount (Expected)"; rec."Sales Amount (Expected)")
                {
                    ApplicationArea = Basic;
                }
                field("Sales Amount (Actual)"; rec."Sales Amount (Actual)")
                {
                    ApplicationArea = Basic;
                }
                field(Correction; rec.Correction)
                {
                    ApplicationArea = Basic;
                }
                field("Shipped Qty. Not Returned"; rec."Shipped Qty. Not Returned")
                {
                    ApplicationArea = Basic;
                }
                field("Prod. Order Comp. Line No."; rec."Prod. Order Comp. Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Lot No."; rec."Lot No.")
                {
                    ApplicationArea = Basic;
                }
                field("Warranty Date"; rec."Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date"; rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Item Tracking"; rec."Item Tracking")
                {
                    ApplicationArea = Basic;
                }
                field("Return Reason Code"; rec."Return Reason Code")
                {
                    ApplicationArea = Basic;
                }
                /* field("DSA Entry No.";rec."DSA Entry No.")
                 {
                     ApplicationArea = Basic;
                 }
                 field("BED %";rec."BED %")
                 {
                     ApplicationArea = Basic;
                 }
                 field("BED Amount";rec."BED Amount")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Other Duties %";"Other Duties %")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Other Duties Amount";rec."Other Duties Amount")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Laboratory Test";rec."Laboratory Test")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Other Usage";rec."Other Usage")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Nature of Disposal";rec."Nature of Disposal")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Type of Disposal";rec."Type of Disposal")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Reason Code";rec."Reason Code")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Captive Consumption";rec."Captive Consumption")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Re-Dispatch";rec."Re-Dispatch")
                 {
                     ApplicationArea = Basic;
                 }
                 field("Assessable Value";rec."Assessable Value")
                 {
                     ApplicationArea = Basic;
                 }*/
                field("Subcon Order No."; rec."Subcon Order No.")
                {
                    ApplicationArea = Basic;
                }
                //Naveen
            }
        }
    }

    actions
    {
    }
}

