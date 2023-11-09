pageextension 50056 "Purchase Prices" extends "Purchase Prices"
{
    // Pallavi 07012017
    // added new fileds base qty , base amt
    layout
    {
        // modify("Control 4.OnValidate")
        // {
        //     Visible = false;
        // }
        // addafter("Control 4")
        // {
        //     field("Vendor Name";Rec."Vendor Name")
        //     {
        //     }
        // }
        // addafter("Control 16")
        // {
        //     field("Base Qty";Rec."Base Qty")
        //     {
        //     }
        //     field("Base Amount";Rec."Base Amount")
        //     {
        //     }
        // }
    }

    var
        NoDataWithinFilterErr: Label 'There is no %1 within the filter %2.', Comment = '%1: Field(Code), %2: GetFilter(Code)';


    //Unsupported feature: Code Modification on "SetRecFilters(PROCEDURE 1)".

    //procedure SetRecFilters();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF VendNoFilter <> '' THEN
      SETFILTER("Vendor No.",VendNoFilter)
    ELSE
    #4..12
    END ELSE
      SETRANGE("Item No.");

    CurrPage.UPDATE(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
    CheckFilters(DATABASE::Vendor,VendNoFilter);
    CheckFilters(DATABASE::Item,ItemNoFilter);

    CurrPage.UPDATE(FALSE);
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: Item) (VariableCollection) on "VendNoFilterOnAfterValidate(PROCEDURE 19075608)".



    //Unsupported feature: Code Modification on "VendNoFilterOnAfterValidate(PROCEDURE 19075608)".

    //procedure VendNoFilterOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrPage.SAVERECORD;
    SetRecFilters;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF Item.GET("Item No.") THEN
      CurrPage.SAVERECORD;
    SetRecFilters;
    */
    //end;

    procedure CheckFilters(TableNo: Integer; FilterTxt: Text[250])
    var
        FilterRecordRef: RecordRef;
        FilterFieldRef: FieldRef;
    begin
        IF FilterTxt = '' THEN
            EXIT;
        CLEAR(FilterRecordRef);
        CLEAR(FilterFieldRef);
        FilterRecordRef.OPEN(TableNo);
        FilterFieldRef := FilterRecordRef.FIELD(1);
        FilterFieldRef.SETFILTER(FilterTxt);
        IF FilterRecordRef.ISEMPTY THEN
            ERROR(NoDataWithinFilterErr, FilterRecordRef.CAPTION, FilterTxt);
    end;
}

