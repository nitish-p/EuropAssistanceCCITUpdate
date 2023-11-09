Report 50057 "External Cost - Cr Note"
{
    // prdp
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/External Cost - Cr Note.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
        {
            DataItemTableView = where("Case No." = filter(<> ''), "Policy No." = filter(<> ''));
            RequestFilterFields = "Posting Date", "Buy-from Vendor No.";
            column(ReportForNavId_1000000010; 1000000010)
            {
            }
            column(CaseNo_PurchInvLine; "Purch. Cr. Memo Line"."Case No.")
            {
            }
            column(PostingDate_PurchInvLine; Format("Purch. Cr. Memo Line"."Posting Date"))
            {
            }
            column(No_PurchInvLine; "Purch. Cr. Memo Line"."No.")
            {
            }
            column(Amount_PurchInvLine; ROUND("Purch. Cr. Memo Line".Amount, 0.01))
            {
            }
            column(Narration_PurchInvLine; "Purch. Cr. Memo Line".Narration)
            {
            }
            column(Description_PurchInvLine; "Purch. Cr. Memo Line".Description)
            {
            }
            column(Quantity_PurchInvLine; "Purch. Cr. Memo Line".Quantity)
            {
            }
            column(DocumentNo_PurchInvLine; "Purch. Cr. Memo Line"."Document No.")
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
            column(CompServTaxRegNo; '')//Nkp
            {
            }
            column(CompPANNo; CompInfo."P.A.N. No.")
            {
            }
            column(PrintDetails; PrintDetails)
            {
            }
            column(NAVCustomer_DocumentwiseServiceMaster; "Purch. Cr. Memo Line"."NAV Customer")
            {
            }
            column(NAVCustomerName_DocumentwiseServiceMaster; CustName)
            {
            }
            column(VehicleRegnNo_DocumentwiseServiceMaster; "Purch. Cr. Memo Line".VRN)
            {
            }
            column(VehicleIdentificationNo_DocumentwiseServiceMaster; "Purch. Cr. Memo Line".VIN)
            {
            }
            column(ServiceID_PurchInvLine; "Purch. Cr. Memo Line"."Service ID")
            {
            }
            column(ServiceDate_PurchInvLine; Format("Purch. Cr. Memo Line"."Service Date"))
            {
            }
            column(TotalGSTAmount_PurchInvLine; '')//"Purch. Cr. Memo Line"."Total GST Amount"//Nkp
            {
            }
            column(BuyfromVendorNo_PurchInvLine; "Purch. Cr. Memo Line"."Buy-from Vendor No.")
            {
            }
            column(VendName; VendName)
            {
            }
            column(DocDate; Format(DocDate))
            {
            }
            column(VendCity; VendCity)
            {
            }
            column(Narr; Narr)
            {
            }
            column(VendInvNo; VendInvNo)
            {
            }
            column(PolicyNo_PurchInvLine; "Purch. Cr. Memo Line"."Policy No.")
            {
            }
            column(BaseFare; BaseFare)
            {
            }
            column(AddlFare; AddlFare)
            {
            }
            column(AmountToVendor_PurchInvLine; "Purch. Cr. Memo Line"."Amount To Vendor")
            {
            }
            column(PaymentDate; Format(PaymentDate))
            {
            }
            column(Remarks; Remarks)
            {
            }
            column(IntegrationDocNo_PurchInvLine; "Purch. Cr. Memo Line"."Integration Doc No")
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
            column(net; net)
            {
            }
            column(Discount; Discount)
            {
            }
            column(DRSA; DRSA)
            {
            }
            column(SLA; SLA)
            {
            }
            column(CSAT; CSAT)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Taxinfo.GetTaxInfo(PurchInvLine.RecordId, GSTBaseAmt, TDSBaseAmt, TDSAmt, IGST, SGST, CGST, IGSTPer, SGSTPer, CGSTPer);//Nkp
                if (("Purch. Cr. Memo Line"."No." = '140042')
                  or ("Purch. Cr. Memo Line"."No." = '410013')
                  or ("Purch. Cr. Memo Line"."No." = '410014')
                  or ("Purch. Cr. Memo Line"."No." = '410015')
                  or ("Purch. Cr. Memo Line"."No." = '410016')) then
                    CurrReport.Skip;

                //IF "Purch. Cr. Memo Line"."No." = 'TOLL' THEN
                //CurrReport.SKIP;


                tot := 0;
                gst := 0;
                gross := 0;
                tds := 0;
                net := 0;
                Discount := 0;
                DRSA := 0;
                SLA := 0;
                CSAT := 0;

                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."Document No.", "Purch. Cr. Memo Line"."Document No.");
                GLEntry.SetFilter(GLEntry."G/L Account No.", '%1', '410001');
                if not GLEntry.FindFirst then begin
                    CurrReport.Skip;
                end;

                Remarks := '';
                CustName := '';
                if "Purch. Cr. Memo Line"."NAV Customer" = '' then begin
                    Remarks := 'Policy no is not present in document service master';
                end else begin
                    customer.Reset;
                    customer.SetRange("No.", "Purch. Cr. Memo Line"."NAV Customer");
                    if customer.FindFirst then begin
                        CustName := customer.Name;
                    end;
                end;

                VendCity := '';
                VendName := '';
                DocDate := 0D;
                Narration := '';
                VendInvNo := '';
                DocType := '';

                PurchInvHdr.Reset;
                PurchInvHdr.SetRange("No.", "Purch. Cr. Memo Line"."Document No.");
                if PurchInvHdr.FindFirst then begin

                    Vend.Get(PurchInvHdr."Buy-from Vendor No.");
                    VendName := Vend.Name;
                    VendCity := Vend.City;
                    DocType := 'Invoice';
                    DocDate := PurchInvHdr."Document Date";
                    VendInvNo := PurchInvHdr."Reference Invoice Number";
                end;

                // for narration +++
                Narr := '';

                PurchInvLine.Reset;
                PurchInvLine.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                PurchInvLine.SetRange("No.", "Purch. Cr. Memo Line"."No.");
                PurchInvLine.SetRange("Case No.", "Purch. Cr. Memo Line"."Case No.");
                if PurchInvLine.FindFirst then begin
                    Narr := PurchInvLine.Narration;
                end;

                if Narr = '' then begin
                    PurchInvLine.Reset;
                    PurchInvLine.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    PurchInvLine.SetFilter(Narration, '<>%1', '');
                    if PurchInvLine.FindFirst then begin
                        Narr := PurchInvLine.Narration;
                    end;
                end;
                // for narration ---


                BaseFare := 0;
                AddlFare := 0;

                PurchPrice.Reset;
                PurchPrice.SetRange("Source No.", "Purch. Cr. Memo Line"."Buy-from Vendor No.");
                PurchPrice.SetRange("Asset No.", "Purch. Cr. Memo Line"."No.");
                PurchPrice.SetRange("Unit of Measure Code", '');
                PurchPrice.SetFilter("Base Qty", '<>%1', 0);
                if PurchPrice.FindFirst then begin
                    BaseFare := PurchPrice."Base Amount";

                    if "Purch. Cr. Memo Line".Quantity > PurchPrice."Base Qty" then begin
                        AddlFare := ("Purch. Cr. Memo Line".Quantity - PurchPrice."Base Qty") * PurchPrice."Direct Unit Cost";
                    end;

                end;

                PaymentDate := 0D;

                VLE1.Reset;
                VLE1.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                VLE1.SetRange(Open, false);
                if VLE1.FindFirst then begin
                    VLE2.Reset;
                    VLE2.SetRange("Entry No.", VLE1."Closed by Entry No.");
                    if VLE2.FindFirst then begin
                        BALE.Reset;
                        BALE.SetRange("Document No.", VLE2."Document No.");
                        if BALE.FindLast then begin
                            PaymentDate := BALE."Posting Date";
                        end;
                    end;
                end;

                if PaymentDate = 0D then begin
                    VLE1.Reset;
                    VLE1.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    VLE1.SetRange(Open, true);
                    if VLE1.FindFirst then begin
                        VLE2.Reset;
                        VLE2.SetRange("Closed by Entry No.", VLE1."Entry No.");
                        if VLE2.FindFirst then begin
                            BALE.Reset;
                            BALE.SetRange("Document No.", VLE2."Document No.");
                            if BALE.FindLast then begin
                                PaymentDate := BALE."Posting Date";
                            end;
                        end;
                    end;
                end;

                // gc ppc +++
                tot := "Purch. Cr. Memo Line".Amount;
                gst := (CGST + SGST + IGST + TDSAmt);//Nkp
                // gst := "Purch. Cr. Memo Line"."Total GST Amount";
                //tds:="Purch. Cr. Memo Line"."TDS Amount";

                if "Purch. Cr. Memo Line"."Primary Line" = true then begin

                    PurchInvLine.Reset;
                    PurchInvLine.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    PurchInvLine.SetRange("Service ID", "Purch. Cr. Memo Line"."Service ID");
                    PurchInvLine.SetFilter("No.", '=%1', '410013');
                    if PurchInvLine.FindFirst then begin
                        Discount := PurchInvLine.Amount;
                        tot := tot + PurchInvLine.Amount;
                        gst := gst + (CGST + SGST + IGST + TDSAmt);
                        //gst := gst + PurchInvLine."Total GST Amount";//Nkp
                        //tds:=tds+PurchInvLine."TDS Amount";
                    end;
                    PurchInvLine.Reset;
                    PurchInvLine.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    PurchInvLine.SetRange("Service ID", "Purch. Cr. Memo Line"."Service ID");
                    PurchInvLine.SetFilter("No.", '=%1', '410014');
                    if PurchInvLine.FindFirst then begin
                        DRSA := PurchInvLine.Amount;
                        tot := tot + PurchInvLine.Amount;
                        gst := gst + (CGST + SGST + IGST + TDSAmt);
                        // gst := gst + PurchInvLine."Total GST Amount";//Nkp
                        //tds:=tds+PurchInvLine."TDS Amount";
                    end;
                    PurchInvLine.Reset;
                    PurchInvLine.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    PurchInvLine.SetRange("Service ID", "Purch. Cr. Memo Line"."Service ID");
                    PurchInvLine.SetFilter("No.", '=%1', '410015');
                    if PurchInvLine.FindFirst then begin
                        SLA := PurchInvLine.Amount;
                        tot := tot + PurchInvLine.Amount;
                        gst := gst + (CGST + SGST + IGST + TDSAmt);//Nkp
                                                                   // gst := gst + PurchInvLine."Total GST Amount";//Nkp
                                                                   //tds:=tds+PurchInvLine."TDS Amount";
                    end;
                    PurchInvLine.Reset;
                    PurchInvLine.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
                    PurchInvLine.SetRange("Service ID", "Purch. Cr. Memo Line"."Service ID");
                    PurchInvLine.SetFilter("No.", '=%1', '410016');
                    if PurchInvLine.FindFirst then begin
                        CSAT := PurchInvLine.Amount;
                        tot := tot + PurchInvLine.Amount;
                        gst := gst + (CGST + SGST + IGST + TDSAmt);//Nkp
                        // gst := gst + PurchInvLine."Total GST Amount";//Nkp
                        //tds:=tds+PurchInvLine."TDS Amount";
                    end;

                end;

                gross := tot + gst;
                net := gross;//-tds;
                tds := -1 * tds;
                // gc ppc ---
            end;

            trigger OnPreDataItem()
            begin
                //"Purch. Cr. Memo Line".SETFILTER("Purch. Cr. Memo Line"."No.",'<>%1|<>%2|<>%3|<>%4','410013','410014','410015','410016');
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

        trigger OnOpenPage()
        begin
            PrintDetails := true;
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
    end;

    var
        CompInfo: Record "Company Information";
        CompNm: Text[50];
        CompAddrs: Text[250];
        CompCityPostCode: Text[30];
        CINNo: Code[30];
        GLEntry: Record "G/L Entry";
        PrintDetails: Boolean;
        DocServMaster: Record "Documentwise Service Master";
        CustNo: Code[20];
        CustName: Text[75];
        VRN: Code[50];
        VIN: Code[50];
        City: Text[30];
        PolNo: Text[50];
        VendName: Code[100];
        Vend: Record Vendor;
        VendCity: Text[30];
        PurchInvHdr: Record "Purch. Cr. Memo Hdr.";
        Narr: Text[250];
        PurchInvLine: Record "Purch. Cr. Memo Line";
        VendInvNo: Code[35];
        PurchPrice: Record "Price list line";
        BaseFare: Decimal;
        AddlFare: Decimal;
        VLE1: Record "Vendor Ledger Entry";
        VLE2: Record "Vendor Ledger Entry";
        BALE: Record "Bank Account Ledger Entry";
        PaymentDate: Date;
        Remarks: Text[100];
        customer: Record Customer;
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
        Discount: Decimal;
        DRSA: Decimal;
        SLA: Decimal;
        CSAT: Decimal;
        Discount1: Decimal;
        DRSA1: Decimal;
        SLA1: Decimal;
        CSAT1: Decimal;
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

