page 50073 KotakBankLines
{
    ApplicationArea = All;
    Caption = 'KotakBankLines';
    PageType = List;
    SourceTable = "Kotak Bank Int. Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Inst Ref No."; Rec."Inst Ref No.")
                {
                    ToolTip = 'Specifies the value of the Inst Ref No. field.';
                }
                field("Company Id"; Rec."Company Id")
                {
                    ToolTip = 'Specifies the value of the Company Id field.';
                }
                field("Company Batch Id"; Rec."Company Batch Id")
                {
                    ToolTip = 'Specifies the value of the Company Batch Id field.';
                }
                field("Confidential Indicator"; Rec."Confidential Indicator")
                {
                    ToolTip = 'Specifies the value of the Confidential Indicator field.';
                }
                field("My Product Code"; Rec."My Product Code")
                {
                    ToolTip = 'Specifies the value of the My Product Code field.';
                }
                field("company_tr ans_no"; Rec."company_tr ans_no")
                {
                    ToolTip = 'Specifies the value of the company_tr ans_no field.';
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ToolTip = 'Specifies the value of the Payment Mode field.';
                }
                field("Transaction Amount"; Rec."Transaction Amount")
                {
                    ToolTip = 'Specifies the value of the Transaction Amount field.';
                }
                field("Client Debit account Number"; Rec."Client Debit account Number")
                {
                    ToolTip = 'Specifies the value of the Client Debit account Number field.';
                }
                field("Debit reference Number"; Rec."Debit reference Number")
                {
                    ToolTip = 'Specifies the value of the Debit reference Number field.';
                }
                field("Debit Description"; Rec."Debit Description")
                {
                    ToolTip = 'Specifies the value of the Debit Description field.';
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ToolTip = 'Specifies the value of the Payment Date field.';
                }
                field("bank Code Indicator"; Rec."bank Code Indicator")
                {
                    ToolTip = 'Specifies the value of the bank Code Indicator field.';
                }
                field("Beneficiary Bank"; Rec."Beneficiary Bank")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Bank field.';
                }
                field("IFSC Code for benef. branch"; Rec."IFSC Code for benef. branch")
                {
                    ToolTip = 'Specifies the value of the IFSC Code for beneficiary branch field.';
                }
                field("Beneficiary Account Number"; Rec."Beneficiary Account Number")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Account Number field.';
                }
                field("Beneficiary Name"; Rec."Beneficiary Name")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Name field.';
                }
                field("Beneficiary Code"; Rec."Beneficiary Code")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Code field.';
                }
                field("Beneficiary Email ID"; Rec."Beneficiary Email ID")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Email ID field.';
                }
                field("Beneficiary Fax"; Rec."Beneficiary Fax")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Fax field.';
                }
                field("Beneficiary Mobile Number"; Rec."Beneficiary Mobile Number")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Mobile Number field.';
                }
                field("Beneficiary Address1"; Rec."Beneficiary Address1")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Address field.';
                }
                field("Beneficiary Address2"; Rec."Beneficiary Address2")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Address field.';
                }
                field("Beneficiary Address3"; Rec."Beneficiary Address3")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Address field.';
                }
                field("Beneficiary Address4"; Rec."Beneficiary Address4")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Address field.';
                }
                field("Beneficiary Address5"; Rec."Beneficiary Address5")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Address field.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Zip Code"; Rec."Zip Code")
                {
                    ToolTip = 'Specifies the value of the Zip Code field.';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.';
                }
                field("Telephone Number"; Rec."Telephone Number")
                {
                    ToolTip = 'Specifies the value of the Telephone Number field.';
                }
                field("Beneficiary ID"; Rec."Beneficiary ID")
                {
                    ToolTip = 'Specifies the value of the Beneficiary ID field.';
                }
                field("Beneficiary TAX ID"; Rec."Beneficiary TAX ID")
                {
                    ToolTip = 'Specifies the value of the Beneficiary TAX ID field.';
                }
                field(AUTHORIZED_PERSON; Rec.AUTHORIZED_PERSON)
                {
                    ToolTip = 'Specifies the value of the AUTHORIZED_PERSON field.';
                }
                field(AUTHORIZED_PERSON_ID; Rec.AUTHORIZED_PERSON_ID)
                {
                    ToolTip = 'Specifies the value of the AUTHORIZED_PERSON_ID field.';
                }
                field("DELIVERY_ METHOD"; Rec."DELIVERY_ METHOD")
                {
                    ToolTip = 'Specifies the value of the DELIVERY_ METHOD field.';
                }
                field("PAYOUT_L OCATION"; Rec."PAYOUT_L OCATION")
                {
                    ToolTip = 'Specifies the value of the PAYOUT_L OCATION field.';
                }
                field("PICKUP_BR ANCH"; Rec."PICKUP_BR ANCH")
                {
                    ToolTip = 'Specifies the value of the PICKUP_BR ANCH field.';
                }
                field("Payment Reference Number"; Rec."Payment Reference Number")
                {
                    ToolTip = 'Specifies the value of the Payment Reference Number field.';
                }
                field("Charge Borne By"; Rec."Charge Borne By")
                {
                    ToolTip = 'Specifies the value of the Charge Borne By field.';
                }
                field("Instrument Date"; Rec."Instrument Date")
                {
                    ToolTip = 'Specifies the value of the Instrument Date field.';
                }
                field("Instrument number"; Rec."Instrument number")
                {
                    ToolTip = 'Specifies the value of the Instrument number field.';
                }
                field("Credit reference Number"; Rec."Credit reference Number")
                {
                    ToolTip = 'Specifies the value of the Credit reference Number field.';
                }
                field("Payment Detail 1"; Rec."Payment Detail 1")
                {
                    ToolTip = 'Specifies the value of the Payment Detail 1 field.';
                }
                field("Payment Detail 2"; Rec."Payment Detail 2")
                {
                    ToolTip = 'Specifies the value of the Payment Detail 2 field.';
                }
                field("Payment Detail 3"; Rec."Payment Detail 3")
                {
                    ToolTip = 'Specifies the value of the Payment Detail 3 field.';
                }
                field("Payment Detail 4"; Rec."Payment Detail 4")
                {
                    ToolTip = 'Specifies the value of the Payment Detail 4 field.';
                }
                field("Mail to Address 1"; Rec."Mail to Address 1")
                {
                    ToolTip = 'Specifies the value of the Mail to Address 1 field.';
                }
                field("Mail to Address 2"; Rec."Mail to Address 2")
                {
                    ToolTip = 'Specifies the value of the Mail to Address 2 field.';
                }
                field("Mail to Address 3"; Rec."Mail to Address 3")
                {
                    ToolTip = 'Specifies the value of the Mail to Address 3 field.';
                }
                field("Mail to Address 4"; Rec."Mail to Address 4")
                {
                    ToolTip = 'Specifies the value of the Mail to Address 4 field.';
                }
                field("Mail To"; Rec."Mail To")
                {
                    ToolTip = 'Specifies the value of the Mail To field.';
                }
                field("Exchange Document"; Rec."Exchange Document")
                {
                    ToolTip = 'Specifies the value of the Exchange Document field.';
                }
                field(InfCheckSum; Rec.InfCheckSum)
                {
                    ToolTip = 'Specifies the value of the InfCheckSum field.';
                }
                field("Reserved Field 1"; Rec."Reserved Field 1")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 1 field.';
                }
                field("Reserved Field 2"; Rec."Reserved Field 2")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 2 field.';
                }
                field("Reserved Field 3"; Rec."Reserved Field 3")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 3 field.';
                }
                field("Reserved Field 4"; Rec."Reserved Field 4")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 4 field.';
                }
                field("Reserved Field 5"; Rec."Reserved Field 5")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 5 field.';
                }
                field("Reserved Field 6"; Rec."Reserved Field 6")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 6 field.';
                }
                field("Reserved Field 7"; Rec."Reserved Field 7")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 7 field.';
                }
                field("Reserved Field 8"; Rec."Reserved Field 8")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 8 field.';
                }
                field("Reserved Field 9"; Rec."Reserved Field 9")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 9 field.';
                }
                field("Reserved Field 10"; Rec."Reserved Field 10")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 10 field.';
                }
                field("Reserved Field 11"; Rec."Reserved Field 11")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 11 field.';
                }
                field("Reserved Field 12"; Rec."Reserved Field 12")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 12 field.';
                }
                field("Reserved Field 13"; Rec."Reserved Field 13")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 13 field.';
                }
                field("Reserved Field 14"; Rec."Reserved Field 14")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 14 field.';
                }
                field("Reserved Field 15"; Rec."Reserved Field 15")
                {
                    ToolTip = 'Specifies the value of the Reserved Field 15 field.';
                }
                field("Enrichment Values"; Rec."Enrichment Values")
                {
                    ToolTip = 'Specifies the value of the Enrichment Values field.';
                }
                field("Instrument Status Code"; Rec."Instrument Status Code")
                {
                    ToolTip = 'Specifies the value of the Instrument Status Code field.';
                }
                field("Instrument Status Remarks"; Rec."Instrument Status Remarks")
                {
                    ToolTip = 'Specifies the value of the Instrument Status Remarks field.';
                }
                field("Error Description"; Rec."Error Description")
                {
                    ToolTip = 'Specifies the value of the Error Description field.';
                }
                field("Error Code"; Rec."Error Code")
                {
                    ToolTip = 'Specifies the value of the Error Code field.';
                }
                field("Error Reason"; Rec."Error Reason")
                {
                    ToolTip = 'Specifies the value of the Error Reason field.';
                }
                field("Invalid Field Name"; Rec."Invalid Field Name")
                {
                    ToolTip = 'Specifies the value of the Invalid Field Name field.';
                }
                field("Invalid Field Value"; Rec."Invalid Field Value")
                {
                    ToolTip = 'Specifies the value of the Invalid Field Value field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
}
