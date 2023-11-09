pageextension 50012 salesorder extends "Sales Order"
{
    layout
    {

        addbefore(Trading)
        {
            // field("Nature of Services";Rec."Nature of Services")
            // {
            // }
        }
        // addafter("Control 1500058")
        // {
        //     group(GST)
        //     {
        //         Caption = 'GST';
        //         field("GST Bill-to State Code";Rec."GST Bill-to State Code")
        //         {
        //         }
        //         field("GST Ship-to State Code";Rec."GST Ship-to State Code")
        //         {
        //         }
        //         field("Location State Code";Rec."Location State Code")
        //         {
        //         }
        //         field("Nature of Supply";Rec."Nature of Supply")
        //         {
        //         }
        //         field("GST Customer Type";Rec."GST Customer Type")
        //         {
        //         }
        //         field("GST Without Payment of Duty";Rec."GST Without Payment of Duty")
        //         {
        //         }
        //         field("Invoice Type";Rec."Invoice Type")
        //         {
        //         }
        //         field("Bill Of Export No.";Rec."Bill Of Export No.")
        //         {
        //         }
        //         field("Bill Of Export Date";Rec."Bill Of Export Date")
        //         {
        //         }
        //         field("e-Commerce Customer";Rec."e-Commerce Customer")
        //         {

        //             trigger OnValidate()
        //             var
        //                 Customer: Record Customer;
        //             begin
        //             end;
        //         }
        //         field("e-Commerce Merchant Id";Rec."e-Commerce Merchant Id")
        //         {
        //         }
        //     }
        // }
    }
    actions
    {


        //Unsupported feature: Code Insertion on "Comment(Action 37)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //var
        //ApprovalsMgmt: Codeunit "1535";
        //begin
        /*
        ApprovalsMgmt.GetApprovalComment(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (RunObject) on "Comment(Action 37)".


        //Unsupported feature: Property Deletion (RunPageLink) on "Comment(Action 37)".

        addbefore(AssemblyOrders)
        {
            action("Detailed GST")
            {
                ApplicationArea = All;
                Caption = 'Detailed GST';
                Image = ServiceTax;
                RunObject = Page "Detailed GST Entry Buffer";
                RunPageLink = "Transaction Type" = FILTER(Sales),
                              "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("No.");
            }
        }
    }


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DynamicEditable := CurrPage.EDITABLE;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    CRMIsCoupledToRecord := CRMIntegrationEnabled AND CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID);
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    CurrPage.ApprovalFactBox.PAGE.RefreshPage(RECORDID);
    */
    //end;
}

