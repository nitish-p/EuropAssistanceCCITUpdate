// Report 50112 "Update Filename TranAPI"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Update Filename TranAPI.rdl';

//     dataset
//     {
//         dataitem(UnknownTable50024;UnknownTable50024)
//         {
//             column(ReportForNavId_1000000000; 1000000000)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 //ESIGN_86088
//                 //Esign_35521_signed.pdf

//                 TempStr1 :='';
//                 TempStr2 :='';
//                 RecTransAPI.Reset;
//                 RecTransAPI.SetRange(RecTransAPI."Transaction No.","Temp Table"."No.");
//                 if RecTransAPI.FindSet then
//                   repeat
//                      if RecTransAPI."File Name" = '' then
//                      begin
//                         TempStr1 := CopyStr(RecTransAPI."Transaction No.",7);
//                         TempStr2 := 'Esign_'+TempStr1+'_signed.pdf';
//                         //MESSAGE('%1   %2',TempStr1,TempStr2);
//                         RecTransAPI."File Name" := TempStr2;
//                         RecTransAPI.Modify;
//                      end;
//                   until RecTransAPI.Next=0;

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

//     trigger OnPostReport()
//     begin
//         Message('Done...');
//     end;

//     var
//         RecTransAPI: Record "Transaction API";
//         TempStr1: Text;
//         TempStr2: Text;
// }

