/*Page 50043 "Auto Knock Off Stagging List"
{
    PageType = List;
    SourceTable = UnknownTable50025;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Code";"Vendor Code")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice No.";"Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Applying Doc. No.";"Applying Doc. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date";"Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(AutoKnockOff;AutoKnockOff)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Remark;Remark)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Auto Knock Off Entries")
            {
                ApplicationArea = Basic;
                Image = "report";
                Promoted = true;
                RunObject = Codeunit UnknownCodeunit50020;
            }
            action("Import Data")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                RunObject = XMLport UnknownXMLport50040;

                trigger OnAction()
                begin
                    CurrPage.Update;
                end;
            }
            action("Vendor Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = Entries;
                Promoted = true;
                RunObject = Page "Vendor Ledger Entries";
                RunPageLink = "Vendor No."=field("Vendor Code"),
                              "Remaining Amount"=filter(<>0);
                RunPageMode = View;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.AutoKnockOff = true then
          Error('You do not have permission to delete data.');
        if Rec.Status = Rec.Status::Error then
;
}
*/
