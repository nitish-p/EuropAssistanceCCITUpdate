// Report 50007 "RCM Report"
// {
//     // prdp 22022017
//     // created new report for RCM
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/RCM Report.rdl';


//     dataset
//     {
//         dataitem(UnknownTable16473;UnknownTable16473)
//         {
//             DataItemTableView = where(Type=const(Purchase),"Service Tax Group Code"=filter(ADVOCATE|CONSULTANT|"IT SERVICE"|"MANPOWER RECRUIT"|"RENT A CAB"));
//             RequestFilterFields = "Posting Date","Service Tax Group Code","Party Code";
//             column(ReportForNavId_1000000000; 1000000000)
//             {
//             }
//             column(DocumentNo_ServiceTaxEntry;"Service Tax Entry"."Document No.")
//             {
//             }
//             column(PostingDate_ServiceTaxEntry;Format("Service Tax Entry"."Posting Date"))
//             {
//             }
//             column(ServiceTaxGroupCode_ServiceTaxEntry;"Service Tax Entry"."Service Tax Group Code")
//             {
//             }
//             column(PartyCode_ServiceTaxEntry;"Service Tax Entry"."Party Code")
//             {
//             }
//             column(ServiceTaxBaseAmount_ServiceTaxEntry;"Service Tax Entry"."Service Tax Base Amount")
//             {
//             }
//             column(ServiceTaxAmount_ServiceTaxEntry;"Service Tax Entry"."Service Tax Amount")
//             {
//             }
//             column(AmountIncludingServiceTax_ServiceTaxEntry;"Service Tax Entry"."Amount Including Service Tax")
//             {
//             }
//             column(ServiceTax_ServiceTaxEntry;"Service Tax Entry"."Service Tax %")
//             {
//             }
//             column(GLAccountNo_ServiceTaxEntry;"Service Tax Entry"."G/L Account No.")
//             {
//             }
//             column(CINNo;CINNo)
//             {
//             }
//             column(CompCityPostCode;CompCityPostCode)
//             {
//             }
//             column(CompAddrs;CompAddrs)
//             {
//             }
//             column(CompNm;CompNm)
//             {
//             }
//             column(CompInfoPicture;CompInfo.Picture)
//             {
//             }
//             column(CompServTaxRegNo;CompInfo."Service Tax Registration No.")
//             {
//             }
//             column(CompPANNo;CompInfo."P.A.N. No.")
//             {
//             }
//             column(PrintDetails;PrintDetails)
//             {
//             }
//             column(DateFilter;DateFilter)
//             {
//             }
//             column(VendorName;VendorName)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Vendor.Get("Service Tax Entry"."Party Code");
//                 VendorName:=Vendor.Name;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 VendorName:='';
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         CompInfo.Get('');
//         CompInfo.CalcFields(CompInfo.Picture);
//         CompNm:=CompInfo.Name;
//         CompAddrs:=CompInfo.Address+' ' +CompInfo."Address 2";
//         CompCityPostCode:=CompInfo.City+'-'+CompInfo."Post Code";
//         CINNo:=CompInfo."CIN No.";
//     end;

//     var
//         CompInfo: Record "Company Information";
//         CompNm: Text[50];
//         CompAddrs: Text[250];
//         CompCityPostCode: Text[30];
//         CINNo: Code[30];
//         GLEntry: Record "G/L Entry";
//         PrintDetails: Boolean;
//         DateFilter: Text[30];
//         VendorName: Text[100];
//         Vendor: Record Vendor;
// }

