pageextension 50099 MyExtension extends "FA Depreciation Books Subform"
{
    layout
    {
        modify("Depreciation Ending Date")
        {
            Editable = false;
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}