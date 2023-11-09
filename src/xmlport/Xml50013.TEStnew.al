XmlPort 50013 "TESt new"
{
    Encoding = UTF8;
    FormatEvaluate = Xml;
    InlineSchema = false;

    schema
    {
        textelement(Document)
        {
            textattribute(xmlns1)
            {
                XmlName = 'xmlns:xsi1';
            }
            textattribute(xmlns2)
            {
                XmlName = 'xmlns.';
            }
            tableelement(Item;Item)
            {
                XmlName = 'item';
                fieldelement(Name;Item.Description)
                {
                }
                fieldelement(itemdescription;Item.Description)
                {
                }
                tableelement("Item Category";"Item Category")
                {
                    XmlName = 'itemcatogorycode';
                    fieldelement(category;"Item Category".Description)
                    {
                    }
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

    trigger OnPreXmlPort()
    begin
         xmlns1:='urn:iso:std:iso:20022:tech:xsd:pain.001.001.03';
         xmlns2:='http://www.w3.org/2001/XMLSchema-instance';

    end;
}

