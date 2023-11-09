pageextension 50051 "Job Queue Entry Card" extends "Job Queue Entry Card"
{
    layout
    {
        addafter("No. of Minutes between Runs")
        {
            group("Custom Setup")
            {
                Caption = 'Custom Setup';
                field(Folder; rec.Folder)
                {
                    ApplicationArea = All;
                }
                field("Remote Path Folder"; Rec."Remote Path Folder")
                {
                    ApplicationArea = All;
                }
                field("Archive Folder"; Rec."Archive Folder")
                {
                    ApplicationArea = All;
                }
                field("SFTP Host Name"; Rec."SFTP Host Name")
                {
                    ApplicationArea = All;
                }
                field("SFTP User Name"; Rec."SFTP User Name")
                {
                    ApplicationArea = All;
                }
                field("SFTP Password"; Rec."SFTP Password")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
                field("SFTP Host Key"; Rec."SFTP Host Key")
                {
                    ApplicationArea = All;
                }
                field("Input File Name"; Rec."Input File Name")
                {
                    ApplicationArea = All;
                }
                field("Expected Rollup File"; Rec."Expected Rollup File")
                {
                    ApplicationArea = All;
                }
                field("Expected Audit File"; Rec."Expected Audit File")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

