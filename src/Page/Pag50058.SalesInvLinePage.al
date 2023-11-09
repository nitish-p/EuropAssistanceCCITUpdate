Page 50058 "Sales Inv. Line Page"
{
    PageType = List;
    Permissions = TableData "Sales Invoice Line" = rimd;
    SourceTable = "Sales Invoice Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; rec."Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Shipment Date"; rec."Shipment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Description 2"; rec."Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)"; rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("VAT %"; rec."VAT %")
                {
                    ApplicationArea = Basic;
                }
                field("Line Discount %"; rec."Line Discount %")
                {
                    ApplicationArea = Basic;
                }
                field("Line Discount Amount"; rec."Line Discount Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including VAT"; rec."Amount Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Invoice Disc."; rec."Allow Invoice Disc.")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Weight"; rec."Gross Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Net Weight"; rec."Net Weight")
                {
                    ApplicationArea = Basic;
                }
                field("Units per Parcel"; rec."Units per Parcel")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Volume"; rec."Unit Volume")
                {
                    ApplicationArea = Basic;
                }
                field("Appl.-to Item Entry"; rec."Appl.-to Item Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Price Group"; rec."Customer Price Group")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Work Type Code"; rec."Work Type Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shipment No."; rec."Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Shipment Line No."; rec."Shipment Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inv. Discount Amount"; rec."Inv. Discount Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Drop Shipment"; rec."Drop Shipment")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Calculation Type"; rec."VAT Calculation Type")
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
                field("Attached to Line No."; rec."Attached to Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Exit Point"; rec."Exit Point")
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
                field("Tax Category"; rec."Tax Category")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Area Code"; rec."Tax Area Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Liable"; rec."Tax Liable")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Group Code"; rec."Tax Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Clause Code"; rec."VAT Clause Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Blanket Order No."; rec."Blanket Order No.")
                {
                    ApplicationArea = Basic;
                }
                field("Blanket Order Line No."; rec."Blanket Order Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Base Amount"; rec."VAT Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("System-Created Entry"; rec."System-Created Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount"; rec."Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Difference"; rec."VAT Difference")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Identifier"; rec."VAT Identifier")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Ref. Type"; rec."IC Partner Ref. Type")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Reference"; rec."IC Partner Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment Line"; rec."Prepayment Line")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Code"; rec."IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Contract Entry No."; rec."Job Contract Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Deferral Code"; rec."Deferral Code")
                {
                    ApplicationArea = Basic;
                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bin Code"; rec."Bin Code")
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
                field("Quantity (Base)"; rec."Quantity (Base)")
                {
                    ApplicationArea = Basic;
                }
                field("FA Posting Date"; rec."FA Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Depreciation Book Code"; rec."Depreciation Book Code")
                {
                    ApplicationArea = Basic;
                }
                field("Depr. until FA Posting Date"; rec."Depr. until FA Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Duplicate in Depreciation Book"; rec."Duplicate in Depreciation Book")
                {
                    ApplicationArea = Basic;
                }
                field("Use Duplication List"; rec."Use Duplication List")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                // field("Cross-Reference No."; rec."Cross-Reference No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Unit of Measure (Cross Ref.)"; rec."Unit of Measure (Cross Ref.)")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Cross-Reference Type"; rec."Cross-Reference Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Cross-Reference Type No."; rec."Cross-Reference Type No.")
                // {
                //     ApplicationArea = Basic;
                // }
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
                field("Appl.-from Item Entry"; rec."Appl.-from Item Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Return Reason Code"; rec."Return Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Allow Line Disc."; rec."Allow Line Disc.")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Disc. Group"; rec."Customer Disc. Group")
                {
                    ApplicationArea = Basic;
                }
                /*field("Tax Amount";rec."Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Bus. Posting Group";rec."Excise Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Prod. Posting Group";rec."Excise Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Amount";rec."Excise Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including Excise";rec."Amount Including Excise")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Base Amount";rec."Excise Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Accounting Type";rec."Excise Accounting Type")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Base Quantity";rec."Excise Base Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Tax %";rec."Tax %")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Including Tax";rec."Amount Including Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Added to Excise Base";rec."Amount Added to Excise Base")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Added to Tax Base";rec."Amount Added to Tax Base")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Base Amount";rec."Tax Base Amount")
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
                field("Concessional Code";rec."Concessional Code")
                {
                    ApplicationArea = Basic;
                }*/
                field("Assessee Code";rec."Assessee Code")
                {
                    ApplicationArea = Basic;
                }
                /*field("TDS/TCS %";rec."TDS/TCS %")
                {
                    ApplicationArea = Basic;
                }
                field("Bal. TDS/TCS Including SHECESS";rec."Bal. TDS/TCS Including SHECESS")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Deferred Excise";"Claim Deferred Excise")
                {
                    ApplicationArea = Basic;
                }
                field("Capital Item";rec."Capital Item")
                {
                    ApplicationArea = Basic;
                }
                field("BED Amount";rec."BED Amount")
                {
                    ApplicationArea = Basic;
                }
                field("AED(GSI) Amount";rec."AED(GSI) Amount")
                {
                    ApplicationArea = Basic;
                }
                field("SED Amount";rec."SED Amount")
                {
                    ApplicationArea = Basic;
                }
                field("SAED Amount";rec."SAED Amount")
                {
                    ApplicationArea = Basic;
                }
                field("CESS Amount";rec."CESS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("NCCD Amount";rec."NCCD Amount")
                {
                    ApplicationArea = Basic;
                }
                field("eCess Amount";rec."eCess Amount")
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
                field(State;rec.State)
                {
                    ApplicationArea = Basic;
                }
                field("TDS/TCS Amount";rec."TDS/TCS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Amount To Customer";rec."Amount To Customer")
                {
                    ApplicationArea = Basic;
                }
                field("Charges To Customer";rec."Charges To Customer")
                {
                    ApplicationArea = Basic;
                }
                field("TDS/TCS Base Amount";rec."TDS/TCS Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Surcharge Base Amount";rec."Surcharge Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Group";rec."Service Tax Group")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Base";rec."Service Tax Base")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Amount";rec."Service Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax Registration No.";rec."Service Tax Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("eCESS % on TDS/TCS";rec."eCESS % on TDS/TCS")
                {
                    ApplicationArea = Basic;
                }
                field("eCESS on TDS/TCS Amount";rec."eCESS on TDS/TCS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total TDS/TCS Incl. SHE CESS";rec."Total TDS/TCS Incl. SHE CESS")
                {
                    ApplicationArea = Basic;
                }
                field("Per Contract";rec."Per Contract")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax eCess Amount";rec."Service Tax eCess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("ADET Amount";rec."ADET Amount")
                {
                    ApplicationArea = Basic;
                }
                field("AED(TTA) Amount";rec."AED(TTA) Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Free Supply";rec."Free Supply")
                {
                    ApplicationArea = Basic;
                }
                field("ADE Amount";rec."ADE Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Assessable Value";rec."Assessable Value")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Type";rec."VAT Type")
                {
                    ApplicationArea = Basic;
                }
                field("SHE Cess Amount";rec."SHE Cess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SHE Cess Amount";rec."Service Tax SHE Cess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Debit To PLA / RG";rec."Direct Debit To PLA / RG")
                {
                    ApplicationArea = Basic;
                }*/
                field("TCS Nature of Collection";rec."TCS Nature of Collection")
                {
                    ApplicationArea = Basic;
                }
                /*field("TCS Type";rec."TCS Type")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Deduction %";rec."Standard Deduction %")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Deduction Amount";rec."Standard Deduction Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Supplementary;rec.Supplementary)
                {
                    ApplicationArea = Basic;
                }
                field("Source Document Type";rec."Source Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source Document No.";rec."Source Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("ADC VAT Amount";rec."ADC VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("CIF Amount";rec."CIF Amount")
                {
                    ApplicationArea = Basic;
                }
                field("BCD Amount";rec."BCD Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CVD;rec.CVD)
                {
                    ApplicationArea = Basic;
                }
                field("Process Carried Out";rec."Process Carried Out")
                {
                    ApplicationArea = Basic;
                }
                field("Identification Mark";rec."Identification Mark")
                {
                    ApplicationArea = Basic;
                }
                field("Re-Dispatch";rec."Re-Dispatch")
                {
                    ApplicationArea = Basic;
                }
                field("Return Rcpt line No.";rec."Return Rcpt line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. to be Re-Dispatched";rec."Qty. to be Re-Dispatched")
                {
                    ApplicationArea = Basic;
                }
                field("Return Re-Dispatch Rcpt. No.";rec."Return Re-Dispatch Rcpt. No.")
                {
                    ApplicationArea = Basic;
                }
                field("SHE Cess % on TDS/TCS";rec."SHE Cess % on TDS/TCS")
                {
                    ApplicationArea = Basic;
                }
                field("SHE Cess on TDS/TCS Amount";rec."SHE Cess on TDS/TCS Amount")
                {
                    ApplicationArea = Basic;
                }
                field("MRP Price";rec."MRP Price")
                {
                    ApplicationArea = Basic;
                }
                field(MRP;rec.MRP)
                {
                    ApplicationArea = Basic;
                }
                field("Abatement %";rec."Abatement %")
                {
                    ApplicationArea = Basic;
                }
                field("PIT Structure";rec."PIT Structure")
                {
                    ApplicationArea = Basic;
                }
                field("Price Inclusive of Tax";rec."Price Inclusive of Tax")
                {
                    ApplicationArea = Basic;
                }*/
                field("Unit Price Incl. of Tax";rec."Unit Price Incl. of Tax")
                {
                    ApplicationArea = Basic;
                }
               /* field("Amount To Customer UPIT";rec."Amount To Customer UPIT")
                {
                    ApplicationArea = Basic;
                }
                field("UPIT Rounding Inserted";rec."UPIT Rounding Inserted")
                {
                    ApplicationArea = Basic;
                }
                field("Custom eCess Amount";rec."Custom eCess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Custom SHECess Amount";rec."Custom SHECess Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Effective Rate";rec."Excise Effective Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SBC %";rec."Service Tax SBC %")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SBC Amount";rec."Service Tax SBC Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Service Tax SBC Amount (Intm)";rec."Service Tax SBC Amount (Intm)")
                {
                    ApplicationArea = Basic;
                }
                field("KK Cess%";rec."KK Cess%")
                {
                    ApplicationArea = Basic;
                }
                field("KK Cess Amount";rec."KK Cess Amount")
                {
                    ApplicationArea = Basic;
                }*/
                field("GST Place of Supply";rec."GST Place of Supply")
                {
                    ApplicationArea = Basic;
                }
                field("GST Group Code";rec."GST Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST Group Type";rec."GST Group Type")
                {
                    ApplicationArea = Basic;
                }
               /* field("GST Base Amount";rec."GST Base Amount")
                {
                    ApplicationArea = Basic;
                }
                field("GST %";rec."GST %")
                {
                    ApplicationArea = Basic;
                }
                field("Total GST Amount";rec."Total GST Amount")
                {
                    ApplicationArea = Basic;
                }*/
                field("HSN/SAC Code";rec."HSN/SAC Code")
                {
                    ApplicationArea = Basic;
                }
                field("GST Jurisdiction Type";rec."GST Jurisdiction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Type";rec."Invoice Type")
                {
                    ApplicationArea = Basic;
                }
                //Naveen
                field("Integration Doc No"; rec."Integration Doc No")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Case No."; rec."Case No.")
                {
                    ApplicationArea = Basic;
                }
                field(Narration; rec.Narration)
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Particulars; rec.Particulars)
                {
                    ApplicationArea = Basic;
                }
                field("Client Level Code"; rec."Client Level Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code"; rec."Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Policy No."; rec."Policy No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage Start Date"; rec."Policy Coverage Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Coverage End Date"; rec."Policy Coverage End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Year Of Mfg"; rec."Year Of Mfg")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No."; rec."Vehicle Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Identification No."; rec."Vehicle Identification No.")
                {
                    ApplicationArea = Basic;
                }
                field("Client Name"; rec."Client Name")
                {
                    ApplicationArea = Basic;
                }
                field("Client Id"; rec."Client Id")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Month"; rec."Policy Month")
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

