Report 50052 "Inv. Policy Detail Attachment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Inv. Policy Detail Attachment.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Documentwise Service Master"; "Documentwise Service Master")
        {
            DataItemTableView = sorting("Document No.", "Document Line No.", "Line No.") order(ascending);
            column(ReportForNavId_1000000000; 1000000000)
            {
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

    labels
    {
    }
}

