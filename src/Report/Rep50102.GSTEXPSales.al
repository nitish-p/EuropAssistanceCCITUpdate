Report 50102 "GSTEXP_Sales"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/GSTEXP_Sales.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = where("GST Customer Type" = filter(Export | "Deemed Export"));
            column(ReportForNavId_1000000015; 1000000015)
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                RequestFilterFields = "Posting Date", "Document No.";
                column(ReportForNavId_1000000000; 1000000000)
                {
                }
                column(Sales_Invoice_Line_DocumentNo; "Sales Invoice Line"."Document No.")
                {
                }
                column(Sales_Invoice_Line_PostingDate; "Sales Invoice Line"."Posting Date")
                {
                }
                column(Sales_Invoice_Line_Amount_To_Customer; '')//"Sales Invoice Line"."Amount To Customer"//Naveen
                {
                }
                column(GST_percent; '')//"Sales Invoice Line"."GST %"//Naveen
                {
                }
                column(GST_Base_amount; '')//"Sales Invoice Line"."GST Base Amount"
                {
                }//Naveen
                column(company_name; "company information".Name)
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
                column(LocVal; LocVal)
                {
                }
                column(state_code; state_code)
                {
                }
                column(GSTTINRegNo; GSTTINRegNo)
                {
                }
                column(Bill_of_exportno; Bill_of_exportno)
                {
                }
                column(Bill_of_exportdate; Bill_of_exportdate)
                {
                }
                column(ExpTyp; ExpTyp)
                {
                }

                trigger OnAfterGetRecord()
                begin

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

                    // code for bill of export no
                    SalesInvoiceHeader.Reset;
                    SalesInvoiceHeader.SetRange("No.", "Sales Invoice Line"."Document No.");
                    if SalesInvoiceHeader.FindFirst then begin
                        Bill_of_exportno := SalesInvoiceHeader."Bill Of Export No.";
                        Bill_of_exportdate := SalesInvoiceHeader."Bill Of Export Date";
                    end;
                    //MESSAGE(GSTCusttype);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                /*
                //"Sales Invoice Header".RESET;
                IF "Sales Invoice Header".FIND('-') THEN BEGIN REPEAT
                IF ("Sales Invoice Header"."GST Customer Type"= 3)AND ("Sales Invoice Header"."GST Customer Type"= 4) AND ("Sales Invoice Header"."GST Without Payment of Duty"=FALSE) THEN
                    ExpTyp := 'WPAY'
                ELSE IF ("Sales Invoice Header"."GST Customer Type"= 3)AND ("Sales Invoice Header"."GST Customer Type"= 4) AND ("Sales Invoice Header"."GST Without Payment of Duty"=TRUE) THEN
                     ExpTyp :='WOPAY'
                UNTIL "Sales Invoice Header".NEXT=0;
                END;
                */
                if ("Sales Invoice Header"."GST Without Payment of Duty" = false) then
                    ExpTyp := 'WPAY'
                else
                    if ("Sales Invoice Header"."GST Without Payment of Duty" = true) then
                        ExpTyp := 'WOPAY'

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("GSTIN of Location"; GSTTINRegNo)
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
        "company information".Get;

        periodfilter := "Sales Invoice Line".GetFilter("Sales Invoice Line"."Posting Date");
        periodstartdate := "Sales Invoice Line".GetRangeMin("Sales Invoice Line"."Posting Date");
        periodenddate := "Sales Invoice Line".GetRangemax("Sales Invoice Line"."Posting Date");
    end;

    var
        "company information": Record "Company Information";
        periodfilter: Text;
        periodstartdate: Date;
        periodenddate: Date;
        GSTTINRegNo: Code[30];
        location: Record Location;
        state_code: Text[20];
        LocVal: Code[10];
        RecGSTRegNo: Record "GST Registration Nos.";
        Bill_of_exportno: Code[30];
        Bill_of_exportdate: Date;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        ExpTyp: Text;
}

