Report 50071 "Sales QTY-GTO Report"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Sell-to Customer No.";
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
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_1000000001; 1000000001)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    DeptCode := '';
                    ClientCode := '';
                    RecDimSetEntry.Reset;
                    RecDimSetEntry.SetRange("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
                    if RecDimSetEntry.FindSet then
                        repeat
                            if RecDimSetEntry."Dimension Code" = 'CLIENT LEVEL' then
                                ClientCode := RecDimSetEntry."Dimension Value Code";
                            if RecDimSetEntry."Dimension Code" = 'DEPARTMENT' then
                                DeptCode := RecDimSetEntry."Dimension Value Code";
                        until RecDimSetEntry.Next = 0;

                    MakeExcelDataBody;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Srno += 1;

                if "Sales Invoice Header"."Debit Note" = true then
                    InvType := 'Debit Note'
                else
                    InvType := 'Invoice';



                //--------
                /*IF (CurrDoc = 'CRONUS')  THEN BEGIN
                   CurrDoc := "Sales Invoice Header"."Document No.";
                   I := 0;
                   DocCounter := EntryCount(CurrDoc);
                END;
                I += 1;
                
                IF I = DocCounter THEN BEGIN
                
                  MakeExcelDataBody;
                  CurrDoc := 'CRONUS';
                  DocCounter :=0;
                END;*/
                //--------


                //MakeExcelDataBody;

            end;

            trigger OnPreDataItem()
            begin

                if (FromDate <> 0D) and (ToDate <> 0D) then
                    "Sales Invoice Header".SetRange("Sales Invoice Header"."Posting Date", FromDate, ToDate);
                Srno := 0;
                InvType := '';
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
        //CurrDoc := 'CRONUS';
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
        ExcelBuf: Record "Excel Buffer";
        CurrDoc: Code[20];
        DocCounter: Integer;
        I: Integer;
        CompInfo: Record "Company Information";
        FromDate: Date;
        ToDate: Date;
        RecCust: Record Customer;
        InvType: Text;
        RecDimSetEntry: Record "Dimension Set Entry";
        DeptCode: Code[50];
        ClientCode: Code[50];


    procedure MakeExcelInfo()
    begin

        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CompInfo.Name, false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Sales QTY-GTO Report', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        if (FromDate <> 0D) and (ToDate <> 0D) then
            ExcelBuf.AddColumn('From Date :' + Format(FromDate) + ' To To Date :' + Format(ToDate), false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Integration Doc No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EA Transaction Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Posting Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Document Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Invoice Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('External Document No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Posting No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Invoice Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Sell-to Customer No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Sell-to Customer Name', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Description', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Particulars', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Quantity', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('Unit Price Excl. Tax', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Line Amount Excl. Tax', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Line Discount Amount', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Business line Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Department Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('Client level Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('GST Place of Supply', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Total GST Amount', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Case No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Comments', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Policy Month', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
    end;


    procedure CreateExcelbook()
    begin
        ExcelBuf.SetFriendlyFilename('Sales QTY-GTO Report');
        ExcelBuf.OpenExcel();
        // ExcelBuf.CreateBookAndOpenExcel('D:\Reports\Sales QTY-GTO Report.xlsx','Sales QTY-GTO Report','Sales QTY-GTO Report',COMPANYNAME,UserId);
    end;


    procedure MakeExcelDataBody()
    var
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
    begin


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Invoice Header"."Integration Doc No", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."EA Transaction Type", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."Posting Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Sales Invoice Header"."Document Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Sales Invoice Header"."Invoice Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);

        ExcelBuf.AddColumn("Sales Invoice Header"."External Document No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(InvType, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Customer No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Header"."Sell-to Customer Name", false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn("Sales Invoice Line".Type, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line"."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line".Description, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line".Particulars, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format("Sales Invoice Line".Quantity), false, '', false, false, false, '0.00', ExcelBuf."cell type"::Number);

        ExcelBuf.AddColumn(Format("Sales Invoice Line"."Unit Price"), false, '', false, false, false, '0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(Format("Sales Invoice Line"."Line Amount"), false, '', false, false, false, '0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(Format("Sales Invoice Line"."Line Discount Amount"), false, '', false, false, false, '0.00', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Sales Invoice Line"."Shortcut Dimension 1 Code", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(DeptCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn(ClientCode, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line"."GST Place of Supply", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(SGST + CGST + IGST, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Sales Invoice Line"."Case No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line".Comments, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Invoice Line"."Policy Month", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
    end;


    procedure EntryCount(DocNo: Code[20]): Integer
    var
        RecGSTLedEntry: Record "GST Ledger Entry";
    begin
        /*RecGSTLedEntry.RESET;
        RecGSTLedEntry.SETRANGE(RecGSTLedEntry."Document No.",DocNo);
        IF (FromDate <> 0D) AND (ToDate <> 0D) THEN
        RecGSTLedEntry.SETRANGE(RecGSTLedEntry."Posting Date",FromDate,ToDate);
        IF RecGSTLedEntry.FINDSET THEN
           EXIT(RecGSTLedEntry.COUNT);
           */

    end;
}

