Report 50044 "Sales Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sales Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.") order(ascending);
            RequestFilterFields = "Posting Date", "Sell-to Customer No.", "Shortcut Dimension 1 Code", "Department Code", "Client Level Code", "Employee Code", "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(SelltoCustomerNo_SalesInvoiceLine; "Sales Invoice Line"."Sell-to Customer No.")
            {
            }
            column(DocumentNo_SalesInvoiceLine; "Sales Invoice Line"."Document No.")
            {
            }
            column(Type_SalesInvoiceLine; "Sales Invoice Line".Type)
            {
            }
            column(No_SalesInvoiceLine; "Sales Invoice Line"."No.")
            {
            }
            column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
            {
            }
            column(Quantity_SalesInvoiceLine; "Sales Invoice Line".Quantity)
            {
            }
            column(UnitPrice_SalesInvoiceLine; ROUND("Sales Invoice Line"."Unit Price", 0.01))
            {
            }
            column(Amount_SalesInvoiceLine; ROUND("Sales Invoice Line".Amount, 0.01))
            {
            }
            column(TotalGSTAmount_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."Total GST Amount",0.01)//Naveen
            {
            }
            column(AmountToCustomer_SalesInvoiceLine; '')//ROUND("Sales Invoice Line"."Amount To Customer",0.01)//Naveen
            {
            }
            column(PostingDate_SalesInvoiceLine; Format("Sales Invoice Line"."Posting Date"))
            {
            }
            column(ShortcutDimension1Code_SalesInvoiceLine; "Sales Invoice Line"."Shortcut Dimension 1 Code")
            {
            }
            column(DepartmentCode_SalesInvoiceLine; "Sales Invoice Line"."Department Code")
            {
            }
            column(ClientLevelCode_SalesInvoiceLine; "Sales Invoice Line"."Client Level Code")
            {
            }
            column(EmployeeCode_SalesInvoiceLine; "Sales Invoice Line"."Employee Code")
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
            column(Narration_SalesInvoiceLine; "Sales Invoice Line".Comments)
            {
            }
            column(IntegrationDocNo_SalesInvoiceLine; "Sales Invoice Line"."Integration Doc No")
            {
            }
            column(SalesGL; SalesGL)
            {
            }
            column(SalesGLName; SalesGLName)
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
                recCust.SetRange("No.", "Sales Invoice Line"."Sell-to Customer No.");
                if recCust.FindFirst then
                    CustName := recCust.Name;


                DimSetEntry.Reset;
                DimSetEntry.SetRange("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
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
                DimSetEntry.SetRange("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
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
                DimSetEntry.SetRange("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
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
                if "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" then begin
                    SalesGL := "Sales Invoice Line"."No.";
                    GLAcc.Reset;
                    GLAcc.SetRange("No.", SalesGL);
                    if GLAcc.FindFirst then begin
                        SalesGLName := GLAcc.Name;
                    end;
                end;

                if "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item then begin
                    GenPostSetup.Reset;
                    GenPostSetup.SetRange("Gen. Bus. Posting Group", "Sales Invoice Line"."Gen. Bus. Posting Group");
                    GenPostSetup.SetRange("Gen. Prod. Posting Group", "Sales Invoice Line"."Gen. Prod. Posting Group");
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

                Taxinfo.GetTaxInfo("Sales Invoice Line".RecordId, GSTBaseAmt, TDSBaseAmt, TCSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);
                // GST bifurcations ++
                IGSTAmt := 0;
                CGSTAmt := 0;
                SGSTAmt := 0;
                // if "Sales Invoice Line"."Total GST Amount" <> 0 then begin//Naveen
                if (CGST + SGST + IGST) <> 0 then begin
                    if "Sales Invoice Line"."GST Jurisdiction Type" = "Sales Invoice Line"."gst jurisdiction type"::Interstate then begin
                        IGSTAmt := (CGST + SGST + IGST);
                        //IGSTAmt := "Sales Invoice Line"."Total GST Amount";//Naveen
                    end;
                    if "Sales Invoice Line"."GST Jurisdiction Type" = "Sales Invoice Line"."gst jurisdiction type"::Intrastate then begin
                        CGSTAmt := (CGST + SGST + IGST) / 2;
                        SGSTAmt := (CGST + SGST + IGST) / 2;
                        //  CGSTAmt := "Sales Invoice Line"."Total GST Amount" / 2;
                        // SGSTAmt := "Sales Invoice Line"."Total GST Amount" / 2;//Naveen
                    end;
                end;
                // GST bifurcations --
                EATransactionType := '';
                AmtLcy := 0;
                SalesInvHdr.Reset;
                SalesInvHdr.SetRange("No.", "Sales Invoice Line"."Document No.");
                SalesInvHdr.SetFilter("Currency Code", '<>%1', '');
                SalesInvHdr.SetFilter("Currency Factor", '<>%1', 0);
                if SalesInvHdr.FindFirst then begin
                    AmtLcy := (GSTBaseAmt + CGST + SGST + IGST + TCSAmt) / SalesInvHdr."Currency Factor";//Naveen
                    EATransactionType := Format(SalesInvHdr."EA Transaction Type");
                end else begin
                    AmtLcy := (GSTBaseAmt + CGST + SGST + IGST + TCSAmt);//Naveen
                    EATransactionType := Format(SalesInvHdr."EA Transaction Type");
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
        SalesInvHdr: Record "Sales Invoice Header";
        EATransactionType: Code[10];
        //Naveen
        taxinfo: Codeunit TaxInfo;
        GSTBaseAmt: Decimal;
        TCSAmt: Decimal;
        TDSBaseAmt: Decimal;
        IGST: Decimal;
        SGST: Decimal;
        CGST: Decimal;
        IGSTPer: Decimal;
        SGSTPer: Decimal;
        CGSTPer: Decimal;
    //Naveen


}

