Report 50048 "Debit Note Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Debit Note Report.rdl';
UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.") order(ascending);
            RequestFilterFields = "Posting Date", "Buy-from Vendor No.", "Shortcut Dimension 1 Code", "Department Code", "Client Level Code", "Employee Code";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyfromVendorNo_PurchInvLine; "Purch. Cr. Memo Line"."Buy-from Vendor No.")
            {
            }
            column(DocumentNo_PurchInvLine; "Purch. Cr. Memo Line"."Document No.")
            {
            }
            column(Type_PurchInvLine; "Purch. Cr. Memo Line".Type)
            {
            }
            column(Description_PurchInvLine; "Purch. Cr. Memo Line".Description)
            {
            }
            column(Quantity_PurchInvLine; "Purch. Cr. Memo Line".Quantity)
            {
            }
            column(DirectUnitCost_PurchInvLine; ROUND("Purch. Cr. Memo Line"."Direct Unit Cost", 0.01))
            {
            }
            column(Amount_PurchInvLine; "Purch. Cr. Memo Line".Amount)
            {
            }
            column(TotalGSTAmount_PurchInvLine; '')//"Purch. Cr. Memo Line"."Total GST Amount"//Naveen
            {
            }
            column(AmountToVendor_PurchInvLine; "Purch. Cr. Memo Line"."Amount To Vendor")
            {
            }
            column(PostingDate_PurchInvLine; Format("Purch. Cr. Memo Line"."Posting Date"))
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
            column(Narration_PurchInvLine; "Purch. Cr. Memo Line".Narration)
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
                recVend.SetRange("No.", "Purch. Cr. Memo Line"."Buy-from Vendor No.");
                if recVend.FindFirst then begin
                    VendName := recVend.Name;
                end;

                DimSetEntry.Reset;
                DimSetEntry.SetRange("Dimension Set ID", "Purch. Cr. Memo Line"."Dimension Set ID");
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
                DimSetEntry.SetRange("Dimension Set ID", "Purch. Cr. Memo Line"."Dimension Set ID");
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
                DimSetEntry.SetRange("Dimension Set ID", "Purch. Cr. Memo Line"."Dimension Set ID");
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
                if "Purch. Cr. Memo Line".Type = "Purch. Cr. Memo Line".Type::"G/L Account" then begin
                    PurchaseGL := "Purch. Cr. Memo Line"."No.";
                    GLAcc.Reset;
                    GLAcc.SetRange("No.", PurchaseGL);
                    if GLAcc.FindFirst then begin
                        PurchaseGLName := GLAcc.Name;
                    end;
                end;

                if "Purch. Cr. Memo Line".Type = "Purch. Cr. Memo Line".Type::Item then begin
                    GenPostSetup.Reset;
                    GenPostSetup.SetRange("Gen. Bus. Posting Group", "Purch. Cr. Memo Line"."Gen. Bus. Posting Group");
                    GenPostSetup.SetRange("Gen. Prod. Posting Group", "Purch. Cr. Memo Line"."Gen. Prod. Posting Group");
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
                PurchCrMemoHdr.Reset;
                PurchCrMemoHdr.SetRange("No.", "Purch. Cr. Memo Line"."Document No.");
                if PurchCrMemoHdr.FindFirst then begin
                    PostGrp := PurchCrMemoHdr."Vendor Posting Group";
                    DocDate := PurchCrMemoHdr."Document Date";

                    VLE.Reset;
                    VLE.SetRange("Document No.", PurchCrMemoHdr."No.");
                    if VLE.FindFirst then begin
                        GSTNo := VLE."Buyer GST Reg. No.";
                    end;

                    PurchInvHdr.Reset;
                    PurchInvHdr.SetRange("No.", PurchCrMemoHdr."Applies-to Doc. No.");
                    if PurchInvHdr.FindFirst then begin
                        VendorInvNo := PurchInvHdr."Vendor Invoice No.";
                    end;
                end;

                // additional fields capture 110520 --

                // GST bifurcations ++
                IGSTAmt := 0;
                CGSTAmt := 0;
                SGSTAmt := 0;
                // if "Purch. Cr. Memo Line"."Total GST Amount" <> 0 then begin//Naveen
                if (CGST + SGST + IGST) <> 0 then begin
                    if "Purch. Cr. Memo Line"."GST Jurisdiction Type" = "Purch. Cr. Memo Line"."gst jurisdiction type"::Interstate then begin
                        IGSTAmt := (CGST + SGST + IGST);
                        //IGSTAmt := "Purch. Cr. Memo Line"."Total GST Amount";//Naveen
                    end;
                    if "Purch. Cr. Memo Line"."GST Jurisdiction Type" = "Purch. Cr. Memo Line"."gst jurisdiction type"::Intrastate then begin
                        CGSTAmt := (CGST + SGST + IGST) / 2;
                        SGSTAmt := (CGST + SGST + IGST) / 2;
                        // CGSTAmt := "Purch. Cr. Memo Line"."Total GST Amount" / 2;//Naveen
                        // SGSTAmt := "Purch. Cr. Memo Line"."Total GST Amount" / 2;
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
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        DimSetEntry: Record "Dimension Set Entry";
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

