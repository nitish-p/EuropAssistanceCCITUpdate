pageextension 50044 "Customer Bank Account List" extends "Customer Bank Account List" 
{
    layout
    {
        addafter("Language Code")
        {
            field("Default Account";Rec."Default Account")
            {
                ApplicationArea = All;
            }
        }
    }
}

