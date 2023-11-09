// pageextension 50130 RoleCenterExt extends "Business Manager Role Center"
// {
//     layout
//     {
//         // Add changes to page layout here
//     }

//     actions
//     {
//         // Add changes to page actions here
//         addafter("Purchase Invoice")
//         {
//             action("Open XmlPage")
//             {
//                 RunObject = page RoleCenterXmlport;
//                 ApplicationArea = All;
//             }
//         }

//     }


//     var
//         myInt: Integer;
// }