Page 50068 "Vendor Bank Account Master"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Vendor Bank Account";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No.";rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name";rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Positng Group";rec."Vendor Positng Group")
                {
                    ApplicationArea = Basic;
                }
                field("Code";rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch No.";rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account No.";rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Name 2";rec."Name 2")
                {
                    ApplicationArea = Basic;
                }
                field(Address;rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City;rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(Contact;rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Telex No.";rec."Telex No.")
                {
                    ApplicationArea = Basic;
                }
                field("Transit No.";rec."Transit No.")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code";rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(County;rec.County)
                {
                    ApplicationArea = Basic;
                }
                field("Fax No.";rec."Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field("Telex Answer Back";rec."Telex Answer Back")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code";rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail";rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Home Page";rec."Home Page")
                {
                    ApplicationArea = Basic;
                }
                field(Iban;rec.Iban)
                {
                    ApplicationArea = Basic;
                }
                field("SWIFT Code";rec."SWIFT Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Clearing Code";rec."Bank Clearing Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Clearing Standard";rec."Bank Clearing Standard")
                {
                    ApplicationArea = Basic;
                }
                field("Default Account";rec."Default Account")
                {
                    ApplicationArea = Basic;
                }
                field(Modified;rec.Modified)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

