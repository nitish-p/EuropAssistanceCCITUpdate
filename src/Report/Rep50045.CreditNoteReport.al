Report 50045 "Credit Note Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Credit Note Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.") order(ascending);
            RequestFilterFields = "Posting Date", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Department Code", "Client Level Code", "Employee Code", "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(SelltoCustomerNo_SalesInvoiceLine; "Sales Cr.Memo Line"."Sell-to Customer No.")
            {
            }
            column(DocumentNo_SalesInvoiceLine; "Sales Cr.Memo Line"."Document No.")
            {
            }
            column(Type_SalesInvoiceLine; "Sales Cr.Memo Line".Type)
            {
            }
            column(No_SalesInvoiceLine; "Sales Cr.Memo Line"."No.")
            {
            }
            column(Description_SalesInvoiceLine; "Sales Cr.Memo Line".Description)
            {
            }
            column(Quantity_SalesInvoiceLine; "Sales Cr.Memo Line".Quantity)
            {
            }
            column(UnitPrice_SalesInvoiceLine; ROUND("Sales Cr.Memo Line"."Unit Price", 0.01))
            {
            }
            column(Amount_SalesInvoiceLine; ROUND("Sales Cr.Memo Line".Amount, 0.01))
            {
            }
            column(TotalGSTAmount_SalesInvoiceLine; '')//ROUND("Sales Cr.Memo Line"."Total GST Amount", 0.01)//Naveen
            {
            }
            column(AmountToCustomer_SalesInvoiceLine; '')//ROUND("Sales Cr.Memo Line"."Amount To Customer", 0.01)//Naveen
            {
            }
            column(PostingDate_SalesInvoiceLine; Format("Sales Cr.Memo Line"."Posting Date"))
            {
            }
            column(ShortcutDimension1Code_SalesInvoiceLine; "Sales Cr.Memo Line"."Shortcut Dimension 1 Code")
            {
            }
            column(DepartmentCode_SalesInvoiceLine; "Sales Cr.Memo Line"."Department Code")
            {
            }
            column(ClientLevelCode_SalesInvoiceLine; "Sales Cr.Memo Line"."Client Level Code")
            {
            }
            column(EmployeeCode_SalesInvoiceLine; "Sales Cr.Memo Line"."Employee Code")
            {
            }
            column(CustName; CustName)
            {
            }
            column(BusLineDim; BusLineDim)
            {
            }
            column(DeptDim; DeptDim)
            {
            }
            column(ClientLevelDim; ClientLevelDim)
            {
            }
            column(SalesGL; SalesGL)
            {
            }
            column(SalesGLName; SalesGLName)
            {
            }
            column(Comments_SalesCrMemoLine; "Sales Cr.Memo Line".Comments)
            {
            }
            column(IGSTAmt; IGSTAmt)
            {
            }
            column(CGSTAmt; CGSTAmt)
            {
            }
            column(SGSTAmt; SGSTAmt)
            {
            }
            column(AmtLcy; AmtLcy)
            {
            }
            column(EATransactionType; EATransactionType)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CustName := '';
                BusLineDim := '';
                DeptDim := '';
                ClientLevelDim := '';

                recCust.Reset;
                recCust.SetRange("No.", "Sales Cr.Memo Line"."Sell-to Customer No.");
                if recCust.FindFirst then
                    CustName := recCust.Name;

                DimSetEntry.Reset;
                DimSetEntry.SetRange("Dimension Set ID", "Sales Cr.Memo Line"."Dimension Set ID");
                DimSetEntry.SetRange("Dimension Code", 'BUSINESS LINE');
                if DimSetEntry.FindFirst then begin
                    DimVal.Reset;
                    DimVal.SetRange("Global Dimension No.", 1);
                    DimVal.SetRange(Code, DimSetEntry."Dimension Value Code");
                    if DimVal.FindFirst then begin
                        BusLineDim := DimVal.Name;
                    end;
                end;

                DimSetEntry.Reset;
                DimSetEntry.SetRange("Dimension Set ID", "Sales Cr.Memo Line"."Dimension Set ID");
                DimSetEntry.SetRange("Dimension Code", 'DEPARTMENT');
                if DimSetEntry.FindFirst then begin
                    DimVal.Reset;
                    DimVal.SetRange("Global Dimension No.", 3);
                    DimVal.SetRange(Code, DimSetEntry."Dimension Value Code");
                    if DimVal.FindFirst then begin
                        DeptDim := DimVal.Name;
                    end;
                end;

                DimSetEntry.Reset;
                DimSetEntry.SetRange("Dimension Set ID", "Sales Cr.Memo Line"."Dimension Set ID");
                DimSetEntry.SetRange("Dimension Code", 'CLIENT LEVEL');
                if DimSetEntry.FindFirst then begin
                    DimVal.Reset;
                    DimVal.SetRange("Global Dimension No.", 4);
                    DimVal.SetRange(Code, DimSetEntry."Dimension Value Code");
                    if DimVal.FindFirst then begin
                        ClientLevelDim := DimVal.Name;
                    end;
                end;


                // sales GL ++
                SalesGL := '';
                SalesGLName := '';
                if "Sales Cr.Memo Line".Type = "Sales Cr.Memo Line".Type::"G/L Account" then begin
                    SalesGL := "Sales Cr.Memo Line"."No.";
                    GLAcc.Reset;
                    GLAcc.SetRange("No.", SalesGL);
                    if GLAcc.FindFirst then begin
                        SalesGLName := GLAcc.Name;
                    end;
                end;

                if "Sales Cr.Memo Line".Type = "Sales Cr.Memo Line".Type::Item then begin
                    GenPostSetup.Reset;
                    GenPostSetup.SetRange("Gen. Bus. Posting Group", "Sales Cr.Memo Line"."Gen. Bus. Posting Group");
                    GenPostSetup.SetRange("Gen. Prod. Posting Group", "Sales Cr.Memo Line"."Gen. Prod. Posting Group");
                    if GenPostSetup.FindFirst then begin
                        SalesGL := GenPostSetup."Sales Account";
                        GLAcc.Reset;
                        GLAcc.SetRange("No.", SalesGL);
                        if GLAcc.FindFirst then begin
                            SalesGLName := GLAcc.Name;
                        end;
                    end;
                end;
                // sales GL --
                Taxinfo.GetTaxInfo("Sales Cr.Memo Line".RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);
                // GST bifurcations ++
                IGSTAmt := 0;
                CGSTAmt := 0;
                SGSTAmt := 0;
                //if "Sales Cr.Memo Line"."Total GST Amount" <> 0 then begin//Naveen
                if (CGST + SGST + IGST) <> 0 then begin
                    if "Sales Cr.Memo Line"."GST Jurisdiction Type" = "Sales Cr.Memo Line"."gst jurisdiction type"::Interstate then begin
                        IGSTAmt := (CGST + SGST + IGST);
                        //IGSTAmt := "Sales Cr.Memo Line"."Total GST Amount";
                    end;
                    if "Sales Cr.Memo Line"."GST Jurisdiction Type" = "Sales Cr.Memo Line"."gst jurisdiction type"::Intrastate then begin
                        CGSTAmt := (CGST + SGST + IGST) / 2;
                        SGSTAmt := (CGST + SGST + IGST) / 2;
                        //  CGSTAmt := "Sales Cr.Memo Line"."Total GST Amount" / 2;//Naveen
                        // SGSTAmt := "Sales Cr.Memo Line"."Total GST Amount" / 2;
                    end;
                end;
                // GST bifurcations --
                EATransactionType := '';
                AmtLcy := 0;
                SalesCrMemoHdr.Reset;
                SalesCrMemoHdr.SetRange("No.", "Sales Cr.Memo Line"."Document No.");
                SalesCrMemoHdr.SetFilter("Currency Code", '<>%1', '');
                SalesCrMemoHdr.SetFilter("Currency Factor", '<>%1', 0);
                if SalesCrMemoHdr.FindFirst then begin
                    AmtLcy := (CGST + SGST + IGST - TDSAmt) / SalesCrMemoHdr."Currency Factor";
                    EATransactionType := Format(SalesCrMemoHdr."EA Transaction Type");
                end else begin
                    AmtLcy := (CGST + SGST + IGST - TDSAmt);
                    // AmtLcy := "Sales Cr.Memo Line"."Amount To Customer";//Naveen
                    EATransactionType := Format(SalesCrMemoHdr."EA Transaction Type");
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        CustName: Text[100];
        recCust: Record Customer;
        DimVal: Record "Dimension Value";
        BusLineDim: Text[50];
        DeptDim: Text[50];
        ClientLevelDim: Text[50];
        SalesGL: Code[20];
        GenPostSetup: Record "General Posting Setup";
        SalesGLName: Text[50];
        GLAcc: Record "G/L Account";
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        DimSetEntry: Record "Dimension Set Entry";
        AmtLcy: Decimal;
        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        EATransactionType: Code[10];
        //Naveen
        taxinfo: Codeunit TaxInfo;
        GSTBaseAmt: Decimal;
        TDSAmt: Decimal;
        TDSBaseAmt: Decimal;
        IGST: Decimal;
        SGST: Decimal;
        CGST: Decimal;
        IGSTPer: Decimal;
        SGSTPer: Decimal;
        CGSTPer: Decimal;
    //Naveen

}

