Page 50036 "Client Wise Monthly Invoicing"
{
    Editable = true;
    PageType = List;
    SourceTable = "B2B Monthwise Client Invoicing";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case ID";rec."Case ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Client Name";rec."Client Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Invoicing Month";rec."Invoicing Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Active Policies";rec."Active Policies")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnDrillDown()
                    begin

                        B2BPolicyMaster.Reset;
                        B2BPolicyMaster.SetRange("Client Name",rec."Client Name");
                        B2BPolicyMaster.SetRange(Cancelled,false);
                        B2BPolicyMaster.SetFilter("Document Date",'%1..%2',rec."Start Date",rec."End Date");
                        Page.RunModal(50039,B2BPolicyMaster);
                    end;
                }
                field("Amount For Policies";rec."Amount For Policies")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Invoice Amount For Month";rec."Posted Invoice Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Invoice Posted";rec."Invoice Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date";rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = ShowPostDate;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Post Sales Invoice")
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;

                trigger OnAction()
                begin
                    if rec."Posting Date" = 0D then begin
                    Error('kindly add "Posting Date" for invoices');
                    end;
                    
                    ClientLevelCode:='';
                    BusLineCode:='';
                    DepCode:='';
                    
                    DimensionMappingForEPortal.Reset;
                    DimensionMappingForEPortal.SetRange("E-Portal Client Name",rec."Client Name");
                    DimensionMappingForEPortal.SetFilter("Client Code Dimension",'<>%1','');
                    DimensionMappingForEPortal.SetFilter("Business Line Dimension",'<>%1','');
                    DimensionMappingForEPortal.SetFilter("Department Dimension",'<>%1','');
                    if DimensionMappingForEPortal.FindFirst then begin
                    ClientLevelCode:=DimensionMappingForEPortal."Client Code Dimension";
                    BusLineCode:=DimensionMappingForEPortal."Business Line Dimension";
                    DepCode:=DimensionMappingForEPortal."Department Dimension";
                    end else begin
                    Error('Please map all 3 dimensions for client %1',rec."Client Name");
                    end;
                    
                    if not Confirm ('Do you want to Post Sales Invoice ?',false)
                      then
                        exit;
                    
                    if rec."Invoice Posted" = false then begin
                    
                    B2BPolMaster.Reset;
                    B2BPolMaster.SetCurrentkey("Nav Dealer Code");
                    B2BPolMaster.Ascending(true);
                    B2BPolMaster.SetRange("Client Name",rec."Client Name");
                    B2BPolMaster.SetRange(Cancelled,false);
                    B2BPolMaster.SetRange("Posted Invoice No.",'');
                    B2BPolMaster.SetFilter("Nav Dealer Code",'<>%1','');
                    B2BPolMaster.SetFilter("Document Date",'%1..%2',rec."Start Date",rec."End Date");
                    if B2BPolMaster.FindSet then repeat
                    /*
                    B2BPolicyMaster1.RESET;
                    B2BPolicyMaster1.SETRANGE("Client Name",B2BPolMaster."Client Name");
                    B2BPolicyMaster1.SETRANGE("Nav Dealer Code",B2BPolMaster."Nav Dealer Code");
                    B2BPolicyMaster1.SETRANGE(Cancelled,FALSE);
                    B2BPolicyMaster1.SETRANGE("Posted Invoice No.",'<>%1','');
                    B2BPolicyMaster1.SETFILTER("Document Date",'%1..%2',"Start Date","End Date");
                    IF NOT B2BPolicyMaster1.FINDFIRST THEN BEGIN // B2BPolicyMaster1 begin
                    */
                    
                    rec112.Reset;
                    rec112.SetRange("Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                    rec112.SetRange("Sell-to Customer No.",B2BPolMaster."Nav Dealer Code");
                    if not rec112.FindFirst then begin
                    
                    EAFees:=0;
                    DealerCommission:=0;
                    BrandRoyalty:=0;
                    Document_No2:='';
                    
                    B2BPolicyMaster.Reset;
                    B2BPolicyMaster.SetRange("Client Name",B2BPolMaster."Client Name");
                    B2BPolicyMaster.SetRange("Nav Dealer Code",B2BPolMaster."Nav Dealer Code");
                    B2BPolicyMaster.SetRange(Cancelled,false);
                    B2BPolicyMaster.SetRange("Posted Invoice No.",'');
                    B2BPolicyMaster.SetFilter("Document Date",'%1..%2',rec."Start Date",rec."End Date");
                    if B2BPolicyMaster.FindSet then repeat
                    
                      if B2BPolicyMaster."EA Fees" <> 0 then begin
                      EAFees:=EAFees+B2BPolicyMaster."EA Fees";
                      end;
                      if B2BPolicyMaster."Dealer Commission" <> 0 then begin
                      DealerCommission:=DealerCommission+B2BPolicyMaster."Dealer Commission";
                      end;
                      if B2BPolicyMaster."Brand Royalty" <> 0 then begin
                      BrandRoyalty:=BrandRoyalty+B2BPolicyMaster."Brand Royalty";
                      end;
                    
                    until B2BPolicyMaster.Next=0;
                    
                    recCustomer.Get(B2BPolMaster."Nav Dealer Code");
                    
                               Sales_Header.Reset;
                               Sales_HDRInsert.Reset;
                               Sales_Header.SetRange(Sales_Header."Document Type",Sales_Header."document type"::Invoice);
                               Sales_Header.SetRange(Sales_Header."Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                               Sales_Header.SetRange(Sales_Header."No.",B2BPolMaster."Nav Dealer Code");
                               if not Sales_Header.FindFirst then begin
                                Sales_HDRInsert.Init;
                                Sales_HDRInsert."Document Type" := Sales_HDRInsert."document type"::Invoice;
                                "Sales&RcSetup".Get('');
                                if "Sales&RcSetup"."Invoice Nos."= '' then
                                  Error(' Please enter invoice nos in sales & receivalbe setup');
                                 Document_No2   := NoSeriesMgmt.GetNextNo("Sales&RcSetup"."Invoice Nos.",WorkDate,true);
                                Sales_HDRInsert.Validate("No.",Document_No2);
                                Sales_HDRInsert.Validate("Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                Sales_HDRInsert.Validate(Type,1);
                                Sales_HDRInsert.Insert(true);
                    
                    
                    
                                Sales_HDRModify.Reset;
                                Sales_HDRModify.SetRange(Sales_HDRModify."Document Type",Sales_HDRModify."document type"::Invoice);
                                Sales_HDRModify.SetRange(Sales_HDRModify."Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                Sales_HDRModify.SetRange("No.",Document_No2);
                                if Sales_HDRModify.FindFirst then begin
                                Sales_HDRModify.Validate("Sell-to Customer No.",B2BPolMaster."Nav Dealer Code");
                                Sales_HDRModify.Validate("Posting Date",rec."Posting Date");
                                Sales_HDRModify.Validate("Document Date",rec."Posting Date");
                                Sales_HDRModify.Validate("Order Date",rec."Posting Date");
                                Sales_HDRModify.Validate("External Document No.",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                Sales_HDRModify.Validate("Location Code",'MUMBAI');
                                /*if ((recCustomer."GST Customer Type"=recCustomer."gst customer type"::Registered) and (recCustomer."GST Registration No." <> '')) then begin
                                  Sales_HDRModify.Validate(Structure,'GST');
                                end;*/
                                //Naveen
                                Sales_HDRModify.Validate("Customer Invoice No.",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                Sales_HDRModify.Validate("Shortcut Dimension 1 Code",BusLineCode);
                                Sales_HDRModify.Validate(Department,DepCode);
                                Sales_HDRModify.Validate("Client Level Code",ClientLevelCode);
                                //Sales_HDRModify.VALIDATE(Sales_HDRModify."EA Transaction Type",Sales_HDRModify."EA Transaction Type"::B2B);
                                Sales_HDRModify.Modify(true);
                                end;
                    
                                end;
                    
                      Sales_Header.Reset;
                      Sales_Header.SetRange(Sales_Header."Document Type",Sales_Header."document type"::Invoice);
                      Sales_Header.SetRange("Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                      Sales_Header.SetRange("No.",Document_No2);
                      if Sales_Header.FindFirst then begin
                    
                      if BrandRoyalty <> 0 then begin
                    
                                 RecSalesLine.Init;
                                 RecSalesLine."Document Type" := RecSalesLine."document type"::Invoice;
                                 RecSalesLine."Document No." := Sales_Header."No.";
                                 RecSalesLine."Line No." := 10000;
                                 RecSalesLine.Validate(RecSalesLine.Type,1);
                                 RecSalesLine.Validate(RecSalesLine."No.",'310008');
                                 RecSalesLine.Validate("Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                 RecSalesLine.Validate(Quantity,1);
                                 RecSalesLine.Validate(RecSalesLine."Unit Price",BrandRoyalty);
                                 RecSalesLine.Validate(RecSalesLine.Comments,'Invoice for the month '+rec."Invoicing Month");
                                 RecSalesLine.Validate(RecSalesLine.Narration,'Invoice for the month '+rec."Invoicing Month");
                                 RecSalesLine.Validate(RecSalesLine.Particulars,B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                 RecSalesLine.Validate("Shortcut Dimension 1 Code",BusLineCode);
                                 RecSalesLine.Validate("Department Code",DepCode);
                                 RecSalesLine.Validate("Client Level Code",ClientLevelCode);
                                 //RecSalesLine.VALIDATE(RecSalesLine."GST Place of Supply",RecSalesLine."GST Place of Supply"::"Bill-to Address");
                                 RecSalesLine.Insert(true);
                    
                      end;
                    
                    
                      if DealerCommission <> 0 then begin
                    
                                 RecSalesLine.Init;
                                 RecSalesLine."Document Type" := RecSalesLine."document type"::Invoice;
                                 RecSalesLine."Document No." := Sales_Header."No.";
                                 RecSalesLine."Line No." := 20000;
                                 RecSalesLine.Validate(RecSalesLine.Type,1);
                                 RecSalesLine.Validate(RecSalesLine."No.",'310009');
                                 RecSalesLine.Validate("Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                 RecSalesLine.Validate(Quantity,1);
                                 RecSalesLine.Validate(RecSalesLine."Unit Price",DealerCommission);
                                 RecSalesLine.Validate(RecSalesLine.Comments,'Invoice for the month '+rec."Invoicing Month");
                                 RecSalesLine.Validate(RecSalesLine.Narration,'Invoice for the month '+rec."Invoicing Month");
                                 RecSalesLine.Validate(RecSalesLine.Particulars,B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                 RecSalesLine.Validate("Shortcut Dimension 1 Code",BusLineCode);
                                 RecSalesLine.Validate("Department Code",DepCode);
                                 RecSalesLine.Validate("Client Level Code",ClientLevelCode);
                                 RecSalesLine.Insert(true);
                    
                      end;
                    
                      if EAFees <> 0 then begin
                    
                                 RecSalesLine.Init;
                                 RecSalesLine."Document Type" := RecSalesLine."document type"::Invoice;
                                 RecSalesLine."Document No." := Sales_Header."No.";
                                 RecSalesLine."Line No." := 30000;
                                 RecSalesLine.Validate(RecSalesLine.Type,1);
                                 RecSalesLine.Validate(RecSalesLine."No.",'310056');
                                 RecSalesLine.Validate("Integration Doc No",B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                 RecSalesLine.Validate(Quantity,1);
                                 RecSalesLine.Validate(RecSalesLine."Unit Price",EAFees);
                                 RecSalesLine.Validate(RecSalesLine.Comments,'Invoice for the month '+rec."Invoicing Month");
                                 RecSalesLine.Validate(RecSalesLine.Narration,'Invoice for the month '+rec."Invoicing Month");
                                 RecSalesLine.Validate(RecSalesLine.Particulars,B2BPolMaster."Nav Dealer Code"+'-'+rec."Invoicing Month");
                                 RecSalesLine.Validate("Shortcut Dimension 1 Code",BusLineCode);
                                 RecSalesLine.Validate("Department Code",DepCode);
                                 RecSalesLine.Validate("Client Level Code",ClientLevelCode);
                                 RecSalesLine.Insert(true);
                    
                      end;
                    
                      end;
                    
                      recSalesHdr.Reset;
                      recSalesHdr.SetRange(recSalesHdr."Document Type",recSalesHdr."document type"::Invoice);
                      recSalesHdr.SetRange(recSalesHdr."No.",Document_No2);
                      if recSalesHdr.FindFirst then begin
                        SalesPost.Run(recSalesHdr);
                      end;
                    
                      SIH.Reset;
                      SIH.SetRange("Pre-Assigned No.",Document_No2);
                      if SIH.FindFirst then begin
                        //SIH.CalcFields("Amount to Customer");//Naveen
                    
                        //Rec."Posted Invoice Amount":=Rec."Posted Invoice Amount"+SIH."Amount to Customer";//Naveen
                        Rec."Invoice Posted":=true;
                        Rec.Modify;
                    
                    
                        B2BPolicyMaster.Reset;
                        B2BPolicyMaster.SetRange("Client Name",B2BPolMaster."Client Name");
                        B2BPolicyMaster.SetRange("Nav Dealer Code",B2BPolMaster."Nav Dealer Code");
                        B2BPolicyMaster.SetRange(Cancelled,false);
                        B2BPolicyMaster.SetFilter("Posted Invoice No.",'=%1','');
                        B2BPolicyMaster.SetFilter("Document Date",'%1..%2',rec."Start Date",rec."End Date");
                        B2BPolicyMaster.SetFilter("Entry No.",'<>%1',B2BPolMaster."Entry No.");
                        if B2BPolicyMaster.FindSet then repeat
                          B2BPolicyMaster."Posted Invoice No.":=SIH."No.";
                          B2BPolicyMaster.Modify;
                        until B2BPolicyMaster.Next=0;
                    
                        B2BPolMaster."Posted Invoice No.":=SIH."No.";
                        B2BPolMaster.Modify;
                    
                      end;
                    
                    end; // B2BPolicyMaster1 begin
                    
                    until B2BPolMaster.Next=0;
                    
                    
                    end else begin
                    
                      Error('Invoice has been already posted for this record.');
                    
                    end;
                    

                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ShowPostDate:=false;
        if rec."Invoice Posted" = false then
          ShowPostDate:=true;
    end;

    trigger OnAfterGetRecord()
    begin
        InvAmt:=0;
        Count1:=0;

        B2BPolicyMaster.Reset;
        B2BPolicyMaster.SetRange("Client Name",rec."Client Name");
        B2BPolicyMaster.SetRange(Cancelled,false);
        B2BPolicyMaster.SetFilter("Document Date",'%1..%2',rec."Start Date",rec."End Date");
        if B2BPolicyMaster.FindSet then repeat
          InvAmt:=InvAmt+Abs(B2BPolicyMaster."Brand Royalty")+Abs(B2BPolicyMaster."Dealer Commission")+Abs(B2BPolicyMaster."EA Fees");
          Count1:=Count1+1;
        until B2BPolicyMaster.Next=0;

        rec."Active Policies":=Count1;
        rec."Amount For Policies":=InvAmt;
    end;

    var
        rec21: Record "Cust. Ledger Entry";
        InvAmt: Decimal;
        page143: Page "Posted Sales Invoices";
        salesInvHdr: Record "Sales Invoice Header";
        rec112: Record "Sales Invoice Header";
        Count1: Integer;
        B2BPolicyMaster: Record "E-Portal Policy Master";
        EAFees: Decimal;
        DealerCommission: Decimal;
        BrandRoyalty: Decimal;
        Sales_Header: Record "Sales Header";
        Sales_HDRInsert: Record "Sales Header";
        Sales_HDRModify: Record "Sales Header";
        "Sales&RcSetup": Record "Sales & Receivables Setup";
        Document_No2: Code[20];
        NoSeriesMgmt: Codeunit NoSeriesManagement;
        recCustomer: Record Customer;
        RecSalesLine: Record "Sales Line";
        recSalesHdr: Record "Sales Header";
        SalesPost: Codeunit "Sales-Post";
        SIH: Record "Sales Invoice Header";
        "Sales&Rec": Record "Sales & Receivables Setup";
        B2BPolMaster: Record "E-Portal Policy Master";
        B2BPolicyMaster1: Record "E-Portal Policy Master";
        DimensionMappingForEPortal: Record "Dimension Mapping For E-Portal";
        ClientLevelCode: Code[20];
        BusLineCode: Code[20];
        DepCode: Code[20];
        ShowPostDate: Boolean;
}

