// xmlport 50014 "Rate Matrix Export"
// {
//     Direction = Export;
//     FileName = 'RateMatrix.csv';
//     Format = VariableText;

//     schema
//     {
//         textelement(Root)
//         {
//             tableelement(Integer; Integer)
//             {
//                 XmlName = 'PurchPriceHedaer';
//                 SourceTableView = SORTING(Number)
//                                   WHERE(Number = CONST(1));
//                 textelement(VendorNo)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         VendorNo := "Purchase Price".FIELDCAPTION("Purchase Price"."Vendor No.");
//                     end;
//                 }
//                 textelement(VendorName)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         VendorName := "Purchase Price".FIELDCAPTION("Purchase Price"."Vendor Name");
//                     end;
//                 }
//                 textelement(ItemNo)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         ItemNo := "Purchase Price".FIELDCAPTION("Purchase Price"."Item No.");
//                     end;
//                 }
//                 textelement(UnitofMeasureCode)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         UnitofMeasureCode := "Purchase Price".FIELDCAPTION("Purchase Price"."Unit of Measure Code");
//                     end;
//                 }
//                 textelement(BaseQty)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         BaseQty := "Purchase Price".FIELDCAPTION("Purchase Price"."Base Qty");
//                     end;
//                 }
//                 textelement(BaseAmount)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         BaseAmount := "Purchase Price".FIELDCAPTION("Purchase Price"."Base Amount");
//                     end;
//                 }
//                 textelement(MinimumQuantity)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         MinimumQuantity := "Purchase Price".FIELDCAPTION("Purchase Price"."Minimum Quantity");
//                     end;
//                 }
//                 textelement(DirectUnitCost)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         DirectUnitCost := "Purchase Price".FIELDCAPTION("Purchase Price"."Direct Unit Cost");
//                     end;
//                 }
//                 textelement(StartingDate)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         StartingDate := "Purchase Price".FIELDCAPTION("Purchase Price"."Starting Date");
//                     end;
//                 }
//                 textelement(EndingDate)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         EndingDate := "Purchase Price".FIELDCAPTION("Purchase Price"."Ending Date");
//                     end;
//                 }
//                 textelement(CurrencyCode)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         CurrencyCode := "Purchase Price".FIELDCAPTION("Purchase Price"."Currency Code");
//                     end;
//                 }
//                 textelement(VariantCode)
//                 {

//                     trigger OnBeforePassVariable()
//                     begin
//                         VariantCode := "Purchase Price".FIELDCAPTION("Purchase Price"."Variant Code");
//                     end;
//                 }
//             }
//             tableelement("Purchase Price"; "Purchase Price")
//             {
//                 RequestFilterFields = Field4, Field15, Field2, Field1;
//                 XmlName = 'PurchasePrice';
//                 fieldelement(VendorNo; "Purchase Price"."Vendor No.")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(VendorName; "Purchase Price"."Vendor Name")
//                 {
//                 }
//                 fieldelement(ItemNo; "Purchase Price"."Item No.")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(UnitofMeasureCode; "Purchase Price"."Unit of Measure Code")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(BaseQty; "Purchase Price"."Base Qty")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(BaseAmount; "Purchase Price"."Base Amount")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(MinimumQuantity; "Purchase Price"."Minimum Quantity")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(DirectUnitCost; "Purchase Price"."Direct Unit Cost")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(StartingDate; "Purchase Price"."Starting Date")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(EndingDate; "Purchase Price"."Ending Date")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(CurrencyCode; "Purchase Price"."Currency Code")
//                 {
//                     FieldValidate = Yes;
//                 }
//                 fieldelement(VariantCode; "Purchase Price"."Variant Code")
//                 {
//                 }
//             }
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

//     var
//         i: Integer;
// }

