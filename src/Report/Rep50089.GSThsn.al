Report 50089 GSThsn
{
    // Rohit 01.11.2017
    // 1.Modified code as per the requirement.
    // 2.modified layout as per the requirement.
    // 3.added new field vendor invoice no.
    // 
    // Rohit 01.11.2017
    // 1.Added code for HSN description.
    // 2.Added code for  unit of measure.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSThsn.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Sales), "Source Type" = const(Customer), "Entry Type" = const("Initial Entry"), "Document Type" = const(Invoice));
            RequestFilterFields = "Posting Date", "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyerSellerRegNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Buyer/Seller Reg. No.")
            {
            }
            column(HSNSACCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."HSN/SAC Code")
            {
            }
            column(DocumentNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document No.")
            {
            }
            column(DocumentLineNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document Line No.")
            {
            }
            column(No_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."No.")
            {
            }
            column(PostingDate_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Posting Date")
            {
            }
            column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"//Naveen
            {
            }
            column(PoS; PoS)
            {
            }
            column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
            {
            }
            column(InvoiceType_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Invoice Type"
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."
            {
            }
            column(GSTPrcnt; GSTPrcnt)
            {
            }
            column(GSTComponentCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Component Code")
            {
            }
            column(GST_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST %")
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(TotGstAmt; TotGstAmt)
            {
            }
            column(TotalInvoiceValue; TotalInvoiceValue)
            {
            }
            column(TaxableValue; TaxableValue)
            {
            }
            column(Quantity_Total; Quantity_Total)
            {
            }
            column(CGST_Amount; CGST_Amount)
            {
            }
            column(SGST_Amount; SGST_Amount)
            {
            }
            column(IGST_Amount; IGST_Amount)
            {
            }
            column(HSN_Description; HSN_Description)
            {
            }
            column(UQC_Description; UQC_Description)
            {
            }
            column(TotalQty1; "Detailed GST Ledger Entry".Quantity)
            {
            }
            column(GBA; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(ACV; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotGstAmt := 0;
                GSTPrcnt := 0;

                Quantity_Total := 0;
                CGST_Amount := 0;
                SGST_Amount := 0;
                IGST_Amount := 0;

                Clear(HSN_Description);
                Clear(UQC_Description);

                //Rohit
                DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                TaxableValue := TaxableValue + "Detailed GST Ledger Entry"."GST Base Amount";

                TotalInvoiceValue := TotalInvoiceValue + DtGstLdjEntInfo."Amount to Customer/Vendor";

                if "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' then begin
                    CGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'IGST' then begin
                    IGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' then begin
                    SGST_Amount := "Detailed GST Ledger Entry"."GST Amount";
                end;

                if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTER' then begin
                    TotGstAmt := "Detailed GST Ledger Entry"."GST Amount";
                end;
                if "Detailed GST Ledger Entry"."GST Component Code" = 'CESS INTRA' then begin
                    TotGstAmt := "Detailed GST Ledger Entry"."GST Amount";
                end;

                Sales_Inv_Line_Record.Reset();
                Sales_Inv_Line_Record.SetRange(Sales_Inv_Line_Record."Document No.", "Detailed GST Ledger Entry"."Document No.");
                Sales_Inv_Line_Record.SetRange(Sales_Inv_Line_Record."HSN/SAC Code", "Detailed GST Ledger Entry"."HSN/SAC Code");
                Sales_Inv_Line_Record.SetFilter(Sales_Inv_Line_Record."Unit of Measure", '<>%1', '');
                if Sales_Inv_Line_Record.FindFirst then begin
                    UQC_Description := Sales_Inv_Line_Record."Unit of Measure";
                end;
                //UNTIL Sales_Inv_Line_Record.NEXT = 0;

                HSN_Record.Reset();
                HSN_Record.SetRange(HSN_Record.Code, "Detailed GST Ledger Entry"."HSN/SAC Code");
                if HSN_Record.FindFirst then begin
                    HSN_Description := HSN_Record.Description;
                end;
                //Rohit



                /*
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("Document No.",'%1',"Detailed GST Ledger Entry"."Document No.");
                IF DtGstLdjEnt.FIND('-') THEN BEGIN REPEAT
                
                    IF DtGstLdjEnt."GST Component Code"='CGST' THEN BEGIN
                      TaxableValue :=TaxableValue + DtGstLdjEnt."GST Base Amount"; // Issue raised by Pasa 02092017
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='IGST' THEN BEGIN
                      TaxableValue := TaxableValue + DtGstLdjEnt."GST Base Amount"; // Issue raised by Pasa 02092017
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='CGST' THEN BEGIN
                      Quantity_Total :=Quantity_Total + DtGstLdjEnt.Quantity;
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='IGST' THEN BEGIN
                      Quantity_Total :=Quantity_Total + DtGstLdjEnt.Quantity;
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='Cess' THEN BEGIN
                      TotGstAmt := TotGstAmt + DtGstLdjEnt."GST Amount";
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='CGST' THEN BEGIN
                      TotalInvoiceValue :=TotalInvoiceValue + DtGstLdjEnt."Amount to Customer/Vendor";
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='IGST' THEN BEGIN
                      TotalInvoiceValue :=TotalInvoiceValue + DtGstLdjEnt."Amount to Customer/Vendor";
                    END;
                
                    GSTPrcnt :=GSTPrcnt + DtGstLdjEnt."GST %";
                
                    IF DtGstLdjEnt."GST Component Code"='CGST' THEN BEGIN
                      CGST_Amount :=CGST_Amount +DtGstLdjEnt."GST Amount";
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='SGST' THEN BEGIN
                      SGST_Amount :=SGST_Amount +DtGstLdjEnt."GST Amount";
                    END;
                
                    IF DtGstLdjEnt."GST Component Code"='IGST' THEN BEGIN
                      IGST_Amount :=IGST_Amount +DtGstLdjEnt."GST Amount";
                    END;
                */
                State.SetRange(Code, DtGstLdjEntInfo."Buyer/Seller State Code");
                if State.FindFirst then
                    PoS := State."State Code (GST Reg. No.)" + ' ' + State.Description;



                /*
                Sales_Inv_Line_Record.RESET();
                Sales_Inv_Line_Record.SETFILTER("HSN/SAC Code",'%1',DtGstLdjEnt."HSN/SAC Code");
                IF Sales_Inv_Line_Record.FINDFIRST THEN BEGIN
                  UQC_Description :=Sales_Inv_Line_Record."Unit of Measure";
                END;
                */
                //UNTIL DtGstLdjEnt.NEXT = 0;
                //END;

            end;

            trigger OnPreDataItem()
            begin
                TotalInvoiceValue := 0;
                TaxableValue := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("GSTIN of Location"; GSTTINRegNo)
                {
                    ApplicationArea = Basic;
                    TableRelation = "GST Registration Nos.".Code;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        InvVal: Decimal;
        PoS: Code[20];
        GSTPrcnt: Decimal;
        TotGstAmt: Decimal;
        DtGstLdjEnt: Record "Detailed GST Ledger Entry";
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
        State: Record State;
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        Quantity_Total: Decimal;
        CGST_Amount: Decimal;
        SGST_Amount: Decimal;
        IGST_Amount: Decimal;
        HSN_Record: Record "HSN/SAC";
        HSN_Description: Text;
        Sales_Inv_Line_Record: Record "Sales Invoice Line";
        UQC_Description: Text;
        GSTTINRegNo: Code[30];
}

