// table 50017 "Dealer Bridge"
// {

//     fields
//     {
//         field(1; "Entry No."; Integer)
//         {
//         }
//         field(2; "CASE ID"; DateTime)
//         {
//         }
//         field(3; Type; Text[10])
//         {
//         }
//         field(4; "Dealer Code"; Text[20])
//         {
//         }
//         field(5; Name; Text[100])
//         {
//         }
//         field(6; Address; Text[250])
//         {
//         }
//         field(7; "Address 2"; Text[250])
//         {
//         }
//         field(8; "Post Code"; Text[10])
//         {
//         }
//         field(9; "Contact No"; Text[50])
//         {
//         }
//         field(10; "State Code"; Text[10])
//         {
//         }
//         field(11; "GST Registration No."; Code[20])
//         {
//         }
//         field(12; "PAN No."; Text[10])
//         {
//         }
//         field(13; "E-Mail"; Text[150])
//         {
//         }
//         field(14; "Dealer Id"; Integer)
//         {
//         }
//         field(15; "Client Id"; Integer)
//         {
//         }
//         field(16; "Client Name"; Text[50])
//         {
//         }
//         field(17; "Cancelled Cheque"; Text[250])
//         {
//         }
//         field(18; "GST Registration File"; Text[250])
//         {
//         }
//         field(19; "PAN File"; Text[250])
//         {
//         }
//         field(20; "Action"; Text[10])
//         {

//             trigger OnValidate()
//             begin


//                 IF ((Action <> '') AND ((UPPERCASE(Action) = 'CREATE') OR (UPPERCASE(Action) = 'UPDATE'))) THEN BEGIN

//                     /////////////////////////////////////////////////// CREATE START /////////////////////////////////////////////

//                     IF UPPERCASE(Action) = 'CREATE' THEN BEGIN  // create begin

//                         IF Type = '' THEN BEGIN
//                             Response := Response + 'TypeIsMust,';
//                         END ELSE BEGIN
//                             IF ((UPPERCASE(Type) <> 'DEALER') AND (UPPERCASE(Type) <> 'VENDOR')) THEN BEGIN
//                                 Response := Response + 'InvalidType,';
//                                 "Error Flag" := TRUE;
//                             END;
//                         END;

//                         IF "Dealer Id" = 0 THEN BEGIN
//                             Response := Response + 'DealerIdIsMust,';
//                             "Error Flag" := TRUE;
//                         END;

//                         IF "Dealer Code" = '' THEN BEGIN
//                             Response := Response + 'DealerCodeIsMust,';
//                             "Error Flag" := TRUE;
//                         END;

//                         IF ((UPPERCASE(Type) = 'DEALER') AND ("Dealer Id" <> 0)) THEN BEGIN  // type customer begin

//                             recCustomer.RESET;
//                             recCustomer.SETRANGE("Dealer Id", "Dealer Id");
//                             IF recCustomer.FINDFIRST THEN BEGIN  // rec customer begin
//                                 Response := Response + 'DealerAlredyCreatedInNAV,';
//                                 "Error Flag" := TRUE;

//                             END ELSE BEGIN

//                                 IF Name = '' THEN BEGIN
//                                     Response := Response + 'NameIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END;

//                                 IF Address = '' THEN BEGIN
//                                     Response := Response + 'AddessIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END;

//                                 IF "Post Code" = '' THEN BEGIN
//                                     Response := Response + 'PostCodeIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END;

//                                 IF "Contact No" = '' THEN BEGIN
//                                     Response := Response + 'ContactNoIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END;

//                                 IF "State Code" = '' THEN BEGIN
//                                     Response := Response + 'StateCodeIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END ELSE BEGIN
//                                     recState.RESET;
//                                     recState.SETRANGE(Code, "State Code");
//                                     IF NOT recState.FINDFIRST THEN BEGIN
//                                         Response := Response + 'StateCodeInvalid,';
//                                         "Error Flag" := TRUE;
//                                     END;
//                                     IF "GST Registration No." <> '' THEN BEGIN
//                                         recState.RESET;
//                                         recState.SETRANGE(Code, "State Code");
//                                         IF recState.FINDFIRST THEN BEGIN
//                                             IF COPYSTR("GST Registration No.", 1, 2) <> recState."State Code (GST Reg. No.)" THEN BEGIN
//                                                 Response := Response + 'GSTRegNoNotMatchedWithState,';
//                                                 "Error Flag" := TRUE;
//                                             END;
//                                         END;
//                                     END;
//                                 END;

//                                 IF "E-Mail" = '' THEN BEGIN
//                                     Response := Response + 'E-MailIdIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END;

//                                 IF "Client Id" = 0 THEN BEGIN
//                                     Response := Response + 'ClientIdIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END;

//                                 IF "Client Name" = '' THEN BEGIN
//                                     Response := Response + 'ClientNameIsMust,';
//                                     "Error Flag" := TRUE;
//                                 END;
//                                 IF Address <> '' THEN BEGIN//ccit np 30/01/23++
//                                     String := Address;
//                                     IF String.Contains(' Andd') THEN
//                                         String := String.Replace(' Andd', ' And');
//                                     IF String.Contains(' andd') THEN
//                                         String := String.Replace(' andd', ' and');
//                                     IF String.Contains('Orr') THEN
//                                         String := String.Replace('Orr', 'Or');
//                                     IF String.Contains('orr') THEN
//                                         String := String.Replace('orr', 'or');
//                                     IF String.Contains('qots') THEN
//                                         String := String.Replace('qots', '"');
//                                     //IF String.Contains('dollarr')THEN
//                                     //  String:= String.Replace('dollarr','$');
//                                     IF String.Contains('hashh') THEN
//                                         String := String.Replace('hashh', '#');
//                                     IF String.Contains('ampnd') THEN
//                                         String := String.Replace('ampnd', '&');
//                                     Address := String;
//                                 END;
//                                 IF "Address 2" <> '' THEN BEGIN
//                                     String := ("Address 2");
//                                     IF String.Contains(' Andd') THEN
//                                         String := String.Replace(' Andd', ' And');
//                                     IF String.Contains(' andd') THEN
//                                         String := String.Replace(' andd', ' and');
//                                     IF String.Contains('Orr') THEN
//                                         String := String.Replace('Orr', 'Or');
//                                     IF String.Contains('orr') THEN
//                                         String := String.Replace('orr', 'or');
//                                     IF String.Contains('qots') THEN
//                                         String := String.Replace('qots', '"');//hashh
//                                                                               //IF String.Contains('dollarr')THEN
//                                                                               //  String:= String.Replace('dollarr','$');
//                                     IF String.Contains('hashh') THEN
//                                         String := String.Replace('hashh', '#');
//                                     IF String.Contains('ampnd') THEN
//                                         String := String.Replace('ampnd', '&');
//                                     "Address 2" := String;
//                                 END;//ccit np 30/01/23++

//                             END; // rec customer end;

//                         END; // type customer end
//                         Validated := TRUE;
//                         // insert customer +++

//                         IF "Error Flag" = FALSE THEN BEGIN // error flag begin

//                             InitialChar := COPYSTR(UPPERCASE(Name), 1, 1);
//                             LastNo := '';
//                             NewNo := '';
//                             CustNo := '';

//                             /*recCustomer.RESET;
//                             recCustomer.ASCENDING(TRUE);
//                             recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//                             IF recCustomer.FINDSET THEN REPEAT
//                              IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//                                IF  ((COPYSTR(recCustomer."No.",2,1) = 'D' ))    THEN BEGIN
//                                LastNo:=COPYSTR(recCustomer."No.",6,11);
//                              END;
//                              END;
//                            UNTIL recCustomer.NEXT = 0;*/

//                             recCustomer.RESET;
//                             recCustomer.ASCENDING(TRUE);
//                             //recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//                             IF recCustomer.FINDSET THEN
//                                 REPEAT
//                                     //IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//                                     IF ((COPYSTR(recCustomer."No.", 1, 5) = 'CDAPI')) THEN BEGIN
//                                         LastNo := COPYSTR(recCustomer."No.", 6, 11);
//                                     END;
//                                 //END;
//                                 UNTIL recCustomer.NEXT = 0;


//                             // to get customer code for current new customer
//                             IF LastNo <> '' THEN
//                                 NewNo := INCSTR(LastNo)
//                             ELSE
//                                 NewNo := '000001';   //CDAPI000001
//                                                      //CustNo :='CDRS'+InitialChar+NewNo;
//                             CustNo := 'CDAPI' + NewNo;//ccit

//                             insertCustomer.INIT;
//                             insertCustomer.VALIDATE("No.", CustNo);
//                             insertCustomer.VALIDATE(Name, UPPERCASE(Name));
//                             insertCustomer.VALIDATE(Address, Address);
//                             insertCustomer.VALIDATE("Address 2", "Address 2");
//                             insertCustomer.VALIDATE("Dealer City", City);

//                             recPostCode.RESET;
//                             recPostCode.SETRANGE(Code, "Post Code");
//                             //recPostCode.SETRANGE(City,City);
//                             IF NOT recPostCode.FINDFIRST THEN BEGIN

//                                 insertPostCode.RESET;
//                                 insertPostCode.INIT;
//                                 insertPostCode.VALIDATE(insertPostCode.Code, "Post Code");
//                                 insertPostCode.VALIDATE(insertPostCode.City, City);
//                                 insertPostCode.INSERT(TRUE);

//                             END;

//                             insertCustomer."Post Code" := "Post Code";
//                             insertCustomer.City := City;

//                             insertCustomer.VALIDATE("Phone No.", "Contact No");
//                             insertCustomer.VALIDATE("State Code", "State Code");
//                             insertCustomer.VALIDATE("Gen. Bus. Posting Group", 'AUTO-RS');
//                             insertCustomer.VALIDATE("Customer Posting Group", 'DOM-RSA');
//                             insertCustomer."GST Registration No." := DealerBridge."GST Registration No.";
//                             insertCustomer.VALIDATE("P.A.N. No.", "PAN No.");
//                             insertCustomer.VALIDATE("E-Mail", "E-Mail");
//                             insertCustomer.VALIDATE("Dealer Id", "Dealer Id");
//                             insertCustomer.VALIDATE("Client Id", "Client Id");
//                             insertCustomer.VALIDATE("Client Name", "Client Name");
//                             insertCustomer.VALIDATE("Cancelled Cheque", "Cancelled Cheque");
//                             insertCustomer.VALIDATE("GST Registration File", "GST Registration File");
//                             insertCustomer.VALIDATE("PAN File", "PAN File");
//                             insertCustomer.VALIDATE("Dealer Code", "Dealer Code");
//                             insertCustomer.VALIDATE("API Customer", TRUE);
//                             insertCustomer.VALIDATE("Dealer Smart Account No", "Dealer Smart Account No");
//                             insertCustomer.INSERT(TRUE);

//                             "Dealer Created" := TRUE;
//                             "Dealer Creaated On" := CURRENTDATETIME;
//                             "NAV Dealer Code" := CustNo;
//                         END; // error flag end
//                     END; // create end

//                     // insert customer ---

//                     /////////////////////////////////////////////////// CREATE END /////////////////////////////////////////////


//                     /////////////////////////////////////////////////// UPDATE START /////////////////////////////////////////////
//                     NavCustCode := '';

//                     IF UPPERCASE(Action) = 'UPDATE' THEN BEGIN  // update begin


//                         IF "Dealer Id" = 0 THEN BEGIN
//                             Response := Response + 'DealerIdMust,';
//                             "Error Flag" := TRUE;
//                         END;

//                         recCustomer.RESET;
//                         recCustomer.SETRANGE("Dealer Id", "Dealer Id");
//                         IF NOT recCustomer.FINDFIRST THEN BEGIN
//                             Response := Response + 'DealerDoesNotExist,';
//                             "Error Flag" := TRUE;
//                             Validated := TRUE;
//                         END ELSE BEGIN

//                             modifyCustomer.RESET;
//                             modifyCustomer.SETRANGE("Dealer Id", "Dealer Id");
//                             IF modifyCustomer.FINDFIRST THEN BEGIN  // modifycust begin
//                                 "NAV Dealer Code" := modifyCustomer."No.";
//                                 NavCustCode := modifyCustomer."No.";

//                                 IF (("GST Registration No." <> '') AND ("State Code" = '')) THEN BEGIN
//                                     Response := Response + 'StateCodeMustWhileGSTRegNoUpdate,';
//                                     "Error Flag" := TRUE;
//                                 END;
//                                 IF Address <> '' THEN BEGIN//ccit np 30/01/23++
//                                     String := Address;
//                                     IF String.Contains(' Andd') THEN
//                                         String := String.Replace(' Andd', ' And');
//                                     IF String.Contains(' andd') THEN
//                                         String := String.Replace(' andd', ' and');
//                                     IF String.Contains('Orr') THEN
//                                         String := String.Replace('Orr', 'Or');
//                                     IF String.Contains('orr') THEN
//                                         String := String.Replace('orr', 'or');
//                                     IF String.Contains('qots') THEN
//                                         String := String.Replace('qots', '"');
//                                     //IF String.Contains('dollarr')THEN
//                                     //  String:= String.Replace('dollarr','$');
//                                     IF String.Contains('hashh') THEN
//                                         String := String.Replace('hashh', '#');
//                                     IF String.Contains('ampnd') THEN
//                                         String := String.Replace('ampnd', '&');
//                                     Address := String;
//                                 END;
//                                 IF "Address 2" <> '' THEN BEGIN
//                                     String := "Address 2";
//                                     IF String.Contains(' Andd') THEN
//                                         String := String.Replace(' Andd', ' And');
//                                     IF String.Contains(' andd') THEN
//                                         String := String.Replace(' andd', ' and');
//                                     IF String.Contains('Orr') THEN
//                                         String := String.Replace('Orr', 'Or');
//                                     IF String.Contains('orr') THEN
//                                         String := String.Replace('orr', 'or');
//                                     IF String.Contains('qots') THEN
//                                         String := String.Replace('qots', '"');//hashh
//                                                                               //IF String.Contains('dollarr')THEN
//                                                                               //  String:= String.Replace('dollarr','$');
//                                     IF String.Contains('hashh') THEN
//                                         String := String.Replace('hashh', '#');
//                                     IF String.Contains('ampnd') THEN
//                                         String := String.Replace('ampnd', '&');
//                                     "Address 2" := String;
//                                 END;//ccit np 30/01/23++

//                                 IF "State Code" <> '' THEN BEGIN

//                                     recState.RESET;
//                                     recState.SETRANGE(Code, "State Code");
//                                     IF NOT recState.FINDFIRST THEN BEGIN
//                                         Response := Response + 'StateCodeInvalid,';
//                                         "Error Flag" := TRUE;
//                                     END ELSE BEGIN

//                                         IF "GST Registration No." <> '' THEN BEGIN
//                                             recState.RESET;
//                                             recState.SETRANGE(Code, "State Code");
//                                             IF recState.FINDFIRST THEN BEGIN
//                                                 IF COPYSTR("GST Registration No.", 1, 2) <> recState."State Code (GST Reg. No.)" THEN BEGIN
//                                                     Response := Response + 'GSTRegNoNotMatchedWithState,';
//                                                     "Error Flag" := TRUE;
//                                                 END;
//                                             END;
//                                         END;

//                                     END;
//                                 END;

//                                 IF (("Beneficiary Name" <> '') OR ("Beneficiary Account No" <> '') OR ("Beneficiary IFSC Code" <> '')) THEN BEGIN

//                                     IF "Beneficiary Name" = '' THEN BEGIN
//                                         Response := Response + 'BeneficiaryNameMust,';
//                                         "Error Flag" := TRUE;
//                                     END;

//                                     IF "Beneficiary Account No" = '' THEN BEGIN
//                                         Response := Response + 'BeneficiaryAccNoMust,';
//                                         "Error Flag" := TRUE;
//                                     END;

//                                     IF "Beneficiary IFSC Code" = '' THEN BEGIN
//                                         Response := Response + 'BeneficiaryIFSCcodeMust,';
//                                         "Error Flag" := TRUE;
//                                     END;

//                                 END;

//                                 Validated := TRUE;

//                                 IF "Error Flag" = FALSE THEN BEGIN

//                                     IF Name <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE(Name, Name);
//                                     END;

//                                     IF Address <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE(Address, Address);
//                                     END;

//                                     IF "Address 2" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("Address 2", "Address 2");
//                                     END;

//                                     IF "Post Code" <> '' THEN BEGIN
//                                         recPostCode.RESET;
//                                         recPostCode.SETRANGE(Code, "Post Code");
//                                         IF NOT recPostCode.FINDFIRST THEN BEGIN

//                                             insertPostCode.RESET;
//                                             insertPostCode.INIT;
//                                             insertPostCode.VALIDATE(insertPostCode.Code, "Post Code");
//                                             insertPostCode.VALIDATE(insertPostCode.City, City);
//                                             insertPostCode.INSERT;

//                                         END;

//                                         modifyCustomer."Post Code" := "Post Code";
//                                     END;

//                                     IF City <> '' THEN BEGIN
//                                         modifyCustomer."Dealer City" := City;
//                                         modifyCustomer.City := City;
//                                     END;


//                                     IF "Contact No" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("Phone No.", "Contact No");
//                                     END;

//                                     IF "PAN No." <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("P.A.N. No.", "PAN No.");
//                                     END;

//                                     IF "State Code" <> '' THEN BEGIN
//                                         modifyCustomer."GST Registration No." := '';
//                                         modifyCustomer.VALIDATE("State Code", "State Code");
//                                     END;

//                                     IF "GST Registration No." <> '' THEN BEGIN
//                                         modifyCustomer."GST Registration No." := DealerBridge."GST Registration No.";
//                                     END;

//                                     IF "E-Mail" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("E-Mail", "E-Mail");
//                                     END;
//                                     /*
//                                     IF "Dealer Id" <> 0 THEN BEGIN
//                                     modifyCustomer.VALIDATE("Dealer Id","Dealer Id");
//                                     END;
//                                     */
//                                     IF "Dealer Code" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("Dealer Code", "Dealer Code");
//                                     END;

//                                     IF "Client Id" <> 0 THEN BEGIN
//                                         modifyCustomer.VALIDATE("Client Id", "Client Id");
//                                     END;

//                                     IF "Client Name" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("Client Name", "Client Name");
//                                     END;
//                                     IF "Cancelled Cheque" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("Cancelled Cheque", "Cancelled Cheque");
//                                     END;
//                                     IF "GST Registration File" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("GST Registration File", "GST Registration File");
//                                     END;
//                                     IF "PAN File" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("PAN File", "PAN File");
//                                     END;
//                                     IF "Dealer Smart Account No" <> '' THEN BEGIN
//                                         modifyCustomer.VALIDATE("Dealer Smart Account No", "Dealer Smart Account No");
//                                     END;

//                                     // update customer bank details +++

//                                     IF (("Beneficiary Account No" <> '') OR ("Beneficiary Name" <> '') OR ("Beneficiary IFSC Code" <> '')) THEN BEGIN

//                                         custbankacc.RESET;
//                                         custbankacc.SETCURRENTKEY("Customer No.", Code);
//                                         custbankacc.ASCENDING(TRUE);
//                                         custbankacc.SETRANGE("Customer No.", NavCustCode);
//                                         IF custbankacc.FINDLAST THEN BEGIN

//                                             insertCustomerBankAcc.INIT;
//                                             insertCustomerBankAcc.VALIDATE("Customer No.", NavCustCode);
//                                             insertCustomerBankAcc.VALIDATE(Code, INCSTR(custbankacc.Code));
//                                             insertCustomerBankAcc.VALIDATE(Name, "Beneficiary Name");
//                                             insertCustomerBankAcc.VALIDATE("Bank Account No.", "Beneficiary Account No");
//                                             insertCustomerBankAcc.VALIDATE("SWIFT Code", "Beneficiary IFSC Code");
//                                             insertCustomerBankAcc.VALIDATE("Default Account", TRUE);
//                                             insertCustomerBankAcc.INSERT(TRUE);


//                                             recCustomerBankAcc.RESET;
//                                             recCustomerBankAcc.SETRANGE("Customer No.", NavCustCode);
//                                             recCustomerBankAcc.SETFILTER(Code, '<>%1', INCSTR(custbankacc.Code));
//                                             IF recCustomerBankAcc.FINDSET THEN
//                                                 REPEAT
//                                                     recCustomerBankAcc."Default Account" := FALSE;
//                                                     recCustomerBankAcc.MODIFY(TRUE);
//                                                 UNTIL recCustomerBankAcc.NEXT = 0;

//                                         END ELSE BEGIN

//                                             insertCustomerBankAcc.INIT;
//                                             insertCustomerBankAcc.VALIDATE("Customer No.", NavCustCode);
//                                             insertCustomerBankAcc.VALIDATE(Code, NavCustCode + '_01');
//                                             insertCustomerBankAcc.VALIDATE(Name, "Beneficiary Name");
//                                             insertCustomerBankAcc.VALIDATE("Bank Account No.", "Beneficiary Account No");
//                                             insertCustomerBankAcc.VALIDATE("SWIFT Code", "Beneficiary IFSC Code");
//                                             insertCustomerBankAcc.VALIDATE("Default Account", TRUE);
//                                             insertCustomerBankAcc.INSERT(TRUE);

//                                         END;
//                                     END;

//                                     // update customer bank details ---

//                                     modifyCustomer.MODIFY(TRUE);


//                                     Validated := TRUE;
//                                     "Dealer Updated" := TRUE;
//                                     "Dealer Updated On" := CURRENTDATETIME;
//                                 END;

//                             END;
//                         END;

//                         // Create Dealer in UPDATE request if response is : DealerDoesNotExist; ++

//                         IF ((Validated = TRUE) AND ("Error Flag" = TRUE) AND (Response = 'DealerDoesNotExist,')) THEN BEGIN

//                             createDealer;
//                         END;

//                         // Create Deraler in UPDATE request if response is : DealerDoesNotExist; --

//                     END; // update end

//                     /////////////////////////////////////////////////// UPDATE END /////////////////////////////////////////////
//                 END ELSE BEGIN
//                     Response := Response + 'InvalidAction,';
//                     "Error Flag" := TRUE;
//                     Validated := TRUE;
//                 END;

//                 ///////////////////////////////////////////////////////// documents begin ////////////////////////////////////////

//                 IF ((Validated = TRUE) AND ("Error Flag" = FALSE)) THEN BEGIN

//                     IF "PAN File" <> '' THEN BEGIN

//                         SalesRcblSetup.GET('');
//                         LinkID := 0;
//                         recLink.RESET;
//                         recLink.SETCURRENTKEY(recLink."Link ID");
//                         recLink.ASCENDING(TRUE);
//                         recLink.SETFILTER("Link ID", '<>%1', 0);
//                         IF recLink.FINDLAST THEN BEGIN
//                             LinkID := recLink."Link ID" + 1;
//                         END;

//                         RecordLink.RESET;
//                         RecordLink.INIT;
//                         RecordLink."Link ID" := LinkID;
//                         RecordLink."No." := "NAV Dealer Code";
//                         RecordLink.Description := 'PAN FILE';
//                         RecordLink."Attachement Name" := COPYSTR(FileManagement.GetFileNameWithoutExtension("PAN File"), 1, MAXSTRLEN("PAN File"));
//                         RecordLink.URL1 := "PAN File";
//                         RecordLink.Created := CURRENTDATETIME;
//                         RecordLink."User ID" := USERID;
//                         RecordLink.Company := COMPANYNAME;
//                         RecordLink.INSERT(TRUE);
//                     END;

//                     IF "GST Registration File" <> '' THEN BEGIN

//                         SalesRcblSetup.GET('');
//                         LinkID := 0;
//                         recLink.RESET;
//                         recLink.SETCURRENTKEY(recLink."Link ID");
//                         recLink.ASCENDING(TRUE);
//                         recLink.SETFILTER("Link ID", '<>%1', 0);
//                         IF recLink.FINDLAST THEN BEGIN
//                             LinkID := recLink."Link ID" + 1;
//                         END;

//                         RecordLink.RESET;
//                         RecordLink.INIT;
//                         RecordLink."Link ID" := LinkID;
//                         RecordLink."No." := "NAV Dealer Code";
//                         RecordLink.Description := 'GST Registration File';
//                         RecordLink."Attachement Name" := COPYSTR(FileManagement.GetFileNameWithoutExtension("GST Registration File"), 1, MAXSTRLEN("GST Registration File"));
//                         RecordLink.URL1 := "GST Registration File";
//                         RecordLink.Created := CURRENTDATETIME;
//                         RecordLink."User ID" := USERID;
//                         RecordLink.Company := COMPANYNAME;
//                         RecordLink.INSERT(TRUE);
//                     END;

//                     IF "Cancelled Cheque" <> '' THEN BEGIN

//                         SalesRcblSetup.GET('');
//                         LinkID := 0;
//                         recLink.RESET;
//                         recLink.SETCURRENTKEY(recLink."Link ID");
//                         recLink.ASCENDING(TRUE);
//                         recLink.SETFILTER("Link ID", '<>%1', 0);
//                         IF recLink.FINDLAST THEN BEGIN
//                             LinkID := recLink."Link ID" + 1;
//                         END;

//                         RecordLink.RESET;
//                         RecordLink.INIT;
//                         RecordLink."Link ID" := LinkID;
//                         RecordLink."No." := "NAV Dealer Code";
//                         RecordLink.Description := 'Cancelled Cheque';
//                         RecordLink."Attachement Name" := COPYSTR(FileManagement.GetFileNameWithoutExtension("Cancelled Cheque"), 1, MAXSTRLEN("Cancelled Cheque"));
//                         RecordLink.URL1 := "Cancelled Cheque";
//                         RecordLink.Created := CURRENTDATETIME;
//                         RecordLink."User ID" := USERID;
//                         RecordLink.Company := COMPANYNAME;
//                         RecordLink.INSERT(TRUE);
//                     END;

//                 END;

//                 ///////////////////////////////////////////////////////// documents end ////////////////////////////////////////

//             end;
//         }
//         field(21; Validated; Boolean)
//         {
//         }
//         field(22; "Error Flag"; Boolean)
//         {
//         }
//         field(23; Response; Text[250])
//         {
//         }
//         field(24; "Dealer Created"; Boolean)
//         {
//         }
//         field(25; "Dealer Creaated On"; DateTime)
//         {
//         }
//         field(26; "Dealer Updated"; Boolean)
//         {
//         }
//         field(27; "Dealer Updated On"; DateTime)
//         {
//         }
//         field(28; "NAV Dealer Code"; Code[20])
//         {
//         }
//         field(29; City; Text[20])
//         {
//         }
//         field(30; "Beneficiary Name"; Text[100])
//         {
//         }
//         field(31; "Beneficiary Account No"; Text[30])
//         {
//         }
//         field(32; "Beneficiary IFSC Code"; Text[30])
//         {
//         }
//         field(33; "Dealer Smart Account No"; Text[30])
//         {
//         }
//     }

//     keys
//     {
//         key(Key1; "Entry No.", "CASE ID")
//         {
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnInsert()
//     begin
//         DealerBridge.RESET;
//         DealerBridge.SETFILTER("Entry No.", '<>%1', 0);
//         IF DealerBridge.FINDLAST THEN BEGIN
//             "Entry No." := DealerBridge."Entry No." + 1;
//         END ELSE BEGIN
//             "Entry No." := 1;
//         END;
//         "CASE ID" := CURRENTDATETIME;
//     end;

//     var
//         DealerBridge: Record "Dealer Bridge";
//         recCustomer: Record Customer;
//         insertCustomer: Record Customer;
//         recState: Record State;
//         CustNo: Code[20];
//         recPostCode: Record "Post Code";
//         modifyCustomer: Record Customer;
//         LastNo: Code[10];
//         InitialChar: Text[1];
//         NewNo: Text[6];
//         NavCustCode: Code[20];
//         recCustomerBankAcc: Record "Customer Bank Account";
//         insertCustomerBankAcc: Record "Customer Bank Account";
//         custbankacc: Record "Customer Bank Account";
//         modifyCustomer1: Record Customer;
//         recLink: Record "Record Link";
//         RecordLink: Record "Record Link1";
//         LinkID: Integer;
//         SalesRcblSetup: Record "Sales & Receivables Setup";
//         FileManagement: Codeunit "File Management";
//         insertPostCode: Record "Post Code";
//         String: Text;

//     procedure createDealer()
//     begin
//         IF Type = '' THEN BEGIN
//             Response := Response + 'TypeIsMust,';
//         END ELSE BEGIN
//             IF ((UPPERCASE(Type) <> 'DEALER') AND (UPPERCASE(Type) <> 'VENDOR')) THEN BEGIN
//                 Response := Response + 'InvalidType,';
//                 "Error Flag" := TRUE;
//             END;
//         END;

//         IF "Dealer Id" = 0 THEN BEGIN
//             Response := Response + 'DealerIdIsMust,';
//             "Error Flag" := TRUE;
//         END;

//         IF "Dealer Code" = '' THEN BEGIN
//             Response := Response + 'DealerCodeIsMust,';
//             "Error Flag" := TRUE;
//         END;

//         IF ((UPPERCASE(Type) = 'DEALER') AND ("Dealer Id" <> 0)) THEN BEGIN  // type customer begin

//             recCustomer.RESET;
//             recCustomer.SETRANGE("Dealer Id", "Dealer Id");
//             IF recCustomer.FINDFIRST THEN BEGIN  // rec customer begin
//                 Response := Response + 'DealerAlredyCreatedInNAV,';
//                 "Error Flag" := TRUE;

//             END ELSE BEGIN

//                 IF Name = '' THEN BEGIN
//                     Response := Response + 'NameIsMust,';
//                     "Error Flag" := TRUE;
//                 END;

//                 IF Address = '' THEN BEGIN
//                     Response := Response + 'AddessIsMust,';
//                     "Error Flag" := TRUE;
//                 END;

//                 IF "Post Code" = '' THEN BEGIN
//                     Response := Response + 'PostCodeIsMust,';
//                     "Error Flag" := TRUE;
//                 END;

//                 IF "Contact No" = '' THEN BEGIN
//                     Response := Response + 'ContactNoIsMust,';
//                     "Error Flag" := TRUE;
//                 END;

//                 IF "State Code" = '' THEN BEGIN
//                     Response := Response + 'StateCodeIsMust,';
//                     "Error Flag" := TRUE;
//                 END ELSE BEGIN
//                     recState.RESET;
//                     recState.SETRANGE(Code, "State Code");
//                     IF NOT recState.FINDFIRST THEN BEGIN
//                         Response := Response + 'StateCodeInvalid,';
//                         "Error Flag" := TRUE;
//                     END;
//                     IF "GST Registration No." <> '' THEN BEGIN
//                         recState.RESET;
//                         recState.SETRANGE(Code, "State Code");
//                         IF recState.FINDFIRST THEN BEGIN
//                             IF COPYSTR("GST Registration No.", 1, 2) <> recState."State Code (GST Reg. No.)" THEN BEGIN
//                                 Response := Response + 'GSTRegNoNotMatchedWithState,';
//                                 "Error Flag" := TRUE;
//                             END;
//                         END;
//                     END;
//                 END;

//                 IF "E-Mail" = '' THEN BEGIN
//                     Response := Response + 'E-MailIdIsMust,';
//                     "Error Flag" := TRUE;
//                 END;

//                 IF "Client Id" = 0 THEN BEGIN
//                     Response := Response + 'ClientIdIsMust,';
//                     "Error Flag" := TRUE;
//                 END;

//                 IF "Client Name" = '' THEN BEGIN
//                     Response := Response + 'ClientNameIsMust,';
//                     "Error Flag" := TRUE;
//                 END;

//             END; // rec customer end;

//         END; // type customer end
//         Validated := TRUE;
//         // insert customer +++

//         IF ((Validated = TRUE) AND ("Error Flag" = TRUE) AND (Response = 'DealerDoesNotExist,')) THEN BEGIN

//             InitialChar := COPYSTR(UPPERCASE(Name), 1, 1);
//             LastNo := '';
//             NewNo := '';
//             CustNo := '';

//             /*recCustomer.RESET;
//             recCustomer.ASCENDING(TRUE);
//             recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//             IF recCustomer.FINDSET THEN REPEAT
//              IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//                IF  ((COPYSTR(recCustomer."No.",2,1) = 'D' ))    THEN BEGIN
//                LastNo:=COPYSTR(recCustomer."No.",6,11);
//              END;
//              END;
//            UNTIL recCustomer.NEXT = 0;*/

//             recCustomer.RESET; //CCIT
//             recCustomer.ASCENDING(TRUE);
//             //recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//             IF recCustomer.FINDSET THEN
//                 REPEAT
//                     //IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//                     IF ((COPYSTR(recCustomer."No.", 1, 5) = 'CDAPI')) THEN BEGIN
//                         LastNo := COPYSTR(recCustomer."No.", 6, 11);
//                     END;
//                 // END;
//                 UNTIL recCustomer.NEXT = 0;

//             // to get customer code for current new customer
//             IF LastNo <> '' THEN
//                 NewNo := INCSTR(LastNo)
//             ELSE
//                 NewNo := '000001';
//             //CustNo :='CDRS'+InitialChar+NewNo;
//             CustNo := 'CDAPI' + NewNo;//CCIT

//             insertCustomer.INIT;
//             insertCustomer.VALIDATE("No.", CustNo);
//             insertCustomer.VALIDATE(Name, UPPERCASE(Name));
//             insertCustomer.VALIDATE(Address, Address);
//             insertCustomer.VALIDATE("Address 2", "Address 2");
//             insertCustomer.VALIDATE("Dealer City", City);
//             recPostCode.RESET;
//             recPostCode.SETRANGE(Code, "Post Code");
//             IF recPostCode.FINDFIRST THEN BEGIN
//                 insertCustomer.VALIDATE("Post Code", "Post Code");
//                 insertCustomer.VALIDATE(City, recPostCode.City);
//             END;

//             insertCustomer.VALIDATE("Phone No.", "Contact No");
//             insertCustomer.VALIDATE("State Code", "State Code");
//             insertCustomer.VALIDATE("Gen. Bus. Posting Group", 'AUTO-RS');
//             insertCustomer.VALIDATE("Customer Posting Group", 'DOM-RSA');
//             insertCustomer."GST Registration No." := "GST Registration No.";
//             insertCustomer.VALIDATE("P.A.N. No.", "PAN No.");
//             insertCustomer.VALIDATE("E-Mail", "E-Mail");
//             insertCustomer.VALIDATE("Dealer Id", "Dealer Id");
//             insertCustomer.VALIDATE("Client Id", "Client Id");
//             insertCustomer.VALIDATE("Client Name", "Client Name");
//             insertCustomer.VALIDATE("Cancelled Cheque", "Cancelled Cheque");
//             insertCustomer.VALIDATE("GST Registration File", "GST Registration File");
//             insertCustomer.VALIDATE("PAN File", "PAN File");
//             insertCustomer.VALIDATE("Dealer Code", "Dealer Code");
//             insertCustomer.VALIDATE("API Customer", TRUE);
//             insertCustomer.VALIDATE("Dealer Smart Account No", "Dealer Smart Account No");// AZ090721
//             insertCustomer.INSERT(TRUE);


//             "Error Flag" := FALSE;
//             Response := '';
//             "Dealer Created" := TRUE;
//             "Dealer Creaated On" := CURRENTDATETIME;
//             "NAV Dealer Code" := CustNo;

//         END; // error flag end

//         // insert customer ---

//     end;
// }

