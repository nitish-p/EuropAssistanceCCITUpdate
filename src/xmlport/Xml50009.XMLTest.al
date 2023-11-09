xmlport 50009 XMLTest
{
    Direction = Both;
    Encoding = UTF8;
    FileName = 'Dummy.xml';
    Namespaces = xsi='http://www.w3.org/2001/XMLSchema-instance',""='urn:iso:std:iso:20022:tech:xsd:pain.001.001.03';
    UseDefaultNamespace = false;

    schema
    {
        textelement(Document)
        {
            textelement(xml1)
            {
                textelement(EMPname)
                {
                }
                textelement(EMPcode)
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
        //MESSAGE('Imported');
    end;
}

