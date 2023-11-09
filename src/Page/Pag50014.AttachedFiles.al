Page 50014 "Attached Files"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = "Record Link1";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Attachment; rec."Attachement Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Hyperlink(rec.URL1);
                    end;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Attached On"; rec.Created)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PLS Id"; rec.URL4)
                {
                    ApplicationArea = Basic;
                    Caption = 'PLS ID';
                    Editable = false;
                }
                field("Attached By"; rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attached By';
                    Editable = false;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }


    }

    actions
    {
        area(Processing)
        {
            action("Download File")
            {
                Image = Download;
                trigger OnAction()
                var
                    Istream: InStream;
                    exportfilename: Text;
                    RecordLink: Record "Record Link1";
                begin
                    RecordLink.Get(Rec."Link Id");
                    RecordLink.CalcFields(Note);
                    exportfilename := RecordLink.URL1;

                    if not RecordLink.Note.HasValue then
                        Error('File not Found');
                    RecordLink.Note.CreateInStream(Istream);
                    DownloadFromStream(Istream, '', '', '', exportfilename);
                end;
            }
        }
    }

}

