pageextension 50004 GLAccountCard extends "G/L Account Card"
{
    layout
    {
        addafter("Tax Group Code")
        {
            // field("GST Group Code"; Rec."GST Group Code")
            // {
            // }
            // field("GST Credit"; Rec."GST Credit")
            // {
            // }
            // field("HSN/SAC Code"; Rec."HSN/SAC Code")
            // {
            // }
            field("Tax Liable"; Rec."Tax Liable")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("&Balance")
        {
            // action(test)
            // {
            //     ApplicationArea = all;
            //     Image = Excel;
            //     trigger OnAction()
            //     begin
            //       //  Xmlport.Run(Xmlport::"test Email");
            //     end;
            // }
        }
    }
}

