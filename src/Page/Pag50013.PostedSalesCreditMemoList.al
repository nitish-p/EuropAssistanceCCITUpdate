Page 50013 "Posted Sales Credit Memo List"
{
    // prdp 28032019
    // created new page for sent mail log of digitl signature credit notes

    Caption = 'Posted Sales Credit Memos';
    CardPageID = "Posted Sales Credit Memo";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    Permissions = TableData "Sales Cr.Memo Header"=rimd;
    PromotedActionCategories = 'New,Process,Report,Cr. Memo';
    SourceTable = "Sales Cr.Memo Header";
    SourceTableView = sorting("Cr.Note Sent Date & Time")
                      order(descending)
                      where("Cr.Note Sent Date & Time"=filter(<>''));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No.";rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Client NAV Code";rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Client NAV Code';
                    Editable = false;
                }
                field("Client Name";rec."Sell-to Customer Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Client Name';
                    Editable = false;
                }
                field("Reversal Posting Date";rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reversal Posting Date';
                    Editable = false;
                }
                field("Cr.Note Sent Date & Time";rec."Cr.Note Sent Date & Time")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail ID Of Concern";rec."E-Mail ID Of Concern")
                {
                    ApplicationArea = Basic;
                }
                field("Attached Credit Note";rec."Signed Invoice")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //prdp ++
                        "Sales&Rec".Get('');
                        Hyperlink("Sales&Rec"."DSC Credit Note output"+'\'+rec."Signed Invoice")
                        //prdp --
                    end;
                }
                field("Basic Amount";rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Basic Amount';
                }
                field("GST Amount";rec."GST Amt")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";rec.Total)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        // prdp +++
        SalesInvHeader.Reset;
        SalesInvHeader.SetRange(SalesInvHeader.Select,true);
        if SalesInvHeader.FindSet then repeat
           SalesInvHeader.Select:=false;
           SalesInvHeader.Modify;
        until SalesInvHeader.Next = 0;
        // prdp ---
    end;

    trigger OnOpenPage()
    begin
        // prdp +++
        SalesInvHeader.Reset;
        SalesInvHeader.SetRange(SalesInvHeader.Select,true);
        if SalesInvHeader.FindSet then repeat
           SalesInvHeader.Select:=false;
           SalesInvHeader.Modify;
        until SalesInvHeader.Next = 0;
        // prdp ---
        
        /*
        SalesInvHeader.RESET;
        SalesInvHeader.SETRANGE("Mail Sent",TRUE);
        SalesInvHeader.SETFILTER("Posting Date",'%1..%2',20190101D,TODAY);
        //SalesInvHeader.SETFILTER("GST Amt",'<=%1',0);
        IF SalesInvHeader.FINDSET THEN REPEAT
          SalesInvHeader.CALCFIELDS(Amount);
          GSTAmt:=0;
          GSTLedEntry.RESET;
          GSTLedEntry.SETRANGE("Document No.",SalesInvHeader."No.");
          IF GSTLedEntry.FINDSET THEN REPEAT
            GSTAmt:=GSTAmt+ABS(GSTLedEntry."GST Amount");
          UNTIL GSTLedEntry.NEXT = 0;
          Cust.GET(SalesInvHeader."Sell-to Customer No.");
          SalesInvHeader."E-Mail ID Of Concern":=Cust."E-Mail";
          SalesInvHeader."Doc No":=SalesInvHeader."No.";
          SalesInvHeader."GST Amt":=GSTAmt;
          SalesInvHeader.Total:=SalesInvHeader.Amount+GSTAmt;
          SalesInvHeader.MODIFY;
        UNTIL SalesInvHeader.NEXT =0;
        */

    end;

    var
        DocExchStatusStyle: Text;
        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        SalesInvHeader: Record "Sales Cr.Memo Header";
        Cust: Record Customer;
        //GSTLedEntry: Record UnknownRecord16418;
        GSTAmt: Decimal;
        "Sales&Rec": Record "Sales & Receivables Setup";
}

