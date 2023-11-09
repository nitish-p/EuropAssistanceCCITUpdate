XmlPort 50040 "Auto Knock Off VEL"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Auto Knock off Stagging";"Auto Knock off Stagging")
            {
                XmlName = 'AutoKnockOffStagging';
                fieldelement(VendorCode;"Auto Knock Off Stagging"."Vendor Code")
                {
                }
                fieldelement(InvNo;"Auto Knock Off Stagging"."Invoice No.")
                {
                }
                fieldelement(ApplyDocNo;"Auto Knock Off Stagging"."Applying Doc. No.")
                {
                }
                fieldelement(Amount;"Auto Knock Off Stagging".Amount)
                {
                }
                fieldelement(ApplicationDate;"Auto Knock Off Stagging"."Application Date")
                {
                }

                trigger OnAfterInitRecord()
                begin
                    if FirstLine then begin
                      FirstLine := false;
                      currXMLport.Skip;
                    end;
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
        Message('Data imported into stagging Table Successfully...');
    end;

    trigger OnPreXmlPort()
    begin
        FirstLine := true;
    end;

    var
        FirstLine: Boolean;
}

