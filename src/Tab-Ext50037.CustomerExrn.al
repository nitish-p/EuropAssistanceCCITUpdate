// tableextension 50037 CustomerExrn extends Customer
// {
//     fields
//     {
//         modify("Dealer Code")
//         {
//             trigger OnAfterValidate()
//             var
//             recCustomer:Record Customer;
//                 myInt: Integer;
//             begin
//                 if ((UpperCase(Type) = 'DEALER') and ("Dealer Id" <> 0)) then begin  // type customer begin

//                     recCustomer.Reset;
//                     recCustomer.SetRange("Dealer Code", "Dealer Code");
//                     if recCustomer.FindFirst then begin  // rec customer begin
//                         Response := Response + 'DealerCodeAlredyCreatedInNAV,';
//                         "Error Flag" := true;
//                     end;

//                 end;
//         }
//     }
// }
