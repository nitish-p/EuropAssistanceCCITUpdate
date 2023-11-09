xmlport 50008 "Rate Matrix Upload"
{
    // prdp-19012017
    // 1. created new xmlport for rate matrix import.


    schema
    {
        textelement(Root)
        {
            tableelement("Purchase Price"; "Purchase Price")
            {
                XmlName = 'PurchasePrice';
                fieldelement(VendorNo; "Purchase Price"."Vendor No.")
                {
                    FieldValidate = Yes;
                }
                fieldelement(ItemNo; "Purchase Price"."Item No.")
                {
                    FieldValidate = Yes;
                }
                fieldelement(UnitofMeasureCode; "Purchase Price"."Unit of Measure Code")
                {
                    FieldValidate = Yes;
                }
                //Rushab++
                // fieldelement(BaseQty; "Purchase Price"."Base Qty")
                // {
                //     FieldValidate = Yes;
                // }
                // fieldelement(BaseAmount; "Purchase Price"."Base Amount")
                // {
                //     FieldValidate = Yes;
                // }
                //Rushab--
                fieldelement(MinimumQuantity; "Purchase Price"."Minimum Quantity")
                {
                    FieldValidate = Yes;
                }
                fieldelement(DirectUnitCost; "Purchase Price"."Direct Unit Cost")
                {
                    FieldValidate = Yes;
                }
                fieldelement(StartingDate; "Purchase Price"."Starting Date")
                {
                    FieldValidate = Yes;
                }
                fieldelement(EndingDate; "Purchase Price"."Ending Date")
                {
                    FieldValidate = Yes;
                }
                fieldelement(CurrencyCode; "Purchase Price"."Currency Code")
                {
                    FieldValidate = Yes;
                }
                fieldelement(VariantCode; "Purchase Price"."Variant Code")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    /*
                     EVALUATE(Evaluated_Vendor_No,Vendor_No);
                     "Purchase Price"."Vendor No." :=Evaluated_Vendor_No;
                     "Purchase Price".VALIDATE("Purchase Price"."Vendor No.",Evaluated_Vendor_No);

                     EVALUATE(Evaluated_Item_No,Item_No);
                     "Purchase Price"."Item No." :=Evaluated_Item_No;
                     "Purchase Price".VALIDATE("Purchase Price"."Item No.",Evaluated_Item_No);

                     EVALUATE(Evaluated_Unit_of_Measure_Code,Unit_of_Measure_Code);
                     "Purchase Price"."Unit of Measure Code" :=Evaluated_Unit_of_Measure_Code;
                     "Purchase Price".VALIDATE("Purchase Price"."Unit of Measure Code",Evaluated_Unit_of_Measure_Code);

                     EVALUATE(Evaluated_Base_Qty,Base_Qty);
                     "Purchase Price"."Base Qty" :=Evaluated_Base_Qty;
                     "Purchase Price".VALIDATE("Purchase Price"."Base Qty",Evaluated_Base_Qty);

                     EVALUATE(Evaluated_Base_Amount,Base_Amount);
                     "Purchase Price"."Base Amount" :=Evaluated_Base_Amount;
                     "Purchase Price".VALIDATE("Purchase Price"."Base Amount",Evaluated_Base_Amount);

                     EVALUATE(Evaluated_Minimum_Quantity,Minimum_Quantity);
                     "Purchase Price"."Minimum Quantity" :=Evaluated_Minimum_Quantity;
                     "Purchase Price".VALIDATE("Purchase Price"."Minimum Quantity",Evaluated_Minimum_Quantity);

                     EVALUATE(Evaluated_Direct_Unit_Cost,Direct_Unit_Cost);
                     "Purchase Price"."Direct Unit Cost" :=Evaluated_Direct_Unit_Cost;
                     "Purchase Price".VALIDATE("Purchase Price"."Direct Unit Cost",Evaluated_Direct_Unit_Cost);

                     EVALUATE(Evaluated_Starting_Date,Starting_Date);
                     "Purchase Price"."Starting Date" :=Evaluated_Starting_Date;
                     "Purchase Price".VALIDATE("Purchase Price"."Starting Date",Evaluated_Starting_Date);

                     EVALUATE(Evaluated_Ending_Date,Ending_Date);
                     "Purchase Price"."Ending Date" :=Evaluated_Ending_Date;
                     "Purchase Price".VALIDATE("Purchase Price"."Ending Date",Evaluated_Ending_Date);
                */

                end;
            }
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
    }

    trigger OnPostXmlPort()
    begin

        MESSAGE('Rate Matrix Imported Successfully.');
    end;

    var
        Evaluated_Vendor_No: Code[20];
        Evaluated_Item_No: Code[20];
        Evaluated_Unit_of_Measure_Code: Code[10];
        Evaluated_Base_Qty: Decimal;
        Evaluated_Base_Amount: Decimal;
        Evaluated_Minimum_Quantity: Decimal;
        Evaluated_Direct_Unit_Cost: Decimal;
        Evaluated_Starting_Date: Date;
        Evaluated_Ending_Date: Date;
}

