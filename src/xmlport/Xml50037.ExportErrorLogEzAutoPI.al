XmlPort 50037 "Export Error Log Ez Auto PI"
{

    Direction = Export;
    FileName = 'PurchInvUpload.csv';
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
                fieldelement(ErrorDescription;"Easy Auto - NAV Bridge".Response)
                {
                    MinOccurs = Zero;
                }
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

    var
        CASEID: Text[50];
        ValidateBridge: Record "Easy Auto - NAV Bridge";
        //XMLRejectMAster: XmlPort UnknownXmlPort50036;//Naveen
       // ValidateBridge1: Record UnknownRecord50015;//Naveen
}

