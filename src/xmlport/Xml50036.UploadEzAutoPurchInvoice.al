XmlPort 50036 "Upload Ez Auto Purch Invoice"
{
    // prdp 100920

    Direction = Import;
    FileName = 'PurchInvUploadErrorLog.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Easy Auto - NAV Bridge";"Easy Auto - NAV Bridge")
            {
                XmlName = 'ValidateBridge';
                fieldelement(VenodeCode;"Easy Auto - NAV Bridge"."Vendor Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(TransactionNo;"Easy Auto - NAV Bridge"."Transaction No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Type;"Easy Auto - NAV Bridge".Type)
                {
                    MinOccurs = Zero;
                }
                fieldelement(ItemCode;"Easy Auto - NAV Bridge"."Item Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Quantity;"Easy Auto - NAV Bridge".Quantity)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Amount;"Easy Auto - NAV Bridge".Amount)
                {
                    MinOccurs = Zero;
                }
                fieldelement(UOMCode;"Easy Auto - NAV Bridge"."UOM Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DirectUnitCost;"Easy Auto - NAV Bridge"."Direct Unit Cost")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PaymentDueDate;"Easy Auto - NAV Bridge"."Payment Due Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PostingDate;"Easy Auto - NAV Bridge"."Posting Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DocumentDate;"Easy Auto - NAV Bridge"."Document Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Structure;"Easy Auto - NAV Bridge".Structure)
                {
                    MinOccurs = Zero;
                }
                fieldelement(TDSNOD;"Easy Auto - NAV Bridge"."TDS Nature Of Deduction")
                {
                    MinOccurs = Zero;
                }
                fieldelement(VehicleRegNo;"Easy Auto - NAV Bridge"."Vehicle Registration No")
                {
                    MinOccurs = Zero;
                }
                fieldelement(PolicyNo;"Easy Auto - NAV Bridge"."Policy No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(VariantCode;"Easy Auto - NAV Bridge"."Variant Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(CaseNo;"Easy Auto - NAV Bridge"."Case No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(VendorInvNo;"Easy Auto - NAV Bridge"."Vendor Invoice No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(VINNo;"Easy Auto - NAV Bridge"."Vehicle Identification No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ServiceID;"Easy Auto - NAV Bridge"."Service ID")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ServiceDate;"Easy Auto - NAV Bridge"."Service Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(InvoiceDate;"Easy Auto - NAV Bridge"."Invoice Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DepartmentCode;"Easy Auto - NAV Bridge"."Department Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(BusinessLineCode;"Easy Auto - NAV Bridge"."Business Line Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ClientNameCode;"Easy Auto - NAV Bridge"."Client Name Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Narration;"Easy Auto - NAV Bridge".Narration)
                {
                    MinOccurs = Zero;
                }
                fieldelement(DiscountReceived;"Easy Auto - NAV Bridge"."Discount Received")
                {
                    MinOccurs = Zero;
                }
                fieldelement(DRSA;"Easy Auto - NAV Bridge".DRSA)
                {
                    MinOccurs = Zero;
                }
                fieldelement(SLA;"Easy Auto - NAV Bridge".SLA)
                {
                    MinOccurs = Zero;
                }
                fieldelement(CSAT;"Easy Auto - NAV Bridge".CSAT)
                {
                    MinOccurs = Zero;
                }
                fieldelement(Hydra;"Easy Auto - NAV Bridge"."Hydra Charges")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Toll;"Easy Auto - NAV Bridge"."Toll Charges")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Waiting;"Easy Auto - NAV Bridge"."Waiting Charges")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Border;"Easy Auto - NAV Bridge"."Border Charges")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Other;"Easy Auto - NAV Bridge"."Other Charges")
                {
                    MinOccurs = Zero;
                }
                fieldelement(FileName;"Easy Auto - NAV Bridge"."File Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(InvoiceType;"Easy Auto - NAV Bridge"."Invoice Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Final;"Easy Auto - NAV Bridge".Final)
                {
                    MinOccurs = Zero;
                }
                fieldelement(PostingNoSeries;"Easy Auto - NAV Bridge".PostingNoSeries)
                {
                    MinOccurs = Zero;
                }
                fieldelement(PostingNo;"Easy Auto - NAV Bridge".PostingNo)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    "Easy Auto - NAV Bridge"."Manual Import CASE ID":=CASEID;
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
        ValidateBridge.Reset;
        ValidateBridge.SetRange("Manual Import CASE ID",CASEID);
        ValidateBridge.SetFilter(Flag,'<>%1',0);
        if ValidateBridge.FindFirst then begin


        Message('Error occured ; Please check Rejected Log in csv file');

        ValidateBridge1.Reset;
        ValidateBridge1.SetRange("Manual Import CASE ID",CASEID);
        if ValidateBridge1.FindFirst then begin
        Commit;
        XMLRejectMAster.SetTableview(ValidateBridge1);
        XMLRejectMAster.Run;
        end;

        end else begin

        ValidateBridge1.Reset;
        ValidateBridge1.SetRange("Manual Import CASE ID",CASEID);
        if ValidateBridge1.FindSet then repeat

        EvaluatedDocumentDate:=0D;
        EvaluatedInvoiceDate:=0D;
        EvaluatedPayDueDate:=0D;
        EvaluatedServiceDate:=0D;

        TransactionAPI.Reset;
        TransactionAPI.Init;
        TransactionAPI.Validate("Vendor Code",ValidateBridge1."Vendor Code");
        TransactionAPI.Validate("Transaction No.",ValidateBridge1."Transaction No.");
        TransactionAPI.Validate(Type,ValidateBridge1.Type);
        TransactionAPI.Validate("Item Code",ValidateBridge1."Item Code");
        TransactionAPI.Validate(Quantity,ValidateBridge1.Quantity);
        TransactionAPI.Validate(Amount,ValidateBridge1.Amount);
        TransactionAPI.Validate("UOM Code",ValidateBridge1."UOM Code");
        TransactionAPI.Validate("Direct Unit Cost",ValidateBridge1."Direct Unit Cost");

        if ValidateBridge1."Payment Due Date" <> '' then begin
        Evaluate(EvaluatedPayDueDate,ValidateBridge1."Payment Due Date");
        TransactionAPI.Validate("Payment Due Date",EvaluatedPayDueDate);
        end;

        TransactionAPI.Validate("Posting Date",ValidateBridge1."Posting Date");

        if ValidateBridge1."Document Date" <> '' then begin
        Evaluate(EvaluatedDocumentDate,ValidateBridge1."Document Date");
        TransactionAPI.Validate("Document Date",EvaluatedDocumentDate);
        end;

        TransactionAPI.Validate(Structure,ValidateBridge1.Structure);
        TransactionAPI.Validate("TDS Nature Of Deduction",ValidateBridge1."TDS Nature Of Deduction");
        TransactionAPI.Validate("Vehicle Registration No",ValidateBridge1."Vehicle Registration No");
        TransactionAPI.Validate("Policy No.",ValidateBridge1."Policy No.");
        TransactionAPI.Validate("Variant Code",ValidateBridge1."Variant Code");
        TransactionAPI.Validate("Case No.",ValidateBridge1."Case No.");
        TransactionAPI.Validate("Vendor Invoice No.",ValidateBridge1."Vendor Invoice No.");
        TransactionAPI.Validate("Vehicle Identification No.",ValidateBridge1."Vehicle Identification No.");
        TransactionAPI.Validate("Service ID",ValidateBridge1."Service ID");

        if ValidateBridge1."Service Date" <> '' then begin
        Evaluate(EvaluatedServiceDate,ValidateBridge1."Service Date");
        TransactionAPI.Validate("Service Date",EvaluatedServiceDate);
        end;

        if ValidateBridge1."Invoice Date" <> '' then begin
        Evaluate(EvaluatedInvoiceDate,ValidateBridge1."Invoice Date");
        TransactionAPI.Validate("Invoice Date",EvaluatedInvoiceDate);
        end;

        TransactionAPI.Validate("Department Code",ValidateBridge1."Department Code");
        TransactionAPI.Validate("Business Line Code",ValidateBridge1."Business Line Code");
        TransactionAPI.Validate("Client Name Code",ValidateBridge1."Client Name Code");
        TransactionAPI.Validate(Narration,ValidateBridge1.Narration);
        TransactionAPI.Validate("Discount Received",ValidateBridge1."Discount Received");
        TransactionAPI.Validate(DRSA,ValidateBridge1.DRSA);
        TransactionAPI.Validate(SLA,ValidateBridge1.SLA);
        TransactionAPI.Validate(CSAT,ValidateBridge1.CSAT);
        TransactionAPI.Validate("Hydra Charges",ValidateBridge1."Hydra Charges");
        TransactionAPI.Validate("Toll Charges",ValidateBridge1."Toll Charges");
        TransactionAPI.Validate("Waiting Charges",ValidateBridge1."Waiting Charges");
        TransactionAPI.Validate("Border Charges",ValidateBridge1."Border Charges");
        TransactionAPI.Validate("Other Charges",ValidateBridge1."Other Charges");
        TransactionAPI.Validate("File Name",ValidateBridge1."File Name");
        //CCIT-04082022 //For missing entries
        TransactionAPI.Validate(PostingNoSeries,ValidateBridge1.PostingNoSeries);
        TransactionAPI.Validate(PostingNo,ValidateBridge1.PostingNo);
        //CCIT-04082022
        TransactionAPI.Validate("Invoice Type",ValidateBridge1."Invoice Type");
        TransactionAPI.Validate(Final,ValidateBridge1.Final);

        TransactionAPI.Insert(true);

        until ValidateBridge1.Next=0;

        Message('Imported Successfully');

        end;
    end;

    trigger OnPreXmlPort()
    begin
        CASEID:=Format(CurrentDatetime);
    end;

    var
        CASEID: Text[50];
        ValidateBridge: Record "Easy Auto - NAV Bridge";
        XMLRejectMAster: XmlPort "Export Error Log Ez Auto PI";
        ValidateBridge1: Record "Easy Auto - NAV Bridge";
        TransactionAPI: Record "Transaction API";
        EvaluatedPayDueDate: Date;
        EvaluatedDocumentDate: Date;
        EvaluatedInvoiceDate: Date;
        EvaluatedServiceDate: Date;
}

