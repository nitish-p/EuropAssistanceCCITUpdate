pageextension 50080 "Request to Approve Extn" extends "Requests to Approve"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            //Richa
            /*
            field(Select; Rec.Select)
            {
            }
            */
            field("Client Computer Name"; Rec."Client Computer Name")
            {
                Editable = false;
                 ApplicationArea = All;
            }
            field("Document No."; Rec."Document No.")
            {
                 ApplicationArea = All;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(processing)
        {
            action(Approve1)
            {
                Caption = 'Approve';
                 ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                Visible = true;

                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);

                    // prdp +++
                    SHeader.RESET;
                    SHeader.SETRANGE(SHeader.Select, TRUE);
                    IF NOT SHeader.FINDFIRST THEN BEGIN
                        ERROR('No Entry Selected to Approve');
                    END;

                    SHeader.RESET;
                    SHeader.SETRANGE(SHeader.Select, TRUE);
                    SHeader.SETRANGE(Status, Status::Open);
                    IF SHeader.FINDSET THEN
                        REPEAT
                            SHeader2.RESET;
                            SHeader2.SETRANGE(SHeader2."Entry No.", SHeader."Entry No.");
                            IF SHeader2.FINDFIRST THEN BEGIN
                                //ApprovalsMgmt.ApproveApprovalRequests(SHeader2);
                            END;
                        UNTIL SHeader.NEXT = 0;
                    // prdp ---
                end;
            }
            action(Reject1)
            {
                Caption = 'Reject';
                Image = Reject;
                 ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                Visible = true;

                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);

                    // prdp +++
                    SHeader.RESET;
                    SHeader.SETRANGE(SHeader.Select, TRUE);
                    IF NOT SHeader.FINDFIRST THEN BEGIN
                        ERROR('No Entry Selected to Reject');
                    END;

                    SHeader.RESET;
                    SHeader.SETRANGE(SHeader.Select, TRUE);
                    SHeader.SETRANGE(Status, Status::Open);
                    IF SHeader.FINDSET THEN
                        REPEAT
                            SHeader2.RESET;
                            SHeader2.SETRANGE(SHeader2."Entry No.", SHeader."Entry No.");
                            IF SHeader2.FINDFIRST THEN BEGIN
                               // ApprovalsMgmt.RejectApprovalRequests(SHeader2);
                            END;
                        UNTIL SHeader.NEXT = 0;
                    // prdp ---
                end;
            }
            action(Delegate1)
            {
                Caption = 'Delegate';
                Image = Delegate;
                 ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                Visible = true;

                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);


                    SHeader.RESET;
                    SHeader.SETRANGE(SHeader.Select, TRUE);
                    IF NOT SHeader.FINDFIRST THEN BEGIN
                        ERROR('No Entry Selected to Delegate');
                    END;

                    SHeader.RESET;
                    SHeader.SETRANGE(SHeader.Select, TRUE);
                    SHeader.SETRANGE(Status, Status::Open);
                    IF SHeader.FINDSET THEN
                        REPEAT
                            SHeader2.RESET;
                            SHeader2.SETRANGE(SHeader2."Entry No.", SHeader."Entry No.");
                            IF SHeader2.FINDFIRST THEN BEGIN
                             //   ApprovalsMgmt.DelegateApprovalRequests(SHeader2);
                            END;
                        UNTIL SHeader.NEXT = 0;

                end;
            }
            action(Select)
            {
                Image = SelectField;
                 ApplicationArea = All;
                Promoted = true;

                trigger OnAction()
                begin

                    // prdp +++
                    SalesInvHeader.RESET;
                    //Richa
                    //SalesInvHeader.SETRANGE("Entry No.",rec."Entry No.");
                    IF SalesInvHeader.FINDFIRST THEN BEGIN
                        SalesInvHeader.Select := TRUE;
                        SalesInvHeader.MODIFY;
                    END;
                    // prdp ---
                end;
            }
            action(Deselct)
            {
                Image = CancelLine;
                Promoted = true;

                trigger OnAction()
                begin
                    // prdp +++
                    SalesInvHeader.RESET;
                    //SalesInvHeader.SETRANGE("Entry No.","Entry No.");
                    IF SalesInvHeader.FINDFIRST THEN BEGIN
                        SalesInvHeader.Select := FALSE;
                        SalesInvHeader.MODIFY;
                    END;
                    // prdp ---
                end;
            }
            action("Select All")
            {
                Image = SelectEntries;
                Promoted = true;

                trigger OnAction()
                begin
                    // prdp +++
                    IF NOT CONFIRM('Do you want Select all Entries ?', FALSE)
                      THEN
                        EXIT;

                    SalesInvHeader.RESET;
                    SalesInvHeader.COPYFILTERS(Rec);
                    SalesInvHeader.SETFILTER(SalesInvHeader."Entry No.", '<>%1', 0);
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            SalesInvHeader.Select := TRUE;
                            SalesInvHeader.MODIFY;
                        UNTIL SalesInvHeader.NEXT = 0;
                    // prdp ---
                end;
            }
            action("Deselect All")
            {
                Image = UnApply;
                Promoted = true;

                trigger OnAction()
                begin
                    // prdp +++
                    IF NOT CONFIRM('Do you want Deselect all Entries ?', FALSE)
                      THEN
                        EXIT;

                    SalesInvHeader.RESET;
                    SalesInvHeader.COPYFILTERS(Rec);
                    //SalesInvHeader.SETRANGE(Select,TRUE);
                    IF SalesInvHeader.FINDSET THEN
                        REPEAT
                            SalesInvHeader.Select := FALSE;
                            SalesInvHeader.MODIFY;
                        UNTIL SalesInvHeader.NEXT = 0;
                    // prdp ---
                end;
            }
        }

    }
    var
        myInt: Integer;
        SalesInvHeader: Record "Approval Entry";
        SHeader: Record "Approval Entry";
        SHeader2: Record "Approval Entry";
}