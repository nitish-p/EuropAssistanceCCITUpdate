pageextension 50043 "Vendor Bank Account Card" extends "Vendor Bank Account Card"
{
    layout
    {
        addafter(Name)
        {
            field("Bank name"; Rec."Name 2")
            {
                ApplicationArea = all;
            }
        }
        modify(Name)
        {
            Caption = 'Beneficiary Name';
            ApplicationArea = all;
        }
        addafter("Transit No.")
        {

            field("Default Account"; Rec."Default Account")
            {
                ApplicationArea = All;
            }

        }
        addafter("Bank Account No.")
        {
            field("IFSC Code"; Rec."IFSC Code")
            {
                ApplicationArea = All;
            }
        }
        addafter(Control1905767507)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::Vendor),
                              "No." = FIELD("Vendor No.");
            }
        }
    }



    trigger OnOpenPage()
    var
        myInt: Integer;
        AllowEdit: Boolean;
        ShowAttachment: Boolean;
        recVendorBankAcc: Record "Vendor Bank Account";
        recVendor: Record Vendor;
        // SMTPSetup: Record "SMTP Mail Setup";
        // SMTPMail: Codeunit "SMTP Message";
        // RecordLink: Record "2000000068";
        Vendor: Record Vendor;
        VendPostGrp: Code[10];
        ASP: Boolean;
    begin
        AllowEdit := FALSE;
        ShowAttachment := FALSE;
        VendPostGrp := '';
        ASP := FALSE;

        IF Vendor.GET('') THEN
            IF Vendor."Easy Auto Vendor Code" <> '' THEN BEGIN
                ASP := TRUE;
            END;
        VendPostGrp := Vendor."Vendor Posting Group";


        IF ASP = TRUE THEN BEGIN
            IF ((USERID = 'SUPER') OR (USERID = 'AARTI')) THEN BEGIN
                AllowEdit := TRUE;
                ShowAttachment := TRUE;
            END ELSE BEGIN
                AllowEdit := FALSE;
                ShowAttachment := FALSE;
            END;
        END;


        IF ASP = FALSE THEN BEGIN

            AllowEdit := TRUE;
            ShowAttachment := TRUE;

        end;
    end;

}

