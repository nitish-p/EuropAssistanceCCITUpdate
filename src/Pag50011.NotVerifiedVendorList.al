// page 50011 "Not Verified Vendor List"
// {
//     ApplicationArea = All;
//     Caption = 'Not Verified Vendor List';
//     PageType = List;
//     SourceTable = Vendor;
//     UsageCategory = Lists;
    
//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("API Modified"; Rec."API Modified")
//                 {
//                     ToolTip = 'Specifies the value of the API Modified field.';
//                 }
//                 field("API Screening Result"; Rec."API Screening Result")
//                 {
//                     ToolTip = 'Specifies the value of the API Screening Result field.';
//                 }
//                 field("API Vendor"; Rec."API Vendor")
//                 {
//                     ToolTip = 'Specifies the value of the API Vendor field.';
//                 }
//                 field("ARN No."; Rec."ARN No.")
//                 {
//                     ToolTip = 'Specifies the ARN number of the consignee till GST registration number is not assigned to the consignee.';
//                 }
//                 field(Address; Rec.Address)
//                 {
//                     ToolTip = 'Specifies the vendor''s address.';
//                 }
//                 field("Address 2"; Rec."Address 2")
//                 {
//                     ToolTip = 'Specifies additional address information.';
//                 }
//                 field("Aggregate Turnover"; Rec."Aggregate Turnover")
//                 {
//                     ToolTip = 'Specifies whether the vendors aggregate turnover is more than 20 lacs or less than 20 lacs.';
//                 }
//                 field("Alert Sent"; Rec."Alert Sent")
//                 {
//                     ToolTip = 'Specifies the value of the Alert Sent field.';
//                 }
//                 field("Amt. Rcd. Not Invoiced"; Rec."Amt. Rcd. Not Invoiced")
//                 {
//                     ToolTip = 'Specifies the value of the Amt. Rcd. Not Invoiced field.';
//                 }
//                 field("Amt. Rcd. Not Invoiced (LCY)"; Rec."Amt. Rcd. Not Invoiced (LCY)")
//                 {
//                     ToolTip = 'Specifies the total invoice amount (in LCY) for the items you have received but not yet been invoiced for.';
//                 }
//                 field("Application Method"; Rec."Application Method")
//                 {
//                     ToolTip = 'Specifies how to apply payments to entries for this vendor.';
//                 }
//                 field("Assessee Code"; Rec."Assessee Code")
//                 {
//                     ToolTip = 'Specifies the Assessee Code by whom any tax or sum of money is payable';
//                 }
//                 field("Associated Enterprises"; Rec."Associated Enterprises")
//                 {
//                     ToolTip = 'Specifies that an import transaction of services from companys Associates Vendor';
//                 }
//                 field("Audit File Name"; Rec."Audit File Name")
//                 {
//                     ToolTip = 'Specifies the value of the Audit File Name field.';
//                 }
//                 field("Auto Vendor Code"; Rec."Auto Vendor Code")
//                 {
//                     ToolTip = 'Specifies the value of the Auto Vendor Code field.';
//                 }
//                 field(Balance; Rec.Balance)
//                 {
//                     ToolTip = 'Specifies the value of the Balance field.';
//                 }
//                 field("Balance (LCY)"; Rec."Balance (LCY)")
//                 {
//                     ToolTip = 'Specifies the total value of your completed purchases from the vendor in the current fiscal year. It is calculated from amounts excluding VAT on all completed purchase invoices and credit memos.';
//                 }
//                 field("Balance Due"; Rec."Balance Due")
//                 {
//                     ToolTip = 'Specifies the value of the Balance Due field.';
//                 }
//                 field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
//                 {
//                     ToolTip = 'Specifies the total value of your unpaid purchases from the vendor in the current fiscal year. It is calculated from amounts excluding VAT on all open purchase invoices and credit memos.';
//                 }
//                 field("Base Calendar Code"; Rec."Base Calendar Code")
//                 {
//                     ToolTip = 'Specifies a customizable calendar for delivery planning that holds the vendor''s working days and holidays.';
//                 }
//                 field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
//                 {
//                     ToolTip = 'Specifies if the vendor allows payment tolerance.';
//                 }
//                 field(Blocked; Rec.Blocked)
//                 {
//                     ToolTip = 'Specifies which transactions with the vendor that cannot be processed, for example a vendor that is declared insolvent.';
//                 }
//                 field("Bridge Exported"; Rec."Bridge Exported")
//                 {
//                     ToolTip = 'Specifies the value of the Bridge Exported field.';
//                 }
//                 field("Budgeted Amount"; Rec."Budgeted Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Budgeted Amount field.';
//                 }
//                 field("Buy-from No. Of Archived Doc."; Rec."Buy-from No. Of Archived Doc.")
//                 {
//                     ToolTip = 'Specifies the value of the Buy-from No. Of Archived Doc. field.';
//                 }
//                 field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
//                 {
//                     ToolTip = 'Specifies a payment term that will be used for calculating cash flow.';
//                 }
//                 field(City; Rec.City)
//                 {
//                     ToolTip = 'Specifies the vendor''s city.';
//                 }
//                 field(Comment; Rec.Comment)
//                 {
//                     ToolTip = 'Specifies the value of the Comment field.';
//                 }
//                 field("Commissioner's Permission No."; Rec."Commissioner's Permission No.")
//                 {
//                     ToolTip = 'Specifies the permission no. of the commissioner';
//                 }
//                 field(Composition; Rec.Composition)
//                 {
//                     ToolTip = 'Specifies the value of the Composition field.';
//                 }
//                 field(Contact; Rec.Contact)
//                 {
//                     ToolTip = 'Specifies the name of the person you regularly contact when you do business with this vendor.';
//                 }
//                 field("Country/Region Code"; Rec."Country/Region Code")
//                 {
//                     ToolTip = 'Specifies the country/region of the address.';
//                 }
//                 field(County; Rec.County)
//                 {
//                     ToolTip = 'Specifies the state, province or county as a part of the address.';
//                 }
//                 field("Coupled to CRM"; Rec."Coupled to CRM")
//                 {
//                     ToolTip = 'Specifies that the vendor is coupled to an account in Dataverse.';
//                 }
//                 field("Cr. Memo Amounts"; Rec."Cr. Memo Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Cr. Memo Amounts field.';
//                 }
//                 field("Cr. Memo Amounts (LCY)"; Rec."Cr. Memo Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Cr. Memo Amounts (LCY) field.';
//                 }
//                 field("Created On"; Rec."Created On")
//                 {
//                     ToolTip = 'Specifies the value of the Created On field.';
//                 }
//                 field("Credit Amount"; Rec."Credit Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Credit Amount field.';
//                 }
//                 field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Credit Amount (LCY) field.';
//                 }
//                 field("Creditor No."; Rec."Creditor No.")
//                 {
//                     ToolTip = 'Specifies the number of the vendor.';
//                 }
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     ToolTip = 'Specifies the currency code that is inserted by default when you create purchase documents or journal lines for the vendor.';
//                 }
//                 field("Currency Id"; Rec."Currency Id")
//                 {
//                     ToolTip = 'Specifies the value of the Currency Id field.';
//                 }
//                 field("DUNS Number"; Rec."DUNS Number")
//                 {
//                     ToolTip = 'Specifies the value of the DUNS Number field.';
//                 }
//                 field("Date Of Birth"; Rec."Date Of Birth")
//                 {
//                     ToolTip = 'Specifies the value of the Date Of Birth field.';
//                 }
//                 field("Date Of Incorporation"; Rec."Date Of Incorporation")
//                 {
//                     ToolTip = 'Specifies the value of the Date Of Incorporation field.';
//                 }
//                 field("Dealer Client Name"; Rec."Dealer Client Name")
//                 {
//                     ToolTip = 'Specifies the value of the Dealer Client Name field.';
//                 }
//                 field("Debit Amount"; Rec."Debit Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Debit Amount field.';
//                 }
//                 field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Debit Amount (LCY) field.';
//                 }
//                 field("Disable Search by Name"; Rec."Disable Search by Name")
//                 {
//                     ToolTip = 'Specifies that you can change the vendor name on open purchase documents. The change applies only to the documents.';
//                 }
//                 field("Document Sending Profile"; Rec."Document Sending Profile")
//                 {
//                     ToolTip = 'Specifies the preferred method of sending documents to this vendor, so that you do not have to select a sending option every time that you post and send a document to the vendor. Documents to this vendor will be sent using the specified sending profile and will override the default document sending profile.';
//                 }
//                 field("Duplicates Chain ID"; Rec."Duplicates Chain ID")
//                 {
//                     ToolTip = 'Specifies the value of the Duplicates Chain ID field.';
//                 }
//                 field("E-Mail"; Rec."E-Mail")
//                 {
//                     ToolTip = 'Specifies the vendor''s email address.';
//                 }
//                 field("EORI Number"; Rec."EORI Number")
//                 {
//                     ToolTip = 'Specifies the Economic Operators Registration and Identification number that is used when you exchange information with the customs authorities due to trade into or out of the European Union.';
//                 }
//                 field("Easy Auto Vendor Code"; Rec."Easy Auto Vendor Code")
//                 {
//                     ToolTip = 'Specifies the value of the Easy Auto Vendor Code field.';
//                 }
//                 field("Fax No."; Rec."Fax No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s fax number.';
//                 }
//                 field("Fin Scan API Screening"; Rec."Fin Scan API Screening")
//                 {
//                     ToolTip = 'Specifies the value of the Fin Scan API Screening field.';
//                 }
//                 field("Fin. Charge Memo Amounts (LCY)"; Rec."Fin. Charge Memo Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Fin. Charge Memo Amounts (LCY) field.';
//                 }
//                 field("Fin. Charge Terms Code"; Rec."Fin. Charge Terms Code")
//                 {
//                     ToolTip = 'Specifies the code for the involved finance charges in case of late payment.';
//                 }
//                 field("Finance Charge Memo Amounts"; Rec."Finance Charge Memo Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Finance Charge Memo Amounts field.';
//                 }
//                 field(GLN; Rec.GLN)
//                 {
//                     ToolTip = 'Specifies the vendor in connection with electronic document receiving.';
//                 }
//                 field("GST Registration No."; Rec."GST Registration No.")
//                 {
//                     ToolTip = 'Specifies the vendors GST registration number issued by authorized body.';
//                 }
//                 field("GST Vendor Type"; Rec."GST Vendor Type")
//                 {
//                     ToolTip = 'Specifies the type of GST registration or the vendor. For example, Registered/Un-registered/Import/Composite/Exempted/SEZ.';
//                 }
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
//                 }
//                 field(Gender; Rec.Gender)
//                 {
//                     ToolTip = 'Specifies the value of the Gender field.';
//                 }
//                 field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
//                 {
//                     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
//                 }
//                 field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
//                 {
//                     ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
//                 }
//                 field("Home Page"; Rec."Home Page")
//                 {
//                     ToolTip = 'Specifies the vendor''s web site.';
//                 }
//                 field("IC Partner Code"; Rec."IC Partner Code")
//                 {
//                     ToolTip = 'Specifies the vendor''s IC partner code, if the vendor is one of your intercompany partners.';
//                 }
//                 field(Id; Rec.Id)
//                 {
//                     ToolTip = 'Specifies the value of the Id field.';
//                 }
//                 field(Image; Rec.Image)
//                 {
//                     ToolTip = 'Specifies the picture of the vendor, for example, a logo.';
//                 }
//                 field("Industry Code"; Rec."Industry Code")
//                 {
//                     ToolTip = 'Specifies the value of the Industry Code field.';
//                 }
//                 field("Input File Name"; Rec."Input File Name")
//                 {
//                     ToolTip = 'Specifies the value of the Input File Name field.';
//                 }
//                 field("Intrastat Partner Type"; Rec."Intrastat Partner Type")
//                 {
//                     ToolTip = 'Specifies for Intrastat reporting if the vendor is a person or a company.';
//                 }
//                 field("Inv. Amounts (LCY)"; Rec."Inv. Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Inv. Amounts (LCY) field.';
//                 }
//                 field("Inv. Discounts (LCY)"; Rec."Inv. Discounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Inv. Discounts (LCY) field.';
//                 }
//                 field("Invoice Amounts"; Rec."Invoice Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Invoice Amounts field.';
//                 }
//                 field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
//                 {
//                     ToolTip = 'Specifies the vendor''s invoice discount code. When you set up a new vendor card, the number you have entered in the No. field is automatically inserted.';
//                 }
//                 field("Language Code"; Rec."Language Code")
//                 {
//                     ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
//                 }
//                 field("Last Audit Updated On"; Rec."Last Audit Updated On")
//                 {
//                     ToolTip = 'Specifies the value of the Last Audit Updated On field.';
//                 }
//                 field("Last Bridge Exported On"; Rec."Last Bridge Exported On")
//                 {
//                     ToolTip = 'Specifies the value of the Last Bridge Exported On field.';
//                 }
//                 field("Last Date Modified"; Rec."Last Date Modified")
//                 {
//                     ToolTip = 'Specifies when the vendor card was last modified.';
//                 }
//                 field("Last Modified Date Time"; Rec."Last Modified Date Time")
//                 {
//                     ToolTip = 'Specifies the value of the Last Modified Date Time field.';
//                 }
//                 field("Last Modified On"; Rec."Last Modified On")
//                 {
//                     ToolTip = 'Specifies the value of the Last Modified On field.';
//                 }
//                 field("Last Rollup Updated On"; Rec."Last Rollup Updated On")
//                 {
//                     ToolTip = 'Specifies the value of the Last Rollup Updated On field.';
//                 }
//                 field("Lead Time Calculation"; Rec."Lead Time Calculation")
//                 {
//                     ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     ToolTip = 'Specifies the warehouse location where items from the vendor must be received by default.';
//                 }
//                 field("Mobile Phone No."; Rec."Mobile Phone No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s mobile telephone number.';
//                 }
//                 field(Modified; Rec.Modified)
//                 {
//                     ToolTip = 'Specifies the value of the Modified field.';
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field("Name 2"; Rec."Name 2")
//                 {
//                     ToolTip = 'Specifies an additional part of the name.';
//                 }
//                 field("National Tax No"; Rec."National Tax No")
//                 {
//                     ToolTip = 'Specifies the value of the National Tax No field.';
//                 }
//                 field("Net Change"; Rec."Net Change")
//                 {
//                     ToolTip = 'Specifies the value of the Net Change field.';
//                 }
//                 field("Net Change (LCY)"; Rec."Net Change (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Net Change (LCY) field.';
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
//                 }
//                 field("No. Series"; Rec."No. Series")
//                 {
//                     ToolTip = 'Specifies the value of the No. Series field.';
//                 }
//                 field("No. of Blanket Orders"; Rec."No. of Blanket Orders")
//                 {
//                     ToolTip = 'Specifies the number of purchase blanket orders that exist for the vendor.';
//                 }
//                 field("No. of Credit Memos"; Rec."No. of Credit Memos")
//                 {
//                     ToolTip = 'Specifies the number of unposted purchase credit memos that exist for the vendor.';
//                 }
//                 field("No. of Incoming Documents"; Rec."No. of Incoming Documents")
//                 {
//                     ToolTip = 'Specifies incoming documents, such as vendor invoices in PDF or as image files, that you can manually or automatically convert to document records, such as purchase invoices. The external files that represent incoming documents can be attached at any process stage, including to posted documents and to the resulting vendor, customer, and general ledger entries.';
//                 }
//                 field("No. of Invoices"; Rec."No. of Invoices")
//                 {
//                     ToolTip = 'Specifies the number of unposted purchase invoices that exist for the vendor.';
//                 }
//                 field("No. of Order Addresses"; Rec."No. of Order Addresses")
//                 {
//                     ToolTip = 'Specifies the value of the No. of Order Addresses field.';
//                 }
//                 field("No. of Orders"; Rec."No. of Orders")
//                 {
//                     ToolTip = 'Specifies the number of purchase orders that exist for the vendor.';
//                 }
//                 field("No. of Pstd. Credit Memos"; Rec."No. of Pstd. Credit Memos")
//                 {
//                     ToolTip = 'Specifies the number of posted purchase credit memos that exist for the vendor.';
//                 }
//                 field("No. of Pstd. Invoices"; Rec."No. of Pstd. Invoices")
//                 {
//                     ToolTip = 'Specifies the number of posted purchase invoices that exist for the vendor.';
//                 }
//                 field("No. of Pstd. Receipts"; Rec."No. of Pstd. Receipts")
//                 {
//                     ToolTip = 'Specifies the number of posted purchase receipts that exist for the vendor.';
//                 }
//                 field("No. of Pstd. Return Shipments"; Rec."No. of Pstd. Return Shipments")
//                 {
//                     ToolTip = 'Specifies the number of posted return shipments that exist for the vendor.';
//                 }
//                 field("No. of Quotes"; Rec."No. of Quotes")
//                 {
//                     ToolTip = 'Specifies the number of purchase quotes that exist for the vendor.';
//                 }
//                 field("No. of Return Orders"; Rec."No. of Return Orders")
//                 {
//                     ToolTip = 'Specifies the number of purchase return orders that exist for the vendor.';
//                 }
//                 field("Other Amounts"; Rec."Other Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Other Amounts field.';
//                 }
//                 field("Other Amounts (LCY)"; Rec."Other Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Other Amounts (LCY) field.';
//                 }
//                 field("Our Account No."; Rec."Our Account No.")
//                 {
//                     ToolTip = 'Specifies your account number with the vendor, if you have one.';
//                 }
//                 field("Outstanding Invoices"; Rec."Outstanding Invoices")
//                 {
//                     ToolTip = 'Specifies the value of the Outstanding Invoices field.';
//                 }
//                 field("Outstanding Invoices (LCY)"; Rec."Outstanding Invoices (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of the vendor''s outstanding purchase invoices in LCY.';
//                 }
//                 field("Outstanding Orders"; Rec."Outstanding Orders")
//                 {
//                     ToolTip = 'Specifies the value of the Outstanding Orders field.';
//                 }
//                 field("Outstanding Orders (LCY)"; Rec."Outstanding Orders (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of outstanding orders (in LCY) to this vendor.';
//                 }
//                 field("Over-Receipt Code"; Rec."Over-Receipt Code")
//                 {
//                     ToolTip = 'Specifies the policy that will be used for the vendor if more items than ordered are received.';
//                 }
//                 field("P.A.N. No."; Rec."P.A.N. No.")
//                 {
//                     ToolTip = 'Specifies the Permanent Account No. of Party';
//                 }
//                 field("P.A.N. Reference No."; Rec."P.A.N. Reference No.")
//                 {
//                     ToolTip = 'Specifies the PAN Reference No. in case the PAN is not available or applied by the party';
//                 }
//                 field("P.A.N. Status"; Rec."P.A.N. Status")
//                 {
//                     ToolTip = 'Specifies the PAN Status as PANAPPLIED,PANNOTAVBL,PANINVALID';
//                 }
//                 field("Partner Type"; Rec."Partner Type")
//                 {
//                     ToolTip = 'Specifies if the vendor is a person or a company.';
//                 }
//                 field("Pay-to No. Of Archived Doc."; Rec."Pay-to No. Of Archived Doc.")
//                 {
//                     ToolTip = 'Specifies the value of the Pay-to No. Of Archived Doc. field.';
//                 }
//                 field("Pay-to No. of Blanket Orders"; Rec."Pay-to No. of Blanket Orders")
//                 {
//                     ToolTip = 'Specifies the number of blanket orders.';
//                 }
//                 field("Pay-to No. of Credit Memos"; Rec."Pay-to No. of Credit Memos")
//                 {
//                     ToolTip = 'Specifies the amount that relates to credit memos.';
//                 }
//                 field("Pay-to No. of Invoices"; Rec."Pay-to No. of Invoices")
//                 {
//                     ToolTip = 'Specifies the amount that relates to invoices.';
//                 }
//                 field("Pay-to No. of Orders"; Rec."Pay-to No. of Orders")
//                 {
//                     ToolTip = 'Specifies the number of posted orders that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Pstd. Cr. Memos"; Rec."Pay-to No. of Pstd. Cr. Memos")
//                 {
//                     ToolTip = 'Specifies the amount that relates to credit memos.';
//                 }
//                 field("Pay-to No. of Pstd. Invoices"; Rec."Pay-to No. of Pstd. Invoices")
//                 {
//                     ToolTip = 'Specifies the amount that relates to posted invoices.';
//                 }
//                 field("Pay-to No. of Pstd. Receipts"; Rec."Pay-to No. of Pstd. Receipts")
//                 {
//                     ToolTip = 'Specifies the number of posted receipts that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Pstd. Return S."; Rec."Pay-to No. of Pstd. Return S.")
//                 {
//                     ToolTip = 'Specifies the number of posted return shipments that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Quotes"; Rec."Pay-to No. of Quotes")
//                 {
//                     ToolTip = 'Specifies the number of quotes that exist for the vendor.';
//                 }
//                 field("Pay-to No. of Return Orders"; Rec."Pay-to No. of Return Orders")
//                 {
//                     ToolTip = 'Specifies how many return orders have been registered for the customer when the customer acts as the pay-to customer.';
//                 }
//                 field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
//                 {
//                     ToolTip = 'Specifies the number of a different vendor whom you pay for products delivered by the vendor on the vendor card.';
//                 }
//                 field("Payee Type"; Rec."Payee Type")
//                 {
//                     ToolTip = 'Specifies the value of the Payee Type field.';
//                 }
//                 field("Payment Method Code"; Rec."Payment Method Code")
//                 {
//                     ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
//                 }
//                 field("Payment Method Id"; Rec."Payment Method Id")
//                 {
//                     ToolTip = 'Specifies the value of the Payment Method Id field.';
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
//                 }
//                 field("Payment Terms Id"; Rec."Payment Terms Id")
//                 {
//                     ToolTip = 'Specifies the value of the Payment Terms Id field.';
//                 }
//                 field(Payments; Rec.Payments)
//                 {
//                     ToolTip = 'Specifies the value of the Payments field.';
//                 }
//                 field("Payments (LCY)"; Rec."Payments (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of payments paid to the vendor.';
//                 }
//                 field("Phone No."; Rec."Phone No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s telephone number.';
//                 }
//                 field("Pmt. Disc. Tolerance (LCY)"; Rec."Pmt. Disc. Tolerance (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Disc. Tolerance (LCY) field.';
//                 }
//                 field("Pmt. Discounts (LCY)"; Rec."Pmt. Discounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Discounts (LCY) field.';
//                 }
//                 field("Pmt. Tolerance (LCY)"; Rec."Pmt. Tolerance (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Pmt. Tolerance (LCY) field.';
//                 }
//                 field("Post Code"; Rec."Post Code")
//                 {
//                     ToolTip = 'Specifies the postal code.';
//                 }
//                 field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
//                 {
//                     ToolTip = 'Specifies the vendor bank account that will be used by default on payment journal lines for export to a payment bank file.';
//                 }
//                 field("Prepayment %"; Rec."Prepayment %")
//                 {
//                     ToolTip = 'Specifies a prepayment percentage that applies to all orders for this vendor, regardless of the items or services on the order lines.';
//                 }
//                 field("Price Calculation Method"; Rec."Price Calculation Method")
//                 {
//                     ToolTip = 'Specifies the default price calculation method.';
//                 }
//                 field("Prices Including VAT"; Rec."Prices Including VAT")
//                 {
//                     ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
//                 }
//                 field("Primary Contact No."; Rec."Primary Contact No.")
//                 {
//                     ToolTip = 'Specifies the primary contact number for the vendor.';
//                 }
//                 field(Priority; Rec.Priority)
//                 {
//                     ToolTip = 'Specifies the importance of the vendor when suggesting payments using the Suggest Vendor Payments function.';
//                 }
//                 field("Privacy Blocked"; Rec."Privacy Blocked")
//                 {
//                     ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
//                 }
//                 field("Purchaser Code"; Rec."Purchaser Code")
//                 {
//                     ToolTip = 'Specifies which purchaser is assigned to the vendor.';
//                 }
//                 field("Purchases (LCY)"; Rec."Purchases (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Purchases (LCY) field.';
//                 }
//                 field("Record ID"; Rec."Record ID")
//                 {
//                     ToolTip = 'Specifies the value of the Record ID field.';
//                 }
//                 field("Record Type"; Rec."Record Type")
//                 {
//                     ToolTip = 'Specifies the value of the Record Type field.';
//                 }
//                 field(Refunds; Rec.Refunds)
//                 {
//                     ToolTip = 'Specifies the value of the Refunds field.';
//                 }
//                 field("Refunds (LCY)"; Rec."Refunds (LCY)")
//                 {
//                     ToolTip = 'Specifies the sum of refunds paid to the vendor.';
//                 }
//                 field("Reject Reason"; Rec."Reject Reason")
//                 {
//                     ToolTip = 'Specifies the value of the Reject Reason field.';
//                 }
//                 field("Reminder Amounts"; Rec."Reminder Amounts")
//                 {
//                     ToolTip = 'Specifies the value of the Reminder Amounts field.';
//                 }
//                 field("Reminder Amounts (LCY)"; Rec."Reminder Amounts (LCY)")
//                 {
//                     ToolTip = 'Specifies the value of the Reminder Amounts (LCY) field.';
//                 }
//                 field("Responsibility Center"; Rec."Responsibility Center")
//                 {
//                     ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
//                 }
//                 field("Rollup File Name"; Rec."Rollup File Name")
//                 {
//                     ToolTip = 'Specifies the value of the Rollup File Name field.';
//                 }
//                 field("Screening Result"; Rec."Screening Result")
//                 {
//                     ToolTip = 'Specifies the value of the Screening Result field.';
//                 }
//                 field("Search Name"; Rec."Search Name")
//                 {
//                     ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
//                 }
//                 field("Shipment Method Code"; Rec."Shipment Method Code")
//                 {
//                     ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
//                 }
//                 field("Shipping Agent Code"; Rec."Shipping Agent Code")
//                 {
//                     ToolTip = 'Specifies the value of the Shipping Agent Code field.';
//                 }
//                 field("Source Code"; Rec."Source Code")
//                 {
//                     ToolTip = 'Specifies the value of the Source Code field.';
//                 }
//                 field("State Code"; Rec."State Code")
//                 {
//                     ToolTip = 'Specifies the State Code of Vendor';
//                 }
//                 field("Statistics Group"; Rec."Statistics Group")
//                 {
//                     ToolTip = 'Specifies the value of the Statistics Group field.';
//                 }
//                 field("Status Reason"; Rec."Status Reason")
//                 {
//                     ToolTip = 'Specifies the value of the Status Reason field.';
//                 }
//                 field("Status-Indicator"; Rec."Status-Indicator")
//                 {
//                     ToolTip = 'Specifies the value of the Status-Indicator field.';
//                 }
//                 field(Subcontractor; Rec.Subcontractor)
//                 {
//                     ToolTip = 'Specifies whether the vendor is defined as a subcontractor or not.';
//                 }
//                 field(SystemCreatedAt; Rec.SystemCreatedAt)
//                 {
//                     ToolTip = 'Specifies the value of the SystemCreatedAt field.';
//                 }
//                 field(SystemCreatedBy; Rec.SystemCreatedBy)
//                 {
//                     ToolTip = 'Specifies the value of the SystemCreatedBy field.';
//                 }
//                 field(SystemId; Rec.SystemId)
//                 {
//                     ToolTip = 'Specifies the value of the SystemId field.';
//                 }
//                 field(SystemModifiedAt; Rec.SystemModifiedAt)
//                 {
//                     ToolTip = 'Specifies the value of the SystemModifiedAt field.';
//                 }
//                 field(SystemModifiedBy; Rec.SystemModifiedBy)
//                 {
//                     ToolTip = 'Specifies the value of the SystemModifiedBy field.';
//                 }
//                 field("TRC No."; Rec."TRC No.")
//                 {
//                     ToolTip = 'Specifies the value of the TRC No. field.';
//                 }
//                 field("Tax Area Code"; Rec."Tax Area Code")
//                 {
//                     ToolTip = 'Specifies a tax area code for the company.';
//                 }
//                 field("Tax Code"; Rec."Tax Code")
//                 {
//                     ToolTip = 'Specifies the value of the Tax Code field.';
//                 }
//                 field("Tax Liable"; Rec."Tax Liable")
//                 {
//                     ToolTip = 'Specifies if the customer is liable for sales tax.';
//                 }
//                 field("Telex Answer Back"; Rec."Telex Answer Back")
//                 {
//                     ToolTip = 'Specifies the value of the Telex Answer Back field.';
//                 }
//                 field("Telex No."; Rec."Telex No.")
//                 {
//                     ToolTip = 'Specifies the value of the Telex No. field.';
//                 }
//                 field("Territory Code"; Rec."Territory Code")
//                 {
//                     ToolTip = 'Specifies the value of the Territory Code field.';
//                 }
//                 field(Transporter; Rec.Transporter)
//                 {
//                     ToolTip = 'Specifies the vendor as Transporter';
//                 }
//                 field("Type"; Rec."Type")
//                 {
//                     ToolTip = 'Specifies the value of the Type field.';
//                 }
//                 field("Uploader Vendor"; Rec."Uploader Vendor")
//                 {
//                     ToolTip = 'Specifies the value of the Uploader Vendor field.';
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
//                 }
//                 field("VAT Registration No."; Rec."VAT Registration No.")
//                 {
//                     ToolTip = 'Specifies the vendor''s VAT registration number.';
//                 }
//                 field("Validate EU Vat Reg. No."; Rec."Validate EU Vat Reg. No.")
//                 {
//                     ToolTip = 'Specifies the value of the Validate EU VAT Reg. No. field.';
//                 }
//                 field("Vendor Approved On"; Rec."Vendor Approved On")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Approved On field.';
//                 }
//                 field("Vendor Approved On 2nd Last"; Rec."Vendor Approved On 2nd Last")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Approved On 2nd Last field.';
//                 }
//                 field("Vendor Created On"; Rec."Vendor Created On")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Created On field.';
//                 }
//                 field("Vendor Invoice Type"; Rec."Vendor Invoice Type")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Invoice Type field.';
//                 }
//                 field("Vendor Location"; Rec."Vendor Location")
//                 {
//                     ToolTip = 'Specifies the location code for subcontractor.';
//                 }
//                 field("Vendor Modified On"; Rec."Vendor Modified On")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Modified On field.';
//                 }
//                 field("Vendor Modified On 2nd Last"; Rec."Vendor Modified On 2nd Last")
//                 {
//                     ToolTip = 'Specifies the value of the Vendor Modified On 2nd Last field.';
//                 }
//                 field("Vendor Posting Group"; Rec."Vendor Posting Group")
//                 {
//                     ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
//                 }
//                 field(Verification; Rec.Verification)
//                 {
//                     ToolTip = 'Specifies the value of the Verification field.';
//                 }
//                 field("Verification API Response"; Rec."Verification API Response")
//                 {
//                     ToolTip = 'Specifies the value of the Verification API Response field.';
//                 }
//             }
//         }
//     }
// }
