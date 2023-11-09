table 50028 Abc
{
    Caption = 'Customer Type Creation';
    DataClassification = ToBeClassified;
    LookupPageId = "Customer Type";
    DrillDownPageId = "Customer Type";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
