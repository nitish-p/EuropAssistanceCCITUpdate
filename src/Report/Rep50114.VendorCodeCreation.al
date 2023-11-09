Report 50114 VendorCodeCreation
{
   
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor;Vendor)
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Name;"Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("General Business Posting Group";"General Business Posting Group")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Gen. Business Posting Group";
                }
                field("Vendor Posting Group";"Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Vendor Posting Group";
                }
                field("Status Indicator";StatusIndicator)
                {
                    ApplicationArea = Basic;
                }
                field("Record Type";RecordType)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if ((RecordType <> 'I') and (RecordType <> 'O')) then
                          Error('Record Type must be either I or O');
                    end;
                }
                field("Bank Account Name";BankAccountName)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account Number";BankAccountNumber)
                {
                    ApplicationArea = Basic;
                }
                field("IFSC Code";IFSCCode)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        // to open vendor card
        RecVendor.Reset;
        RecVendor.SetRange(RecVendor."No.",VendNo);
        if RecVendor.FindFirst then
        Page.Run(26,RecVendor);
    end;

    trigger OnPreReport()
    begin

        if ((BankAccountName <> '') or (BankAccountNumber <> '')  or (IFSCCode <> ''))  then begin

            if BankAccountName = '' then begin
              Error('BankAccountName Must');
            end;

            if BankAccountNumber = '' then begin
              Error('BankAccountNumber Must');
            end;

            if IFSCCode = '' then begin
              Error('IFSCCode Must');
            end;

        end;



        // for Vendor +++

        if Type = 0 then begin
        // to get initial of customer name
        InitialChar:=CopyStr("Vendor Name",1,1);
        SecondChar:=CopyStr("Vendor Posting Group",1,1);
        // to get business post group code
        if "General Business Posting Group" = 'DOM-ADMIN' then begin
          GenBusPostGrp:='DOM-ADMIN';
          BusGrp:='DAD';
        end;

        if "General Business Posting Group" = 'DOM-AUTO' then begin
          GenBusPostGrp:='DOM-AUTO';
          BusGrp:='DAU';
        end;

        if "General Business Posting Group" = 'DOM-DEALEN' then begin
          GenBusPostGrp:='DOM-DEALEN|AUTO-RE';
          BusGrp:='DRE';
        end;

        if "General Business Posting Group" = 'AUTO-RE' then begin
          GenBusPostGrp:= 'DOM-DEALEN|AUTO-RE';
          BusGrp:='DRE';
        end;

        if "General Business Posting Group" = 'DOM-EXTWAR' then begin
          GenBusPostGrp:='DOM-EXTWAR';
          BusGrp:='DEW';
        end;

        if "General Business Posting Group" = 'DOM-MEDI' then begin
          GenBusPostGrp:='DOM-MEDI';
          BusGrp:='DME';
        end;

        if "General Business Posting Group" = 'DOM-CYBER' then begin
          GenBusPostGrp:='DOM-CYBER';
          BusGrp:='DCY';
        end;

        if "General Business Posting Group" = 'FOREIGN-IT' then begin
          GenBusPostGrp:='FOREIGN-IT';
          BusGrp:='FIT';
        end;

        if "General Business Posting Group" = 'FOR-INTCOM' then begin
          GenBusPostGrp:='FOR-INTCOM';
          BusGrp:='FIC';
        end;

        // to get last incremental no.
         Vendor1.Reset;
         Vendor1.SetCurrentkey("No.");
         Vendor1.Ascending(true);
         Vendor1.SetRange(Vendor1."Gen. Bus. Posting Group","General Business Posting Group");
         if Vendor1.FindSet then repeat
          if ((CopyStr(Vendor1.Name,1,1) = InitialChar) and (CopyStr(Vendor1."No.",2,3) = BusGrp) and (CopyStr(Vendor1."No.",5,1) = InitialChar)) then begin
          LastNo:=CopyStr(Vendor1."No.",6,11);
          end;
         until Vendor1.Next = 0;



        if GenBusPostGrp = 'DOM-DEALEN|AUTO-RE' then begin
         Vendor1.Reset;
         Vendor1.SetCurrentkey("No.");
         Vendor1.Ascending(true);
         Vendor1.SetFilter(Vendor1."Gen. Bus. Posting Group",'%1','DOM-DEALEN');
         if Vendor1.FindSet then repeat
          if ((CopyStr(Vendor1.Name,1,1) = InitialChar) and (CopyStr(Vendor1."No.",2,3) = BusGrp) and (CopyStr(Vendor1."No.",5,1) = InitialChar)) then begin
            Evaluate(LastNo1,CopyStr(Vendor1."No.",6,11));
          end;
         until Vendor1.Next = 0;

         Vendor1.Reset;
         Vendor1.SetCurrentkey("No.");
         Vendor1.Ascending(true);
         Vendor1.SetFilter(Vendor1."Gen. Bus. Posting Group",'%1','AUTO-RE');
         if Vendor1.FindSet then repeat
          if ((CopyStr(Vendor1.Name,1,1) = InitialChar) and (CopyStr(Vendor1."No.",2,3) = BusGrp) and (CopyStr(Vendor1."No.",5,1) = InitialChar))  then begin
            Evaluate(LastNo2,CopyStr(Vendor1."No.",6,11));
          end;
         until Vendor1.Next = 0;

        if LastNo1 > LastNo2 then
          LastNo:=LastNo1;
        if LastNo1 < LastNo2 then
          LastNo:=LastNo2;

        end;
        // to get vendor code for current new vendor
        if LastNo <> ''then
        NewNo :=IncStr(LastNo)
        else
        NewNo   := '000001';
        VendNo :='V'+BusGrp+InitialChar+NewNo;

        if (("Vendor Name" <> '') and ("General Business Posting Group" <> '') and ("Vendor Posting Group" <> '') and (StatusIndicator <> 0)) then begin
        RecVendor.Reset;
        RecVendor.SetRange(RecVendor."No.",VendNo);
        if not RecVendor.FindFirst then begin
          RecVendor."No.":=VendNo;
          RecVendor.Name:=UpperCase("Vendor Name");
          RecVendor.Validate("Gen. Bus. Posting Group","General Business Posting Group");
          RecVendor.Validate(RecVendor."Vendor Posting Group","Vendor Posting Group");
          RecVendor.Validate("Status-Indicator",StatusIndicator);
          RecVendor.Validate("Record Type",RecordType);
          RecVendor.Insert(true)  ;


        // vendor bank account creation +++
        if ((BankAccountName <> '' ) and (BankAccountNumber <> '') and (IFSCCode <> '')) then begin

              recVendorBankAcc.Reset;
              recVendorBankAcc.SetRange("Vendor No.",VendNo);
              if not recVendorBankAcc.FindFirst then begin

                insertVendorBankAcc.Init;
                insertVendorBankAcc.Validate("Vendor No.",VendNo);
                insertVendorBankAcc.Validate(Code,VendNo+'_01');
                insertVendorBankAcc.Validate(Name,BankAccountName);
                insertVendorBankAcc.Validate("Bank Account No.",BankAccountNumber);
                insertVendorBankAcc.Validate("SWIFT Code",IFSCCode);
                insertVendorBankAcc.Validate("Default Account",true);
                insertVendorBankAcc.Insert(true);

              end;

        end;
        // vendor bank account creation ---


        end;
        end else begin
          Error('Kindly select all fields to create vednor.');
        end;
        end;

        // for Vendor ---

        // for employee +++

        if Type =1 then begin

          InitialChar:=CopyStr("Vendor Name",1,1);

        // to get last incremental no.
         Vendor1.Reset;
         Vendor1.Ascending(true);
         Vendor1.SetFilter("No.",'<>%1','');
         if Vendor1.FindSet then repeat
          if CopyStr(Vendor1."No.",1,1) = 'E' then begin

              if CopyStr(Vendor1.Name,1,1) = InitialChar then begin

                  LastNo:=CopyStr(Vendor1."No.",3,11);
              end;

          end;
         until Vendor1.Next = 0;
        // to get vendor code for current new vendor
        if LastNo <> ''then
        NewNo :=IncStr(LastNo)
        else
        NewNo   := '000000001';
        VendNo :='E'+InitialChar+NewNo;

        if (("Vendor Name" <> '') and ("General Business Posting Group" <> '') and ("Vendor Posting Group" <> '') and (StatusIndicator <> 0)) then begin
        RecVendor.Reset;
        RecVendor.SetRange(RecVendor."No.",VendNo);
        if not RecVendor.FindFirst then begin
          RecVendor."No.":=VendNo;
          RecVendor.Name:=UpperCase("Vendor Name");
          RecVendor.Validate("Gen. Bus. Posting Group","General Business Posting Group");
          RecVendor.Validate("Vendor Posting Group","Vendor Posting Group");
          RecVendor.Validate("Status-Indicator",StatusIndicator);
          RecVendor."Record Type":=RecordType;
          RecVendor.Insert(true)  ;
        end;
        end else begin
          Error('Kindly select all fields to create vednor.');
        end;

        end;

        // for employee ---
    end;

    var
        "General Business Posting Group": Code[10];
        "Vendor Name": Text[250];
        VendNo: Text[250];
        RecVendor: Record Vendor;
        BusGrp: Code[20];
        Vendor1: Record Vendor;
        LastNo: Code[10];
        NewNo: Code[10];
        InitialChar: Code[10];
        "Vendor Posting Group": Code[10];
        SecondChar: Code[10];
        Type: Option Vendor,Employee;
        GenBusPostGrp: Code[20];
        LastNo1: Code[10];
        LastNo2: Code[10];
        StatusIndicator: Option " ",A,I;
        RecordType: Code[1];
        BankAccountName: Text[100];
        BankAccountNumber: Code[30];
        IFSCCode: Code[20];
        recVendorBankAcc: Record "Vendor Bank Account";
        insertVendorBankAcc: Record "Vendor Bank Account";
}

