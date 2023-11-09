// xmlport 50015 NEFT
// {
//     Direction = Export;
//     Encoding = UTF8;
//     Format = Xml;
//     Namespaces = xsi='http://www.w3.org/2001/XMLSchema-instance',""='urn:iso:std:iso:20022:tech:xsd:pain.001.001.03';

//     schema
//     {
//         textelement(Document)
//         {
//             tableelement("NEFT Data";"ICICI UTR Data")
//             {
//                 XmlName = 'CstmrCdtTrfInitn';
//                 textelement(GrpHdr)
//                 {
//                     fieldelement(MsgId;"NEFT Data"."Entry No.")
//                     {
//                     }
//                     fieldelement(CreDtTm;"NEFT Data"."File Name")
//                     {
//                     }
//                     fieldelement(NbOfTxs;"NEFT Data"."Debit Acc. No.")
//                     {
//                     }
//                     fieldelement(CtrlSum;"NEFT Data"."Beneficiary A/c No.")
//                     {
//                     }
//                     textelement(InitgPty)
//                     {
//                         textelement(Id)
//                         {
//                             textelement(OrgId)
//                             {
//                                 textelement(Othr)
//                                 {
//                                     fieldelement(Id;"NEFT Data"."Beneficiary Name")
//                                     {
//                                     }
//                                 }
//                             }
//                         }
//                     }
//                 }
//                 textelement(PmtInf)
//                 {
//                     fieldelement(PmtInfId;"NEFT Data"."UTR Updated")
//                     {
//                     }
//                     fieldelement(PmtMtd;"NEFT Data".Amount)
//                     {
//                     }
//                     textelement(PmtTpInf)
//                     {
//                         textelement(SvcLvl)
//                         {
//                             fieldelement(Cd;"NEFT Data"."Payment Mod")
//                             {
//                             }
//                         }
//                     }
//                     fieldelement(ReqdExctnDt;"NEFT Data".Date)
//                     {
//                     }
//                     textelement(Dbtr)
//                     {
//                         fieldelement(Nm;"NEFT Data"."IFSC Code")
//                         {
//                         }
//                         textelement(PstlAdr)
//                         {
//                             fieldelement(Ctry;"NEFT Data"."Payable Location Name")
//                             {
//                             }
//                         }
//                     }
//                     textelement(DbtrAcct)
//                     {
//                         fieldelement(Id;"NEFT Data".Reversed)
//                         {
//                             fieldelement(Othr;"NEFT Data".Field36)
//                             {
//                                 fieldelement(Id;"NEFT Data"."Bene Mobile No.")
//                                 {
//                                 }
//                             }
//                         }
//                     }
//                     textelement(DbtrAgt)
//                     {
//                         textelement(FinInstnId)
//                         {
//                             fieldelement(PstlAdr;"NEFT Data".Field43)
//                             {
//                                 fieldelement(Ctry;"NEFT Data"."Bene Add 1")
//                                 {
//                                 }
//                             }
//                         }
//                     }
//                     textelement(UltmtDbtr)
//                     {
//                         fieldelement(Nm;"NEFT Data".Field49)
//                         {
//                         }
//                         fieldelement(PstlAdr;"NEFT Data".Field48)
//                         {
//                             fieldelement(PstCd;"NEFT Data".Field50)
//                             {
//                             }
//                             fieldelement(TwnNm;"NEFT Data".Field51)
//                             {
//                             }
//                             fieldelement(Ctry;"NEFT Data".Field52)
//                             {
//                             }
//                         }
//                     }
//                     fieldelement(ChrgBr;"NEFT Data"."Print Location Name")
//                     {
//                     }
//                     tableelement("Vendor Table NEFT";"E-Collection API")
//                     {
//                         XmlName = 'CdtTrfTxInf';
//                         textelement(PmtId)
//                         {
//                             fieldelement(InstrId;"Vendor Table NEFT".Action)
//                             {
//                             }
//                             fieldelement(EndToEndId;"Vendor Table NEFT".Action)
//                             {
//                             }
//                         }
//                         textelement(Amt)
//                         {
//                             fieldelement(InstdAmt;"Vendor Table NEFT".Type)
//                             {
//                                 fieldattribute(Ccy;"Vendor Table NEFT"."Account No.")
//                                 {
//                                 }
//                             }
//                         }
//                         textelement(CdtrAgt)
//                         {
//                             fieldelement(FinInstnId;"NEFT Data".Field46)
//                             {
//                                 textelement(ClrSysMmbId)
//                                 {
//                                     fieldelement(MmbId;"Vendor Table NEFT"."Document No.")
//                                     {
//                                     }
//                                 }
//                                 fieldelement(PstlAdr;"NEFT Data".Field43)
//                                 {
//                                     fieldelement(Ctry;"NEFT Data"."Add details 2")
//                                     {
//                                     }
//                                 }
//                             }
//                         }
//                         textelement(Cdtr)
//                         {
//                             fieldelement(Nm;"Vendor Table NEFT".Amount)
//                             {
//                             }
//                             fieldelement(PstlAdr;"NEFT Data".Field44)
//                             {
//                                 fieldelement(Ctry;"NEFT Data"."Add details 2")
//                                 {
//                                 }
//                             }
//                         }
//                         textelement(CdtrAcct)
//                         {
//                             fieldelement(Id;"NEFT Data".Field35)
//                             {
//                                 fieldelement(Othr;"NEFT Data".Field37)
//                                 {
//                                     fieldelement(Id;"Vendor Table NEFT"."Bal. Account No.")
//                                     {
//                                     }
//                                 }
//                             }
//                         }
//                     }
//                 }
//             }

//             trigger OnBeforePassVariable()
//             begin
//                 Ccy:='INR';
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     var
//         InstdAmt: Text;
//         Ccy: Text;
// }

