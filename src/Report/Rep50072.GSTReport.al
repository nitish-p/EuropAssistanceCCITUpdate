Report 50072 "GST Report"
{
    ProcessingOnly = true;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("GST Ledger Entry"; "GST Ledger Entry")
        {
            RequestFilterFields = "Posting Date", "Transaction Type", "Document Type";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Srno; Srno)
            {
            }
            column(CompInfo_Pict; CompInfo.Picture)
            {
            }
            column(Compinfo_Name; CompInfo.Name)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Srno += 1;


                SGSTAmt := 0;
                CGSTAmt := 0;
                IGSTAmt := 0;
                GSTBaseAmt := 0;
                SGSTGLAcc := '';
                CGSTGLAcc := '';
                IGSTGLAcc := '';
                SGSTEntryNo := '';
                CGSTEntryNo := '';
                IGSTEntryNo := '';
                "HSN/SACCode" := '';
                SGSTComCode := '';
                CGSTComCode := '';
                IGSTComCode := '';
                SGSTPer := 0;
                CGSTPer := 0;
                IGSTPer := 0;
                LocStateCode := '';
                BuyerSellerStateCode := '';
                ShippingAddrStateCode := '';
                LocationRegNo := '';
                BuyerSellerRegNo := '';
                RefInvoiceNumber := '';

                RecDetailedGSTLedEntry.Reset;
                //RecDetailedGSTLedEntry.SETRANGE(RecDetailedGSTLedEntry."Source Type",RecDetailedGSTLedEntry."Source Type"::Customer);
                RecDetailedGSTLedEntry.SetRange(RecDetailedGSTLedEntry."Document No.", "GST Ledger Entry"."Document No.");
                if (FromDate <> 0D) and (ToDate <> 0D) then
                    RecDetailedGSTLedEntry.SetRange(RecDetailedGSTLedEntry."Posting Date", FromDate, ToDate);
                if RecDetailedGSTLedEntry.FindSet then
                    repeat
                        DtGstLdjEntInfo.Get(RecDetailedGSTLedEntry."Entry No."); //NKP--CCIT
                        if RecDetailedGSTLedEntry."GST Component Code" = 'SGST' then begin
                            SGSTAmt += RecDetailedGSTLedEntry."GST Amount";//new

                            SGSTGLAcc := RecDetailedGSTLedEntry."G/L Account No.";
                            //SGSTEntryNo := RecDetailedGSTLedEntry."Entry No.";
                            SGSTEntryNo := SGSTEntryNo + '-' + Format(RecDetailedGSTLedEntry."Entry No.");
                            "HSN/SACCode" := RecDetailedGSTLedEntry."HSN/SAC Code";
                            SGSTComCode := RecDetailedGSTLedEntry."GST Component Code";
                            GSTJuriType := RecDetailedGSTLedEntry."GST Jurisdiction Type";
                            NatureOfSupply := DtGstLdjEntInfo."Nature of Supply";
                            SGSTPer := RecDetailedGSTLedEntry."GST %";
                            LocStateCode := DtGstLdjEntInfo."Location State Code";
                            BuyerSellerStateCode := DtGstLdjEntInfo."Buyer/Seller State Code";
                            ShippingAddrStateCode := DtGstLdjEntInfo."Shipping Address State Code";
                            LocationRegNo := RecDetailedGSTLedEntry."Location  Reg. No.";
                            BuyerSellerRegNo := RecDetailedGSTLedEntry."Buyer/Seller Reg. No.";
                            GSTGroupType := RecDetailedGSTLedEntry."GST Group Type";
                            // RefInvoiceNumber := DtGstLdjEntInfo."Reference Invoice Number";
                            // EATransactionType := DtGstLdjEntInfo."EA Transaction Type";//Nkp
                        end;
                        if RecDetailedGSTLedEntry."GST Component Code" = 'CGST' then begin
                            CGSTAmt += RecDetailedGSTLedEntry."GST Amount";//new
                            CGSTGLAcc := RecDetailedGSTLedEntry."G/L Account No.";
                            CGSTEntryNo := CGSTEntryNo + '-' + Format(RecDetailedGSTLedEntry."Entry No.");
                            CGSTComCode := RecDetailedGSTLedEntry."GST Component Code";
                            CGSTPer := RecDetailedGSTLedEntry."GST %";
                        end;

                        if RecDetailedGSTLedEntry."GST Component Code" = 'IGST' then begin
                            IGSTAmt += RecDetailedGSTLedEntry."GST Amount";//new
                            IGSTGLAcc := RecDetailedGSTLedEntry."G/L Account No.";
                            IGSTEntryNo := IGSTEntryNo + '-' + Format(RecDetailedGSTLedEntry."Entry No.");
                            "HSN/SACCode" := RecDetailedGSTLedEntry."HSN/SAC Code";
                            IGSTComCode := RecDetailedGSTLedEntry."GST Component Code";
                            GSTJuriType := RecDetailedGSTLedEntry."GST Jurisdiction Type";
                            //NKP--CCIT
                            NatureOfSupply := DtGstLdjEntInfo."Nature of Supply";
                            IGSTPer := RecDetailedGSTLedEntry."GST %";
                            LocStateCode := DtGstLdjEntInfo."Location State Code";
                            BuyerSellerStateCode := DtGstLdjEntInfo."Buyer/Seller State Code";
                            ShippingAddrStateCode := DtGstLdjEntInfo."Shipping Address State Code";
                            LocationRegNo := RecDetailedGSTLedEntry."Location  Reg. No.";
                            BuyerSellerRegNo := RecDetailedGSTLedEntry."Buyer/Seller Reg. No.";
                            GSTGroupType := RecDetailedGSTLedEntry."GST Group Type";
                            // RefInvoiceNumber := RecDetailedGSTLedEntry."Reference Invoice Number";
                            // EATransactionType := RecDetailedGSTLedEntry."EA Transaction Type";//Nkp
                        end;

                        GSTBaseAmt += RecDetailedGSTLedEntry."GST Base Amount"

                    until RecDetailedGSTLedEntry.Next = 0;


                if "GST Ledger Entry"."Transaction Type" = "GST Ledger Entry"."transaction type"::Purchase then begin
                    if "GST Ledger Entry"."Document Type" = "GST Ledger Entry"."document type"::Invoice then begin
                        DocDate := 0D;
                        InvDate := 0D;
                        RecPIH.Reset;
                        RecPIH.SetRange(RecPIH."No.", "GST Ledger Entry"."Document No.");
                        if RecPIH.FindFirst then begin
                            DocDate := RecPIH."Document Date";
                            InvDate := RecPIH."Invoice Date";
                        end;
                    end else
                        if "GST Ledger Entry"."Document Type" = "GST Ledger Entry"."document type"::"Credit Memo" then begin
                            DocDate := 0D;
                            InvDate := 0D;
                            RecPCrH.Reset;
                            RecPCrH.SetRange(RecPCrH."No.", "GST Ledger Entry"."Document No.");
                            if RecPCrH.FindFirst then begin
                                DocDate := RecPCrH."Document Date";
                                InvDate := RecPCrH."Invoice Date";
                            end;
                        end;
                end else
                    if "GST Ledger Entry"."Transaction Type" = "GST Ledger Entry"."transaction type"::Sales then begin
                        if "GST Ledger Entry"."Document Type" = "GST Ledger Entry"."document type"::Invoice then begin
                            DocDate := 0D;
                            InvDate := 0D;
                            RecSIH.Reset;
                            RecSIH.SetRange(RecSIH."No.", "GST Ledger Entry"."Document No.");
                            if RecSIH.FindFirst then begin
                                DocDate := RecSIH."Document Date";
                                InvDate := RecSIH."Invoice Date";
                            end;
                        end else
                            if "GST Ledger Entry"."Document Type" = "GST Ledger Entry"."document type"::"Credit Memo" then begin
                                DocDate := 0D;
                                InvDate := 0D;
                                RecSCrH.Reset;
                                RecSCrH.SetRange(RecSCrH."No.", "GST Ledger Entry"."Document No.");
                                if RecSCrH.FindFirst then begin
                                    DocDate := RecSCrH."Document Date";
                                    InvDate := RecSCrH."Invoice Date";
                                end;
                            end;
                    end;

                CustName := '';
                if "GST Ledger Entry"."Source Type" = "GST Ledger Entry"."source type"::Customer then begin
                    if RecCust.Get("GST Ledger Entry"."Source No.") then
                        CustName := RecCust.Name;
                end else
                    if "GST Ledger Entry"."Source Type" = "GST Ledger Entry"."source type"::Vendor then begin
                        if RecVend.Get("GST Ledger Entry"."Source No.") then
                            CustName := RecVend.Name;
                    end;





                //--------
                if (CurrDoc = 'CRONUS') then begin
                    CurrDoc := "GST Ledger Entry"."Document No.";
                    I := 0;
                    DocCounter := EntryCount(CurrDoc);
                end;
                I += 1;

                if I = DocCounter then begin

                    MakeExcelDataBody;
                    CurrDoc := 'CRONUS';
                    DocCounter := 0;
                end;
                //--------


                //MakeExcelDataBody;
            end;

            trigger OnPreDataItem()
            begin

                if (FromDate <> 0D) and (ToDate <> 0D) then
                    "GST Ledger Entry".SetRange("GST Ledger Entry"."Posting Date", FromDate, ToDate);
                Srno := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Option)
                {
                    Caption = 'Option';
                    field("From Date :"; FromDate)
                    {
                        ApplicationArea = Basic;
                    }
                    field("To Date :"; ToDate)
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

    labels
    {
        SNo = 'S. No.';
        NameofGoods = 'Name of Goods';
    }

    trigger OnInitReport()
    begin
        CurrDoc := 'CRONUS';
    end;

    trigger OnPostReport()
    begin
        CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        ExcelBuf.DeleteAll;

        CompInfo.Get;
        CompInfo.CalcFields(Picture);


        MakeExcelInfo;
    end;

    var
        Srno: Integer;
        IGSTAmt: Decimal;
        SGSTAmt: Decimal;
        CGSTAmt: Decimal;
        ExcelBuf: Record "Excel Buffer";
        CurrDoc: Code[20];
        DocCounter: Integer;
        I: Integer;
        CompInfo: Record "Company Information";
        FromDate: Date;
        ToDate: Date;
        RecCust: Record Customer;
        CustName: Text;
        SGSTGLAcc: Code[20];
        CGSTGLAcc: Code[20];
        IGSTGLAcc: Code[20];
        SGSTEntryNo: Text;
        CGSTEntryNo: Text;
        IGSTEntryNo: Text;
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
        RecDetailedGSTLedEntry: Record "Detailed GST Ledger Entry";
        "HSN/SACCode": Code[20];
        SGSTComCode: Code[20];
        CGSTComCode: Code[20];
        IGSTComCode: Code[20];
        GSTJuriType: Option Intrastate,Interstate;
        NatureOfSupply: Option B2B,B2C;
        SGSTPer: Decimal;
        CGSTPer: Decimal;
        IGSTPer: Decimal;
        LocStateCode: Code[20];
        BuyerSellerStateCode: Code[20];
        ShippingAddrStateCode: Code[20];
        LocationRegNo: Code[20];
        BuyerSellerRegNo: Code[20];
        GSTGroupType: Option Goods,Service;
        InvoiceType: Code[20];
        RefInvoiceNumber: Code[20];
        EATransactionType: Option " ",B2B,B2C;
        RecVend: Record Vendor;
        RecPIH: Record "Purch. Inv. Header";
        RecPCrH: Record "Purch. Cr. Memo Hdr.";
        RecSIH: Record "Sales Invoice Header";
        RecSCrH: Record "Sales Cr.Memo Header";
        DocDate: Date;
        InvDate: Date;
        MaxLengh: Integer;
        Lenght: Integer;
        GSTBaseAmt: Decimal;
        GSTBaseAmt1: Decimal;


    procedure MakeExcelInfo()
    begin

        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CompInfo.Name, false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('GST Report', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        if (FromDate <> 0D) and (ToDate <> 0D) then
            ExcelBuf.AddColumn('From Date :' + Format(FromDate) + ' To To Date :' + Format(ToDate), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Posting Date ', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Name', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Transaction Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Document Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('Document No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Document Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Invoice Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('External Doc. No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Gen.Bus.Posting Group', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('HSN/SAC Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('SGST Component Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('CGST Component Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('IGST Component Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('GST Jurisdiction Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('GST Base Amount', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('SGST', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('CGST', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('IGST', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('TotalGST Amount', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('SGST G/L Account No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('CGST G/L Account No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('IGST G/L Account No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Nature of Supply', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('SGST %', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('CGST %', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('IGST %', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Location State Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Buyer/Seller State Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('Shipping Address State Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Location  Reg. No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Buyer/Seller Reg. No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('GST Group Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Invoice Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('Reference Invoice Number', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EA Transaction Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('SGST Entry No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('CGST Entry No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('IGST Entry No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
    end;


    procedure CreateExcelbook()
    begin
        ExcelBuf.SetFriendlyFilename('GST Report''GST Report');//Naveen ---CCIt 
        ExcelBuf.OpenExcel();

        // ExcelBuf.CreateBookAndOpenExcel('D:\Reports\GST Report.xlsx','GST Report','GST Report',COMPANYNAME,UserId);
    end;


    procedure MakeExcelDataBody()
    begin


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("GST Ledger Entry"."Posting Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("GST Ledger Entry"."Source No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(CustName, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("GST Ledger Entry"."Transaction Type", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("GST Ledger Entry"."Document Type", false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn("GST Ledger Entry"."Document No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(DocDate, false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn(InvDate, false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("GST Ledger Entry"."External Document No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("GST Ledger Entry"."Gen. Bus. Posting Group", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("HSN/SACCode", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(SGSTComCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(CGSTComCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(IGSTComCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn(GSTJuriType, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn("GST Ledger Entry"."GST Base Amount",FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
        if IGSTComCode = 'IGST' then
            ExcelBuf.AddColumn(GSTBaseAmt, false, '', false, false, false, '', ExcelBuf."cell type"::Number)
        else
            ExcelBuf.AddColumn(GSTBaseAmt / 2, false, '', false, false, false, '', ExcelBuf."cell type"::Number);

        ExcelBuf.AddColumn(SGSTAmt, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(CGSTAmt, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(IGSTAmt, false, '', false, false, false, '', ExcelBuf."cell type"::Number);

        ExcelBuf.AddColumn((SGSTAmt + SGSTAmt + IGSTAmt), false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(SGSTGLAcc, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(CGSTGLAcc, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(IGSTGLAcc, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(NatureOfSupply, false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn(SGSTPer, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(CGSTPer, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(IGSTPer, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(LocStateCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(BuyerSellerStateCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ShippingAddrStateCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(LocationRegNo, false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn(BuyerSellerRegNo, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(GSTGroupType, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(InvoiceType, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(RefInvoiceNumber, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(EATransactionType, false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        if StrLen(SGSTEntryNo) > 250 then
            ExcelBuf.AddColumn('', false, '', false, false, false, '', ExcelBuf."cell type"::Text)
        else
            ExcelBuf.AddColumn(SGSTEntryNo, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        if StrLen(CGSTEntryNo) > 250 then
            ExcelBuf.AddColumn('', false, '', false, false, false, '', ExcelBuf."cell type"::Text)
        else
            ExcelBuf.AddColumn(CGSTEntryNo, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        if StrLen(IGSTEntryNo) > 250 then
            ExcelBuf.AddColumn('', false, '', false, false, false, '', ExcelBuf."cell type"::Text)
        else
            ExcelBuf.AddColumn(IGSTEntryNo, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
    end;


    procedure EntryCount(DocNo: Code[20]): Integer
    var
        RecGSTLedEntry: Record "GST Ledger Entry";
    begin
        RecGSTLedEntry.Reset;
        RecGSTLedEntry.SetRange(RecGSTLedEntry."Document No.", DocNo);
        if (FromDate <> 0D) and (ToDate <> 0D) then
            RecGSTLedEntry.SetRange(RecGSTLedEntry."Posting Date", FromDate, ToDate);
        if RecGSTLedEntry.FindSet then
            exit(RecGSTLedEntry.Count);

    end;
}

