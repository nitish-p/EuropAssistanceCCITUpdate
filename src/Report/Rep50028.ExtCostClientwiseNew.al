Report 50028 "Ext. Cost -Client wise New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Ext. Cost -Client wise New.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            DataItemTableView = where("Case No." = filter(<> ''), "Policy No." = filter(<> ''));
            RequestFilterFields = "Posting Date", "Buy-from Vendor No.";
            column(ReportForNavId_1000000010; 1000000010)
            {
            }
            column(CaseNo_PurchInvLine; "Purch. Inv. Line"."Case No.")
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
            column(Quantity_PurchInvLine; "Purch. Inv. Line".Quantity)
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
            column(CompServTaxRegNo; '')//CompInfo."Service Tax Registration No."//Naveen
            {
            }
            column(CompPANNo; CompInfo."P.A.N. No.")
            {
            }
            column(PrintDetails; PrintDetails)
            {
            }
            column(NAVCustomer_DocumentwiseServiceMaster; "Purch. Inv. Line"."NAV Customer")
            {
            }
            column(NAVCustomerName_DocumentwiseServiceMaster; CustName)
            {
            }
            column(VehicleRegnNo_DocumentwiseServiceMaster; "Purch. Inv. Line".VRN)
            {
            }
            column(VehicleIdentificationNo_DocumentwiseServiceMaster; "Purch. Inv. Line".VIN)
            {
            }
            column(ServiceID_PurchInvLine; "Purch. Inv. Line"."Service ID")
            {
            }
            column(ServiceDate_PurchInvLine; Format("Purch. Inv. Line"."Service Date"))
            {
            }
            column(TotalGSTAmount_PurchInvLine; '')//"Purch. Inv. Line"."Total GST Amount"
            {
            }
            column(BuyfromVendorNo_PurchInvLine; "Purch. Inv. Line"."Buy-from Vendor No.")
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
            column(PolicyNo_PurchInvLine; "Purch. Inv. Line"."Policy No.")
            {
            }
            column(TDSAmount_PurchInvLine; '')//"Purch. Inv. Line"."TDS Amount"
            {
            }
            column(BaseFare; BaseFare)
            {
            }
            column(AddlFare; AddlFare)
            {
            }
            column(AmountToVendor_PurchInvLine; "Purch. Inv. Line"."Amount To Vendor")
            {
            }
            column(PaymentDate; Format(PaymentDate))
            {
            }
            column(Remarks; Remarks)
            {
            }
            column(IntegrationDocNo_PurchInvLine; "Purch. Inv. Line"."Integration Doc No")
            {
            }
            column(DocType; DocType)
            {
            }
            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {
                DataItemLink = "Case No." = field("Case No."), "Buy-from Vendor No." = field("Buy-from Vendor No."), "No." = field("No.");
                column(ReportForNavId_1000000008; 1000000008)
                {
                }
                column(LineAmount_PurchCrMemoLine; "Purch. Cr. Memo Line"."Line Amount")
                {
                }
                column(BuyfromVendorNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."Buy-from Vendor No.")
                {
                }
                column(DocumentNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."Document No.")
                {
                }
                column(No_PurchCrMemoLine; "Purch. Cr. Memo Line"."No.")
                {
                }
                column(Description_PurchCrMemoLine; "Purch. Cr. Memo Line".Description)
                {
                }
                column(UnitofMeasure_PurchCrMemoLine; "Purch. Cr. Memo Line"."Unit of Measure")
                {
                }
                column(Quantity_PurchCrMemoLine; "Purch. Cr. Memo Line".Quantity)
                {
                }
                column(DirectUnitCost_PurchCrMemoLine; "Purch. Cr. Memo Line"."Direct Unit Cost")
                {
                }
                column(Amount_PurchCrMemoLine; "Purch. Cr. Memo Line".Amount)
                {
                }
                column(CaseNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."Case No.")
                {
                }
                column(PolicyNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."Policy No.")
                {
                }
                column(ServiceID_PurchCrMemoLine; "Purch. Cr. Memo Line"."Service ID")
                {
                }
                column(ServiceDate_PurchCrMemoLine; Format("Purch. Cr. Memo Line"."Service Date"))
                {
                }
                column(NAVCustomer_PurchCrMemoLine; "Purch. Cr. Memo Line"."NAV Customer")
                {
                }
                column(TotalGSTAmount_PurchCrMemoLine; '')//"Purch. Cr. Memo Line"."Total GST Amount"//Naveen
                {
                }
                column(PostingDate_PurchCrMemoLine; Format("Purch. Cr. Memo Line"."Posting Date"))
                {
                }
                column(VendName1; VendName1)
                {
                }
                column(VendCity1; VendCity1)
                {
                }
                column(DocDate1; Format(DocDate1))
                {
                }
                column(VendCrMemoNo; VendCrMemoNo)
                {
                }
                column(VRNNo_PurchCrMemoLine; "Purch. Cr. Memo Line"."VRN No.")
                {
                }
                column(VIN_PurchCrMemoLine; "Purch. Cr. Memo Line".VIN)
                {
                }
                column(VRN_PurchCrMemoLine; "Purch. Cr. Memo Line".VRN)
                {
                }
                column(Narration_PurchCrMemoLine; "Purch. Cr. Memo Line".Narration)
                {
                }
                column(AmountToVendor_PurchCrMemoLine; "Purch. Cr. Memo Line"."Amount To Vendor")
                {
                }
                column(DocType1; DocType1)
                {
                }
                column(GrossInvTotal; GrossInvTotal)
                {
                }
                column(NetPaymnt; NetPaymnt)
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
                    VendCity1 := '';
                    VendName1 := '';
                    DocDate1 := 0D;
                    VendCrMemoNo := '';
                    DocType1 := '';
                    GrossInvTotal := 0;
                    NetPaymnt := 0;

                    PurchCrMemoHdr.Reset;
                    PurchCrMemoHdr.SetRange("No.", "Purch. Cr. Memo Line"."Document No.");
                    if PurchCrMemoHdr.FindFirst then begin

                        Vend.Get(PurchCrMemoHdr."Buy-from Vendor No.");
                        VendName1 := Vend.Name;
                        VendCity1 := Vend.City;
                        DocType1 := 'Credit Memo';
                        DocDate1 := PurchCrMemoHdr."Document Date";
                        VendCrMemoNo := PurchCrMemoHdr."Vendor Cr. Memo No.";
                    end;

                    //GrossInvTotal := -("Purch. Cr. Memo Line".Amount + "Purch. Cr. Memo Line"."Total GST Amount");//Naveen
                    GrossInvTotal := -("Purch. Cr. Memo Line".Amount + (CGST + SGST + IGST));
                    NetPaymnt := -"Purch. Cr. Memo Line"."Amount To Vendor"
                end;
            }

            trigger OnAfterGetRecord()
            begin

                if "Purch. Inv. Line"."No." = '140042' then
                    CurrReport.Skip;

                //IF "Purch. Inv. Line"."No." = 'TOLL' THEN
                //CurrReport.SKIP;

                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."Document No.", "Purch. Inv. Line"."Document No.");
                GLEntry.SetFilter(GLEntry."G/L Account No.", '%1', '410001');
                if not GLEntry.FindFirst then begin
                    CurrReport.Skip;
                end;

                Remarks := '';
                CustName := '';
                if "Purch. Inv. Line"."NAV Customer" = '' then begin
                    Remarks := 'Policy no is not present in document service master';
                end else begin
                    customer.Reset;
                    customer.SetRange("No.", "Purch. Inv. Line"."NAV Customer");
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
                PurchInvHdr.SetRange("No.", "Purch. Inv. Line"."Document No.");
                if PurchInvHdr.FindFirst then begin

                    Vend.Get(PurchInvHdr."Buy-from Vendor No.");
                    VendName := Vend.Name;
                    VendCity := Vend.City;
                    DocType := 'Invoice';
                    DocDate := PurchInvHdr."Document Date";
                    VendInvNo := PurchInvHdr."Vendor Invoice No.";
                end;

                // for narration +++
                Narr := '';

                PurchInvLine.Reset;
                PurchInvLine.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
                PurchInvLine.SetRange("No.", "Purch. Inv. Line"."No.");
                PurchInvLine.SetRange("Case No.", "Purch. Inv. Line"."Case No.");
                if PurchInvLine.FindFirst then begin
                    Narr := PurchInvLine.Narration;
                end;

                if Narr = '' then begin
                    PurchInvLine.Reset;
                    PurchInvLine.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
                    PurchInvLine.SetFilter(Narration, '<>%1', '');
                    if PurchInvLine.FindFirst then begin
                        Narr := PurchInvLine.Narration;
                    end;
                end;
                // for narration ---


                BaseFare := 0;
                AddlFare := 0;

                PurchPrice.Reset;
                PurchPrice.SetRange("Source Type", PurchPrice."Source Type"::Vendor);
                PurchPrice.SetRange("Source No.", "Purch. Inv. Line"."Buy-from Vendor No.");
                PurchPrice.SetRange("Asset No.", "Purch. Inv. Line"."No.");
                PurchPrice.SetRange("Unit of Measure Code", '');
                PurchPrice.SetFilter("Base Qty", '<>%1', 0);
                if PurchPrice.FindFirst then begin
                    BaseFare := PurchPrice."Base Amount";

                    if "Purch. Inv. Line".Quantity > PurchPrice."Base Qty" then begin
                        AddlFare := ("Purch. Inv. Line".Quantity - PurchPrice."Base Qty") * PurchPrice."Direct Unit Cost";
                    end;

                end;

                PaymentDate := 0D;

                VLE1.Reset;
                VLE1.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
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
                    VLE1.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
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
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Print Details"; PrintDetails)
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
        PurchInvHdr: Record "Purch. Inv. Header";
        Narr: Text[250];
        PurchInvLine: Record "Purch. Inv. Line";
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
}

