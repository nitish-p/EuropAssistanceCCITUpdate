Report 50004 "External Cost -Client wise"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/External Cost -Client wise.rdl';
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
            // column(CompServTaxRegNo;CompInfo."Service Tax Registration No.")
            // {
            // }
            //Naveen
            column(CompPANNo; CompInfo."P.A.N. No.")
            {
            }
            column(PrintDetails; PrintDetails)
            {
            }
            column(NAVCustomer_DocumentwiseServiceMaster; CustNo)
            {
            }
            column(NAVCustomerName_DocumentwiseServiceMaster; CustName)
            {
            }
            column(VehicleRegnNo_DocumentwiseServiceMaster; VRN)
            {
            }
            column(VehicleIdentificationNo_DocumentwiseServiceMaster; VIN)
            {
            }
            column(City_DocumentwiseServiceMaster; City)
            {
            }
            column(PolicyNoOEMInvRefNo_DocumentwiseServiceMaster; PolNo)
            {
            }
            column(ServiceID_PurchInvLine; "Purch. Inv. Line"."Service ID")
            {
            }
            column(ServiceDate_PurchInvLine; Format("Purch. Inv. Line"."Service Date"))
            {
            }
            // column(TotalGSTAmount_PurchInvLine;"Purch. Inv. Line"."Total GST Amount")
            // {
            // }
            //Naveen
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
            column(Narration_PurchInvLine; "Purch. Inv. Line".Narration)
            {
            }
            // column(TDSAmount_PurchInvLine;"Purch. Inv. Line"."TDS Amount")
            // {
            // }
            // Naveen
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

            trigger OnAfterGetRecord()
            begin

                if "Purch. Inv. Line"."No." = '140042' then
                    CurrReport.Skip;

                //IF "Purch. Inv. Line"."No." = 'TOLL' THEN
                //CurrReport.SKIP;

                //IF "Purch. Inv. Line"."Case No." = '' THEN
                //CurrReport.SKIP;

                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."Document No.", "Purch. Inv. Line"."Document No.");
                GLEntry.SetFilter(GLEntry."G/L Account No.", '%1', '410001');
                if not GLEntry.FindFirst then begin
                    CurrReport.Skip;
                end;

                CustNo := '';
                CustName := '';
                VRN := '';
                VIN := '';
                PolNo := '';
                City := '';
                Remarks := '';

                DocServMaster.Reset;
                DocServMaster.SetRange("Purchase Doc No", "Purch. Inv. Line"."Integration Doc No");
                DocServMaster.SetRange("Purchase Doc Line No", "Purch. Inv. Line"."Line No.");
                DocServMaster.SetRange("Policy No/OEM Inv/Ref No", "Purch. Inv. Line"."Policy No.");
                DocServMaster.SetRange(Cancelled, false);
                //DocServMaster.SETRANGE("Case No","Purch. Inv. Line"."Case No.");
                if DocServMaster.FindFirst then begin
                    CustNo := DocServMaster."NAV Customer";
                    CustName := DocServMaster."NAV Customer Name";
                    VRN := DocServMaster."Vehicle Regn No";
                    VIN := DocServMaster."Vehicle Identification No";
                    PolNo := DocServMaster."Policy No/OEM Inv/Ref No";
                    City := DocServMaster.City;
                end else begin
                    Remarks := 'Policy no is not present in document service master';
                    //CurrReport.SKIP;
                end;

                VendCity := '';
                VendName := '';
                DocDate := 0D;
                Narration := '';
                VendInvNo := '';

                PurchInvHdr.Reset;
                PurchInvHdr.SetRange("No.", "Purch. Inv. Line"."Document No.");
                if PurchInvHdr.FindFirst then begin

                    Vend.Get(PurchInvHdr."Buy-from Vendor No.");
                    VendName := Vend.Name;
                    VendCity := Vend.City;

                    DocDate := PurchInvHdr."Document Date";
                    VendInvNo := PurchInvHdr."Vendor Invoice No.";
                end;


                PurchInvLine.Reset;
                PurchInvLine.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
                PurchInvLine.SetFilter(Narration, '<>%1', '');
                if PurchInvLine.FindFirst then begin
                    Narr := PurchInvLine.Narration;
                end;



                BaseFare := 0;
                AddlFare := 0;

                PurchPrice.Reset;
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
        DocDate: Date;
        Narr: Text[250];
        PurchInvLine: Record "Purch. Inv. Line";
        VendInvNo: Code[30];
        PurchPrice: Record "Price list line";
        BaseFare: Decimal;
        AddlFare: Decimal;
        VLE1: Record "Vendor Ledger Entry";
        VLE2: Record "Vendor Ledger Entry";
        BALE: Record "Bank Account Ledger Entry";
        PaymentDate: Date;
        Remarks: Text[100];
}

