pageextension 50088 CustomerList extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = All;
            }
        }
        // Add changes to page layout here
        addafter("Location Code")
        {
            field("TAN No."; Rec."TAN No.")
            {
                ApplicationArea = all;
            }
            field("State Code"; Rec."State Code")
            {
                ApplicationArea = all;

            }
            field(City; Rec.City)
            {
                ApplicationArea = All;
            }
            field("GST Registration No."; Rec."GST Registration No.")
            {
                ApplicationArea = All;

            }
            field("GST Customer Type"; Rec."GST Customer Type")
            {
                ApplicationArea = All;
            }
            field("GST Registration Type"; Rec."GST Registration Type")
            {
                ApplicationArea = All;

            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
            }
            field("Cc E-mail ID"; Rec."Cc E-mail ID")
            {
                ApplicationArea = all;

            }
            field("Bcc E-mail ID"; Rec."Bcc E-mail ID")
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
            field("API Customer"; Rec."API Customer")
            {
                ApplicationArea = All;
            }
            field("Dealer Smart Account No"; Rec."Dealer Smart Account No")
            {
                ApplicationArea = All;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
            }
        }
        addbefore("No.")
        {
            field("Dealer Code"; Rec."Dealer Code")
            {
                ApplicationArea = all;
            }
            field("Dealer Id"; Rec."Dealer Id")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        addafter(NewSalesBlanketOrder)
        {
            action("Create Customer Code")
            {
                Promoted = true;
                ApplicationArea = All;
                PromotedIsBig = true;
                RunObject = Report CustomerCodeCreation;//Nkp
            }
        }
        addafter("Sales Journal")
        {
            group("Finance Approval")
            {
                Caption = 'Finance Approval';
                Visible = false;
                action("Finance Approve")
                {
                    Promoted = false;
                    Visible = false;
                    ApplicationArea = All;

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
                    Promoted = false;
                    Visible = false;
                    ApplicationArea = All;

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
        addafter("Customer - Order Detail")
        {
            action("Customer Upload")
            {
                Image = import;
                Promoted = true;
                RunObject = XMLport "Customer Upload";
                ApplicationArea = All;
            }
            action("Uploaded Entries")
            {
                RunObject = Page "Uploaded Entries";
                ApplicationArea = All;
            }
            action("Dealer E-portal KYC Docs")
            {
                ApplicationArea = All;
                Image = Documents;
                Promoted = true;
                // RunObject = Page attache
                // RunPageLink = "No."=FIELD("No.");
            }
        }
        addafter(Sales)
        {
            group("E-Portal")
            {
                action("Dimension Mapping For E-Portal")
                {
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = New;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page "Dimension Mapping For E-Portal";
                }
                action("Dealer Refund Requests")
                {
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = New;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page "Dealer Refund";
                }
                action("Monthwise Client Invoicing")
                {
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page "Client Wise Monthly Invoicing";
                }
                action("E-Portal Policy Master")
                {
                    RunObject = Page "E-Portal Policy Master";
                    ApplicationArea = All;
                }
            }

        }

    }

    var
        myInt: Integer;
        recCust: Record Customer;
}