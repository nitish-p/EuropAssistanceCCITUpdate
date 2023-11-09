// Table 50017 "Dealer Bridge"
// {

//     fields
//     {
//         field(1;"Entry No.";Integer)
//         {
//         }
//         field(2;"CASE ID";DateTime)
//         {
//         }
//         field(3;Type;Text[10])
//         {
//         }
//         field(4;"Dealer Code";Text[20])
//         {
//         }
//         field(5;Name;Text[100])
//         {
//         }
//         field(6;Address;Text[250])
//         {
//         }
//         field(7;"Address 2";Text[250])
//         {
//         }
//         field(8;"Post Code";Text[10])
//         {
//         }
//         field(9;"Contact No";Text[50])
//         {
//         }
//         field(10;"State Code";Text[10])
//         {
//         }
//         field(11;"GST Registration No.";Text[15])
//         {
//         }
//         field(12;"PAN No.";Text[10])
//         {
//         }
//         field(13;"E-Mail";Text[150])
//         {
//         }
//         field(14;"Dealer Id";Integer)
//         {
//         }
//         field(15;"Client Id";Integer)
//         {
//         }
//         field(16;"Client Name";Text[50])
//         {
//         }
//         field(17;"Cancelled Cheque";Text[250])
//         {
//         }
//         field(18;"GST Registration File";Text[250])
//         {
//         }
//         field(19;"PAN File";Text[250])
//         {
//         }
//         field(20;"Action";Text[10])
//         {

//             trigger OnValidate()
//             begin
                
                
//                 if ((Action <> '') and ((UpperCase(Action) = 'CREATE') or (UpperCase(Action) = 'UPDATE'))) then begin
                
//                 /////////////////////////////////////////////////// CREATE START /////////////////////////////////////////////
                
//                 if UpperCase(Action) = 'CREATE' then begin  // create begin
                
//                 if Type='' then begin
//                   Response:=Response+'TypeIsMust,';
//                 end else begin
//                 if ((UpperCase(Type) <> 'DEALER') and (UpperCase(Type) <> 'VENDOR')) then begin
//                   Response:=Response+'InvalidType,';
//                   "Error Flag":=true;
//                 end;
//                 end;
                
//                   if "Dealer Id" = 0 then begin
//                     Response:=Response+'DealerIdIsMust,';
//                     "Error Flag":=true;
//                   end;
                
//                 if "Dealer Code" = '' then begin
//                   Response:=Response+'DealerCodeIsMust,';
//                   "Error Flag":=true;
//                 end;
                
//                 if ((UpperCase(Type) = 'DEALER') and ("Dealer Id" <> 0)) then begin  // type customer begin
                
//                   recCustomer.Reset;
//                 recCustomer.SetRange("Dealer Code","Dealer Code");
//                 if recCustomer.FindFirst then begin  // rec customer begin
//                   Response:=Response+'DealerCodeAlredyCreatedInNAV,';
//                   "Error Flag":=true;
//                 end;
//                 recCustomer.Reset;
//                 recCustomer.SetRange("Dealer Id","Dealer Id");
//                 if recCustomer.FindFirst then begin  // rec customer begin
//                   Response:=Response+'DealerAlredyCreatedInNAV,';
//                   "Error Flag":=true;
                
//                 end else begin
                
//                   if Name = '' then begin
//                     Response:=Response+'NameIsMust,';
//                     "Error Flag":=true;
//                   end;
                
//                   if Address = '' then begin
//                    Response:=Response+'AddessIsMust,';
//                    "Error Flag":=true;
//                   end;
                
//                   if "Post Code" = '' then begin
//                     Response:=Response+'PostCodeIsMust,';
//                     "Error Flag":=true;
//                   end;
                
//                   if "Contact No" = '' then begin
//                     Response:=Response+'ContactNoIsMust,';
//                     "Error Flag":=true;
//                   end;
                
//                   if "State Code" = '' then begin
//                    Response:=Response+'StateCodeIsMust,';
//                    "Error Flag":=true;
//                   end else begin
//                     recState.Reset;
//                     recState.SetRange(Code,"State Code");
//                     if not recState.FindFirst then begin
//                      Response:=Response+'StateCodeInvalid,';
//                      "Error Flag":=true;
//                     end;
//                   if "GST Registration No." <> '' then begin
//                     recState.Reset;
//                     recState.SetRange(Code,"State Code");
//                     if recState.FindFirst then begin
//                     if CopyStr("GST Registration No.",1,2) <> recState."State Code (GST Reg. No.)" then begin
//                      Response:=Response+'GSTRegNoNotMatchedWithState,';
//                      "Error Flag":=true;
//                      end;
//                      end;
//                   end;
//                   end;
                
//                   if "E-Mail" = '' then begin
//                     Response:=Response+'E-MailIdIsMust,';
//                     "Error Flag":=true;
//                   end;
                
//                   if "Client Id"= 0 then begin
//                     Response:=Response+'ClientIdIsMust,';
//                     "Error Flag":=true;
//                   end;
                
//                   if "Client Name" = '' then begin
//                     Response:=Response+'ClientNameIsMust,';
//                     "Error Flag":=true;
//                   end;
//                 if Address<>'' then begin//ccit np 30/01/23++
//                   String:=Address;
//                   if String.Contains(' Andd')then
//                     String:=String.Replace(' Andd',' And');
//                   if String.Contains(' andd')then
//                     String:= String.Replace(' andd',' and');
//                   if String.Contains('Orr')then
//                     String:= String.Replace('Orr','Or');
//                   if String.Contains('orr')then
//                     String:= String.Replace('orr','or');
//                   if String.Contains('qots')then
//                     String:= String.Replace('qots','"');
//                   //IF String.Contains('dollarr')THEN
//                   //  String:= String.Replace('dollarr','$');
//                   if String.Contains('hashh')then
//                     String:= String.Replace('hashh','#');
//                   if String.Contains('ampnd')then
//                     String:= String.Replace('ampnd','&');
//                   Address:=String;
//                 end;
//                 if "Address 2"<>'' then begin
//                   String:=("Address 2");
//                   if String.Contains(' Andd')then
//                     String:=String.Replace(' Andd',' And');
//                   if String.Contains(' andd')then
//                     String:= String.Replace(' andd',' and');
//                   if String.Contains('Orr')then
//                     String:= String.Replace('Orr','Or');
//                   if String.Contains('orr')then
//                     String:= String.Replace('orr','or');
//                   if String.Contains('qots')then
//                     String:= String.Replace('qots','"');//hashh
//                   //IF String.Contains('dollarr')THEN
//                   //  String:= String.Replace('dollarr','$');
//                   if String.Contains('hashh')then
//                     String:= String.Replace('hashh','#');
//                   if String.Contains('ampnd')then
//                     String:= String.Replace('ampnd','&');
//                   "Address 2":=String;
//                 end;//ccit np 30/01/23++
                
//                 end; // rec customer end;
                
//                 end; // type customer end
//                 Validated:=true;
//                 // insert customer +++
                
//                 if "Error Flag" = false then begin // error flag begin
                
//                 InitialChar:=CopyStr(UpperCase(Name),1,1);
//                 LastNo:='';
//                 NewNo:='';
//                 CustNo:='';
                
//                  /*recCustomer.RESET;
//                  recCustomer.ASCENDING(TRUE);
//                  recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//                  IF recCustomer.FINDSET THEN REPEAT
//                   IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//                     IF  ((COPYSTR(recCustomer."No.",2,1) = 'D' ))    THEN BEGIN
//                     LastNo:=COPYSTR(recCustomer."No.",6,11);
//                   END;
//                   END;
//                 UNTIL recCustomer.NEXT = 0;*/
                
//                  recCustomer.Reset;
//                  recCustomer.Ascending(true);
//                  //recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//                  if recCustomer.FindSet then repeat
//                   //IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//                     if  ((CopyStr(recCustomer."No.",1,5) = 'CDAPI' ))    then begin
//                     LastNo:=CopyStr(recCustomer."No.",6,11);
//                   end;
//                   //END;
//                 until recCustomer.Next = 0;
                
                
//                 // to get customer code for current new customer
//                 if LastNo <> ''then
//                 NewNo :=IncStr(LastNo)
//                 else
//                 NewNo   := '000001';   //CDAPI000001
//                 //CustNo :='CDRS'+InitialChar+NewNo;
//                 CustNo :='CDAPI'+NewNo;//ccit
                
//                 insertCustomer.Init;
//                 insertCustomer.Validate("No.",CustNo);
//                 insertCustomer.Validate(Name,UpperCase(Name));
//                 insertCustomer.Validate(Address,Address);
//                 insertCustomer.Validate("Address 2","Address 2");
//                 insertCustomer.Validate("Dealer City",City);
                
//                 recPostCode.Reset;
//                 recPostCode.SetRange(Code,"Post Code");
//                 //recPostCode.SETRANGE(City,City);
//                 if not recPostCode.FindFirst then begin
                
//                 insertPostCode.Reset;
//                 insertPostCode.Init;
//                 insertPostCode.Validate(insertPostCode.Code,"Post Code");
//                 insertPostCode.Validate(insertPostCode.City,City);
//                 insertPostCode.Insert(true);
                
//                 end;
                
//                 insertCustomer."Post Code":="Post Code";
//                 insertCustomer.City:=City;
                
//                 insertCustomer.Validate("Phone No.","Contact No");
//                 insertCustomer.Validate("State Code","State Code");
//                 insertCustomer.Validate("Gen. Bus. Posting Group",'AUTO-RS');
//                 insertCustomer.Validate("Customer Posting Group",'DOM-RSA');
//                 insertCustomer.Validate("GST Registration No.","GST Registration No.");
//                 insertCustomer.Validate("P.A.N. No.","PAN No.");
//                 insertCustomer.Validate("E-Mail","E-Mail");
//                 insertCustomer.Validate("Dealer Id","Dealer Id");
//                 insertCustomer.Validate("Client Id","Client Id");
//                 insertCustomer.Validate("Client Name","Client Name");
//                 insertCustomer.Validate("Cancelled Cheque","Cancelled Cheque");
//                 insertCustomer.Validate("GST Registration File","GST Registration File");
//                 insertCustomer.Validate("PAN File","PAN File");
//                 insertCustomer.Validate("Dealer Code","Dealer Code");
//                 insertCustomer.Validate("API Customer",true);
//                 insertCustomer.Validate("Dealer Smart Account No","Dealer Smart Account No");
//                 insertCustomer.Insert(true);
                
//                 "Dealer Created":=true;
//                 "Dealer Creaated On":=CurrentDatetime;
//                 "NAV Dealer Code":=CustNo;
//                 end; // error flag end
//                 end; // create end
                
//                 // insert customer ---
                
//                 /////////////////////////////////////////////////// CREATE END /////////////////////////////////////////////
                
                
//                 /////////////////////////////////////////////////// UPDATE START /////////////////////////////////////////////
//                 NavCustCode:='';
                
//                 if UpperCase(Action) = 'UPDATE' then begin  // update begin
                
                
//                 if "Dealer Id" = 0 then begin
//                      Response:=Response+'DealerIdMust,';
//                     "Error Flag":=true;
//                 end;
                
//                   recCustomer.Reset;
//                   recCustomer.SetRange("Dealer Id","Dealer Id");
//                   if not recCustomer.FindFirst then begin
//                      Response:=Response+'DealerDoesNotExist,';
//                     "Error Flag":=true;
//                     Validated:=true;
//                   end else begin
                
//                 modifyCustomer.Reset;
//                 modifyCustomer.SetRange("Dealer Id","Dealer Id");
//                 if modifyCustomer.FindFirst then begin  // modifycust begin
//                 "NAV Dealer Code":=modifyCustomer."No.";
//                 NavCustCode:=modifyCustomer."No.";
                
//                   if (("GST Registration No." <> '') and ("State Code" = '')) then begin
//                       Response:=Response+'StateCodeMustWhileGSTRegNoUpdate,';
//                      "Error Flag":=true;
//                   end;
//                 if Address<>'' then begin//ccit np 30/01/23++
//                   String:=Address;
//                   if String.Contains(' Andd')then
//                     String:=String.Replace(' Andd',' And');
//                   if String.Contains(' andd')then
//                     String:= String.Replace(' andd',' and');
//                   if String.Contains('Orr')then
//                     String:= String.Replace('Orr','Or');
//                   if String.Contains('orr')then
//                     String:= String.Replace('orr','or');
//                   if String.Contains('qots')then
//                     String:= String.Replace('qots','"');
//                   //IF String.Contains('dollarr')THEN
//                   //  String:= String.Replace('dollarr','$');
//                   if String.Contains('hashh')then
//                     String:= String.Replace('hashh','#');
//                   if String.Contains('ampnd')then
//                     String:= String.Replace('ampnd','&');
//                   Address:=String;
//                 end;
//                 if "Address 2"<>'' then begin
//                   String:="Address 2";
//                   if String.Contains(' Andd')then
//                     String:=String.Replace(' Andd',' And');
//                   if String.Contains(' andd')then
//                     String:= String.Replace(' andd',' and');
//                   if String.Contains('Orr')then
//                     String:= String.Replace('Orr','Or');
//                   if String.Contains('orr')then
//                     String:= String.Replace('orr','or');
//                   if String.Contains('qots')then
//                     String:= String.Replace('qots','"');//hashh
//                   //IF String.Contains('dollarr')THEN
//                   //  String:= String.Replace('dollarr','$');
//                   if String.Contains('hashh')then
//                     String:= String.Replace('hashh','#');
//                   if String.Contains('ampnd')then
//                     String:= String.Replace('ampnd','&');
//                   "Address 2":=String;
//                 end;//ccit np 30/01/23++
                
//                 if "State Code" <> '' then begin
                
//                     recState.Reset;
//                     recState.SetRange(Code,"State Code");
//                     if not recState.FindFirst then begin
//                      Response:=Response+'StateCodeInvalid,';
//                      "Error Flag":=true;
//                     end else begin
                
//                   if "GST Registration No." <> '' then begin
//                     recState.Reset;
//                     recState.SetRange(Code,"State Code");
//                     if recState.FindFirst then begin
//                     if CopyStr("GST Registration No.",1,2) <> recState."State Code (GST Reg. No.)" then begin
//                      Response:=Response+'GSTRegNoNotMatchedWithState,';
//                      "Error Flag":=true;
//                      end;
//                      end;
//                   end;
                
//                     end;
//                 end;
                
//                 if (("Beneficiary Name" <> '') or ("Beneficiary Account No" <> '')  or("Beneficiary IFSC Code" <> ''))  then begin
                
//                     if "Beneficiary Name" = '' then begin
//                       Response:=Response+'BeneficiaryNameMust,';
//                       "Error Flag":=true;
//                     end;
                
//                     if "Beneficiary Account No" = '' then begin
//                       Response:=Response+'BeneficiaryAccNoMust,';
//                       "Error Flag":=true;
//                     end;
                
//                     if "Beneficiary IFSC Code" = '' then begin
//                       Response:=Response+'BeneficiaryIFSCcodeMust,';
//                       "Error Flag":=true;
//                     end;
                
//                 end;
                
//                 Validated:=true;
                
//                 if "Error Flag" = false then  begin
                
//                 if Name <> '' then begin
//                 modifyCustomer.Validate(Name,Name);
//                 end;
                
//                 if Address <> '' then begin
//                 modifyCustomer.Validate(Address,Address);
//                 end;
                
//                 if "Address 2" <> '' then begin
//                 modifyCustomer.Validate("Address 2","Address 2");
//                 end;
                
//                 if "Post Code" <> '' then begin
//                 recPostCode.Reset;
//                 recPostCode.SetRange(Code,"Post Code");
//                 if not recPostCode.FindFirst then begin
                
//                 insertPostCode.Reset;
//                 insertPostCode.Init;
//                 insertPostCode.Validate(insertPostCode.Code,"Post Code");
//                 insertPostCode.Validate(insertPostCode.City,City);
//                 insertPostCode.Insert;
                
//                 end;
                
//                 modifyCustomer."Post Code":="Post Code";
//                 end;
                
//                 if City <> '' then begin
//                 modifyCustomer."Dealer City":=City;
//                 modifyCustomer.City:=City;
//                 end;
                
                
//                 if "Contact No" <> '' then begin
//                 modifyCustomer.Validate("Phone No.","Contact No");
//                 end;
                
//                 if "PAN No." <> '' then begin
//                 modifyCustomer.Validate("P.A.N. No.","PAN No.");
//                 end;
                
//                 if "State Code" <> '' then begin
//                 modifyCustomer.Validate("GST Registration No.",'');
//                 modifyCustomer.Validate("State Code","State Code");
//                 end;
                
//                 if "GST Registration No." <> '' then begin
//                 modifyCustomer.Validate("GST Registration No.","GST Registration No.");
//                 end;
                
//                 if "E-Mail" <> '' then begin
//                 modifyCustomer.Validate("E-Mail","E-Mail");
//                 end;
//                 /*
//                 IF "Dealer Id" <> 0 THEN BEGIN
//                 modifyCustomer.VALIDATE("Dealer Id","Dealer Id");
//                 END;
//                 */
//                 if "Dealer Code" <> '' then begin
//                 modifyCustomer.Validate("Dealer Code","Dealer Code");
//                 end;
                
//                 if "Client Id" <> 0 then begin
//                 modifyCustomer.Validate("Client Id","Client Id");
//                 end;
                
//                 if "Client Name" <> '' then begin
//                 modifyCustomer.Validate("Client Name","Client Name");
//                 end;
//                 if "Cancelled Cheque" <> '' then begin
//                 modifyCustomer.Validate("Cancelled Cheque","Cancelled Cheque");
//                 end;
//                 if "GST Registration File" <> '' then begin
//                 modifyCustomer.Validate("GST Registration File","GST Registration File");
//                 end;
//                 if "PAN File" <> '' then begin
//                 modifyCustomer.Validate("PAN File","PAN File");
//                 end;
//                 if "Dealer Smart Account No" <> '' then begin
//                 modifyCustomer.Validate("Dealer Smart Account No","Dealer Smart Account No");
//                 end;
                
//                 // update customer bank details +++
                
//                   if (("Beneficiary Account No" <> '') or ("Beneficiary Name" <> '')  or("Beneficiary IFSC Code" <> ''))  then begin
                
//                       custbankacc.Reset;
//                       custbankacc.SetCurrentkey("Customer No.",Code);
//                       custbankacc.Ascending(true);
//                       custbankacc.SetRange("Customer No.",NavCustCode);
//                       if custbankacc.FindLast then begin
                
//                         insertCustomerBankAcc.Init;
//                         insertCustomerBankAcc.Validate("Customer No.",NavCustCode);
//                         insertCustomerBankAcc.Validate(Code,IncStr(custbankacc.Code));
//                         insertCustomerBankAcc.Validate(Name,"Beneficiary Name");
//                         insertCustomerBankAcc.Validate("Bank Account No.","Beneficiary Account No");
//                         insertCustomerBankAcc.Validate("SWIFT Code","Beneficiary IFSC Code");
//                         insertCustomerBankAcc.Validate("Default Account",true);
//                         insertCustomerBankAcc.Insert(true);
                
                
//                       recCustomerBankAcc.Reset;
//                       recCustomerBankAcc.SetRange("Customer No.",NavCustCode);
//                       recCustomerBankAcc.SetFilter(Code,'<>%1',IncStr(custbankacc.Code));
//                       if recCustomerBankAcc.FindSet then repeat
//                         recCustomerBankAcc."Default Account":=false;
//                         recCustomerBankAcc.Modify(true);
//                       until recCustomerBankAcc.Next = 0;
                
//                       end else begin
                
//                         insertCustomerBankAcc.Init;
//                         insertCustomerBankAcc.Validate("Customer No.",NavCustCode);
//                         insertCustomerBankAcc.Validate(Code,NavCustCode+'_01');
//                         insertCustomerBankAcc.Validate(Name,"Beneficiary Name");
//                         insertCustomerBankAcc.Validate("Bank Account No.","Beneficiary Account No");
//                         insertCustomerBankAcc.Validate("SWIFT Code","Beneficiary IFSC Code");
//                         insertCustomerBankAcc.Validate("Default Account",true);
//                         insertCustomerBankAcc.Insert(true);
                
//                       end;
//                       end;
                
//                 // update customer bank details ---
                
//                 modifyCustomer.Modify(true);
                
                
//                 Validated:=true;
//                 "Dealer Updated":=true;
//                 "Dealer Updated On":=CurrentDatetime;
//                 end;
                
//                 end;
//                 end;
                
//                 // Create Dealer in UPDATE request if response is : DealerDoesNotExist; ++
                
//                 if ((Validated=true) and ("Error Flag"=true) and (Response='DealerDoesNotExist,')) then begin
                
//                 createDealer;
//                 end;
                
//                 // Create Deraler in UPDATE request if response is : DealerDoesNotExist; --
                
//                 end; // update end
                
//                 /////////////////////////////////////////////////// UPDATE END /////////////////////////////////////////////
//                 end else begin
//                      Response:=Response+'InvalidAction,';
//                     "Error Flag":=true;
//                     Validated:=true;
//                 end;
                
//                 ///////////////////////////////////////////////////////// documents begin ////////////////////////////////////////
                
//                 if ((Validated = true) and ("Error Flag"=false)) then begin
                
//                 if "PAN File" <> '' then begin
                
//                       SalesRcblSetup.Get('');
//                       LinkID:=0;
//                       recLink.Reset;
//                       recLink.SetCurrentkey(recLink."Link ID");
//                       recLink.Ascending(true);
//                       recLink.SetFilter("Link ID",'<>%1',0);
//                       if recLink.FindLast then begin
//                         LinkID:=recLink."Link ID"+1;
//                       end;
                
//                        RecordLink.Reset;
//                        RecordLink.Init;
//                        RecordLink."Link ID":=LinkID;
//                        RecordLink."No.":="NAV Dealer Code";
//                        RecordLink.Description:='PAN FILE';
//                        RecordLink."Attachement Name":=CopyStr(FileManagement.GetFileNameWithoutExtension("PAN File"),1,MaxStrLen("PAN File"));
//                        RecordLink.URL1:="PAN File";
//                        RecordLink.Created:=CurrentDatetime;
//                        RecordLink."User ID":=UserId;
//                        RecordLink.Company:=COMPANYNAME;
//                        RecordLink.Insert(true);
//                 end;
                
//                 if "GST Registration File" <> '' then begin
                
//                        SalesRcblSetup.Get('');
//                        LinkID:=0;
//                        recLink.Reset;
//                        recLink.SetCurrentkey(recLink."Link ID");
//                        recLink.Ascending(true);
//                        recLink.SetFilter("Link ID",'<>%1',0);
//                        if recLink.FindLast then begin
//                          LinkID:=recLink."Link ID"+1;
//                        end;
                
//                        RecordLink.Reset;
//                        RecordLink.Init;
//                        RecordLink."Link ID":=LinkID;
//                        RecordLink."No.":="NAV Dealer Code";
//                        RecordLink.Description:='GST Registration File';
//                        RecordLink."Attachement Name":=CopyStr(FileManagement.GetFileNameWithoutExtension("GST Registration File"),1,MaxStrLen("GST Registration File"));
//                        RecordLink.URL1:="GST Registration File";
//                        RecordLink.Created:=CurrentDatetime;
//                        RecordLink."User ID":=UserId;
//                        RecordLink.Company:=COMPANYNAME;
//                        RecordLink.Insert(true);
//                 end;
                
//                 if "Cancelled Cheque" <> '' then begin
                
//                        SalesRcblSetup.Get('');
//                        LinkID:=0;
//                        recLink.Reset;
//                        recLink.SetCurrentkey(recLink."Link ID");
//                        recLink.Ascending(true);
//                        recLink.SetFilter("Link ID",'<>%1',0);
//                        if recLink.FindLast then begin
//                          LinkID:=recLink."Link ID"+1;
//                        end;
                
//                        RecordLink.Reset;
//                        RecordLink.Init;
//                        RecordLink."Link ID":=LinkID;
//                        RecordLink."No.":="NAV Dealer Code";
//                        RecordLink.Description:='Cancelled Cheque';
//                        RecordLink."Attachement Name":=CopyStr(FileManagement.GetFileNameWithoutExtension("Cancelled Cheque"),1,MaxStrLen("Cancelled Cheque"));
//                        RecordLink.URL1:="Cancelled Cheque";
//                        RecordLink.Created:=CurrentDatetime;
//                        RecordLink."User ID":=UserId;
//                        RecordLink.Company:=COMPANYNAME;
//                        RecordLink.Insert(true);
//                 end;
                
//                 end;
                
//                 ///////////////////////////////////////////////////////// documents end ////////////////////////////////////////

//             end;
//         }
//         field(21;Validated;Boolean)
//         {
//         }
//         field(22;"Error Flag";Boolean)
//         {
//         }
//         field(23;Response;Text[250])
//         {
//         }
//         field(24;"Dealer Created";Boolean)
//         {
//         }
//         field(25;"Dealer Creaated On";DateTime)
//         {
//         }
//         field(26;"Dealer Updated";Boolean)
//         {
//         }
//         field(27;"Dealer Updated On";DateTime)
//         {
//         }
//         field(28;"NAV Dealer Code";Code[20])
//         {
//         }
//         field(29;City;Text[20])
//         {
//         }
//         field(30;"Beneficiary Name";Text[100])
//         {
//         }
//         field(31;"Beneficiary Account No";Text[30])
//         {
//         }
//         field(32;"Beneficiary IFSC Code";Text[30])
//         {
//         }
//         field(33;"Dealer Smart Account No";Text[30])
//         {
//         }
//     }

//     keys
//     {
//         key(Key1;"Entry No.","CASE ID")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnInsert()
//     begin
//         DealerBridge.Reset;
//         DealerBridge.SetFilter("Entry No.",'<>%1',0);
//         if DealerBridge.FindLast then begin
//           "Entry No.":=DealerBridge."Entry No."+1;
//         end else begin
//           "Entry No.":=1;
//         end;
//         "CASE ID":=CurrentDatetime;
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
//         if Type='' then begin
//           Response:=Response+'TypeIsMust,';
//         end else begin
//         if ((UpperCase(Type) <> 'DEALER') and (UpperCase(Type) <> 'VENDOR')) then begin
//           Response:=Response+'InvalidType,';
//           "Error Flag":=true;
//         end;
//         end;
        
//           if "Dealer Id" = 0 then begin
//             Response:=Response+'DealerIdIsMust,';
//             "Error Flag":=true;
//           end;
        
//         if "Dealer Code" = '' then begin
//           Response:=Response+'DealerCodeIsMust,';
//           "Error Flag":=true;
//         end;
        
//         if ((UpperCase(Type) = 'DEALER') and ("Dealer Id" <> 0)) then begin  // type customer begin
        
//         recCustomer.Reset;
//         recCustomer.SetRange("Dealer Id","Dealer Id");
//         if recCustomer.FindFirst then begin  // rec customer begin
//           Response:=Response+'DealerAlredyCreatedInNAV,';
//           "Error Flag":=true;
        
//         end else begin
        
//           if Name = '' then begin
//             Response:=Response+'NameIsMust,';
//             "Error Flag":=true;
//           end;
        
//           if Address = '' then begin
//            Response:=Response+'AddessIsMust,';
//            "Error Flag":=true;
//           end;
        
//           if "Post Code" = '' then begin
//             Response:=Response+'PostCodeIsMust,';
//             "Error Flag":=true;
//           end;
        
//           if "Contact No" = '' then begin
//             Response:=Response+'ContactNoIsMust,';
//             "Error Flag":=true;
//           end;
        
//           if "State Code" = '' then begin
//            Response:=Response+'StateCodeIsMust,';
//            "Error Flag":=true;
//           end else begin
//             recState.Reset;
//             recState.SetRange(Code,"State Code");
//             if not recState.FindFirst then begin
//              Response:=Response+'StateCodeInvalid,';
//              "Error Flag":=true;
//             end;
//           if "GST Registration No." <> '' then begin
//             recState.Reset;
//             recState.SetRange(Code,"State Code");
//             if recState.FindFirst then begin
//             if CopyStr("GST Registration No.",1,2) <> recState."State Code (GST Reg. No.)" then begin
//              Response:=Response+'GSTRegNoNotMatchedWithState,';
//              "Error Flag":=true;
//              end;
//              end;
//           end;
//           end;
        
//           if "E-Mail" = '' then begin
//             Response:=Response+'E-MailIdIsMust,';
//             "Error Flag":=true;
//           end;
        
//           if "Client Id"= 0 then begin
//             Response:=Response+'ClientIdIsMust,';
//             "Error Flag":=true;
//           end;
        
//           if "Client Name" = '' then begin
//             Response:=Response+'ClientNameIsMust,';
//             "Error Flag":=true;
//           end;
        
//         end; // rec customer end;
        
//         end; // type customer end
//         Validated:=true;
//         // insert customer +++
        
//         if ((Validated=true) and ("Error Flag"=true) and (Response='DealerDoesNotExist,')) then begin
        
//         InitialChar:=CopyStr(UpperCase(Name),1,1);
//         LastNo:='';
//         NewNo:='';
//         CustNo:='';
        
//          /*recCustomer.RESET;
//          recCustomer.ASCENDING(TRUE);
//          recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//          IF recCustomer.FINDSET THEN REPEAT
//           IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//             IF  ((COPYSTR(recCustomer."No.",2,1) = 'D' ))    THEN BEGIN
//             LastNo:=COPYSTR(recCustomer."No.",6,11);
//           END;
//           END;
//         UNTIL recCustomer.NEXT = 0;*/
        
//          recCustomer.Reset; //CCIT
//          recCustomer.Ascending(true);
//          //recCustomer.SETRANGE(recCustomer."Gen. Bus. Posting Group",'AUTO-RS');
//          if recCustomer.FindSet then repeat
//           //IF ((COPYSTR(UPPERCASE(recCustomer.Name),1,1) = InitialChar)) THEN BEGIN
//               if  ((CopyStr(recCustomer."No.",1,5) = 'CDAPI' ))    then begin
//                 LastNo:=CopyStr(recCustomer."No.",6,11);
//               end;
//            // END;
//         until recCustomer.Next = 0;
        
//         // to get customer code for current new customer
//         if LastNo <> ''then
//         NewNo :=IncStr(LastNo)
//         else
//         NewNo   := '000001';
//         //CustNo :='CDRS'+InitialChar+NewNo;
//         CustNo :='CDAPI'+NewNo;//CCIT
        
//         insertCustomer.Init;
//         insertCustomer.Validate("No.",CustNo);
//         insertCustomer.Validate(Name,UpperCase(Name));
//         insertCustomer.Validate(Address,Address);
//         insertCustomer.Validate("Address 2","Address 2");
//         insertCustomer.Validate("Dealer City",City);
//         recPostCode.Reset;
//         recPostCode.SetRange(Code,"Post Code");
//         if recPostCode.FindFirst then begin
//         insertCustomer.Validate("Post Code","Post Code");
//         insertCustomer.Validate(City,recPostCode.City);
//         end;
        
//         insertCustomer.Validate("Phone No.","Contact No");
//         insertCustomer.Validate("State Code","State Code");
//         insertCustomer.Validate("Gen. Bus. Posting Group",'AUTO-RS');
//         insertCustomer.Validate("Customer Posting Group",'DOM-RSA');
//         insertCustomer.Validate("GST Registration No.","GST Registration No.");
//         insertCustomer.Validate("P.A.N. No.","PAN No.");
//         insertCustomer.Validate("E-Mail","E-Mail");
//         insertCustomer.Validate("Dealer Id","Dealer Id");
//         insertCustomer.Validate("Client Id","Client Id");
//         insertCustomer.Validate("Client Name","Client Name");
//         insertCustomer.Validate("Cancelled Cheque","Cancelled Cheque");
//         insertCustomer.Validate("GST Registration File","GST Registration File");
//         insertCustomer.Validate("PAN File","PAN File");
//         insertCustomer.Validate("Dealer Code","Dealer Code");
//         insertCustomer.Validate("API Customer",true);
//         insertCustomer.Validate("Dealer Smart Account No","Dealer Smart Account No");// AZ090721
//         insertCustomer.Insert(true);
        
        
//         "Error Flag":=false;
//         Response:='';
//         "Dealer Created":=true;
//         "Dealer Creaated On":=CurrentDatetime;
//         "NAV Dealer Code":=CustNo;
        
//         end; // error flag end
        
//         // insert customer ---

//     end;
// }

