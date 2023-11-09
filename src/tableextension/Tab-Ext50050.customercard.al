tableextension 50050 customercard extends Customer
{
    fields
    {
        field(50025; "Customer Type"; Text[50])
        {
            Caption = 'Customer Type';
            DataClassification = ToBeClassified;
            TableRelation = Abc;
        }

    }
}
