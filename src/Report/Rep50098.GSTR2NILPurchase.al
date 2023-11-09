Report 50098 "GSTR2_NIL_Purchase"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTR2_NIL_Purchase.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "GST Component Code") order(ascending) where("Transaction Type" = const(Purchase), "Source Type" = const(Vendor), "Entry Type" = const("Initial Entry"), "Document Type" = const(Invoice));
            RequestFilterFields = "Posting Date", "Document No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(BuyerSellerRegNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Buyer/Seller Reg. No.")
            {
            }
            column(DocumentNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document No.")
            {
            }
            column(DocumentLineNo_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Document Line No.")
            {
            }
            column(No_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."No.")
            {
            }
            column(PostingDate_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Posting Date")
            {
            }
            column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"
            {
            }
            column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
            {
            }
            column(InvoiceType_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Invoice Type"?//Nkp
            {
            }
            column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."//Nkp
            {
            }
            column(GSTComponentCode_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Component Code")
            {
            }
            column(GST_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST %")
            {
            }
            column(GSTBaseAmount_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."GST Base Amount")
            {
            }
            column(Tot_Nil_Rated_InterState; Tot_Nil_Rated_InterState)
            {
            }
            column(Tot_Nil_Rated_Composit_InterState; Tot_Nil_Rated_Composit_InterState)
            {
            }
            column(Tot_Nil_Rated_NonGST_InterState; Tot_Nil_Rated_NonGST_InterState)
            {
            }
            column(Tot_Nil_Rated_Exempted_InterState; Tot_Nil_Rated_Exempted_InterState)
            {
            }
            column(Tot_Nil_Rated_IntraState; Tot_Nil_Rated_IntraState)
            {
            }
            column(Tot_Nil_Rated_Composit_IntraState; Tot_Nil_Rated_Composit_IntraState)
            {
            }
            column(Tot_Nil_Rated_NonGST_IntraState; Tot_Nil_Rated_NonGST_IntraState)
            {
            }
            column(Tot_Nil_Rated_Exempted_IntraState; Tot_Nil_Rated_Exempted_IntraState)
            {
            }
            column(company_name; companyinfo.Name)
            {
            }
            column(conditionno; conditionno)
            {
            }
            column(periodfilter; periodfilter)
            {
            }
            column(periodstartdate; periodstartdate)
            {
            }
            column(periodenddate; periodenddate)
            {
            }
            column(GSTTINRegNo; GSTTINRegNo)
            {
            }
            column(state_code; state_code)
            {
            }
            column(state_; state_)
            {
            }
            column(LocVal; LocVal)
            {
            }

            trigger OnAfterGetRecord()
            begin

                Clear(Tot_Nil_Rated_InterState);
                Clear(Tot_Nil_Rated_Composit_InterState);
                Clear(Tot_Nil_Rated_NonGST_InterState);
                Clear(Tot_Nil_Rated_Exempted_InterState);
                Clear(Tot_Nil_Rated_IntraState);
                Clear(Tot_Nil_Rated_Composit_IntraState);
                Clear(Tot_Nil_Rated_NonGST_IntraState);
                Clear(Tot_Nil_Rated_Exempted_IntraState);
                conditionno := '';
                DtGstLdjEnt.SetFilter("GST %", '%1', "Detailed GST Ledger Entry"."GST %");

                if (((DtGstLdjEntInfo."Sales Invoice Type" = 0) and (DtGstLdjEnt."GST %" = 0) and (DtGstLdjEnt."GST Vendor Type" <> 5)) or (DtGstLdjEnt."GST Vendor Type" = 5) or (DtGstLdjEnt."GST Vendor Type" = 2) or
                  (DtGstLdjEntInfo."Sales Invoice Type" = 6)) then begin

                    //For InterState and Registered and UnRegistered
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 1);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1|%2', 1, 3);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            if (DtGstLdjEnt."GST Component Code" = 'CGST') and (DtGstLdjEnt."GST Component Code" = 'IGST') then begin
                                Tot_Nil_Rated_InterState := Tot_Nil_Rated_InterState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                                conditionno := '1st Condition'
                            end;

                        until DtGstLdjEnt.Next = 0;
                    end;
                    //Done For InterState and Registered and UnRegistered

                    //For InterState and Composit
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 1);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1', 2);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            Tot_Nil_Rated_Composit_InterState := Tot_Nil_Rated_Composit_InterState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                            conditionno := '2nd Condition'
                        until DtGstLdjEnt.Next = 0;
                    end;
                    //Done For InterState and Composit

                    //For InterState and Registered and UnRegistered and NON GST SUPPLY
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 1);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1|%2', 1, 3);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 6);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            if (DtGstLdjEnt."GST Component Code" = 'CGST') and (DtGstLdjEnt."GST Component Code" = 'IGST') then begin
                                Tot_Nil_Rated_NonGST_InterState := Tot_Nil_Rated_NonGST_InterState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                                conditionno := '3rd Condition'
                            end;
                        until DtGstLdjEnt.Next = 0;
                    end;

                    //location
                    location.Reset;
                    location.SetRange(location."GST Registration No.", GSTTINRegNo);
                    if location.FindFirst then begin
                        LocVal := location.Code;
                    end;


                    RecGSTRegNo.Reset;
                    RecGSTRegNo.SetRange(RecGSTRegNo.Code, GSTTINRegNo);
                    if RecGSTRegNo.FindFirst then begin
                        state_code := RecGSTRegNo."State Code";
                    end;
                    //
                    //Done For InterState and Registered and UnRegistered and NON GST SUPPLY

                    //For InterState and exempted
                    DtGstLdjEnt.Reset;
                    DtGstLdjEntInfo.Get(DtGstLdjEnt."Entry No."); //NKP--CCIT
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 1);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1', 5);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 6);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            Tot_Nil_Rated_Exempted_InterState := Tot_Nil_Rated_Exempted_InterState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                            conditionno := '4th Condition'
                        until DtGstLdjEnt.Next = 0;
                    end;
                    //Done For InterState and exempted

                    //For Intra State and Registered and UnRegistered
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1|%2', 1, 3);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            if (DtGstLdjEnt."GST Component Code" = 'CGST') and (DtGstLdjEnt."GST Component Code" = 'IGST') then begin
                                Tot_Nil_Rated_IntraState := Tot_Nil_Rated_IntraState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                                conditionno := '5th Condition'
                            end;
                        until DtGstLdjEnt.Next = 0;
                    end;
                    //Done For Intra State and Registered and UnRegistered

                    //For Intra State and Composited
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1', 2);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            Tot_Nil_Rated_Composit_IntraState := Tot_Nil_Rated_Composit_IntraState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                            conditionno := '6th Condition'
                        until DtGstLdjEnt.Next = 0;
                    end;
                    //Done For Intra State and Composited

                    //For Intra State and Registered and UnRegistered and NON GST SUPPLY
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1|%2', 1, 3);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 6);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            if (DtGstLdjEnt."GST Component Code" = 'CGST') and (DtGstLdjEnt."GST Component Code" = 'IGST') then begin
                                Tot_Nil_Rated_NonGST_IntraState := Tot_Nil_Rated_NonGST_IntraState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                                conditionno := '7th Condition'
                            end;
                        until DtGstLdjEnt.Next = 0;
                    end;
                    //Done For Intra State and NON GST SUPPLY

                    //For Intra State and exempted
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST Vendor Type", '%1', 5);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 6);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            Tot_Nil_Rated_Exempted_IntraState := Tot_Nil_Rated_Exempted_IntraState + DtGstLdjEntInfo."Amount to Customer/Vendor";
                            conditionno := '8th Condition'
                        until DtGstLdjEnt.Next = 0;
                    end;
                    //Done For Intra State and exempted
                end else
                    CurrReport.Skip;


                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("GSTIN Of Location"; GSTTINRegNo)
                {
                    ApplicationArea = Basic;
                    TableRelation = "GST Registration Nos.".Code;
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

    trigger OnPreReport()
    begin
        companyinfo.Get;
        periodfilter := "Detailed GST Ledger Entry".GetFilter("Detailed GST Ledger Entry"."Posting Date");
        periodstartdate := "Detailed GST Ledger Entry".GetRangeMin("Detailed GST Ledger Entry"."Posting Date");
        periodenddate := "Detailed GST Ledger Entry".GetRangemax("Detailed GST Ledger Entry"."Posting Date");
    end;

    var
        DtGstLdjEnt: Record "Detailed GST Ledger Entry";
        Tot_Nil_Rated_InterState: Decimal;
        Tot_Nil_Rated_Composit_InterState: Decimal;
        Tot_Nil_Rated_NonGST_InterState: Decimal;
        Tot_Nil_Rated_Exempted_InterState: Decimal;
        Tot_Nil_Rated_IntraState: Decimal;
        Tot_Nil_Rated_Composit_IntraState: Decimal;
        Tot_Nil_Rated_NonGST_IntraState: Decimal;
        Tot_Nil_Rated_Exempted_IntraState: Decimal;
        GSTTINRegNo: Code[30];
        companyinfo: Record "Company Information";
        conditionno: Code[20];
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        location: Record Location;
        state_code: Text[20];
        state_: Text[20];
        RecGSTRegNo: Record "GST Registration Nos.";
        LocVal: Code[10];
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";


}

