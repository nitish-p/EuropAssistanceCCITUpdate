Page 50050 "Pur Line"
{
    PageType = List;
    Permissions = TableData "Purchase Line"=rimd;
    SourceTable = "Purchase Line";

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
                field("Document No.";rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("No.";rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code";rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group";rec."Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Receipt Date";rec."Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description;rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Description 2";rec."Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Quantity";rec."Outstanding Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Invoice";rec."Qty. to Invoice")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Receive";rec."Qty. to Receive")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Unit Cost";rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)";rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("VAT %";rec."VAT %")
                {
                    ApplicationArea = Basic;
                }
                field("Line Discount %";rec."Line Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Line Discount Amount";rec."Line Discount Amount")
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
                field("Unit Price (LCY)";rec."Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Invoice Disc.";rec."Allow Invoice Disc.")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Weight";rec."Gross Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Net Weight";rec."Net Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Units per Parcel";rec."Units per Parcel")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Volume";rec."Unit Volume")
                {
                    ApplicationArea = Basic;
                }
                field("Appl.-to Item Entry";rec."Appl.-to Item Entry")
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
                field("Job No.";rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Indirect Cost %";rec."Indirect Cost %")
                {
                    ApplicationArea = Basic;
                }
                field("Recalculate Invoice Disc.";rec."Recalculate Invoice Disc.")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount";rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Rcd. Not Invoiced";rec."Qty. Rcd. Not Invoiced")
                {
                    ApplicationArea = Basic;
                }
                field("Amt. Rcd. Not Invoiced";rec."Amt. Rcd. Not Invoiced")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Received";rec."Quantity Received")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Invoiced";rec."Quantity Invoiced")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No.";rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Line No.";rec."Receipt Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Profit %";rec."Profit %")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-to Vendor No.";rec."Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inv. Discount Amount";rec."Inv. Discount Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Item No.";rec."Vendor Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sales Order No.";rec."Sales Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sales Order Line No.";rec."Sales Order Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Drop Shipment";rec."Drop Shipment")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group";rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group";rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Calculation Type";rec."VAT Calculation Type")
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
                field("Attached to Line No.";rec."Attached to Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Point";rec."Entry Point")
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
                field("Tax Area Code";rec."Tax Area Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Liable";rec."Tax Liable")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Group Code";rec."Tax Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Use Tax";rec."Use Tax")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group";rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group";rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount (LCY)";rec."Outstanding Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Amt. Rcd. Not Invoiced (LCY)";rec."Amt. Rcd. Not Invoiced (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Reserved Quantity";rec."Reserved Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Blanket Order No.";rec."Blanket Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Blanket Order Line No.";rec."Blanket Order Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Base Amount";rec."VAT Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost";rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("System-Created Entry";rec."System-Created Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount";rec."Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Difference";rec."VAT Difference")
                {
                    ApplicationArea = Basic;
                }
                field("Inv. Disc. Amount to Invoice";rec."Inv. Disc. Amount to Invoice")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Identifier";rec."VAT Identifier")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Ref. Type";rec."IC Partner Ref. Type")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Reference";rec."IC Partner Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment %";rec."Prepayment %")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Line Amount";rec."Prepmt. Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Amt. Inv.";rec."Prepmt. Amt. Inv.")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Amt. Incl. VAT";rec."Prepmt. Amt. Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Amount";rec."Prepayment Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. VAT Base Amt.";rec."Prepmt. VAT Base Amt.")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment VAT %";rec."Prepayment VAT %")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. VAT Calc. Type";rec."Prepmt. VAT Calc. Type")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment VAT Identifier";rec."Prepayment VAT Identifier")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Tax Area Code";rec."Prepayment Tax Area Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Tax Liable";rec."Prepayment Tax Liable")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Tax Group Code";rec."Prepayment Tax Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt Amt to Deduct";rec."Prepmt Amt to Deduct")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt Amt Deducted";rec."Prepmt Amt Deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Line";rec."Prepayment Line")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Amount Inv. Incl. VAT";rec."Prepmt. Amount Inv. Incl. VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. Amount Inv. (LCY)";rec."Prepmt. Amount Inv. (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Code";rec."IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt. VAT Amount Inv. (LCY)";rec."Prepmt. VAT Amount Inv. (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment VAT Difference";rec."Prepayment VAT Difference")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt VAT Diff. to Deduct";rec."Prepmt VAT Diff. to Deduct")
                {
                    ApplicationArea = Basic;
                }
                field("Prepmt VAT Diff. Deducted";rec."Prepmt VAT Diff. Deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amt. Ex. VAT (LCY)";rec."Outstanding Amt. Ex. VAT (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("A. Rcd. Not Inv. Ex. VAT (LCY)";rec."A. Rcd. Not Inv. Ex. VAT (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Line Type";rec."Job Line Type")
                {
                    ApplicationArea = Basic;
                }
                field("Job Unit Price";rec."Job Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Job Total Price";rec."Job Total Price")
                {
                    ApplicationArea = Basic;
                }
                field("Job Line Amount";rec."Job Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Job Line Discount Amount";rec."Job Line Discount Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Job Line Discount %";rec."Job Line Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Job Unit Price (LCY)";rec."Job Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Job Total Price (LCY)";rec."Job Total Price (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Job Line Amount (LCY)";rec."Job Line Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Job Line Disc. Amount (LCY)";rec."Job Line Disc. Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Job Currency Factor";rec."Job Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field("Job Currency Code";rec."Job Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Job Planning Line No.";rec."Job Planning Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Remaining Qty.";rec."Job Remaining Qty.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Remaining Qty. (Base)";rec."Job Remaining Qty. (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Deferral Code";rec."Deferral Code")
                {
                    ApplicationArea = Basic;
                }
                field("Returns Deferral Start Date";rec."Returns Deferral Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prod. Order No.";rec."Prod. Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Variant Code";rec."Variant Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bin Code";rec."Bin Code")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. per Unit of Measure";rec."Qty. per Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity (Base)";rec."Quantity (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Qty. (Base)";rec."Outstanding Qty. (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Invoice (Base)";rec."Qty. to Invoice (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Receive (Base)";rec."Qty. to Receive (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Rcd. Not Invoiced (Base)";rec."Qty. Rcd. Not Invoiced (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Received (Base)";rec."Qty. Received (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Invoiced (Base)";rec."Qty. Invoiced (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Reserved Qty. (Base)";rec."Reserved Qty. (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("FA Posting Date";rec."FA Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("FA Posting Type";rec."FA Posting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Depreciation Book Code";rec."Depreciation Book Code")
                {
                    ApplicationArea = Basic;
                }
                field("Salvage Value";rec."Salvage Value")
                {
                    ApplicationArea = Basic;
                }
                field("Depr. until FA Posting Date";rec."Depr. until FA Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Depr. Acquisition Cost";rec."Depr. Acquisition Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Code";rec."Maintenance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance No.";rec."Insurance No.")
                {
                    ApplicationArea = Basic;
                }
                field("Budgeted FA No.";rec."Budgeted FA No.")
                {
                    ApplicationArea = Basic;
                }
                field("Duplicate in Depreciation Book";rec."Duplicate in Depreciation Book")
                {
                    ApplicationArea = Basic;
                }
                field("Use Duplication List";rec."Use Duplication List")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                // field("Cross-Reference No.";rec."Cross-Reference No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Unit of Measure (Cross Ref.)";rec."Unit of Measure (Cross Ref.)")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Cross-Reference Type";rec."Cross-Reference Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Cross-Reference Type No.";rec."Cross-Reference Type No.")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Item Category Code";rec."Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Nonstock;rec.Nonstock)
                {
                    ApplicationArea = Basic;
                }
                field("Purchasing Code";rec."Purchasing Code")
                {
                    ApplicationArea = Basic;
                }
                // field("Product Group Code";rec."Product Group Code")
                // {
                //     ApplicationArea = Basic;
                // }
                //Naveen
                field("Special Order";rec."Special Order")
                {
                    ApplicationArea = Basic;
                }
                field("Special Order Sales No.";rec."Special Order Sales No.")
                {
                    ApplicationArea = Basic;
                }
                field("Special Order Sales Line No.";rec."Special Order Sales Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Whse. Outstanding Qty. (Base)";rec."Whse. Outstanding Qty. (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Completely Received";rec."Completely Received")
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
                field("Planned Receipt Date";rec."Planned Receipt Date")
                {
                    ApplicationArea = Basic;
                }
                field("Order Date";rec."Order Date")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Item Charge Assignment";rec."Allow Item Charge Assignment")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Assign";rec."Qty. to Assign")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Assigned";rec."Qty. Assigned")
                {
                    ApplicationArea = Basic;
                }
                field("Return Qty. to Ship";rec."Return Qty. to Ship")
                {
                    ApplicationArea = Basic;
                }
                field("Return Qty. to Ship (Base)";rec."Return Qty. to Ship (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Return Qty. Shipped Not Invd.";rec."Return Qty. Shipped Not Invd.")
                {
                    ApplicationArea = Basic;
                }
                field("Ret. Qty. Shpd Not Invd.(Base)";rec."Ret. Qty. Shpd Not Invd.(Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Return Shpd. Not Invd.";rec."Return Shpd. Not Invd.")
                {
                    ApplicationArea = Basic;
                }
                field("Return Shpd. Not Invd. (LCY)";rec."Return Shpd. Not Invd. (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Return Qty. Shipped";rec."Return Qty. Shipped")
                {
                    ApplicationArea = Basic;
                }
                field("Return Qty. Shipped (Base)";rec."Return Qty. Shipped (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("Return Shipment No.";rec."Return Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Return Shipment Line No.";rec."Return Shipment Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Return Reason Code";rec."Return Reason Code")
                {
                    ApplicationArea = Basic;
                }
               /* field("Tax %";rec."Tax %")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including Tax";rec."Amount Including Tax")
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
                field("State Code";"State Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Base Amount";"Tax Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Bus. Posting Group";"Excise Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Prod. Posting Group";"Excise Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including Excise";"Amount Including Excise")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Amount";rec."Excise Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Base Quantity";"Excise Base Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Amount";"Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Accounting Type";"Excise Accounting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Work Tax Base Amount";"Work Tax Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Work Tax %";"Work Tax %")
                {
                    ApplicationArea = Basic;
                }
                field("Work Tax Amount";rec."Work Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Category";"TDS Category")
                {
                    ApplicationArea = Basic;
                }
                field("Surcharge %";rec."Surcharge %")
                {
                    ApplicationArea = Basic;
                }
                field("Surcharge Amount";"Surcharge Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Concessional Code";"Concessional Code")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Base Amount";"Excise Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Amount";rec."TDS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Nature of Deduction";"TDS Nature of Deduction")
                {
                    ApplicationArea = Basic;
                }
                field("Assessee Code";"Assessee Code")
                {
                    ApplicationArea = Basic;
                }
                field("TDS %";"TDS %")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Amount Including Surcharge";rec."TDS Amount Including Surcharge")
                {
                    ApplicationArea = Basic;
                }
                field("Bal. TDS Including SHE CESS";"Bal. TDS Including SHE CESS")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Remittance";"Nature of Remittance")
                {
                    ApplicationArea = Basic;
                }
                field("Act Applicable";"Act Applicable")
                {
                    ApplicationArea = Basic;
                }
                field("Country Code";rec."Country Code")
                {
                    ApplicationArea = Basic;
                }
                field("Capital Item";rec."Capital Item")
                {
                    ApplicationArea = Basic;
                }
                field("BED Amount";"BED Amount")
                {
                    ApplicationArea = Basic;
                }
                field("AED(GSI) Amount";"AED(GSI) Amount")
                {
                    ApplicationArea = Basic;
                }
                field("SED Amount";"SED Amount")
                {
                    ApplicationArea = Basic;
                }
                field("SAED Amount";"SAED Amount")
                {
                    ApplicationArea = Basic;
                }
                field("CESS Amount";"CESS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("NCCD Amount";"NCCD Amount")
                {
                    ApplicationArea = Basic;
                }
                field("eCess Amount";rec."eCess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Added to Excise Base";"Amount Added to Excise Base")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Added to Tax Base";"Amount Added to Tax Base")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Added to Inventory";"Amount Added to Inventory")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Credit Reversal";rec."Excise Credit Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Amount To Vendor";"Amount To Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Charges To Vendor";"Charges To Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Base Amount";"TDS Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Surcharge Base Amount";"Surcharge Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("TDS Group";"TDS Group")
                {
                    ApplicationArea = Basic;
                }*/
                field("Work Tax Nature Of Deduction";rec."Work Tax Nature Of Deduction")
                {
                    ApplicationArea = Basic;
                }
                /*field("Work Tax Group";"Work Tax Group")
                {
                    ApplicationArea = Basic;
                }
                field("Temp TDS Base";"Temp TDS Base")
                {
                    ApplicationArea = Basic;
                }
                field("SetOff Available";"SetOff Available")
                {
                    ApplicationArea = Basic;
                }
                field(Subcontracting;Subcontracting)
                {
                    ApplicationArea = Basic;
                }
                field(SubConSend;rec.SubConSend)
                {
                    ApplicationArea = Basic;
                }
                field("Delivery Challan Posted";"Delivery Challan Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Reject (Rework)";"Qty. to Reject (Rework)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Rejected (Rework)";"Qty. Rejected (Rework)")
                {
                    ApplicationArea = Basic;
                }
                field(SendForRework;SendForRework)
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Reject (C.E.)";"Qty. to Reject (C.E.)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to Reject (V.E.)";"Qty. to Reject (V.E.)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Rejected (C.E.)";"Qty. Rejected (C.E.)")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Rejected (V.E.)";"Qty. Rejected (V.E.)")
                {
                    ApplicationArea = Basic;
                }
                field("Deliver Comp. For";"Deliver Comp. For")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Shipment No.";"Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Released Production Order";"Released Production Order")
                {
                    ApplicationArea = Basic;
                }
                field(SubConReceive;SubConReceive)
                {
                    ApplicationArea = Basic;
                }
                field("Component Item No.";"Component Item No.")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Group";"Service Tax Group")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Base";"Service Tax Base")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Amount";"Service Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Registration No.";"Service Tax Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("eCESS % on TDS";"eCESS % on TDS")
                {
                    ApplicationArea = Basic;
                }
                field("eCESS on TDS Amount";"eCESS on TDS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total TDS Including SHE CESS";"Total TDS Including SHE CESS")
                {
                    ApplicationArea = Basic;
                }
                field("Per Contract";"Per Contract")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax eCess Amount";"Service Tax eCess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("ADET Amount";"ADET Amount")
                {
                    ApplicationArea = Basic;
                }
                field("AED(TTA) Amount";"AED(TTA) Amount")
                {
                    ApplicationArea = Basic;
                }
                field("ADE Amount";"ADE Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Assessable Value";"Assessable Value")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Type";"VAT Type")
                {
                    ApplicationArea = Basic;
                }
                field("SHE Cess Amount";"SHE Cess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SHE Cess Amount";"Service Tax SHE Cess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Non ITC Claimable Usage %";"Non ITC Claimable Usage %")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Loaded on Inventory";"Amount Loaded on Inventory")
                {
                    ApplicationArea = Basic;
                }
                field("Input Tax Credit Amount";"Input Tax Credit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT able Purchase Tax Amount";"VAT able Purchase Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Supplementary;Supplementary)
                {
                    ApplicationArea = Basic;
                }
                field("Source Document Type";"Source Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source Document No.";"Source Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("ADC VAT Amount";"ADC VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("CIF Amount";"CIF Amount")
                {
                    ApplicationArea = Basic;
                }
                field("BCD Amount";"BCD Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CVD;rec.CVD)
                {
                    ApplicationArea = Basic;
                }
                //Naveen
                field("Notification Sl. No.";rec."Notification Sl. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Notification No.";rec."Notification No.")
                {
                    ApplicationArea = Basic;
                }
                field("CTSH No.";"CTSH No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reason Code";"Reason Code")
                {
                    ApplicationArea = Basic;
                }*/
               /* field("SHE Cess % On TDS";rec."SHE Cess % On TDS")
                {
                    ApplicationArea = Basic;
                }
                field("SHE Cess on TDS Amount";"SHE Cess on TDS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Loading on Inventory";"Excise Loading on Inventory")
                {
                    ApplicationArea = Basic;
                }
                field("Custom eCess Amount";"Custom eCess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Custom SHECess Amount";"Custom SHECess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Refund";rec."Excise Refund")
                {
                    ApplicationArea = Basic;
                }
                field("CWIP G/L Type";"CWIP G/L Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to ID (Delivery)";"Applies-to ID (Delivery)")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to ID (Receipt)";"Applies-to ID (Receipt)")
                {
                    ApplicationArea = Basic;
                }
                field("Delivery Challan Date";"Delivery Challan Date")
                {
                    ApplicationArea = Basic;
                }
                field("Item Charge Entry";"Item Charge Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Tot. Serv Tax Amount (Intm)";rec."Tot. Serv Tax Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("S. Tax Base Amount (Intm)";"S. Tax Base Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("S. Tax Amount (Intm)";"S. Tax Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("S. Tax eCess Amount (Intm)";rec."S. Tax eCess Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("S. Tax SHE Cess Amount (Intm)";"S. Tax SHE Cess Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("Amt. Incl. Service Tax (Intm)";"Amt. Incl. Service Tax (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SBC %";"Service Tax SBC %")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SBC Amount";"Service Tax SBC Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SBC Amount (Intm)";"Service Tax SBC Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("KK Cess%";rec."KK Cess%")
                {
                    ApplicationArea = Basic;
                }
                field("KK Cess Amount";"KK Cess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("KK Cess Amount (Intm)";"KK Cess Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("GST Credit";"GST Credit")
                {
                    ApplicationArea = Basic;
                }
                field("GST Group Code";"GST Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST Group Type";rec."GST Group Type")
                {
                    ApplicationArea = Basic;
                }
                field("HSN/SAC Code";"HSN/SAC Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST Base Amount";"GST Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("GST %";rec."GST %")
                {
                    ApplicationArea = Basic;
                }
                field("Total GST Amount";"Total GST Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Exempted;Exempted)
                {
                    ApplicationArea = Basic;
                }*/
                field("GST Jurisdiction Type";rec."GST Jurisdiction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Custom Duty Amount";rec."Custom Duty Amount")
                {
                    ApplicationArea = Basic;
                }
                //Naveen
                field("Integration Doc No";rec."Integration Doc No")
                {
                    ApplicationArea = Basic;
                }
                field("Case No.";rec."Case No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Identification No.";rec."Vehicle Identification No.")
                {
                    ApplicationArea = Basic;
                }
                field(Narration;rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field("Policy No.";rec."Policy No.")
                {
                    ApplicationArea = Basic;
                }
                field("VRN No.";rec."VRN No.")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service ID";rec."Service ID")
                {
                    ApplicationArea = Basic;
                }
                field("Service Date";rec."Service Date")
                {
                    ApplicationArea = Basic;
                }
                field("NAV Customer";rec."NAV Customer")
                {
                    ApplicationArea = Basic;
                }
                field(VIN;rec.VIN)
                {
                    ApplicationArea = Basic;
                }
                field(VRN;rec.VRN)
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
                field("Sent To Middleware";rec."Sent To Middleware")
                {
                    ApplicationArea = Basic;
                }
                field("Middleware Response";rec."Middleware Response")
                {
                    ApplicationArea = Basic;
                }
                field("Discount Received";rec."Discount Received")
                {
                    ApplicationArea = Basic;
                }
                field(DRSA;rec.DRSA)
                {
                    ApplicationArea = Basic;
                }
                field(SLA;rec.SLA)
                {
                    ApplicationArea = Basic;
                }
                field(CSAT;rec.CSAT)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Line";rec."Primary Line")
                {
                    ApplicationArea = Basic;
                }
                field("Hydra Charges";rec."Hydra Charges")
                {
                    ApplicationArea = Basic;
                }
                field("Toll Charges";rec."Toll Charges")
                {
                    ApplicationArea = Basic;
                }
                field("Waiting Charges";rec."Waiting Charges")
                {
                    ApplicationArea = Basic;
                }
                field("Border Charges";rec."Border Charges")
                {
                    ApplicationArea = Basic;
                }
                field("Other Charges";rec."Other Charges")
                {
                    ApplicationArea = Basic;
                }
                field("Routing No.";rec."Routing No.")
                {
                    ApplicationArea = Basic;
                }
                field("Operation No.";rec."Operation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Work Center No.";rec."Work Center No.")
                {
                    ApplicationArea = Basic;
                }
                field(Finished;rec.Finished)
                {
                    ApplicationArea = Basic;
                }
                field("Prod. Order Line No.";rec."Prod. Order Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Overhead Rate";rec."Overhead Rate")
                {
                    ApplicationArea = Basic;
                }
                field("MPS Order";rec."MPS Order")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Flexibility";rec."Planning Flexibility")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Lead Time";rec."Safety Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Routing Reference No.";rec."Routing Reference No.")
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

