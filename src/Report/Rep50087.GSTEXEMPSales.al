Report 50087 GSTEXEMPSales
{
    // Rohit 10.11.2017
    // 1.Modified code as per requirement.
    // 2.Modified layour as per requirement.
    // 3.change formula for invoice value.
    // 4.Added period filter.
    // 5.Added company name.
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTEXEMPSales.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;

    dataset
    {
        dataitem("GST Ledger Entry"; "GST Ledger Entry")
        {
            RequestFilterFields = "Posting Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
            {
                DataItemLink = "Document No." = field("Document No.");
                DataItemTableView = where("Transaction Type" = const(Sales), "Source Type" = const(Customer), "Entry Type" = const("Initial Entry"), "Document Type" = const(Invoice));
                RequestFilterFields = "Posting Date", "Document No.";
                column(ReportForNavId_1000000001; 1000000001)
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
                column(AmounttoCustomerVendor_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Amount to Customer/Vendor"//Nkp
                {
                }
                column(PoS; PoS)
                {
                }
                column(ReverseCharge_DetailedGSTLedgerEntry; "Detailed GST Ledger Entry"."Reverse Charge")
                {
                }
                column(InvoiceType_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."Invoice Type"//Nkp
                {
                }
                column(eCommOperatorGSTRegNo_DetailedGSTLedgerEntry; '')//"Detailed GST Ledger Entry"."e-Comm. Operator GST Reg. No."//Nkp
                {
                }
                column(GSTPrcnt; GSTPrcnt)
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
                column(TotGstAmt; TotGstAmt)
                {
                }
                column(TotalInvoiceValue; TotalInvoiceValue)
                {
                }
                column(TaxableValue; TaxableValue)
                {
                }
                column(GrAdvAmt; GrAdvAmt)
                {
                }
                column(TotNilRatedReg; TotNilRatedReg)
                {
                }
                column(TotNilRatedUnReg; TotNilRatedUnReg)
                {
                }
                column(TotNilRatedExempted; TotNilRatedExempted)
                {
                }
                column(TotNilRatedNonGSTSupp; TotNilRatedNonGSTSupp)
                {
                }
                column(TotNilRatedUnReg_Exempted; TotNilRatedUnReg_Exempted)
                {
                }
                column(TotNilRated_UnReg_NonGSTSupp; TotNilRated_UnReg_NonGSTSupp)
                {
                }
                column(TotNilRatedReg_Intra; TotNilRatedReg_Intra)
                {
                }
                column(TotNilRatedNonGSTSupp_Intra; TotNilRatedNonGSTSupp_Intra)
                {
                }
                column(TotNilRatedUnReg_Intra; TotNilRatedUnReg_Intra)
                {
                }
                column(TotNilRated_UnReg_NonGSTSupp_Intra; TotNilRated_UnReg_NonGSTSupp_Intra)
                {
                }
                column(periodstartdate; Format(periodstartdate))
                {
                }
                column(periodenddate; Format(periodenddate))
                {
                }
                column(Comp_Name; CompanyInformation.Name)
                {
                }
                column(GSTTINRegNo; GSTTINRegNo)
                {
                }
                column(state_code; state_code)
                {
                }
                column(LocVal; LocVal)
                {
                }
                column(CustName; CustName)
                {
                }
                column(Exempetvalue; Exempetvalue)
                {
                }

                trigger OnPreDataItem()
                begin
                    "Detailed GST Ledger Entry".Reset;
                    "Detailed GST Ledger Entry".SetFilter("GST Customer Type", '%1', 5);
                    if "Detailed GST Ledger Entry".Find('-') then begin
                        repeat
                            Exempetvalue := Exempetvalue + (CGST + SGST + IGST + TDSAmt);
                            Message(Format(Exempetvalue));
                        until "Detailed GST Ledger Entry".Next = 0;
                    end;


                    //For InterState and EXEMPTED
                    DtGstLdjEntInfo.Get("Detailed GST Ledger Entry"."Entry No."); //NKP--CCIT
                    DtGstLdjEnt.Reset;
                    DtGstLdjEnt.SetFilter("GST Jurisdiction Type", '%1', 1);
                    //DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',1);
                    DtGstLdjEntInfo.SetFilter("Sales Invoice Type", '%1', 0);
                    DtGstLdjEnt.SetFilter("GST %", '%1', 0);
                    //  DtGstLdjEnt.SetFilter("GST Customer Type", '%1', 5);//rushab_ccit exempted no data
                    if DtGstLdjEnt.Find('-') then begin
                        repeat
                            TotNilRatedExempted := TotNilRatedExempted + (CGST + SGST + IGST + TDSAmt);
                        // TotNilRatedExempted := TotNilRatedExempted + DtGstLdjEnt."Amount to Customer/Vendor";//Nkp
                        // MESSAGE('1 ' + FORMAT(TotNilRatedReg));
                        until DtGstLdjEnt.Next = 0;
                    end;
                    Message(Format(TotNilRatedExempted));
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*
                
                IF (((DtGstLdjEnt."Invoice Type" = 0) AND (DtGstLdjEnt."GST %" = 0) AND (DtGstLdjEnt."GST Customer Type" <> 5)) OR (DtGstLdjEnt."GST Customer Type" = 5) OR
                  (DtGstLdjEnt."Invoice Type" = 6)) THEN
                BEGIN
                TotNilRatedReg := 0;
                TotNilRatedUnReg := 0;
                TotNilRatedReg_Intra := 0;
                TotNilRatedNonGSTSupp_Intra := 0;
                TotNilRatedUnReg_Intra := 0;
                TotNilRated_UnReg_NonGSTSupp_Intra := 0;
                
                //NEW CODE 222
                
                //For InterState and Registered
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',1);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',1);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedReg := TotNilRatedReg + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For InterState and Registered
                
                //Presently this section is stop
                {
                //For InterState and EXEMPTED
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',1);
                //DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',1);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',5);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedExempted := TotNilRatedExempted + DtGstLdjEnt."Amount to Customer/Vendor";
                 // MESSAGE('1 ' + FORMAT(TotNilRatedReg));
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For InterState and EXEMPTED
                }
                //End Presently this section is stop  ^^
                
                
                //For InterState and NON GST SUPPLY
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',1);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',1);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',6);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedNonGSTSupp := TotNilRatedNonGSTSupp + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For InterState and NON GST SUPPLY
                
                
                //for unregister NEW----------------------------------------SANTANU
                
                
                //For InterState and Un Registered
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',1);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',2);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedUnReg := TotNilRatedUnReg + DtGstLdjEnt."Amount to Customer/Vendor";
                  MESSAGE('1 ' + FORMAT(TotNilRatedReg));
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For InterState and Un Registered
                
                //Presently this section is blocked
                {
                //For InterState and EXEMPTED
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',1);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',2);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedUnReg_Exempted := TotNilRatedUnReg_Exempted + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For InterState and EXEMPTED
                }
                
                //END Presently this section is blocked  ^^
                
                
                //For InterState and NON GST SUPPLY
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',1);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',2);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',6);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRated_UnReg_NonGSTSupp := TotNilRated_UnReg_NonGSTSupp + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For InterState and NON GST SUPPLY
                
                //End Un Register
                
                //end new unregistered---------------------------------------SANTANU
                
                //END NEW CODE 333
                
                
                //Intra State Code
                
                
                //For Intra State and Registered
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',1);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedReg_Intra := TotNilRatedReg_Intra + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For Intra State and Registered
                
                
                //For Intra State and NON GST SUPPLY
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',1);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',6);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedNonGSTSupp_Intra := TotNilRatedNonGSTSupp_Intra + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For Intra State and NON GST SUPPLY
                
                //For Intra State and Un Registered
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',2);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRatedUnReg_Intra := TotNilRatedUnReg_Intra + DtGstLdjEnt."Amount to Customer/Vendor";
                 // MESSAGE('1 ' + FORMAT(TotNilRatedReg));
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                //Done For Intra State and Un Registered
                
                //For Intra State and NON GST SUPPLY and Un Registered
                DtGstLdjEnt.RESET;
                DtGstLdjEnt.SETFILTER("GST Jurisdiction Type",'%1',0);
                DtGstLdjEnt.SETFILTER("GST Customer Type",'%1',2);
                DtGstLdjEnt.SETFILTER("Invoice Type",'%1',6);
                DtGstLdjEnt.SETFILTER("GST %",'%1',0);
                IF DtGstLdjEnt.FIND('-') THEN BEGIN
                REPEAT
                TotNilRated_UnReg_NonGSTSupp_Intra := TotNilRated_UnReg_NonGSTSupp_Intra + DtGstLdjEnt."Amount to Customer/Vendor";
                UNTIL DtGstLdjEnt.NEXT = 0;
                END;
                
                END ELSE
                    CurrReport.SKIP;
                
                
                
                //location
                location.RESET;
                location.SETRANGE(location."GST Registration No.",GSTTINRegNo);
                IF location.FINDFIRST THEN BEGIN
                  LocVal:=location.Code;
                END;
                
                RecGSTRegNo.RESET;
                RecGSTRegNo.SETRANGE(RecGSTRegNo.Code,GSTTINRegNo);
                IF RecGSTRegNo.FINDFIRST THEN BEGIN
                  state_code := RecGSTRegNo."State Code";
                END;
                //code for customer name,ext doc no
                RecSalInv.RESET;
                RecSalInv.SETRANGE(RecSalInv."No.","Detailed GST Ledger Entry"."Document No.");
                IF RecSalInv.FINDFIRST THEN BEGIN
                  CustName := RecSalInv."Bill-to Name";
                  //ExtDocNo := RecSalInv."External Document No.";
                END;
                //
                */
                "Detailed GST Ledger Entry".SetRange("Detailed GST Ledger Entry"."Location  Reg. No.", GSTTINRegNo);

                if "Detailed GST Ledger Entry"."Location  Reg. No." <> GSTTINRegNo then
                    CurrReport.Skip;

            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get('');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("GSTIN For Location"; GSTTINRegNo)
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
        periodfilter := "Detailed GST Ledger Entry".GetFilter("Detailed GST Ledger Entry"."Posting Date");
        periodstartdate := "Detailed GST Ledger Entry".GetRangeMin("Detailed GST Ledger Entry"."Posting Date");
        periodenddate := "Detailed GST Ledger Entry".GetRangemax("Detailed GST Ledger Entry"."Posting Date");
    end;

    var
        InvVal: Decimal;
        PoS: Code[20];
        GSTPrcnt: Decimal;
        TotGstAmt: Decimal;
        DtGstLdjEnt: Record "Detailed GST Ledger Entry";
        State: Record State;
        TotalInvoiceValue: Decimal;
        TaxableValue: Decimal;
        GrAdvAmt: Decimal;
        TotNilRatedReg: Decimal;
        TotNilRatedUnReg: Decimal;
        TotNilRatedExempted: Decimal;
        TotNilRatedNonGSTSupp: Decimal;
        TotNilRatedUnReg_Exempted: Decimal;
        TotNilRated_UnReg_NonGSTSupp: Decimal;
        TotNilRatedReg_Intra: Decimal;
        TotNilRatedNonGSTSupp_Intra: Decimal;
        TotNilRatedUnReg_Intra: Decimal;
        TotNilRated_UnReg_NonGSTSupp_Intra: Decimal;
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        GSTTINRegNo: Code[30];
        CompanyInformation: Record "Company Information";
        location: Record Location;
        state_code: Text[20];
        LocVal: Code[10];
        RecGSTRegNo: Record "GST Registration Nos.";
        RecSalInv: Record "Sales Invoice Header";
        CustName: Text;
        Exempetvalue: Decimal;
        DtGstLdjEntInfo: Record "Detailed GST Ledger Entry Info";
        taxinfo: Codeunit TaxInfo;
        GSTBaseAmt: Decimal;
        TDSAmt: Decimal;
        TDSBaseAmt: Decimal;
        IGST: Decimal;
        SGST: Decimal;
        CGST: Decimal;
        IGSTPer: Decimal;
        SGSTPer: Decimal;
        CGSTPer: Decimal;
    //Naveen
}

