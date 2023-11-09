/* 
xmlport 50011 IMPS
{
    Direction = Export;
    Encoding = UTF8;
    FileName = 'PaymentFile.xml';
    Format = Xml;
    Namespaces = "" = 'urn:iso:std:iso:20022:tech:xsd:pain.001.001.03', xsi = 'http://www.w3.org/2001/XMLSchema-instance';

    schema
    {
        textelement(Document)
        {
            tableelement("IMPS Data_"; "Sales Invoice Transaction API")
            {
                XmlName = 'CstmrCdtTrfInitn';
                textelement(GrpHdr)
                {
                    fieldelement(MsgId; "IMPS Data_"."Entry No.")
                    {
                    }
                    fieldelement(CreDtTm; "IMPS Data_"."CASE ID")
                    {
                    }
                    fieldelement(NbOfTxs; "IMPS Data_".Type)
                    {
                    }
                    fieldelement(CtrlSum; "IMPS Data_"."Document No.")
                    {
                    }
                    textelement(InitgPty)
                    {
                        textelement(Id)
                        {
                            textelement(OrgId)
                            {
                                textelement(Othr)
                                {
                                    fieldelement(Id; "IMPS Data_"."Dealer Code")
                                    {
                                    }
                                }
                            }
                        }
                    }
                }
                textelement(PmtInf)
                {
                    fieldelement(PmtInfId; "IMPS Data_".Validated)
                    {
                    }
                    fieldelement(PmtMtd; "IMPS Data_"."Unit Price")
                    {
                    }
                    textelement(PmtTpInf)
                    {
                        textelement(SvcLvl)
                        {
                            fieldelement(Cd; "IMPS Data_"."Document Date")
                            {
                            }
                        }
                    }
                    fieldelement(ReqdExctnDt; "IMPS Data_"."Customer Name")
                    {
                    }
                    textelement(Dbtr)
                    {
                        fieldelement(Nm; "IMPS Data_"."Customer Contact No.")
                        {
                        }
                        textelement(PstlAdr)
                        {
                            fieldelement(Ctry; "IMPS Data_"."Policy No.")
                            {
                            }
                        }
                    }
                    textelement(DbtrAcct)
                    {
                        fieldelement(Id; "IMPS Data_".Response)
                        {
                            fieldelement(Othr; "IMPS Data_".Field36)
                            {
                                fieldelement(Id; "IMPS Data_"."Policy Coverage End Date")
                                {
                                }
                            }
                        }
                    }
                    textelement(DbtrAgt)
                    {
                        textelement(FinInstnId)
                        {
                            fieldelement(PstlAdr; "IMPS Data_".Field43)
                            {
                                fieldelement(Ctry; "IMPS Data_"."Vehicle Registration No.")
                                {
                                }
                            }
                        }
                    }
                    textelement(UltmtDbtr)
                    {
                        fieldelement(Nm; "IMPS Data_".Field49)
                        {
                        }
                        fieldelement(PstlAdr; "IMPS Data_".Field48)
                        {
                            fieldelement(PstCd; "IMPS Data_".Field50)
                            {
                            }
                            fieldelement(TwnNm; "IMPS Data_".Field51)
                            {
                            }
                            fieldelement(Ctry; "IMPS Data_".Field52)
                            {
                            }
                        }
                    }
                    fieldelement(ChrgBr; "IMPS Data_"."Policy Coverage Start Date")
                    {
                    }
                    tableelement(Table50013; Table50013)
                    {
                        LinkFields = Field11 = FIELD(Field31);
                        LinkTable = "IMPS Data_";
                        XmlName = 'CdtTrfTxInf';
                        textelement(PmtId)
                        {
                            fieldelement(InstrId; "Vendor Table IMPS"."State Code")
                            {
                            }
                            fieldelement(EndToEndId; "Vendor Table IMPS"."State Code")
                            {
                            }
                        }
                        textelement(Amt)
                        {
                            fieldelement(InstdAmt; "Vendor Table IMPS"."Employee Code")
                            {
                                fieldattribute(Ccy; "IMPS Data_".Field47)
                                {
                                }
                            }
                        }
                        textelement(CdtrAgt)
                        {
                            fieldelement(FinInstnId; "IMPS Data_".Field46)
                            {
                                textelement(ClrSysMmbId)
                                {
                                    fieldelement(MmbId; "Vendor Table IMPS".Name)
                                    {
                                    }
                                }
                                fieldelement(PstlAdr; "IMPS Data_".Field45)
                                {
                                    fieldelement(Ctry; "IMPS Data_"."Client Id")
                                    {
                                    }
                                }
                            }
                        }
                        textelement(Cdtr)
                        {
                            fieldelement(Nm; "Vendor Table IMPS"."E-mail")
                            {
                            }
                            fieldelement(PstlAdr; "IMPS Data_".Field44)
                            {
                                fieldelement(Ctry; "IMPS Data_"."Invoice Generated")
                                {
                                }
                            }
                        }
                        textelement(CdtrAcct)
                        {
                            fieldelement(Id; "IMPS Data_".Field35)
                            {
                                fieldelement(Othr; "IMPS Data_".Field37)
                                {
                                    fieldelement(Id; "Vendor Table IMPS".Address)
                                    {
                                    }
                                }
                            }
                        }
                    }
                }
            }

            trigger OnBeforePassVariable()
            begin
                Ccy := 'INR';
            end;
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
        InstdAmt: Text;
        Ccy: Text;
        REC271: Record "Bank Account Ledger Entry";
}



 */