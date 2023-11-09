Page 50070 "Voucher List"
{
    Editable = false;
    SourceTable = "Gen. Journal Template";
    SourceTableView = where("Voucher Type" = filter(<> ''));

    layout
    {
        area(content)
        {
            repeater("Voucher Types")
            {
                field("Voucher Type"; rec."Voucher Type")
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
            action("Open Voucher")
            {
                ApplicationArea = Basic;
                Image = Voucher;
                Promoted = true;
                PromotedIsBig = false;

                trigger OnAction()
                begin

                    Page.RunModal(rec."Page ID");
                end;
            }
            action(GenJnlLineUpload)
            {
                ApplicationArea = Basic;
                Caption = 'Gen. Journal Line Upload';
                Image = Import;
                Promoted = true;
                // RunObject = XMLport UnknownXMLport50005;//Naveen--CCIT--1702023
            }
        }
    }
}

