pageextension 50090 VendorList extends "Vendor List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Currency Code")
        {
            field("Uploader Vendor"; Rec."Uploader Vendor")
            {
                ApplicationArea = All;

            }
            field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Lead Time Calculation")
        {
            field("P.A.N. No."; rec."P.A.N. No.")
            {
                ApplicationArea = All;
            }
            field("Screening Result"; rec."Screening Result")
            {
                ApplicationArea = All;
            }
            field("Vendor Invoice Type"; rec."Vendor Invoice Type")
            {
                ApplicationArea = All;
            }
            field("PLS Id"; rec."Easy Auto Vendor Code")
            {
                Caption = 'PLS Id';
                Editable = false;
                ApplicationArea = All;
            }
            field(Verification; rec.Verification)
            {
                ApplicationArea = All;
            }
            field(Type; rec.Type)
            {
                ApplicationArea = All;
            }
            field("Dealer Client Name"; rec."Dealer Client Name")
            {
                ApplicationArea = All;
            }
            field("API Screening Result"; rec."API Screening Result")
            {
                ApplicationArea = All;
            }
            field("Vendor Created On"; rec."Vendor Created On")
            {
                ApplicationArea = All;
            }
            field("Vendor Modified On 2nd Last"; rec."Vendor Modified On 2nd Last")
            {
                ApplicationArea = All;
            }
            field("Vendor Modified On Last"; rec."Vendor Modified On")
            {
                Caption = 'Vendor Modified On Last';
                ApplicationArea = All;
            }
            field("Vendor Approved On 2nd Last"; rec."Vendor Approved On 2nd Last")
            {
                ApplicationArea = All;
            }
            field("Vendor Approved On Last"; rec."Vendor Approved On")
            {
                Caption = 'Vendor Approved On Last';
                ApplicationArea = All;
            }
            field("Record ID"; rec."Record ID")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addbefore("C&ontact")
        {
            action("PLS Id Mapping")
            {
                ApplicationArea = All;
                Caption = 'PLS Id Mapping';
                Image = Addresses;
                RunObject = Page 369;
                RunPageLink = "Vendor No." = FIELD("No.");
            }
            action("Create Vendor Code")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report VendorCodeCreation;
            }
            action(ExternalCostReport)
            {
                ApplicationArea = All;
                RunObject = Report 50016;
            }
            action("Invoice Payment Report")
            {
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Report 50041;
                ApplicationArea = All;
            }
            action("TDS Adj. Journal")
            {
                RunObject = Page "TDS Adjustment Journal";
                ApplicationArea = All;
            }
            action("PLS Id Report")
            {
                RunObject = Page "Order Address List";
                ApplicationArea = All;
            }
            action("PLS Id wise Bank Details Report")
            {
                RunObject = Report "PLS Id wise Bank Details";
                ApplicationArea = All;
            }
            action("Suggested Payments Report")
            {
                Caption = 'Suggested Payments Report';
                ApplicationArea = All;
                RunObject = Report "Suggested Payments Report";
            }
            action("Import Export Vendor Bank Details")
            {
                RunObject = XMLport "Vend Bank Det. Import/Export";
                ApplicationArea = All;
            }
            action("External Cost - Invoice")
            {
                RunObject = Report "External Cost - Invoice";
                ApplicationArea = All;
            }
            action("External Cost - Cr Note")
            {
                RunObject = Report "External Cost - Cr Note";
                ApplicationArea = All;
            }
            action("External Cost - Direct G/L Posting")
            {
                RunObject = Report "External Cost - Direct GL Post";
                ApplicationArea = All;
            }
            group(Automation)
            {
                Caption = 'Automation';
                Visible = ShowAction;
                action("Vendors To Verify")
                {
                    Image = CheckList;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Not Verified Vendor List";
                    Visible = ShowAction;
                }
                action("KYC Attachments")
                {
                    Image = Links;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Attached Files";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Export Automation Invoices Log")
                {
                    //RunObject = Report "Auto Purchase Invoices Log_2";
                    Visible = ShowAction;
                    ApplicationArea = All;
                }
                action("Export Rejection Log")
                {
                    ApplicationArea = All;
                    // RunObject = Report 50050;
                    Visible = ShowAction;
                }
                action("Invoice-Payment Report")
                {
                    RunObject = Report 50070;
                    ApplicationArea = All;
                }
                action("Export Automation Credit Memo Log")
                {
                    //RunObject = Report 50078;
                    ApplicationArea = All;
                }
                action("VENDOR UPLOADER LOG")
                {
                    RunObject = Page "Vendor Uploader Log";
                    ApplicationArea = All;
                }
                action("Update Vendor Attachments")
                {
                    RunObject = Page "Update Vendor Attach.";
                    ApplicationArea = All;
                }
                action(VendorBankAccountMaster)
                {
                    RunObject = Page "Vendor Bank Account Master";
                    ApplicationArea = All;
                }
                action("Fin Scan Vendor Bridge")
                {
                    RunObject = Page "Fin Scan Vendor Bridge";
                    ApplicationArea = All;
                }
            }

        }
        // Add changes to page actions here
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        // IF ((USERID = 'SUPER') OR (USERID = 'DIPEN') OR (USERID = 'ASHRAF') OR (USERID = 'AUTO CLAIM') OR (USERID = 'TEJAS') OR (USERID = 'ADMIN')) THEN BEGIN
        //     ShowAction := TRUE;
        // END ELSE BEGIN
        //     ShowAction := FALSE;
        // END;//np 30-05-23
        ShowAction := TRUE;

    end;

    var
        myInt: Integer;
        ShowAction: Boolean;
}
