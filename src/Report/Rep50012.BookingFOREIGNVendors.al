Report 50012 "Booking FOREIGN Vendors"
{
    ProcessingOnly = true;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Srno; Srno)
            {
            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = WHERE("No." = FILTER(<> ''));
                column(ReportForNavId_1000000001; 1000000001)
                {
                }

                trigger OnAfterGetRecord()
                begin


                    MakeExcelDataBody;
                end;
            }


            trigger OnAfterGetRecord()
            begin
                Srno += 1;
                CurrExRate := 0;
                //"Purch. Inv. Header".CALCFIELDS("Purch. Inv. Header"."Currency Code");
                RecCurrExRate.Reset;
                RecCurrExRate.SetRange(RecCurrExRate."Currency Code", "Purch. Inv. Header"."Currency Code");
                if RecCurrExRate.FindLast then
                    CurrExRate := RecCurrExRate."Relational Exch. Rate Amount";

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
                    "Purch. Inv. Header".SetRange("Purch. Inv. Header"."Posting Date", FromDate, ToDate);

                Srno := 0;
                "Purch. Inv. Header".SetFilter("Vendor Posting Group", '%1|%2', 'FOREIGN', 'FORN-INTC');
            end;
        }
        dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
        {


            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = WHERE("No." = FILTER(<> ''));
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin

                    MakeExcelDataBodyForMemo;

                end;

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Srno += 1;
                CurrExRate1 := 0;
                //"Purch. Inv. Header".CALCFIELDS("Purch. Inv. Header"."Currency Code");
                RecCurrExRate.Reset;
                RecCurrExRate.SetRange(RecCurrExRate."Currency Code", "Purch. Inv. Header"."Currency Code");
                if RecCurrExRate.FindLast then
                    CurrExRate1 := RecCurrExRate."Relational Exch. Rate Amount";

            end;


            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                if (FromDate <> 0D) and (ToDate <> 0D) then
                    "Purch. Cr. Memo Hdr.".SetRange("Purch. Cr. Memo Hdr."."Posting Date", FromDate, ToDate);

                Srno := 0;
                "Purch. Cr. Memo Hdr.".SetFilter("Vendor Posting Group", '%1|%2', 'FOREIGN', 'FORN-INTC');
            end;
        }

    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("From Date"; FromDate)
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; ToDate)
                {
                    ApplicationArea = Basic;
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
        CompInfo.Get;
    end;

    trigger OnPostReport()
    begin
        CreateExcelbook;
    end;

    trigger OnPreReport()
    begin
        ExcelBuf.DeleteAll(true);

        MakeExcelInfo;
    end;

    var
        Srno: Integer;
        Srno1: Integer;
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
        RecCurr: Record Currency;
        CurrExRate: Decimal;
        CurrExRate1: Decimal;
        RecCurrExRate: Record "Currency Exchange Rate";


    procedure MakeExcelInfo()
    begin

        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CompInfo.Name, false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Booking FOREIGN Vendors Report', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Posting Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Document Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('PI Number', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Currency Code', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Exchange Rate', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Euro Value', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Equals To INR', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('TDS Deduction Amount', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Taxable Amount', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Euro Remaining Amount', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Remainig Balance', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Vendor Invoice No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
    end;


    procedure CreateExcelbook()
    begin

        ExcelBuf.CreateNewBook('Statement Report');
        ExcelBuf.WriteSheet('Statement Report', '', '');
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename('Booking FOREIGN Vendors Report.xlsx');
        ExcelBuf.OpenExcel();

        //ExcelBuf.CreateBookAndOpenExcel('D:\Reports\Booking FOREIGN Vendors Report.xlsx','Booking FOREIGN Vendors Report','Booking FOREIGN Vendors Report',COMPANYNAME,UserId);
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

        Taxinfo.GetTaxInfo("Purch. Inv. Line".RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Purch. Inv. Header"."Posting Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Purch. Inv. Header"."Document Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Purch. Inv. Header"."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        //"Purch. Inv. Header".CALCFIELDS("Purch. Inv. Header"."Currency Code");
        ExcelBuf.AddColumn("Purch. Inv. Header"."Currency Code", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(CurrExRate, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Purch. Inv. Line"."Direct Unit Cost", false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(CurrExRate * "Purch. Inv. Line"."Direct Unit Cost", false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TDSAmt, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Purch. Inv. Line"."Line Amount", false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(("Purch. Inv. Line"."Line Amount" - tdsamt), false, '', false, false, false, '', ExcelBuf."cell type"::Number);//Naveen
        ExcelBuf.AddColumn(("Purch. Inv. Line"."Line Amount" - Tdsamt) * CurrExRate, false, '', false, false, false, '', ExcelBuf."cell type"::Number);//Naveen
        ExcelBuf.AddColumn("Purch. Inv. Header"."Vendor Invoice No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
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



    procedure MakeExcelDataBodyForMemo()
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

        Taxinfo.GetTaxInfo("Purch. Cr. Memo Hdr.".RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."Posting Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."Document Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        //"Purch. Inv. Header".CALCFIELDS("Purch. Inv. Header"."Currency Code");
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."Currency Code", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn((-1 * CurrExRate1), false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn((-1 * "Purch. Cr. Memo Line"."Direct Unit Cost"), false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn((-1 * CurrExRate1 * "Purch. Cr. Memo Line"."Direct Unit Cost"), false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(TDSAmt, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn((-1 * "Purch. Cr. Memo Line"."Line Amount"), false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn((-1 * ("Purch. Cr. Memo Line"."Line Amount" - tdsamt)), false, '', false, false, false, '', ExcelBuf."cell type"::Number);//Naveen
        ExcelBuf.AddColumn((-1 * ("Purch. Cr. Memo Line"."Line Amount" - Tdsamt) * CurrExRate1), false, '', false, false, false, '', ExcelBuf."cell type"::Number);//Naveen
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."Vendor Cr. Memo No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
    end;

}

