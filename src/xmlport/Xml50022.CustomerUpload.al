XmlPort 50022 "Customer Upload"
{
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(InputFIle)
        {
            tableelement(Customer;Customer)
            {
                XmlName = 'Customer';
                fieldelement(CustomerNo;Customer."No.")
                {
                }
                fieldelement(CustomerName;Customer.Name)
                {
                }
                fieldelement(Address;Customer.Address)
                {
                }
                fieldelement(Address2;Customer."Address 2")
                {
                }
                fieldelement(StateCode;Customer."State Code")
                {
                }
                fieldelement(PostCode;Customer."Post Code")
                {
                }
                fieldelement(PhoneNo;Customer."Phone No.")
                {
                }
                fieldelement(Email;Customer."E-Mail")
                {
                }
                fieldelement(GSTRegNo;Customer."GST Registration No.")
                {
                }
                fieldelement(GSTCustomerType;Customer."GST Customer Type")
                {
                }
                fieldelement(GenBusPostGrp;Customer."Gen. Bus. Posting Group")
                {
                }
                fieldelement(CustPostGrp;Customer."Customer Posting Group")
                {
                }
                fieldelement(DealerCode;Customer."Dealer Code")
                {
                }
                fieldelement(DealerID;Customer."Dealer Id")
                {
                }
                fieldelement(ClientID;Customer."Client Id")
                {
                }
                fieldelement(ClientName;Customer."Client Name")
                {
                }
                fieldelement(DealerSmartAccNo;Customer."Dealer Smart Account No")
                {
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

    trigger OnPostXmlPort()
    begin
        Message('Customers uploaded successfully');
    end;
}

