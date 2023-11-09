pageextension 50057 AccPayablesCoordinatorRCExtn extends "Acc. Payables Coordinator RC" 
{
    actions
    {
        addafter("Navi&gate")
        {
            action("VENDOR UPLOADER LOG")
            {
                RunObject = Page "Vendor Uploader Log";
                ApplicationArea = All;
            }
            action("FA UPLOADER LOG")
            {
                RunObject = Page "FA Uploader Stagging";
                ApplicationArea = All;
            }
            action("BOOKING FOREIGN VENDOR")
            {
                RunObject = Report "Booking FOREIGN Vendors";
                ApplicationArea = All;
            }
            action("WIP CAPEX REPORT")
            {
                RunObject = Report "WIP Capex";
                ApplicationArea = All;
            }
        }
    }
}

