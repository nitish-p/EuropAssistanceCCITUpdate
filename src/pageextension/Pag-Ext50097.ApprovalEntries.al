pageextension 50097 "Approval Entries" extends "Approval Entries"
{

    //Unsupported feature: Property Insertion (Permissions) on ""Approval Entries"(Page 658)".

    layout
    {
        // addfirst("Control 1")
        // {
        //     field(Select;Rec.Select)
        //     {
        //     }
        // }
    }
    actions
    {


        //Unsupported feature: Code Modification on "Action 35.OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(ApprovalEntry);
        //ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);

        // prdp +++
        SHeader.RESET;
        SHeader.SETRANGE(SHeader.Select,TRUE);
        IF NOT SHeader.FINDFIRST THEN BEGIN
          ERROR('No Entry Selected to Delegate');
        END;

        SHeader.RESET;
        SHeader.SETRANGE(SHeader.Select,TRUE);
        IF SHeader.FINDSET THEN REPEAT
        SHeader2.RESET;
        SHeader2.SETRANGE(SHeader2."Entry No.",SHeader."Entry No.");
        IF SHeader2.FINDFIRST THEN BEGIN
         ApprovalsMgmt.DelegateApprovalRequests(SHeader2);
        END;
        UNTIL SHeader.NEXT = 0 ;
        // prdp ---
        */
        //end;
        //     addafter("Action 35")
        //     {
        //         action(Select)
        //         {
        //             Image = SelectField;
        //             Promoted = true;

        //             trigger OnAction()
        //             begin

        //                 // prdp +++
        //                   SalesInvHeader.RESET;
        //                   SalesInvHeader.SETRANGE("Entry No.","Entry No.");
        //                   IF SalesInvHeader.FINDFIRST THEN BEGIN
        //                     SalesInvHeader.Select:=TRUE;
        //                     SalesInvHeader.MODIFY;
        //                   END;
        //                 // prdp ---
        //             end;
        //         }
        //         action(Deselct)
        //         {
        //             Image = CancelLine;
        //             Promoted = true;

        //             trigger OnAction()
        //             begin
        //                 // prdp +++
        //                   SalesInvHeader.RESET;
        //                   SalesInvHeader.SETRANGE("Entry No.","Entry No.");
        //                   IF SalesInvHeader.FINDFIRST THEN BEGIN
        //                     SalesInvHeader.Select:=FALSE;
        //                     SalesInvHeader.MODIFY;
        //                   END;
        //                 // prdp ---
        //             end;
        //         }
        //         action("Select All")
        //         {
        //             Image = SelectEntries;
        //             Promoted = true;

        //             trigger OnAction()
        //             begin
        //                 // prdp +++
        //                 IF NOT CONFIRM ('Do you want Select all Entries ?',FALSE)
        //                   THEN
        //                     EXIT;

        //                 SalesInvHeader.RESET;
        //                 SalesInvHeader.COPYFILTERS(Rec);
        //                 SalesInvHeader.SETFILTER(SalesInvHeader."Entry No.",'<>%1',0);
        //                 IF SalesInvHeader.FINDSET THEN REPEAT
        //                    SalesInvHeader.Select:=TRUE;
        //                    SalesInvHeader.MODIFY;
        //                 UNTIL SalesInvHeader.NEXT = 0;
        //                 // prdp ---
        //             end;
        //         }
        //         action("Deselect All")
        //         {
        //             Image = UnApply;
        //             Promoted = true;

        //             trigger OnAction()
        //             begin
        //                 // prdp +++
        //                 IF NOT CONFIRM ('Do you want Deselect all Entries ?',FALSE)
        //                   THEN
        //                     EXIT;

        //                 SalesInvHeader.RESET;
        //                 SalesInvHeader.COPYFILTERS(Rec);
        //                 SalesInvHeader.SETRANGE(Select,TRUE);
        //                 IF SalesInvHeader.FINDSET THEN REPEAT
        //                    SalesInvHeader.Select:=FALSE;
        //                    SalesInvHeader.MODIFY;
        //                 UNTIL SalesInvHeader.NEXT = 0;
        //                 // prdp ---
        //             end;
        //         }
        //     }
        // }

        // var
        //     SalesInvHeader: Record "Sales Invoice Header";
        //     SHeader: Record "Sales Invoice Header";
        //     SHeader2: Record "Sales Invoice Header";


        // //Unsupported feature: Code Modification on "OnOpenPage".

        // //trigger OnOpenPage()
        // //>>>> ORIGINAL CODE:
        // //begin
        //     /*
        //     IF Usersetup.GET(USERID) THEN
        //       SETCURRENTKEY("Table ID","Document Type","Document No.");
        //     */
        // //end;
        // //>>>> MODIFIED CODE:
        // //begin
        //     /*
        //     IF Usersetup.GET(USERID) THEN
        //       SETCURRENTKEY("Table ID","Document Type","Document No.");
        //     ApproverSenderFiltering;
        //     */
        // //end;

        // local procedure ApproverSenderFiltering()
        // begin
        //     IF Usersetup.GET(USERID) AND Usersetup."Approval Administrator" THEN
        //       EXIT;
        //     FILTERGROUP(-1);
        //     SETRANGE("Approver ID",USERID);
        //     SETRANGE("Sender ID",USERID);
        //     MarkAll;
        //     MARKEDONLY(TRUE);
        // end;

        // local procedure MarkAll()
        // begin
        //     IF FINDSET THEN
        //       REPEAT
        //         MARK(TRUE);
        //       UNTIL NEXT = 0;
        // end;
    }
}


