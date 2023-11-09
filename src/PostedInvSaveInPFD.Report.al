// Report 50109 "Posted Inv Save In PFD"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Posted Inv Save In PFD.rdl';

//     dataset
//     {
//         dataitem(UnknownTable50024;UnknownTable50024)
//         {
//             column(ReportForNavId_1000000000; 1000000000)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Filename :='';
//                 ReturnValue := false;
//                 RecSIH.Reset;
//                 RecSIH.SetRange(RecSIH."No.","Temp Table"."No.");
//                 if RecSIH.FindFirst then
//                 begin

//                    Report.RunModal(50110,false,false,RecSIH);

//                    //Filename := 'D:\Digital Signature\Sales Invoices\'+'Invoice_' + CONVERTSTR(RecSIH."No.",'/','-') + '.pdf';
//                    //REPORT.SAVEASPDF(50108,Filename,RecSIH);
//                 end;
//             end;

//             trigger OnPostDataItem()
//             begin
//                 Message('Done....');
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

//     var
//         RecSIH: Record "Sales Invoice Header";
//         Filename: Text;
//         ReturnValue: Boolean;
//        // R50108: Report BarcPurchaseOrder;
// }

