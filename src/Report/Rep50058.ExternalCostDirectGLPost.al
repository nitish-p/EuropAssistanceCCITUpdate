Report 50058 "External Cost - Direct GL Post"
{
    // prdp
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/External Cost - Direct GL Post.rdl';

    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.") order(ascending) where(Type = filter("G/L Account"), "No." = const('410001'));
            RequestFilterFields = "Posting Date", "Buy-from Vendor No.";
            column(ReportForNavId_1000000010; 1000000010)
            {
            }
            column(PostingDate_PurchInvLine; Format("Purch. Inv. Line"."Posting Date"))
            {
            }
            column(No_PurchInvLine; "Purch. Inv. Line"."No.")
            {
            }
            column(Amount_PurchInvLine; ROUND("Purch. Inv. Line".Amount, 0.01))
            {
            }
            column(Narration_PurchInvLine; "Purch. Inv. Line".Narration)
            {
            }
            column(Description_PurchInvLine; "Purch. Inv. Line".Description)
            {
            }
            column(DocumentNo_PurchInvLine; "Purch. Inv. Line"."Document No.")
            {
            }
            column(CINNo; CINNo)
            {
            }
            column(CompCityPostCode; CompCityPostCode)
            {
            }
            column(CompAddrs; CompAddrs)
            {
            }
            column(CompNm; CompNm)
            {
            }
            column(CompInfoPicture; CompInfo.Picture)
            {
            }
            column(CompServTaxRegNo; '')//CompInfo."Service Tax Registration No."
            {
            }
            //Naveen
            column(CompPANNo; CompInfo."P.A.N. No.")
            {
            }
            column(ServiceDate_PurchInvLine; Format("Purch. Inv. Line"."Service Date"))
            {
            }
            column(TotalGSTAmount_PurchInvLine; '')//"Purch. Inv. Line"."Total GST Amount"
            {
            }
            //naveen
            column(BuyfromVendorNo_PurchInvLine; "Purch. Inv. Line"."Buy-from Vendor No.")
            {
            }
            column(VendName; VendName)
            {
            }
            column(VendInvNo; VendInvNo)
            {
            }
            column(AmountToVendor_PurchInvLine; "Purch. Inv. Line"."Amount To Vendor")
            {
            }
            column(IntegrationDocNo_PurchInvLine; "Purch. Inv. Line"."Integration Doc No")
            {
            }
            column(DocType; DocType)
            {
            }
            column(tot; tot)
            {
            }
            column(gst; gst)
            {
            }
            column(gross; gross)
            {
            }
            column(tds; tds)
            {
            }
            column(net; "Purch. Inv. Line"."Amount To Vendor")
            {
            }
            column(Narr; "Purch. Inv. Line".Narration)
            {
            }
            column(CreditNote; CreditNote)
            {
            }
            column(DataItem1Visible; DataItem1Visible)
            {
            }

            trigger OnAfterGetRecord()
            var
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

            begin
                tot := 0;
                gst := 0;
                gross := 0;
                tds := 0;
                net := 0;
                DataItem1Visible := true;
                DataItem2Visible := false;

                VendInvNo := '';
                DocType := '';

                PurchInvHdr.Reset;
                PurchInvHdr.SetRange("No.", "Purch. Inv. Line"."Document No.");
                if PurchInvHdr.FindFirst then begin

                    Vend.Get(PurchInvHdr."Buy-from Vendor No.");
                    VendName := Vend.Name;
                    DocType := 'Invoice';
                    VendInvNo := PurchInvHdr."Vendor Invoice No.";
                end;

                tot := "Purch. Inv. Line".Amount;
                gst := (CGST + SGST + IGST);
                tds := TDSAmt;//Naveen
                //  gst := "Purch. Inv. Line"."Total GST Amount";
                // tds := "Purch. Inv. Line"."TDS Amount";


                gross := tot + gst;
                net := gross - tds;
                tds := -1 * tds;
            end;
        }
        dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.") order(ascending) where(Type = filter("G/L Account"), "No." = const('410001'));
            column(ReportForNavId_1000000005; 1000000005)
            {
            }
            column(PostingDate_PurchCrMemoLine; Format("Purch. Cr. Memo Line"."Posting Date"))
            {
            }
            column(No_PurchCrMemoLine; "Purch. Cr. Memo Line"."No.")
            {
            }
            column(Amount_PurchCrMemoLine; ROUND("Purch. Cr. Memo Line".Amount, 0.01))
            {
            }
            column(Narration_PurchCrMemoLine; "Purch. Cr. Memo Line".Narration)
            {
            }
            column(Description_PurchCrMemoLine; "Purch. Cr. Memo Line".Description)
            {
            }
            column(DocumentNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."Document No.")
            {
            }
            column(ServiceDate_PurchCrMemoLine; Format("Purch. Inv. Line"."Service Date"))
            {
            }
            column(TotalGSTAmount_PurchCrMemoLine; '')// "Purch. Cr. Memo Line"."Total GST Amount"
            {
            }
            //Naveen
            column(BuyfromVendorNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."Buy-from Vendor No.")
            {
            }
            column(VendName1; VendName1)
            {
            }
            column(VendCrMemoNo; VendCrMemoNo)
            {
            }
            column(AmountToVendor_PurchCrMemoLine; "Purch. Cr. Memo Line"."Amount To Vendor")
            {
            }
            column(IntegrationDocNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."Integration Doc No")
            {
            }
            column(DocType1; DocType1)
            {
            }
            column(tot1; tot1)
            {
            }
            column(gst1; gst1)
            {
            }
            column(gross1; gross1)
            {
            }
            column(tds1; tds1)
            {
            }
            column(net1; "Purch. Cr. Memo Line"."Amount To Vendor")
            {
            }
            column(Narr1; "Purch. Cr. Memo Line".Narration)
            {
            }
            column(DataItem2Visible; DataItem2Visible)
            {
            }

            trigger OnAfterGetRecord()
            var
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

            begin
                tot1 := 0;
                gst1 := 0;
                gross1 := 0;
                tds1 := 0;
                net1 := 0;
                DataItem1Visible := false;
                DataItem2Visible := true;
                VendCrMemoNo := '';
                DocType1 := '';

                PurchCrMemoHdr.Reset;
                PurchCrMemoHdr.SetRange("No.", "Purch. Cr. Memo Line"."Document No.");
                if PurchCrMemoHdr.FindFirst then begin

                    Vend.Get(PurchCrMemoHdr."Buy-from Vendor No.");
                    VendName1 := Vend.Name;
                    DocType1 := 'Credit Memo';
                    VendCrMemoNo := PurchCrMemoHdr."Vendor Cr. Memo No.";
                end;

                tot1 := "Purch. Cr. Memo Line".Amount;
                gst1 := CGST + SGST + IGST;//Naveen

                // tot1 := "Purch. Cr. Memo Line".Amount;
                // gst1 := "Purch. Cr. Memo Line"."Total GST Amount";


                gross1 := tot1 + gst1;
                net1 := gross1;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Show Credit Note Data"; CreditNote)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            CreditNote := false;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompInfo.Get('');
        CompInfo.CalcFields(CompInfo.Picture);
        CompNm := CompInfo.Name;
        CompAddrs := CompInfo.Address + ' ' + CompInfo."Address 2";
        CompCityPostCode := CompInfo.City + '-' + CompInfo."Post Code";
        CINNo := CompInfo."CIN No.";
        DataItem1Visible := false;
        DataItem2Visible := false;
    end;

    var
        CompInfo: Record "Company Information";
        CompNm: Text[50];
        CompAddrs: Text[250];
        CompCityPostCode: Text[30];
        CINNo: Code[30];
        GLEntry: Record "G/L Entry";
        CreditNote: Boolean;
        DocServMaster: Record "Documentwise Service Master";
        VendName: Code[100];
        Vend: Record Vendor;
        VendCity: Text[30];
        PurchInvHdr: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
        VendInvNo: Code[35];
        VendName1: Code[100];
        VendCity1: Text[30];
        DocDate1: Date;
        DocDate: Date;
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        VendCrMemoNo: Code[35];
        DocType: Text[10];
        DocType1: Text[15];
        GrossInvTotal: Decimal;
        NetPaymnt: Decimal;
        tot: Decimal;
        gst: Decimal;
        gross: Decimal;
        tds: Decimal;
        net: Decimal;
        tot1: Decimal;
        gst1: Decimal;
        gross1: Decimal;
        tds1: Decimal;
        net1: Decimal;
        PurchCrMemoLine: Record "Purch. Cr. Memo Line";
        DataItem1Visible: Boolean;
        DataItem2Visible: Boolean;
    //Naveen

}

