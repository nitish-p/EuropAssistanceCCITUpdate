Report 50001 CustomerCodeCreation
{

    ProcessingOnly = true;
    ShowPrintStatus = false;
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Posting Group"; "Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Customer Posting Group";
                }
                field("General Business Posting Group"; "General Business Posting Group")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Gen. Business Posting Group";
                }
                field(GSTCustType; GSTCustType)
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

    trigger OnPostReport()
    begin
        RecCustomer.Reset;
        RecCustomer.SetRange(RecCustomer."No.", CustNo);
        if RecCustomer.FindFirst then
            Page.Run(21, RecCustomer);
    end;

    trigger OnPreReport()
    begin

        // to get initial of customer name

        InitialChar := CopyStr("Customer Name", 1, 1);
        SecondChar := CopyStr("Customer Posting Group", 1, 1);
        // to get business post group code
        if "General Business Posting Group" = 'AUTO-ER' then begin
            BusGrp := 'ER';
        end;

        if "General Business Posting Group" = 'AUTO-EW' then begin
            BusGrp := 'EI';
        end;

        if "General Business Posting Group" = 'AUTO-RE' then begin
            Error('You have to create customer code manually for AUTO-RE');
        end;

        if "General Business Posting Group" = 'FOR - INCI' then begin
            BusGrp := 'IC';
        end;

        if "General Business Posting Group" = 'FOR - INCR' then begin
            BusGrp := 'IR';
        end;

        if "General Business Posting Group" = 'AUTO-RS' then begin
            BusGrp := 'RS';
        end;

        if "General Business Posting Group" = 'CONCEIR-I' then begin
            BusGrp := 'CR';
        end;

        if "General Business Posting Group" = 'CONCEIR-R' then begin
            BusGrp := 'OR';
        end;

        if "General Business Posting Group" = 'TRAVEL-I' then begin
            BusGrp := 'IN';
        end;

        if "General Business Posting Group" = 'TRAVEL-R' then begin
            if "Customer Posting Group" = 'DOM-OUTRMB' then
                BusGrp := 'OR';
            if "Customer Posting Group" = 'DOM-TRRMB' then
                BusGrp := 'TR';
        end;

        if "General Business Posting Group" = 'TRAVEL-OR' then begin
            BusGrp := 'OR';
        end;

        if "General Business Posting Group" = 'HOME - I' then begin
            BusGrp := 'HA';
        end;

        if "General Business Posting Group" = 'DOM-OTHERS' then begin
            BusGrp := 'OT';
        end;

        // LastNo:='';
        // // to get last incremental no.
        //  Customer1.Reset;
        //  Customer1.Ascending(true);
        //  //Customer1.SETRANGE(Customer1."Customer Posting Group","Customer Posting Group");
        //  Customer1.SetRange(Customer1."Gen. Bus. Posting Group","General Business Posting Group");
        //  if Customer1.FindSet then repeat
        //   if ((CopyStr(Customer1.Name,1,1) = InitialChar)) then begin
        //     if  ((CopyStr(Customer1."No.",2,1) = SecondChar ))    then begin
        //     LastNo:=CopyStr(Customer1."No.",6,11);
        //   end;
        //   end;

        // until Customer1.Next = 0;

        // // to get customer code for current new customer
        // if LastNo <> ''then
        // NewNo :=IncStr(LastNo)
        // else
        // NewNo   := '000001';
        // CustNo :='C'+SecondChar+BusGrp+InitialChar+NewNo;

        // if (("Customer Name" <> '') and ("General Business Posting Group" <> '')
        // and ("Customer Posting Group" <> '') and (GSTCustType <> 0)) then begin
        CustNo := NoSeriesMgt.GetNextNo(salesSetup."Customer Nos.", Today, true);
        RecCustomer.Reset;
        RecCustomer.SetRange(RecCustomer."No.", CustNo);
        if not RecCustomer.FindFirst then begin
            RecCustomer."No." := CustNo;
            RecCustomer.Name := UpperCase("Customer Name");
            RecCustomer."Customer Posting Group" := "Customer Posting Group";
            RecCustomer."Gen. Bus. Posting Group" := "General Business Posting Group";
            RecCustomer."GST Customer Type" := GSTCustType;
            RecCustomer.Insert;

        end;
        // end else begin
        // Error('Kindly fill all 4 fields to create customer code');
        // end;
    end;

    var
        "Customer Posting Group": Code[10];
        "Customer Name": Text[250];
        CustNo: Text[250];
        RecCustomer: Record Customer;
        BusGrp: Code[10];
        Customer1: Record Customer;
        LastNo: Code[10];
        NewNo: Code[10];
        InitialChar: Code[10];
        "General Business Posting Group": Text[10];
        SecondChar: Text[10];
        GSTCustType: enum "GST Customer Type";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        salesSetup: Record "Sales & Receivables Setup";
}

