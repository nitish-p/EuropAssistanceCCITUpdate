Report 50050 "Rejected Log Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Rejected Log Report.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    dataset
    {
        dataitem("Easy Auto - NAV Bridge"; "Easy Auto - NAV Bridge")
        {
            DataItemTableView = where(Flag = filter(<> " "));
            RequestFilterFields = "Created Date", "Vendor Code", "Transaction No.", "Invoice Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CreatedDate_EasyAutoNAVBridge; Format("Easy Auto - NAV Bridge"."Created Date"))
            {
            }
            column(ServiceID_EasyAutoNAVBridge; "Easy Auto - NAV Bridge"."Service ID")
            {
            }
            column(ServiceDate_EasyAutoNAVBridge; Format("Easy Auto - NAV Bridge"."Service Date"))
            {
            }
            column(InvoiceDate_EasyAutoNAVBridge; Format("Easy Auto - NAV Bridge"."Invoice Date"))
            {
            }
            column(InvoiceType_EasyAutoNAVBridge; "Easy Auto - NAV Bridge"."Invoice Type")
            {
            }
            column(Response_EasyAutoNAVBridge; "Easy Auto - NAV Bridge".Response)
            {
            }
            column(Amount_EasyAutoNAVBridge; "Easy Auto - NAV Bridge".Amount)
            {
            }
            column(NavVendorCode_EasyAutoNAVBridge; "Easy Auto - NAV Bridge"."Nav Vendor Code")
            {
            }
            column(Flag_EasyAutoNAVBridge; "Easy Auto - NAV Bridge".Flag)
            {
            }
            column(VendorCode_EasyAutoNAVBridge; "Easy Auto - NAV Bridge"."Vendor Code")
            {
            }
            column(TransactionNo_EasyAutoNAVBridge; "Easy Auto - NAV Bridge"."Transaction No.")
            {
            }
            column(FileName_EasyAutoNAVBridge; "Easy Auto - NAV Bridge"."File Name")
            {
            }
            column(VendorInvoiceNo_EasyAutoNAVBridge; "Easy Auto - NAV Bridge"."Vendor Invoice No.")
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

