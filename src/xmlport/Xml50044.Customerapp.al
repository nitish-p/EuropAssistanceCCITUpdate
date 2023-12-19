XmlPort 50044 "Customer app"
{
    Direction = Import;
    Format = VariableText;
    Permissions = TableData "Cust. Ledger Entry" = rimd;

    schema
    {
        textelement(root)
        {
            tableelement(Integer; Integer)
            {
                AutoSave = false;
                XmlName = 'integer';
                UseTemporary = true;
                textelement(customner)
                {
                }
                textelement(Custpostinggrp)
                {
                }
                textelement(startdate)
                {
                }
                textelement(enddate)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    if not (ApplyCustomer) then
                        Message('Customer=%1 ,%2', customner, GetLastErrorText);
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Message('Done');
    end;

    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Sdate: Date;
        Edate: Date;
        applyCustLegderEntry: Record "Cust. Ledger Entry";
        CustEntryApplyPostedEntries: Codeunit "CustEntry-Apply Posted Entries";
        ApplicationDate: Date;
        RemainingAmount: Decimal;
        ApplyRemainingAmount: Decimal;
        chk: Integer;

    local procedure ApplyCustomer(): Boolean
    var
        bool: Boolean;
        unapplyparameter: Record "Apply Unapply Parameters" temporary;
    begin
        bool := false;
        chk := 0;
        CustLedgerEntry.Reset;
        CustLedgerEntry.SetRange("Customer No.", customner);
        Evaluate(Sdate, startdate);
        Evaluate(Edate, enddate);
        CustLedgerEntry.SetCurrentkey("Customer No.", Open, Positive, "Global Dimension 1 Code");
        CustLedgerEntry.Ascending;
        CustLedgerEntry.SetRange("Posting Date", Sdate, Edate);
        CustLedgerEntry.SetRange("Customer Posting Group", Custpostinggrp);
        CustLedgerEntry.SetRange(Open, true);
        CustLedgerEntry.SetRange(Positive, false);
        if CustLedgerEntry.FindFirst then
            repeat
                bool := false;
                CustLedgerEntry.CalcFields("Remaining Amount");
                RemainingAmount := CustLedgerEntry."Remaining Amount";
                CustLedgerEntry."Applying Entry" := true;
                CustLedgerEntry."Applies-to ID" := UserId;
                CustLedgerEntry."Amount to Apply" := CustLedgerEntry."Remaining Amount";
                //CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",CustLedgerEntry);

                applyCustLegderEntry.Reset;
                applyCustLegderEntry.SetCurrentkey("Customer No.", Open, "Document Date");
                applyCustLegderEntry.SetRange("Customer No.", customner);
                applyCustLegderEntry.SetRange(Open, true);
                //applyCustLegderEntry.SETRANGE("Applying Entry",TRUE);
                applyCustLegderEntry.SetRange("Customer Posting Group", Custpostinggrp);
                applyCustLegderEntry.SetRange("Posting Date", Sdate, Edate);
                applyCustLegderEntry.SetRange(Positive, true);
                if applyCustLegderEntry.FindFirst then
                    repeat
                        chk := 1;
                        if not (RemainingAmount > 0) then begin

                            applyCustLegderEntry."Applies-to ID" := UserId;

                            applyCustLegderEntry.CalcFields("Remaining Amount");
                            ApplyRemainingAmount := applyCustLegderEntry."Remaining Amount";
                            //IF RemainingAmount>ApplyRemainingAmount*-1 THEN
                            applyCustLegderEntry."Amount to Apply" := applyCustLegderEntry."Remaining Amount";
                            //ELSE
                            //applyCustLegderEntry."Amount to Apply":=RemainingAmount;
                            applyCustLegderEntry.Modify;

                            RemainingAmount := RemainingAmount + applyCustLegderEntry."Amount to Apply";
                        end;
                    until applyCustLegderEntry.Next = 0;

                if chk = 1 then begin
                    CustLedgerEntry.Modify;
                    unapplyparameter."Document No." := '';
                    unapplyparameter."Posting Date" := Today;
                    CustEntryApplyPostedEntries.Apply(CustLedgerEntry, unapplyparameter);

                end;
                bool := true;
            until CustLedgerEntry.Next = 0;
        exit(bool);
    end;
}

