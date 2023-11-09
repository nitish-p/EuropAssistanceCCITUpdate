Page 50012 "Posted Sales Invoices List"
{
    // prdp 23022019
    // created new page to send digital signature pdf to customer

    Editable = false;
    PageType = List;
    Permissions = TableData "Sales Invoice Header"=rimd;
    SourceTable = "Sales Invoice Header";
    SourceTableView = sorting("Invoice Sent Date & Time")
                      order(descending)
                      where("Invoice Sent Date & Time"=filter(<>''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Invoice No.";rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice No.';
                    Editable = false;
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
                field("Invoice Posting Date";rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Posting Date';
                    Editable = false;
                }
                field("Invoice Sent Date & Time";rec."Invoice Sent Date & Time")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail ID Of Concern";rec."E-Mail ID Of Concern")
                {
                    ApplicationArea = Basic;
                }
                field("Attached Invoice";rec."Signed Invoice")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //prdp ++
                        "Sales&Rec".Get('');
                        Hyperlink("Sales&Rec"."DSC Print output"+'\'+rec."Signed Invoice")
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
                field("Invoice Total";rec."Invoice Total")
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
        SalesInvHeader.SETFILTER("GST Amt",'<=%1',0);
        IF SalesInvHeader.FINDSET THEN REPEAT
          SalesInvHeader.CALCFIELDS(Amount);
          GSTAmt:=0;
          GSTLedEntry.RESET;
          GSTLedEntry.SETRANGE("Document No.",SalesInvHeader."No.");
          IF GSTLedEntry.FINDSET THEN REPEAT
            GSTAmt:=GSTAmt+ABS(GSTLedEntry."GST Amount");
          UNTIL GSTLedEntry.NEXT = 0;
          SalesInvHeader."GST Amt":=GSTAmt;
          SalesInvHeader."Invoice Total":=SalesInvHeader.Amount+GSTAmt;
          SalesInvHeader.MODIFY;
        UNTIL SalesInvHeader.NEXT =0;
        */

    end;

    var
        SalesInvHeader: Record "Sales Invoice Header";
        Cust: Record Customer;
       // GSTLedEntry: Record UnknownRecord16418;
        GSTAmt: Decimal;
        "Sales&Rec": Record "Sales & Receivables Setup";
}

