pageextension 50087 CustomerCard extends "Customer Card"
{
    layout
    {
        modify("No.")
        {
            Editable = EditField;
        }
        modify(Name)
        {
            Editable = EditField;
        }
        // Add changes to page layout here
        addafter(Name)
        {
            field("Name for Invoice"; Rec."Name for Invoice")
            {
                ApplicationArea = all;
            }

        }
        addafter("Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = all;
            }
        }
        addafter("P.A.N. No.")
        {
            field("TAN No."; Rec."TAN No.")
            {
                ApplicationArea = all;
            }
        }
        addafter("E-Mail")
        {
            field("Cc E-mail ID"; Rec."Cc E-mail ID")
            {
                ApplicationArea = all;

            }
            field("Bcc E-mail ID"; Rec."Bcc E-mail ID")
            {
                ApplicationArea = all;
            }


        }
        addafter("Tax Information")
        {
            group("E-Portal Info.")
            {
                Caption = 'E-Portal Info.';

                field("Dealer Code"; Rec."Dealer Code")
                {
                    ApplicationArea = all;
                }
                field("Dealer Id"; Rec."Dealer Id")
                {
                    ApplicationArea = all;
                }
                field("Client Id"; Rec."Client Id")
                {
                    ApplicationArea = all;
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = all;
                }
                field("Cancelled Cheque"; Rec."Cancelled Cheque")
                {
                    ApplicationArea = all;
                    Editable = false;
                    // trigger OnLookup(var Text: Text): Boolean
                    // begin
                    //     HYPERLINK(rec."Cancelled Cheque");
                    // end;
                }
                field("GST Registration File"; Rec."GST Registration File")
                {
                    ApplicationArea = All;
                    Editable = false;

                    // trigger OnLookup(var Text: Text): Boolean
                    // begin
                    //     HYPERLINK(rec."GST Registration File");
                    // end;
                }
                field("PAN File"; Rec."PAN File")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("TAN File"; Rec."TAN File")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Dealer Smart Account No"; Rec."Dealer Smart Account No")
                {
                    ApplicationArea = all;
                }
            }
        }
        addafter("State Code")
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = All;
            }
        }
    }


    //}

    actions
    {
        // Add changes to page actions here
        addafter("&Customer")
        {
            action("e-Commerce Merchant Id")
            {

                Promoted = true;
                PromotedCategory = Category7;
                ApplicationArea = all;
                RunObject = Page "E-Comm. Merchant Id";
                RunPageLink = "Customer No." = FIELD("No.");
            }


        }
        addafter("Sales Journal")
        {

            group("Finance Approval")
            {
                Caption = 'Finance Approval';
                action("Finance Approve")
                {

                    trigger OnAction()
                    begin

                        recCust.RESET;
                        recCust.SETRANGE("No.", recCust."No.");
                        IF recCust.FINDFIRST THEN BEGIN
                            recCust.Status := recCust.Status::Approved;
                            recCust."Rejection Reason" := '';
                            recCust.MODIFY;
                        END;
                    end;
                }
                action("Finance Reject")
                {

                    trigger OnAction()
                    begin

                        recCust.RESET;
                        recCust.SETRANGE("No.", recCust."No.");
                        recCust.SETFILTER("Rejection Reason", '<>%1', '');
                        IF recCust.FINDFIRST THEN BEGIN
                            recCust.Status := recCust.Status::Rejected;
                            recCust.MODIFY;
                        END ELSE BEGIN
                            ERROR('Rejection Reason on customer card must be filled while Rejection');
                        END;
                    end;
                }
            }

        }

    }
    trigger OnOpenPage()
    var
        usersetup: Record "User Setup";
    begin
        EditField := false;
        if usersetup.Get(UserId) then
            if usersetup."Modify Customer" = true then
                EditField := true;

    end;


    var
        myInt: Integer;
        recCust: Record Customer;
        EditField: Boolean;
}