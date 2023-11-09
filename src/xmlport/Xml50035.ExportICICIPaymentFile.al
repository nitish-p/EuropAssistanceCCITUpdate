XmlPort 50035 "Export ICICI Payment File"
{
    FieldDelimiter = '<None>';
    FieldSeparator = '|';
    FileName = 'ICICICPayment.txt';
    Format = VariableText;
    Permissions = TableData "Bank Account Ledger Entry"=rimd;
    TableSeparator = '<NewLine>';

    schema
    {
        textelement(Root)
        {
            tableelement(Integer;Integer)
            {
                XmlName = 'Header';
                SourceTableView = sorting(Number) where(Number=const(1));
                textelement(DebitAcNoTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        DebitAcNoTitle := 'Debit Ac No';
                    end;
                }
                textelement(BeneficiaryAcNoTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        BeneficiaryAcNoTitle:='Beneficiary Ac No';
                    end;
                }
                textelement(BeneficiaryNameTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        BeneficiaryNameTitle:='Beneficiary Name';
                    end;
                }
                textelement(AmountTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        AmountTitle:='Amount';
                    end;
                }
                textelement(PayModTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        PayModTitle:='Pay Mod';
                    end;
                }
                textelement(DATETitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        DATETitle:='DATE';
                    end;
                }
                textelement(IFSCTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        IFSCTitle:='IFSC';
                    end;
                }
                textelement(PayableLocationnameTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        PayableLocationnameTitle:='Payable Location name';
                    end;
                }
                textelement(PrintLocationTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        PrintLocationTitle:='Print Location';
                    end;
                }
                textelement(BeneMobileNoTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        BeneMobileNoTitle:='Bene Mobile No.';
                    end;
                }
                textelement(BeneEmailIDTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        BeneEmailIDTitle:='Bene Email ID';
                    end;
                }
                textelement(Beneadd1Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Beneadd1Title:='Bene add1';
                    end;
                }
                textelement(Beneadd2Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Beneadd2Title:='Bene add2';
                    end;
                }
                textelement(Beneadd3Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Beneadd3Title:='Bene add3';
                    end;
                }
                textelement(Beneadd4Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Beneadd4Title:='Bene add4';
                    end;
                }
                textelement(AddDetails1Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        AddDetails1Title:='Add Details 1';
                    end;
                }
                textelement(AddDetails2Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        AddDetails2Title:='Add Details 2';
                    end;
                }
                textelement(AddDetails3Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        AddDetails3Title:='Add Details 3';
                    end;
                }
                textelement(AddDetails4Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        AddDetails4Title:='Add Details 4';
                    end;
                }
                textelement(AddDetails5Title)
                {

                    trigger OnBeforePassVariable()
                    begin
                        AddDetails5Title:='Add Details 5';
                    end;
                }
                textelement(RemarksTitle)
                {

                    trigger OnBeforePassVariable()
                    begin
                        RemarksTitle:='Remarks';
                    end;
                }
            }
            tableelement("Bank Account Ledger Entry";"Bank Account Ledger Entry")
            {
                XmlName = 'BankAccLedEntry';
                SourceTableView = sorting("Entry No.") order(ascending) where("Suggsted Payment"=const(true),"Bank Account No."=const('BANK0001'),"Document Type"=const(1));
                textelement(DebitAcNo)
                {
                }
                textelement(BeneficiaryAcNo)
                {
                }
                textelement(BeneficiaryName)
                {
                }
                textelement(PayAmount)
                {
                }
                fieldelement(PayMod;"Bank Account Ledger Entry"."Payment Mode")
                {
                }
                textelement(DATE)
                {
                }
                textelement(IFSC)
                {
                }
                textelement(PayableLocationname)
                {
                }
                textelement(PrintLocation)
                {
                }
                textelement(BeneMobileNo)
                {
                }
                textelement(BeneEmailID)
                {
                }
                textelement(Beneadd1)
                {
                }
                textelement(Beneadd2)
                {
                }
                textelement(Beneadd3)
                {
                }
                textelement(Beneadd4)
                {
                }
                textelement(AddDetails1)
                {
                }
                textelement(AddDetails2)
                {
                }
                textelement(AddDetails3)
                {
                }
                fieldelement(AddDetails4;"Bank Account Ledger Entry"."Entry No.")
                {
                }
                textelement(AddDetails5)
                {
                }
                textelement(Remarks)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PayAmount:=DelChr(Format(Abs("Bank Account Ledger Entry".Amount)),'=',',');
                    
                    DebitAcNo:='';
                    BeneficiaryAcNo:='';
                    BeneficiaryName:='';
                    DATE1:=0D;
                    IFSC:='';
                    
                    AddDetails5:='';
                    Remarks:='';
                    GenLedSetup.Get('');
                    
                    BankAcc.Reset;
                    BankAcc.SetRange("No.",'BANK0001');
                    if BankAcc.FindFirst then begin
                     DebitAcNo:=BankAcc."Bank Account No.";
                    end;
                    
                    
                    VLE.Reset;
                    VLE.SetRange(VLE."Document Type",VLE."document type"::Payment);
                    VLE.SetRange("Transaction No.","Bank Account Ledger Entry"."Transaction No.");
                    if VLE.FindFirst then begin
                    
                    VendorBankAcc.Reset;
                    VendorBankAcc.SetRange("Vendor No.",VLE."Vendor No.");
                    VendorBankAcc.SetRange("Default Account",true);
                    if VendorBankAcc.FindFirst then begin
                      BeneficiaryAcNo:=VendorBankAcc."Bank Account No.";
                      BeneficiaryName:=VendorBankAcc.Name;
                      IFSC:=VendorBankAcc."SWIFT Code";
                    end;
                    /*
                    IF COPYSTR(IFSC,1,4)='ICIC' THEN BEGIN
                      PayMod:='I';
                    END ELSE BEGIN
                      IF ABS("Bank Account Ledger Entry".Amount) > 100000 THEN BEGIN
                        PayMod:='N';
                      END;
                      IF ABS("Bank Account Ledger Entry".Amount) <= 100000 THEN BEGIN
                        PayMod:='M';
                      END;
                    END;
                    */
                    // for date +++
                    
                    DATE1:="Bank Account Ledger Entry"."Posting Date";
                    Dt1:='';
                    Month2:='';
                    DATE2:='';
                    
                    if StrLen(Format(Date2dmy(DATE1,1))) = 1 then begin
                      Dt1:='0'+Format(Date2dmy(DATE1,1));
                    end else begin
                      Dt1:=Format(Date2dmy(DATE1,1));
                    end;
                    
                    if Date2dmy(DATE1,2) = 1 then begin
                      Month2:='JAN';
                    end;
                    if Date2dmy(DATE1,2) = 2 then begin
                      Month2:='FEB';
                    end;
                    if Date2dmy(DATE1,2) = 3 then begin
                      Month2:='MAR';
                    end;
                    if Date2dmy(DATE1,2) = 4 then begin
                      Month2:='APR';
                    end;
                    if Date2dmy(DATE1,2) = 5 then begin
                      Month2:='MAY';
                    end;
                    if Date2dmy(DATE1,2) = 6 then begin
                      Month2:='JUN';
                    end;
                    if Date2dmy(DATE1,2) = 7 then begin
                      Month2:='JUL';
                    end;
                    if Date2dmy(DATE1,2) = 8 then begin
                      Month2:='AUG';
                    end;
                    if Date2dmy(DATE1,2) = 9 then begin
                      Month2:='SEP';
                    end;
                    if Date2dmy(DATE1,2) = 10 then begin
                      Month2:='OCT';
                    end;
                    if Date2dmy(DATE1,2) = 11 then begin
                      Month2:='NOV';
                    end;
                    if Date2dmy(DATE1,2) = 12 then begin
                      Month2:='DEC';
                    end;
                    
                    DATE:=Dt1+'-'+Month2+'-'+Format(Date2dmy(DATE1,3));
                    // for date ---
                    
                    AddDetails5:=VLE."Vendor No.";
                    recVendor.Reset;
                    recVendor.SetRange("No.",VLE."Vendor No.");
                    if recVendor.FindFirst then begin
                    Remarks:=recVendor.Name;
                    end;
                    
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
        BankAcc: Record "Bank Account";
        VLE: Record "Vendor Ledger Entry";
        VendorBankAcc: Record "Vendor Bank Account";
        DebitAcNo1: Text[30];
        BeneficiaryAcNo1: Text[30];
        BeneficiaryName1: Text[100];
        Amount1: Text;
        PayMod1: Text[1];
        DATE1: Date;
        IFSC1: Code[20];
        AddDetails41: Text[20];
        AddDetails51: Text[100];
        Remarks1: Text[100];
        recVendor: Record Vendor;
        BankAccLedEntry: Record "Bank Account Ledger Entry";
      /*  xlApp: Automation ;
        xlWorkBook: Automation ;
        xlWorksheet: Automation ;
        xlRange: Automation ;*/
        PrintToExcel: Boolean;
        k: Integer;
        BALE: Record "Bank Account Ledger Entry";
        GenLedSetup: Record "General Ledger Setup";
        FileNo: Integer;
        FileName: Text[100];
        Dt: Text[2];
        Month1: Text[2];
        BALE1: Record "Bank Account Ledger Entry";
        Dt1: Text[2];
        Month2: Text[3];
        DATE2: Text[11];
      //  SMTPSetup: Record "SMTP Mail Setup";
       // SMTPMail: Codeunit UnknownCodeunit400;//Naveen
        ToMail: Text[150];
        SmtpEmail: Text[50];
        Cnt: Integer;
}

