xmlport 50051 KotakBankXml
{
    Caption = 'KotakBankXml';
    Namespaces = pay = 'http://www.kotak.com/schemas/CMS_Generic/Payment_Request.xsd', "SOAP-ENV" = 'http://www.w3.org/2003/05/soap-envelope', soap = 'http://www.w3.org/2003/05/soap-envelope';
    Encoding = UTF8;
    schema
    {
        textelement(Payment)
        {
            NamespacePrefix = 'pay';
            tableelement(RequestHeader; "Kotak Bank Int. Hdr")
            {
                NamespacePrefix = 'pay';
                fieldelement(MessageId; RequestHeader."Message Id")
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(MsgSource; RequestHeader."Message Source Code")
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(ClientCode; RequestHeader."Client Code")
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(BatchRefNmbr; RequestHeader."Batch Ref No.")
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(HeaderChecksum; RequestHeader."Header Checksum")
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(ReqRF1; RequestHeader.RF1)
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(ReqRF2; RequestHeader.RF2)
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(ReqRF3; RequestHeader.RF3)
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(ReqRF4; RequestHeader.RF4)
                {
                    NamespacePrefix = 'pay';
                }
                fieldelement(ReqRF5; RequestHeader.RF5)
                {
                    NamespacePrefix = 'pay';
                }

            }
            textelement(InstrumentList)
            {
                NamespacePrefix = 'pay';
                tableelement(instrument; "Kotak Bank Int. Line")
                {
                    NamespacePrefix = 'pay';
                    LinkTable = RequestHeader;
                    LinkFields = "Inst Ref No." = field("Message Id");
                    fieldelement(InstRefNo; instrument."Inst Ref No.")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(CompanyId; instrument."Company Id")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(CompanyBatchId; instrument."Company Batch Id")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(ConfidentialInd; instrument."Confidential Indicator")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(MyProdCode; instrument."My Product Code")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(CompTransNo; instrument."company_tr ans_no")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PayMode; instrument."Payment Mode")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(TxnAmnt; instrument."Transaction Amount")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(AccountNo; instrument."Client Debit account Number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(DrRefNmbr; instrument."Debit reference Number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(DrDesc; instrument."Debit Description")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PaymentDt; instrument."Payment Date")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BankCdInd; instrument."bank Code Indicator")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneBnkCd; instrument."Beneficiary Bank")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(RecBrCd; instrument."IFSC Code for benef. branch")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneAcctNo; instrument."Beneficiary Account Number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneName; instrument."Beneficiary Name")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneCode; instrument."Beneficiary Code")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneEmail; instrument."Beneficiary Email ID")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneFax; instrument."Beneficiary Fax")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneMb; instrument."Beneficiary Mobile Number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneAddr1; instrument."Beneficiary Address1")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneAddr2; instrument."Beneficiary Address2")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneAddr3; instrument."Beneficiary Address3")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneAddr4; instrument."Beneficiary Address4")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneAddr5; instrument."Beneficiary Address5")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(city; instrument.City)
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(zip; instrument."Zip Code")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(Country; instrument.Country)
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(State; instrument.State)
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(TelephoneNo; instrument."Telephone Number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneId; instrument."Beneficiary ID")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(BeneTaxId; instrument."Beneficiary TAX ID")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(AuthPerson; instrument.AUTHORIZED_PERSON)
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(AuthPersonId; instrument.AUTHORIZED_PERSON_ID)
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(DeliveryMode; instrument."DELIVERY_ METHOD")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PayoutLoc; instrument."PAYOUT_L OCATION")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PickupBr; instrument."PICKUP_BR ANCH")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PaymentRef; instrument."Payment Reference Number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(ChgBorneBy; instrument."Charge Borne By")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstDt; instrument."Instrument Date")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(MICRNo; instrument."Instrument number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(CreditRefNo; instrument."Credit reference Number")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PaymentDtl; instrument."Payment Detail 1")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PaymentDtl1; instrument."Payment Detail 2")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PaymentDtl2; instrument."Payment Detail 3")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(PaymentDtl3; instrument."Payment Detail 4")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(MailToAddr1; instrument."Mail to Address 1")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(MailToAddr2; instrument."Mail to Address 2")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(MailToAddr3; instrument."Mail to Address 3")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(MailToAddr4; instrument."Mail to Address 4")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(MailTo; instrument."Mail To")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(ExchDoc; instrument."Exchange Document")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstChecksum; instrument.InfCheckSum)
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF1; instrument."Reserved Field 1")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF2; instrument."Reserved Field 2")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF3; instrument."Reserved Field 3")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF4; instrument."Reserved Field 4")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF5; instrument."Reserved Field 5")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF6; instrument."Reserved Field 6")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF7; instrument."Reserved Field 7")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF8; instrument."Reserved Field 8")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF9; instrument."Reserved Field 9")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF10; instrument."Reserved Field 10")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF11; instrument."Reserved Field 11")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF12; instrument."Reserved Field 12")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF13; instrument."Reserved Field 13")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF14; instrument."Reserved Field 14")
                    {
                        NamespacePrefix = 'pay';
                    }
                    fieldelement(InstRF15; instrument."Reserved Field 15")
                    {
                        NamespacePrefix = 'pay';
                    }
                    textelement(EnrichmentSet)
                    {
                        NamespacePrefix = 'pay';
                        fieldelement(Enrichment; instrument."Enrichment Values")
                        {
                            NamespacePrefix = 'pay';
                        }
                    }

                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {

            }
        }
        actions
        {

        }
    }
}
