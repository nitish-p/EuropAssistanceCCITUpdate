pageextension 50058 "Bookkeeper Role Center" extends "Bookkeeper Role Center" 
{
    actions
    {
        addafter("Navi&gate")
        {
            action("GST Report")
            {
                Image = "Report";
                RunObject = Report "GST Report";
                ApplicationArea = All;
            }
            action("Auto Knock Off Customer")
            {
                //RunObject = Page 50042;
                ApplicationArea = All;
            }
            action("Sales QTY-GTO Report")
            {
                RunObject = Report "Sales QTY-GTO Report";
                ApplicationArea = All;
            }
        }
    }
}

