XmlPort 50042 "file attachment"
{
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(root)
        {
            tableelement(Integer;Integer)
            {
                AutoSave = false;
                XmlName = 'integer';
                UseTemporary = true;
                textelement(externaldocno)
                {
                }
                textelement(filename)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    PurchpayablesSetup.Get;
                    VLE.Reset;
                    VLE.SetRange("External Document No.",externaldocno);
                    if VLE.FindFirst then begin
                    Clear(RecordLink);
                    RecordLink.Init;
                    //Naveen++
                    // RecordLink."No.":=VLE."Document No.";
                    // RecordLink.URL2:=VLE."Document No.";
                    // RecordLink."Attachement Name":=CopyStr(FileManagement.GetFileNameWithoutExtension(filename),1,MaxStrLen(filename));
                    //Naveen---
                    RecordLink.URL1:=PurchpayablesSetup."Local Attachment Folder"+filename;
                    RecordLink.Created:=CurrentDatetime;
                    RecordLink."User ID":=UserId;
                    RecordLink.Company:=COMPANYNAME;
                    RecordLink.Insert;
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

    var
        RecordLink: Record "Record Link";
        VLE: Record "Vendor Ledger Entry";
        PurchpayablesSetup: Record "Purchases & Payables Setup";
        FileManagement: Codeunit "File Management";
}

