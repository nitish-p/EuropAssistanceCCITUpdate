Report 50107 "WIP Capex"
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
                DataItemTableView = where(Type = filter("G/L Account"), "No." = filter('212401'));
                RequestFilterFields = "Integration Doc No", "Project Name";
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

                IF (FromDate <> 0D) AND (ToDate <> 0D) THEN
                    "Purch. Inv. Header".SETRANGE("Purch. Inv. Header"."Posting Date", FromDate, ToDate);
                Srno := 0;
            end;
        }
        dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
        {
            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Type = filter("G/L Account"), "No." = filter('212401'));
                RequestFilterFields = "Integration Doc No", "Project Name";
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    MakeExcelDataBodyMemo;
                end;
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;

            begin
                Srno += 1;
            end;

            trigger OnPreDataItem()
            begin

                IF (FromDate <> 0D) AND (ToDate <> 0D) THEN
                    "Purch. Cr. Memo Hdr.".SETRANGE("Purch. Cr. Memo Hdr."."Posting Date", FromDate, ToDate);
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
                field(FromDate; FromDate)
                {
                    ApplicationArea = all;
                }
                field(ToDate; ToDate)
                {
                    ApplicationArea = all;
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


    procedure MakeExcelInfo()
    begin

        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CompInfo.Name, false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('WIP Capex Report', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Invoice No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Vendor No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Vendor Name', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Posting Date', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Type', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Description', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Quantity', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Unit Price Excl. Tax', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Line Amount Excl. Tax', false, '', true, false, true, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('Project Name', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Integration Doc No.', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('Narration', false, '', true, false, true, '', ExcelBuf."cell type"::Text);
    end;


    procedure CreateExcelbook()
    begin

        ExcelBuf.CreateNewBook('Statement Report');
        ExcelBuf.WriteSheet('Statement Report', '', '');
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename('WIP Capex Report.xlsx');
        ExcelBuf.OpenExcel();


        // ExcelBuf.CreateBookAndOpenExcel('D:\Reports\WIP Capex Report.xlsx','WIP Capex Report','WIP Capex Report',COMPANYNAME,UserId);//NKP
    end;


    procedure MakeExcelDataBody()
    begin


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Purch. Inv. Header"."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Inv. Header"."Buy-from Vendor No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Inv. Header"."Buy-from Vendor Name", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Inv. Header"."Posting Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Purch. Inv. Line".Type, false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn("Purch. Inv. Line"."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Inv. Line".Description, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Inv. Line".Quantity, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Purch. Inv. Line"."Unit Cost", false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Purch. Inv. Line"."Line Amount", false, '', false, false, false, '', ExcelBuf."cell type"::Number);

        ExcelBuf.AddColumn("Purch. Inv. Line"."Project Name", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Inv. Line"."Integration Doc No", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Inv. Line".Narration, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
    end;


    procedure EntryCount(DocNo: Code[20]): Integer
    var
    //RecGSTLedEntry: Record UnknownRecord16418;
    begin
        /*RecGSTLedEntry.RESET;
        RecGSTLedEntry.SETRANGE(RecGSTLedEntry."Document No.",DocNo);
        IF (FromDate <> 0D) AND (ToDate <> 0D) THEN
        RecGSTLedEntry.SETRANGE(RecGSTLedEntry."Posting Date",FromDate,ToDate);
        IF RecGSTLedEntry.FINDSET THEN
           EXIT(RecGSTLedEntry.COUNT);
           */

    end;


    procedure MakeExcelDataBodyMemo()
    begin


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."Buy-from Vendor No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."Buy-from Vendor Name", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Cr. Memo Hdr."."Posting Date", false, '', false, false, false, '', ExcelBuf."cell type"::Date);
        ExcelBuf.AddColumn("Purch. Cr. Memo Line".Type, false, '', false, false, false, '', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn("Purch. Cr. Memo Line"."No.", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Cr. Memo Line".Description, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn((-1 * "Purch. Cr. Memo Line".Quantity), false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn((-1 * "Purch. Cr. Memo Line"."Unit Cost"), false, '', false, false, false, '', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn((-1 * "Purch. Cr. Memo Line"."Line Amount"), false, '', false, false, false, '', ExcelBuf."cell type"::Number);

        ExcelBuf.AddColumn("Purch. Cr. Memo Line"."Project Name", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Cr. Memo Line"."Integration Doc No", false, '', false, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Purch. Cr. Memo Line".Narration, false, '', false, false, false, '', ExcelBuf."cell type"::Text);
    end;

}

