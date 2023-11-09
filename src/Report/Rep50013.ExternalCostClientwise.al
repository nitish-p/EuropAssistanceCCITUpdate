Report 50013 "External Cost Client wise"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/External Cost Client wise.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            DataItemTableView = where("Policy No." = filter(<> ''), "Case No." = filter(<> ''));
            RequestFilterFields = "Posting Date";
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
            column(CompServTaxRegNo; '')//CompInfo."Service Tax Registration No."
            {
            }
            //Naveen
            column(CompPANNo; CompInfo."P.A.N. No.")
            {
            }
            column(PrintDetails; PrintDetails)
            {
            }
            column(IntegrationDocNo_PurchInvLine; "Purch. Inv. Line"."Integration Doc No")
            {
            }
            column(VehicleIdentificationNo_PurchInvLine; "Purch. Inv. Line"."Vehicle Identification No.")
            {
            }
            column(Narration_PurchInvLine; "Purch. Inv. Line".Narration)
            {
            }
            column(PolicyNo_PurchInvLine; "Purch. Inv. Line"."Policy No.")
            {
            }
            column(VRNNo_PurchInvLine; "Purch. Inv. Line"."VRN No.")
            {
            }
            column(DepartmentCode_PurchInvLine; "Purch. Inv. Line"."Department Code")
            {
            }
            column(ServiceID_PurchInvLine; "Purch. Inv. Line"."Service ID")
            {
            }
            column(ServiceDate_PurchInvLine; Format("Purch. Inv. Line"."Service Date"))
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
            column(Narration; Narration)
            {
            }
            column(VendInvNo; VendInvNo)
            {
            }
            dataitem("Documentwise Service Master"; "Documentwise Service Master")
            {
                DataItemLink = "Purchase Doc No" = field("Integration Doc No"), "Purchase Doc Line No" = field("Line No."), "Policy No/OEM Inv/Ref No" = field("Policy No."), "Case No" = field("Case No.");
                DataItemTableView = where("Purchase Doc No" = filter(<> ''), "Case No" = filter(<> ''));
                column(ReportForNavId_1000000011; 1000000011)
                {
                }
                column(NAVCustomer_DocumentwiseServiceMaster; "Documentwise Service Master"."NAV Customer")
                {
                }
                column(NAVCustomerName_DocumentwiseServiceMaster; "Documentwise Service Master"."NAV Customer Name")
                {
                }
                column(VehicleRegnNo_DocumentwiseServiceMaster; "Documentwise Service Master"."Vehicle Regn No")
                {
                }
                column(VehicleIdentificationNo_DocumentwiseServiceMaster; "Documentwise Service Master"."Vehicle Identification No")
                {
                }
                column(City_DocumentwiseServiceMaster; "Documentwise Service Master".City)
                {
                }
                column(PolicyNoOEMInvRefNo_DocumentwiseServiceMaster; "Documentwise Service Master"."Policy No/OEM Inv/Ref No")
                {
                }
                column(CaseNo_DocumentwiseServiceMaster; "Documentwise Service Master"."Case No")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                if "Purch. Inv. Line"."No." = '140042' then
                    CurrReport.Skip;

                if "Purch. Inv. Line"."Case No." = '' then
                    CurrReport.Skip;

                GLEntry.Reset;
                GLEntry.SetRange(GLEntry."Document No.", "Purch. Inv. Line"."Document No.");
                GLEntry.SetFilter(GLEntry."G/L Account No.", '%1', '410001');
                if not GLEntry.FindFirst then begin
                    CurrReport.Skip;
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
                PurchInvLine.SetRange(Narration, '<>%1', '');
                if PurchInvLine.FindFirst then begin
                    Narration := PurchInvLine.Narration;
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
        VendName: Code[100];
        Vend: Record Vendor;
        VendCity: Text[30];
        PurchInvHdr: Record "Purch. Inv. Header";
        DocDate: Date;
        Narration: Text[250];
        PurchInvLine: Record "Purch. Inv. Line";
        VendInvNo: Code[30];
}

