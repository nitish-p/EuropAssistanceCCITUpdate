xmlport 50052 KotakBankResponse
{
    Caption = 'KotakBankResponse';
    Namespaces = "SOAP-ENV" = 'http://www.w3.org/2003/05/soap-envelope', ns0 = 'http://www.kotak.com/schemas/CMS_Generic/Payment_Response.xsd';
    schema
    {
        textelement(Envelope)
        {
            NamespacePrefix = 'SOAP-ENV';
            textelement(Body)
            {
                NamespacePrefix = 'SOAP-ENV';
                textelement(Payment)
                {
                    NamespacePrefix = 'ns0';
                    textelement(AckHeader)
                    {
                        NamespacePrefix = 'ns0';
                        textelement(MessageId)
                        {
                            NamespacePrefix = 'ns0';

                        }
                        textelement(StatusCd)
                        {
                            NamespacePrefix = 'ns0';
                        }
                        textelement(StatusRem)
                        {
                            NamespacePrefix = 'ns0';
                        }
                        trigger OnAfterAssignVariable()
                        begin
                            Message(MessageId + StatusCd + StatusRem);
                        end;

                    }
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {

            }
        }
        actions
        {

        }
    }
}
