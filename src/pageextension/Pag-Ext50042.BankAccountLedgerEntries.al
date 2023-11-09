pageextension 50042 "Bank Account Ledger Entries" extends "Bank Account Ledger Entries"
{
    Editable = true;


    //Unsupported feature: Property Insertion (Permissions) on ""Bank Account Ledger Entries"(Page 372)".

    layout
    {
        addafter("Bal. Account No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = All;
            }
        }
        addafter("Entry No.")
        {
            field("Payment Reference"; Rec."Payment Reference")
            {
                ApplicationArea = All;
            }
            field(Narration; rec.Narration)
            {
                ApplicationArea = All;
            }
            field(Success; rec.Success)
            {
                ApplicationArea = All;
            }
            field("Fail To Success"; Rec."Fail To Success")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(Succeeded; rec.Succeeded)
            {
                ApplicationArea = All;
            }
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Integrated Invoice Type"; Rec."Integrated Invoice Type")
            {
                ApplicationArea = All;
            }
            // field("Cheque No.";Rec."Cheque No.")
            // {
            // }
            field("Payment Status Code"; Rec."Payment Status Code")
            {
                ApplicationArea = All;
            }
            field("Payment Status"; Rec."Payment Status")
            {
                ApplicationArea = All;
            }
            field("Payment Mode"; Rec."Payment Mode")
            {
                ApplicationArea = All;
            }
            field("Sent To Middleware"; Rec."Sent To Middleware")
            {
                ApplicationArea = All;
            }
            field("Payment File Name"; Rec."Payment File Name")
            {
                ApplicationArea = All;
            }
            field("Icici Payment Status"; Rec."Icici Payment Status")
            {
                ApplicationArea = All;
            }
            field("Date Credited in Bank"; Rec."Date Credited in Bank")
            {
                ApplicationArea = All;
            }
            field("Date Cancelled in Bank"; Rec."Date Cancelled in Bank")
            {
                ApplicationArea = All;
            }
            field("Customer Ref. No."; Rec."Customer Ref. No.")
            {
                ApplicationArea = All;
            }
            field("UTR No."; Rec."UTR No.")
            {
                ApplicationArea = All;
            }
            field("Transaction Date"; Rec."Transaction Date")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast(Creation)
        {
            action("Generate_XML IMPS")
            {
                Caption = 'Generate XML IMPS';
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                var
                    // XMIMPS: XMLport "50011";
                    // REC271: Record "271";
                    // IMPStable: Record "50011";
                    // SNo: Integer;
                    // Vend: Record "23";
                    // BANK_ACC: Record "270";
                    // REC288: Record "288";
                    // NoSeriesMgmt: Codeunit "396";
                    // purchpayable: Record "312";
                    // "batch Ref": Code[10];
                    // RecBankLedger: Record "271";
                    // Counter: Integer;
                    // TransactionAmt: Integer;
                    // TImeStamp: Text;
                    // Year: Integer;
                    // Timestamp2: Text;
                    // VendorTable: Record "50013";
                    new: Text;
                    text: Text;
                    precision: Decimal;
                    text1: Text;
                begin

                    /*
                    // to calcualte no of transactions , sum up amount ;
                    Counter := 0 ;
                    TransactionAmt := 0 ;
                    RecBankLedger.RESET ;
                    RecBankLedger.SETRANGE("Generate XML_IMPS",TRUE);
                    RecBankLedger.SETRANGE("Bal. Account Type",RecBankLedger."Bal. Account Type"::Vendor);
                    RecBankLedger.SETRANGE("Batch Reference",'');
                    IF RecBankLedger.FINDSET THEN REPEAT
                      Counter +=1 ;
                      TransactionAmt += ABS(RecBankLedger.Amount);
                      UNTIL RecBankLedger.NEXT= 0 ;
                    //calculation no of transaction--
                    //added validation amount >2lacs
                    IF TransactionAmt>200000 THEN BEGIN
                    REC271.RESET;
                    REC271.SETRANGE(REC271."Generate XML_IMPS",TRUE);
                    IF REC271.FINDSET THEN REPEAT
                      REC271."Generate XML_IMPS" := FALSE;
                      REC271."Batch Reference" := "batch Ref" ;
                    REC271.MODIFY ;
                    //MESSAGE(FORMAT(REC271."Generate XML_IMPS"));
                    COMMIT;
                    UNTIL REC271.NEXT=0;
                    ERROR('Transaction Amount is greater than 200000');
                    END;
                    
                    REC271.RESET;
                    REC271.SETRANGE("Generate XML_IMPS",TRUE);
                    IF REC271.FINDSET THEN REPEAT
                      IF REC271."Document Type" = REC271."Document Type"::Refund THEN BEGIN
                      REC271."Generate XML_IMPS":=FALSE;
                      REC271.MODIFY ;
                      COMMIT;
                      //MESSAGE(FORMAT(REC271."Bal. Account Type"));
                      ERROR('We cannot proceed because document Type is Refund');
                      END;
                    UNTIL REC271.NEXT=0;
                    
                    REC271.RESET;
                    REC271.SETRANGE("Generate XML_IMPS",TRUE);
                    IF REC271.FINDSET THEN REPEAT
                      IF REC271."Bal. Account Type" <> REC271."Bal. Account Type"::Vendor THEN BEGIN
                      REC271."Generate XML_IMPS":=FALSE;
                      REC271.MODIFY ;
                      COMMIT;
                      MESSAGE(FORMAT(REC271."Bal. Account Type"));
                      ERROR('Please select Bal. Account Type::Vendor');
                      END;
                    UNTIL REC271.NEXT=0;
                    
                    IF REC271."Batch Refrence NEFT" <>'' THEN BEGIN
                    REC271.RESET;
                    REC271.SETRANGE("Generate XML_IMPS",TRUE);
                    IF REC271.FINDSET THEN REPEAT
                       REC271."Generate XML_IMPS":=FALSE;
                       REC271.MODIFY;
                       COMMIT;
                     UNTIL REC271.NEXT=0;
                    ERROR('payment batch aleady proceeded for NEFT');
                     END;
                    
                    IF REC271."Batch Reference" <>'' THEN BEGIN
                    REC271.RESET;
                    REC271.SETRANGE("Generate XML_IMPS",TRUE);
                    IF REC271.FINDSET THEN REPEAT
                       REC271."Generate XML_IMPS":=FALSE;
                       REC271.MODIFY;
                       COMMIT;
                     UNTIL REC271.NEXT=0;
                    ERROR('payment for this batch aleady done');
                     END;
                    
                    //code for insert data in IMPS table
                    SNo:=0;
                    purchpayable.GET(' ');
                    IF Counter >= 1 THEN
                    "batch Ref":=NoSeriesMgmt.GetNextNo(purchpayable."payment Inf ID No series",WORKDATE,TRUE)
                    ELSE
                    ERROR (' No Batch to Upload');
                    REC271.RESET;
                    REC271.SETRANGE("Generate XML_IMPS",TRUE);
                    REC271.SETRANGE("Bal. Account Type",REC271."Bal. Account Type"::Vendor);
                    REC271.SETRANGE("Batch Reference",'');
                    IF REC271.FINDSET THEN REPEAT
                      IMPStable.RESET;
                      IMPStable.SETRANGE("NAV DOC No",REC271."Document No.");
                      IMPStable.SETRANGE("NAV Line No",REC271."Entry No.");
                      IF NOT IMPStable.FINDFIRST THEN BEGIN
                        SNo:=SNo+1;
                        Year:=DATE2DMY(TODAY,3);
                        TImeStamp:=(COPYSTR(FORMAT(TODAY),1,6) + FORMAT(Year) + ' ' + COPYSTR(FORMAT(TIME),1,5));
                        Timestamp2:=(FORMAT(Year)+(COPYSTR(FORMAT(TODAY),3,4))+(COPYSTR(FORMAT(TODAY),1,2)));
                        new:=(FORMAT(Year)+(COPYSTR(FORMAT(TODAY),3,4))+(COPYSTR(FORMAT(TODAY),1,2))+ 'T' + COPYSTR(FORMAT(TIME),1,8));
                        IMPStable."Payment batch":="batch Ref";
                        IMPStable."NAV DOC No":=REC271."Document No.";
                        IMPStable."NAV Line No":=REC271."Entry No.";
                        //IMPStable."Message ID":='HSBC_'+FORMAT(TODAY)+'_'+FORMAT(SNo);
                        IMPStable."CASE ID":=CONVERTSTR(new,'/','-');
                        IMPStable."Document Type":= FORMAT(Counter);
                        IMPStable."Document No.":= ABS(TransactionAmt);
                        IMPStable."Customer Name":=CONVERTSTR(Timestamp2,'/','-');;
                        IMPStable."Vehicle Identification No.":='';
                        IMPStable."Client Name":='';
                        //IMPStable."Transaction Identification":=REC271."Document No.";
                        //IMPStable."Payment reference id":=FORMAT(REC271."Entry No.");
                        IMPStable.Narration:=ABS(REC271.Amount);
                        // hardcode fields
                        IMPStable.Particulars:='';
                        IMPStable."Client Id":='IN';
                        IMPStable."Invoice Generated":='IN';
                        IMPStable."Policy Coverage Start Date":='DEBT';
                        IMPStable."Year Of Mfg":='HSBCINBB';
                        IMPStable."Vehicle Registration No.":='IN';
                        IMPStable."Dealer Code":='ABC66847001';
                        IMPStable."Unit Price":='TRF';
                        IMPStable."Document Date":='IMPS';
                        IMPStable."Country code2":='IN';
                        IMPStable."XML Generated":=TRUE;
                        IMPStable.IDTAG1:='';
                        IMPStable.IDTAG2:='';
                        IMPStable.IDTAG3:='';
                        IMPStable.Ccy:='INR';
                        IMPStable."Name(UltmtDbtr)":='Europ Assistance';
                        IMPStable."Pstcd(UltmtDbtr)":='4000001';
                        IMPStable."TwnNm(UltmtDbtr)":='Maharashtra';
                        IMPStable."Ctry(UltmtDbtr)":='IN';
                        IMPStable.PstlAdrTAG3:='';
                    
                    
                    //
                    //code for debitor account details++
                    BANK_ACC.RESET;
                    BANK_ACC.SETRANGE("No.",REC271."Bank Account No.");
                    IF BANK_ACC.FINDFIRST THEN BEGIN
                      IMPStable."Customer Contact No.":=BANK_ACC.Name;
                       IMPStable."Policy No.":=BANK_ACC."Country/Region Code";
                       IMPStable."Policy Coverage End Date":=BANK_ACC."Bank Account No.";
                    END;
                    
                    
                    IMPStable.RESET;
                    IMPStable.SETRANGE("Payment batch","batch Ref");
                    //code to generate XML port ++
                    
                    //code to insert data in vendor table
                    REC271.RESET;
                    REC271.SETRANGE("Generate XML_IMPS",TRUE);
                    REC271.SETRANGE("Bal. Account Type",REC271."Bal. Account Type"::Vendor);
                    REC271.SETRANGE("Batch Reference",'');
                    VendorTable.RESET;
                    IF REC271.FINDSET THEN REPEAT
                      VendorTable.RESET;
                      VendorTable.SETRANGE("NAV Doc No",REC271."Document No.");
                      VendorTable.SETRANGE("NAV Line No",REC271."Entry No.");
                      IF NOT VendorTable.FINDFIRST THEN BEGIN
                      VendorTable."NAV Doc No":=REC271."Document No.";
                      VendorTable."NAV Line No":=REC271."Entry No.";
                      Vend.RESET;
                      Vend.SETRANGE("No.",REC271."Bal. Account No.");
                      IF Vend.FINDFIRST THEN BEGIN
                        VendorTable."Name of debitor(Nm)":=Vend.Name;
                        REC288.RESET ;
                        REC288.SETRANGE("Vendor No.",REC271."Bal. Account No.");
                         //REC288.SETRANGE("Bank Account No.",REC271."Bank Account No.");
                         IF REC288.FINDFIRST THEN BEGIN
                         VendorTable."Account No(ID)":=REC288."Bank Account No.";
                         VendorTable."Debit Amount":= ABS(REC271.Amount);
                         VendorTable."IFSC Code(MMID)":=REC288."SWIFT Code";
                         VendorTable."Batch Ref":="batch Ref";
                       END;
                      END;
                      VendorTable.INSERT(TRUE);
                    END;
                    UNTIL REC271.NEXT=0;
                    
                    CLEAR(XMIMPS);
                    VendorTable.RESET;
                      IMPStable.INSERT(TRUE);
                    END;//IMPS table Findfirst
                    
                    UNTIL REC271.NEXT=0;//END OF REC271 IMPS Table
                    //VendorTable.SETRANGE("Payment batch","batch Ref")
                    //COMMIT;
                    //XMIMPS.SETTABLEVIEW(VendorTable);
                    
                    
                    //IMPStable.SETFILTER("XML Generated",);
                    COMMIT;
                    XMIMPS.SETTABLEVIEW(IMPStable);
                    XMIMPS.RUN;
                    //code to generate XML port --
                    
                    REC271.RESET;
                    REC271.SETRANGE("Generate XML_IMPS",TRUE);
                    IF REC271.FINDSET THEN REPEAT
                    REC271."Generate XML_IMPS" := FALSE;
                    REC271."Batch Reference" := "batch Ref" ;
                    REC271.MODIFY ;
                    UNTIL REC271.NEXT = 0 ;
                    */

                end;
            }
            action("Generate XML NEFT")
            {
                Caption = 'Generate XML NEFT';
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    // XMIMPS: XMLport "50015";
                    // REC81: Record "271";
                    // SNo: Integer;
                    // Vend: Record "23";
                    // BANK_ACC: Record "270";
                    // REC288: Record "288";
                    // NoSeriesMgmt: Codeunit "396";
                    // purchpayable: Record "312";
                    // "batch Ref": Code[30];
                    // RecBankLedger: Record "271";
                    Counter: Integer;
                    TransactionAmt: Integer;
                    TImeStamp: Text;
                    Year: Integer;
                    Timestamp2: Text;
                    // VendorTable: Record "50014";
                    new: Text;
                begin
                    /*
                    // to calcualte no of transactions , sum up amount ;
                    Counter := 0 ;
                    TransactionAmt := 0 ;
                    RecBankLedger.RESET ;
                    RecBankLedger.SETRANGE("Generate XML_NEFT",TRUE);
                    RecBankLedger.SETRANGE("Bal. Account Type",RecBankLedger."Bal. Account Type"::Vendor);
                    RecBankLedger.SETRANGE("Batch Refrence NEFT",'');
                    IF RecBankLedger.FINDSET THEN REPEAT
                      Counter +=1 ;
                      TransactionAmt += ABS(RecBankLedger.Amount);
                      UNTIL RecBankLedger.NEXT= 0 ;
                    
                    
                    
                    SNo:=0;
                    purchpayable.GET(' ');
                    IF Counter >= 1 THEN
                    "batch Ref":=NoSeriesMgmt.GetNextNo(purchpayable."payment Inf ID No series(NEFT)",WORKDATE,TRUE)
                    ELSE
                    ERROR (' No Batch to Upload');
                    REC81.RESET;
                    REC81.SETRANGE("Generate XML_NEFT",TRUE);
                    REC81.SETRANGE("Bal. Account Type",REC81."Bal. Account Type"::Vendor);
                    REC81.SETRANGE("Batch Refrence NEFT",'');
                    IF REC81.FINDSET THEN REPEAT
                      IMPStable.RESET;
                      IMPStable.SETRANGE("NAV DOC No",REC81."Document No.");
                      IMPStable.SETRANGE("NAV Line No",REC81."Entry No.");
                      IF NOT IMPStable.FINDFIRST THEN BEGIN
                        SNo:=SNo+1;
                        Year:=DATE2DMY(TODAY,3);
                        TImeStamp:=(COPYSTR(FORMAT(TODAY),1,6) + FORMAT(Year) + ' ' + COPYSTR(FORMAT(TIME),1,5));
                        Timestamp2:=(FORMAT(Year)+(COPYSTR(FORMAT(TODAY),3,4))+(COPYSTR(FORMAT(TODAY),1,2)));
                        new:=(FORMAT(Year)+(COPYSTR(FORMAT(TODAY),3,4))+(COPYSTR(FORMAT(TODAY),1,2))+ 'T' + COPYSTR(FORMAT(TIME),1,8));
                        //MESSAGE(CONVERTSTR(TImeStamp,'/','-'));
                        IMPStable."Payment batch":="batch Ref";
                        IMPStable."NAV DOC No":=REC81."Document No.";
                        IMPStable."NAV Line No":=REC81."Entry No.";
                        //IMPStable."Message ID":='HSBC_'+FORMAT(TODAY)+'_'+FORMAT(SNo);
                        IMPStable."Create Date Time":=CONVERTSTR(new,'/','-');
                        IMPStable."Number Of Transaction":= FORMAT(Counter);
                        IMPStable."Sum of Transaction":= TransactionAmt;
                    
                        IMPStable.ReqdExctnDt:=CONVERTSTR(Timestamp2,'/','-');;
                        IMPStable."Transaction Identification":='';
                        IMPStable."Payment reference id":='';
                        //IMPStable."Transaction Identification":=REC81."Document No.";
                        //IMPStable."Payment reference id":=FORMAT(REC81."Entry No.");
                        IMPStable."Payment amount":=ABS(REC81.Amount);
                        // hardcode fields
                        IMPStable."IFSC code":='';
                        IMPStable."Country code":='IN';
                        IMPStable."Country code1":='IN';
                        IMPStable."Charge Bearer":='DEBT';
                        IMPStable.BIC:='HSBCINBB';
                        IMPStable.Country:='IN';
                        IMPStable."HSBC net ID(id)":='ABC66847001';
                        IMPStable."Payment Method":='TRF';
                        IMPStable.Code:='URNS';
                    
                        IMPStable."Country code2":='IN';
                        IMPStable."XML Generated":=TRUE;
                        IMPStable.IDTAG1:='';
                        IMPStable.IDTAG2:='';
                        IMPStable.IDTAG3:='';
                        IMPStable.Ccy:='INR';
                        IMPStable."Name(UltmtDbtr)":='Europ Assistance';
                        IMPStable."Pstcd(UltmtDbtr)":='4000001';
                        IMPStable."TwnNm(UltmtDbtr)":='Maharashtra';
                        IMPStable."Ctry(UltmtDbtr)":='IN';
                        IMPStable.PstlAdrTAG3:='';
                    
                    //
                    REC81.RESET;
                    REC81.SETRANGE("Generate XML_NEFT",TRUE);
                    REC81.SETRANGE("Bal. Account Type",REC81."Bal. Account Type"::Vendor);
                    REC81.SETRANGE("Batch Reference",'');
                    IF REC81.FINDSET THEN REPEAT
                      VendorTable.RESET;
                      VendorTable.SETRANGE("NAV Doc No",REC81."Document No.");
                      VendorTable.SETRANGE("NAV Line No",REC81."Entry No.");
                      IF NOT VendorTable.FINDFIRST THEN BEGIN
                      VendorTable."NAV Doc No":=REC81."Document No.";
                      VendorTable."NAV Line No":=REC81."Entry No.";
                      Vend.RESET;
                      Vend.SETRANGE("No.",REC81."Bal. Account No.");
                      IF Vend.FINDFIRST THEN BEGIN
                        VendorTable."Name of debitor(Nm)":=Vend.Name;
                        REC288.RESET ;
                        REC288.SETRANGE("Vendor No.",REC81."Bal. Account No.");
                         //REC288.SETRANGE("Bank Account No.",REC81."Bank Account No.");
                         IF REC288.FINDFIRST THEN BEGIN
                         VendorTable."Account No(ID)":=REC288."Bank Account No.";
                         VendorTable."Debit Amount":= ABS(REC81.Amount);
                         VendorTable."IFSC Code(MMID)":=REC288."SWIFT Code";
                       END;
                      END;
                      VendorTable.INSERT(TRUE);
                    END;
                    UNTIL REC81.NEXT=0;
                    //
                    
                    
                    //code for debitor account details++
                    BANK_ACC.RESET;
                    BANK_ACC.SETRANGE("No.",REC81."Bank Account No.");
                    IF BANK_ACC.FINDFIRST THEN BEGIN
                      IMPStable."Debitor name":=BANK_ACC.Name;
                       IMPStable."Country Name":=BANK_ACC."Country/Region Code";
                       IMPStable."ID1(debit acc no)":=BANK_ACC."Bank Account No.";
                    END;
                    
                      IMPStable.INSERT(TRUE);
                    END;
                    
                    UNTIL REC81.NEXT=0;
                    //code to generate XML port ++
                    CLEAR(XMIMPS);
                    VendorTable.RESET;
                    //VendorTable.SETRANGE("Payment batch","batch Ref")
                    COMMIT;
                    XMIMPS.SETTABLEVIEW(VendorTable);
                    
                    IMPStable.RESET;
                    IMPStable.SETRANGE("Payment batch","batch Ref");
                    //IMPStable.SETFILTER("XML Generated",);
                    COMMIT;
                    XMIMPS.SETTABLEVIEW(IMPStable);
                    XMIMPS.RUN;
                    //code to generate XML port --
                    
                    REC81.RESET;
                    REC81.SETRANGE("Generate XML_NEFT",TRUE);
                    IF REC81.FINDSET THEN REPEAT
                    REC81."Generate XML_NEFT" := FALSE;
                    REC81."Batch Refrence NEFT":= "batch Ref" ;
                    REC81.MODIFY ;
                    UNTIL REC81.NEXT = 0 ;
                    */

                end;
            }
            action("Bank Acc Led Entry for Bank File")
            {
                ApplicationArea = All;
                RunObject = Page 50029;
                Image = "Report";
            }
            action(temp)
            {
                Visible = false;

                trigger OnAction()
                begin
                    //report50059.RUN;?/Nkp
                end;
            }
            action("Suggest Vendor Payment UTR File Details")
            {
                Caption = 'Suggest Vendor Payment UTR File Details';
                Image = "Report";
                RunObject = Report 50062;
                ApplicationArea = All;
            }
            action("ICICI UTR Details")
            {
                ApplicationArea = All;
                RunObject = Page 50041;
                Image = "Report";
            }

        }
    }

    var
    // BankAccLedEntry: Record "271";
    // report50059: Report "50059";


    //Unsupported feature: Code Insertion on "OnClosePage".

    //trigger OnClosePage()
    //begin
    /*
    BankAccLedEntry.RESET;
    BankAccLedEntry.SETRANGE(Select,TRUE);
    IF BankAccLedEntry.FINDSET THEN REPEAT
       BankAccLedEntry.Select:=FALSE;
       BankAccLedEntry.MODIFY;
    UNTIL BankAccLedEntry.NEXT = 0;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    BankAccLedEntry.RESET;
    BankAccLedEntry.SETRANGE(Select,TRUE);
    IF BankAccLedEntry.FINDSET THEN REPEAT
       BankAccLedEntry.Select:=FALSE;
       BankAccLedEntry.MODIFY;
    UNTIL BankAccLedEntry.NEXT = 0;
    */
    //end;
}

