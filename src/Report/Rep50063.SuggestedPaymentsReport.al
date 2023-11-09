Report 50063 "Suggested Payments Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Suggested Payments Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.") order(descending) where(Type = filter(<> " "), "No." = filter(<> '140042'), "Suggested Payment" = const(true));
            RequestFilterFields = "Posting Date", "Buy-from Vendor No.", "Document No.", "Integration Doc No";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Amount_PurchInvLine; "Purch. Inv. Line".Amount)
            {
            }
            column(DocumentNo_PurchInvLine; "Purch. Inv. Line"."Document No.")
            {
            }
            column(CaseNo_PurchInvLine; "Purch. Inv. Line"."Case No.")
            {
            }
            column(ServiceID_PurchInvLine; "Purch. Inv. Line"."Service ID")
            {
            }
            column(ServiceDate_PurchInvLine; Format("Purch. Inv. Line"."Service Date"))
            {
            }
            column(LineAmount_PurchInvLine; "Purch. Inv. Line"."Line Amount")
            {
            }
            column(TotalGSTAmount_PurchInvLine; '')//"Purch. Inv. Line"."Total GST Amount"
            {
            }
            column(TDSAmount_PurchInvLine; '')//"Purch. Inv. Line"."TDS Amount"
            {
            }
            column(vendInvNo; vendInvNo)
            {
            }
            column(vendCode; vendCode)
            {
            }
            column(vendName; vendName)
            {
            }
            column(invAmt; invAmt)
            {
            }
            column(invDate; Format(invDate))
            {
            }
            column(invType; invType)
            {
            }
            column(paidAmt; paidAmt)
            {
            }
            column(payDate; Format(payDate))
            {
            }
            column(navDocNo; navDocNo)
            {
            }
            column(transactionRefNo; transactionRefNo)
            {
            }
            column(tranferDate; Format(tranferDate))
            {
            }
            column(cancelledReversed; cancelledReversed)
            {
            }
            column(tdsAmt; tdsAmt)
            {
            }
            column(paid; paid)
            {
            }
            column(UTRNo_PurchInvLine; "Purch. Inv. Line"."UTR No.")
            {
            }
            column(DateCreditedinBank_PurchInvLine; "Purch. Inv. Line"."Date Credited in Bank")
            {
            }
            column(IciciPaymentStatus_PurchInvLine; "Purch. Inv. Line"."Icici Payment Status")
            {
            }

            trigger OnAfterGetRecord()
            begin
                vendCode := '';
                vendName := '';
                vendInvNo := '';
                invAmt := 0;
                invDate := 0D;
                invType := '';
                cancelledReversed := '';
                tranferDate := 0D;
                transactionRefNo := '';
                paidAmt := 0;
                payDate := 0D;
                navDocNo := '';
                tdsAmt := 0;
                paid := 0;

                invVLE.Reset;
                invVLE.SetRange(invVLE."Document Type", invVLE."document type"::Invoice);
                invVLE.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
                if invVLE.FindFirst then begin

                    if ((PayStartDt <> 0D) and (PayEndDt <> 0D)) then begin
                        payVLE.Reset;
                        payVLE.SetCurrentkey("Entry No.");
                        payVLE.Ascending(true);
                        payVLE.SetRange(payVLE."Document Type", payVLE."document type"::Payment);
                        payVLE.SetRange("Reference Invoice Number", invVLE."Document No.");
                        if payVLE.FindLast then begin
                            if ((payVLE."Posting Date" > PayEndDt) or (payVLE."Posting Date" < PayStartDt)) then
                                CurrReport.Skip;
                        end;
                    end;


                    recPurchInvHdr.Reset;
                    recPurchInvHdr.SetRange("No.", "Purch. Inv. Line"."Document No.");
                    if recPurchInvHdr.FindFirst then begin
                        vendInvNo := recPurchInvHdr."Vendor Invoice No.";
                    end;

                    if invVLE."Remaining Amount" = 0 then begin
                        paid := "Purch. Inv. Line"."Amount To Vendor";
                    end;

                    if ((invVLE."Remaining Amount" <> 0) and (invVLE.Amount <> invVLE."Remaining Amount") and (invVLE."Remaining Amount" = invVLE."GST Amount")) then begin
                        paid := "Purch. Inv. Line"."Line Amount";
                    end;
                    if ((invVLE."Remaining Amount" <> 0) and (invVLE.Amount <> invVLE."Remaining Amount") and (invVLE."Remaining Amount" = invVLE.Amount - invVLE."GST Amount")) then begin
                        // paid:="Purch. Inv. Line"."Total GST Amount";//Naveen
                    end;

                    invVLE.CalcFields(Amount);

                    invAmt := Abs(invVLE.Amount);
                    invDate := invVLE."Invoice Date";
                    invType := invVLE."Integrated Invoice Type";
                    navDocNo := invVLE."Document No.";
                    recVend.Get(invVLE."Vendor No.");
                    vendCode := invVLE."Vendor No.";
                    vendName := recVend.Name;

                    tdsEntry.Reset;
                    tdsEntry.SetRange("Document No.", invVLE."Document No.");
                    if tdsEntry.FindFirst then begin
                        tdsAmt := tdsEntry."TDS Amount";
                    end;



                    payVLE.Reset;
                    payVLE.SetRange(payVLE."Document Type", payVLE."document type"::Payment);
                    payVLE.SetRange("Reference Invoice Number", invVLE."Document No.");
                    if payVLE.FindSet then
                        repeat
                            payVLE.CalcFields(Amount);

                            payDate := payVLE."Posting Date";
                            paidAmt := paidAmt + Abs(payVLE.Amount)

 until payVLE.Next = 0;

                end;
            end;

            trigger OnPreDataItem()
            begin
                if ((PayStartDt <> 0D) and (PayEndDt = 0D)) then
                    Error('Please select Payment End Date too');
                if ((PayStartDt = 0D) and (PayEndDt <> 0D)) then
                    Error('Please select Payment Start Date too');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Payment Start Date"; PayStartDt)
                {
                    ApplicationArea = Basic;
                }
                field("Payment End Date"; PayEndDt)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        recVend: Record Vendor;
        vendInvNo: Code[50];
        recPurchInvHdr: Record "Purch. Inv. Header";
        invVLE: Record "Vendor Ledger Entry";
        payVLE: Record "Vendor Ledger Entry";
        BALE: Record "Bank Account Ledger Entry";
        vendName: Text[100];
        vendCode: Text[20];
        paidAmt: Decimal;
        invAmt: Decimal;
        invDate: Date;
        payDate: Date;
        invType: Text[20];
        navDocNo: Code[20];
        transactionRefNo: Code[20];
        tranferDate: Date;
        cancelledReversed: Code[20];
        tdsAmt: Decimal;
        tdsEntry: Record "TDS Entry";
        paid: Decimal;
        PaymentDate: Date;
        PayStartDt: Date;
        PayEndDt: Date;
}

