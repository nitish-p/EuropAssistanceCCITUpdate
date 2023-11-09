pageextension 50045 "Vendor Bank Account List" extends "Vendor Bank Account List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor Bank Account List"(Page 426)".

    layout
    {
        modify(Name)
        {
            Caption = 'Beneficiary Name';
        }


        addfirst(content)
        {
            field("Vendor No."; Rec."Vendor No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Name)
        {
            field("Name 2"; Rec."Name 2")
            {
                ApplicationArea = all;
                Caption = 'Bank Name';
                Description = 'Upto 50 Chars';
            }
        }
        addafter("Currency Code")
        {
            field("Default Account"; Rec."Default Account")
            {
                ApplicationArea = All;
            }
        }

    }
    actions
    {

        addfirst(creation)
        {
            group(Attachments)
            {
                //     Caption = 'Attachments';
                //      ApplicationArea = All;
                //     Visible = ShowAttachment;
                //     action("Attach File1")
                //     {
                //         Enabled = false;
                //         Image = Attach;
                //         Promoted = true;
                //         Visible = ShowAttachment;
                //     }
                action("Attach File")
                {
                    Image = Attach;
                    ApplicationArea = All;
                    Promoted = true;
                }
                // action(Attachments)
                // {
                //     Image = Links;
                //      ApplicationArea = All;
                //     Promoted = true;
                //     RunObject = Page 50014;
                //     RunPageLink = No.=FIELD(Vendor No.);
                //     Visible = ShowAttachment;
                // }
            }
        }
    }

    var
        ShowAttachment: Boolean;
}

