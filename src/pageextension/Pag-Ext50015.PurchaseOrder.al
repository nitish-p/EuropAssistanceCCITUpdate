pageextension 50015 PurchaseOrder extends "Purchase Order"
{
    layout
    {

        //Unsupported feature: Property Insertion (Name) on "Control 1906354007".


        //Unsupported feature: Property Deletion (SubPageLink) on "Control 1906354007".

        addafter("Vendor Shipment No.")
        {
            field("Invoice Date"; Rec."Invoice Date")
            {
                ApplicationArea = All;
            }
        }
        // addafter("Control 1500051")
        // {
        //     field("Nature of Supply";Rec."Nature of Supply")
        //     {
        //     }
        //     field("GST Vendor Type";Rec."GST Vendor Type")
        //     {
        //     }
        //     field("Invoice Type";Rec."Invoice Type")
        //     {
        //     }
        //     field("Associated Enterprises";Rec."Associated Enterprises")
        //     {
        //     }
        //     field("Bill of Entry No.";Rec."Bill of Entry No.")
        //     {
        //         Importance = Additional;
        //     }
        //     field("Bill of Entry Date";Rec."Bill of Entry Date")
        //     {
        //         Importance = Additional;
        //     }
        //     field("Bill of Entry Value";Rec."Bill of Entry Value")
        //     {
        //         Importance = Additional;
        //     }
        // }
    }
    actions
    {

        //Unsupported feature: Property Insertion (Name) on "Action 226".


        //Unsupported feature: Property Insertion (Name) on "Action 184".



        //Unsupported feature: Code Insertion on "Comment(Action 29)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //var
        //ApprovalsMgmt: Codeunit "1535";
        //begin
        /*
        ApprovalsMgmt.GetApprovalComment(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (RunObject) on "Comment(Action 29)".


        //Unsupported feature: Property Deletion (RunPageLink) on "Comment(Action 29)".

        addbefore("Archive Document")
        {
            action("Detailed GST")
            {
                Caption = 'Detailed GST';
                ApplicationArea = All;
                Image = ServiceTax;
                RunObject = Page "Detailed GST Entry Buffer";
                RunPageLink = "Transaction Type" = FILTER(Purchase),
                              "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("No.");
            }
        }
        addafter("&Print")
        {
            action(PurchaseOrder)
            {
                ApplicationArea = Suite;
                Caption = 'Purchase Order New';
                Ellipsis = true;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category8;
                //PromotedCategory = Category10;
                // Visible = Visible1;
                PromotedIsBig = true;


                trigger OnAction()
                var
                    PoHeader: Record "Purchase Header";
                begin
                    PoHeader.Reset();
                    PoHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::PurchaseOrder1, true, false, PoHeader);
                end;

            }
        }
    }


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    CurrPage.ApprovalFactBox.PAGE.RefreshPage(RECORDID);

    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    */
    //end;
}

