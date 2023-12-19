xmlport 50045 "Customer application"
{
    Direction = Import;
    Format = VariableText;
    Permissions = TableData 21 = rimd;

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

                trigger OnAfterInsertRecord()
                begin
                    IF NOT (ApplyCustomer) THEN
                        MESSAGE('Customer=%1 ,%2', customner, GETLASTERRORTEXT);
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
        MESSAGE('Done');
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
        bool := FALSE;
        chk := 0;
        CustLedgerEntry.RESET;
        CustLedgerEntry.SETRANGE("Customer No.", customner);
        //EVALUATE(Sdate,startdate);
        //EVALUATE(Edate,enddate);
        CustLedgerEntry.SETCURRENTKEY("Customer No.", "Posting Date");
        CustLedgerEntry.ASCENDING;
        //CustLedgerEntry.SETRANGE("Posting Date",Sdate,Edate);
        //CustLedgerEntry.SETRANGE("Customer Posting Group",Custpostinggrp);
        CustLedgerEntry.SETRANGE(Open, TRUE);
        CustLedgerEntry.SETRANGE(Positive, FALSE);
        IF CustLedgerEntry.FINDFIRST THEN
            REPEAT
                bool := FALSE;
                CustLedgerEntry.CALCFIELDS("Remaining Amount");
                RemainingAmount := CustLedgerEntry."Remaining Amount";
                CustLedgerEntry."Applying Entry" := TRUE;
                CustLedgerEntry."Applies-to ID" := USERID;
                CustLedgerEntry."Amount to Apply" := CustLedgerEntry."Remaining Amount";
                //CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",CustLedgerEntry);

                applyCustLegderEntry.RESET;
                applyCustLegderEntry.SETCURRENTKEY("Customer No.", "Posting Date");
                applyCustLegderEntry.SETRANGE("Customer No.", customner);
                applyCustLegderEntry.SETRANGE(Open, TRUE);
                //applyCustLegderEntry.SETRANGE("Applying Entry",TRUE);
                //applyCustLegderEntry.SETRANGE("Customer Posting Group",Custpostinggrp);
                //applyCustLegderEntry.SETRANGE("Posting Date",Sdate,Edate);
                applyCustLegderEntry.SETRANGE(Positive, TRUE);
                IF applyCustLegderEntry.FINDFIRST THEN
                    REPEAT
                        chk := 1;
                        IF NOT (RemainingAmount > 0) THEN BEGIN

                            applyCustLegderEntry."Applies-to ID" := USERID;

                            applyCustLegderEntry.CALCFIELDS("Remaining Amount");
                            ApplyRemainingAmount := applyCustLegderEntry."Remaining Amount";
                            IF ABS(RemainingAmount) > ABS(ApplyRemainingAmount) THEN BEGIN
                                applyCustLegderEntry."Amount to Apply" := applyCustLegderEntry."Remaining Amount";
                                RemainingAmount := RemainingAmount + applyCustLegderEntry."Amount to Apply";
                            END
                            ELSE BEGIN
                                applyCustLegderEntry."Amount to Apply" := ABS(RemainingAmount);
                                RemainingAmount := RemainingAmount + applyCustLegderEntry."Amount to Apply";
                            END;
                            applyCustLegderEntry.MODIFY;

                            //:=RemainingAmount+applyCustLegderEntry."Amount to Apply";
                        END;
                    UNTIL (applyCustLegderEntry.NEXT = 0) OR (RemainingAmount >= 0);

                IF chk = 1 THEN BEGIN
                    CustLedgerEntry.MODIFY;
                    unapplyparameter."Document No." := '';
                    unapplyparameter."Posting Date" := Today;
                    CustEntryApplyPostedEntries.Apply(CustLedgerEntry, unapplyparameter);

                END;
                bool := TRUE;
            UNTIL CustLedgerEntry.NEXT = 0;
        EXIT(bool);
    end;
}

