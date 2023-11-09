Report 50047 "Purchase Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Purchase Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.") order(ascending);
            RequestFilterFields = "Posting Date", "Buy-from Vendor No.", "Shortcut Dimension 1 Code", "Department Code", "Client Level Code", "Employee Code";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyfromVendorNo_PurchInvLine; "Purch. Inv. Line"."Buy-from Vendor No.")
            {
            }
            column(DocumentNo_PurchInvLine; "Purch. Inv. Line"."Document No.")
            {
            }
            column(Type_PurchInvLine; "Purch. Inv. Line".Type)
            {
            }
            column(Description_PurchInvLine; "Purch. Inv. Line".Description)
            {
            }
            column(Quantity_PurchInvLine; "Purch. Inv. Line".Quantity)
            {
            }
            column(DirectUnitCost_PurchInvLine; ROUND("Purch. Inv. Line"."Direct Unit Cost", 0.01))
            {
            }
            column(Amount_PurchInvLine; "Purch. Inv. Line".Amount)
            {
            }
            column(TotalGSTAmount_PurchInvLine; '')//"Purch. Inv. Line"."Total GST Amount"//Naveen
            {
            }
            column(AmountToVendor_PurchInvLine; "Purch. Inv. Line"."Amount To Vendor")
            {
            }
            column(PostingDate_PurchInvLine; Format("Purch. Inv. Line"."Posting Date"))
            {
            }
            column(VendName; VendName)
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
            column(PurchaseGL; PurchaseGL)
            {
            }
            column(PurchaseGLName; PurchaseGLName)
            {
            }
            column(Narration_PurchInvLine; "Purch. Inv. Line".Narration)
            {
            }
            column(VendorInvNo; VendorInvNo)
            {
            }
            column(DocDate; Format(DocDate))
            {
            }
            column(GSTNo; GSTNo)
            {
            }
            column(PostGrp; PostGrp)
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

            trigger OnAfterGetRecord()
            begin
                VendName := '';
                BusLineDim := '';
                DeptDim := '';
                ClientLevelDim := '';

                recVend.Reset;
                recVend.SetRange("No.", "Purch. Inv. Line"."Buy-from Vendor No.");
                if recVend.FindFirst then begin
                    VendName := recVend.Name;
                end;

                DimSetEntry.Reset;
                DimSetEntry.SetRange("Dimension Set ID", "Purch. Inv. Line"."Dimension Set ID");
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
                DimSetEntry.SetRange("Dimension Set ID", "Purch. Inv. Line"."Dimension Set ID");
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
                DimSetEntry.SetRange("Dimension Set ID", "Purch. Inv. Line"."Dimension Set ID");
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
                PurchaseGL := '';
                PurchaseGLName := '';
                if "Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"G/L Account" then begin
                    PurchaseGL := "Purch. Inv. Line"."No.";
                    GLAcc.Reset;
                    GLAcc.SetRange("No.", PurchaseGL);
                    if GLAcc.FindFirst then begin
                        PurchaseGLName := GLAcc.Name;
                    end;
                end;

                if "Purch. Inv. Line".Type = "Purch. Inv. Line".Type::Item then begin
                    GenPostSetup.Reset;
                    GenPostSetup.SetRange("Gen. Bus. Posting Group", "Purch. Inv. Line"."Gen. Bus. Posting Group");
                    GenPostSetup.SetRange("Gen. Prod. Posting Group", "Purch. Inv. Line"."Gen. Prod. Posting Group");
                    if GenPostSetup.FindFirst then begin
                        PurchaseGL := GenPostSetup."Purch. Account";
                        GLAcc.Reset;
                        GLAcc.SetRange("No.", PurchaseGL);
                        if GLAcc.FindFirst then begin
                            PurchaseGLName := GLAcc.Name;
                        end;
                    end;
                end;
                // sales GL --


                // additional fields capture 110520 ++

                PostGrp := '';
                VendorInvNo := '';
                DocDate := 0D;
                GSTNo := '';
                PurchInvHdr.Reset;
                PurchInvHdr.SetRange("No.", "Purch. Inv. Line"."Document No.");
                if PurchInvHdr.FindFirst then begin
                    PostGrp := PurchInvHdr."Vendor Posting Group";
                    VendorInvNo := PurchInvHdr."Vendor Invoice No.";
                    DocDate := PurchInvHdr."Document Date";

                    VLE.Reset;
                    VLE.SetRange("Document No.", PurchInvHdr."No.");
                    if VLE.FindFirst then begin
                        GSTNo := VLE."Buyer GST Reg. No.";
                    end;
                end;

                // additional fields capture 110520 --

                Taxinfo.GetTaxInfo("Purch. Inv. Line".RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);
                // GST bifurcations ++
                IGSTAmt := 0;
                CGSTAmt := 0;
                SGSTAmt := 0;
                if (SGST + CGST + IGST) <> 0 then begin//Naveen
                    if "Purch. Inv. Line"."GST Jurisdiction Type" = "Purch. Inv. Line"."gst jurisdiction type"::Interstate then begin
                        IGSTAmt := (SGST + CGST + IGST);//Naveen
                    end;
                    if "Purch. Inv. Line"."GST Jurisdiction Type" = "Purch. Inv. Line"."gst jurisdiction type"::Intrastate then begin
                        // CGSTAmt:="Purch. Inv. Line"."Total GST Amount"/2;
                        // SGSTAmt:="Purch. Inv. Line"."Total GST Amount"/2;
                        CGSTAmt := (SGST + CGST + IGST) / 2;
                        SGSTAmt := (SGST + CGST + IGST) / 2;//Naveen
                    end;
                end;
                // GST bifurcations --
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
        VendName: Text[100];
        recVend: Record Vendor;
        DimVal: Record "Dimension Value";
        BusLineDim: Text[50];
        DeptDim: Text[50];
        ClientLevelDim: Text[50];
        PurchaseGL: Code[20];
        GenPostSetup: Record "General Posting Setup";
        PurchaseGLName: Text[50];
        GLAcc: Record "G/L Account";
        VendorInvNo: Code[35];
        DocDate: Date;
        GSTNo: Code[15];
        PostGrp: Code[10];
        PurchInvHdr: Record "Purch. Inv. Header";
        VLE: Record "Vendor Ledger Entry";
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        DimSetEntry: Record "Dimension Set Entry";
        //Naveen++
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

