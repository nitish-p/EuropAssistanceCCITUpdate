pageextension 50055 "FA Ledger Entries" extends "FA Ledger Entries" 
{
    layout
    {
        addafter("G/L Entry No.")
        {
            field("FA Subclass Code";Rec."FA Subclass Code")
            {
                ApplicationArea = All;
            }
            field("FA Class Code";Rec."FA Class Code")
            {
                ApplicationArea = All;
            }
            field("FA Posting Group";Rec."FA Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}

