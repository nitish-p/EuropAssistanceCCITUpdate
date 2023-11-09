pageextension 50079 "PEXTCustBankAccCard" extends "Customer Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field("Customer No."; Rec."Customer No.")
            {
                Editable = false;
                ApplicationArea = All;
            }

        }
        addafter("Bank Account No.")
        {
            field("IFSC Code"; Rec."IFSC Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Transit No.")
        {
            field("Default Account"; Rec."Default Account")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}