pageextension 50052 "CRM Connection Setup" extends "CRM Connection Setup" 
{
    layout
    {

        //Unsupported feature: Code Modification on "Password(Control 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SetPassword(NewPassword);
            COMMIT;
            IF (NewPassword <> '') AND (NOT ENCRYPTIONENABLED) THEN
              IF CONFIRM(EncryptionIsNotActivatedQst) THEN
                PAGE.RUN(PAGE::"Data Encryption Management")
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
                PAGE.RUNMODAL(PAGE::"Data Encryption Management")
            */
        //end;
    }

    var
        IsConnectionStringEditable: Boolean;


    //Unsupported feature: Code Modification on "OnClosePage".

    //trigger OnClosePage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CRMIntegrationManagement.Clear;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CRMIntegrationManagement.ClearState;
        */
    //end;


    //Unsupported feature: Code Modification on "RefreshData(PROCEDURE 19)".

    //procedure RefreshData();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RefreshDataFromCRM;
        RefreshDataFromNAV;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetIsConnectionStringEditable;
        RefreshDataFromCRM;
        RefreshDataFromNAV;
        */
    //end;


    //Unsupported feature: Code Modification on "PerformTestConnection(PROCEDURE 9)".

    //procedure PerformTestConnection();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ("User Name" = '') OR (NewPassword = '') OR ("Server Address" = '') THEN
          ERROR(DetailsMissingErr);

        CRMIntegrationManagement.Clear;

        IF NOT TestConnection THEN
          ERROR(ConnectionErr,CRMIntegrationManagement.GetLastErrorMessage);
        #8..14
          END;

        MESSAGE(ConnectionSuccessMsg);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        CRMIntegrationManagement.ClearState;
        #5..17
        */
    //end;


    //Unsupported feature: Code Modification on "CreateTempAdminConnection(PROCEDURE 5)".

    //procedure CreateTempAdminConnection();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CreateTempNoDelegateConnection(CRMConnectionSetup);
        CRMConnectionSetup."Primary Key" := COPYSTR('TEMP' + "Primary Key",1,MAXSTRLEN(CRMConnectionSetup."Primary Key"));
        CRMConnectionSetup."User Name" := '';
        CLEAR(CRMConnectionSetup."User Password Key");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CreateTempNoDelegateConnection(CRMConnectionSetup);
        CRMConnectionSetup."Primary Key" := COPYSTR('TEMP' + "Primary Key",1,MAXSTRLEN(CRMConnectionSetup."Primary Key"));
        CRMConnectionSetup.VALIDATE("User Name",'');
        CLEAR(CRMConnectionSetup."User Password Key");
        */
    //end;

    local procedure SetIsConnectionStringEditable()
    begin
        /*
        IsConnectionStringEditable :=
          NOT "Is Enabled" AND
          ("Authentication Type" IN ["Authentication Type"::"2","Authentication Type"::"3"]);
          */

    end;
}

