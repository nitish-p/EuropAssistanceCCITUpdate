pageextension 50022 UserSetupextn extends "User Setup"
{
    layout
    {
        addafter("Time Sheet Admin.")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
            }
            field("Modify Customer"; Rec."Modify Customer")
            {
                ApplicationArea = all;
            }
        }
    }
}

