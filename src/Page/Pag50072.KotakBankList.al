page 50072 "Kotak Bank List"
{
    ApplicationArea = All;
    Caption = 'Kotak Bank List';
    PageType = List;
    SourceTable = "Kotak Bank Int. Hdr";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Message Id"; Rec."Message Id")
                {
                    ToolTip = 'Specifies the value of the Message Id field.';
                }
                field("Message Source Code"; Rec."Message Source Code")
                {
                    ToolTip = 'Specifies the value of the Message Source Code field.';
                }
                field("Client Code"; Rec."Client Code")
                {
                    ToolTip = 'Specifies the value of the Client Code field.';
                }
                field("Batch Ref No."; Rec."Batch Ref No.")
                {
                    ToolTip = 'Specifies the value of the Batch Ref No. field.';
                }
                field("Header Checksum"; Rec."Header Checksum")
                {
                    ToolTip = 'Specifies the value of the Header Checksum field.';
                }
                field(RF1; Rec.RF1)
                {
                    ToolTip = 'Specifies the value of the RF1 field.';
                }
                field(RF2; Rec.RF2)
                {
                    ToolTip = 'Specifies the value of the RF2 field.';
                }
                field(RF3; Rec.RF3)
                {
                    ToolTip = 'Specifies the value of the RF3 field.';
                }
                field(RF4; Rec.RF4)
                {
                    ToolTip = 'Specifies the value of the RF4 field.';
                }
                field(RF5; Rec.RF5)
                {
                    ToolTip = 'Specifies the value of the RF5 field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ExportXmlFile)
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    outstream: OutStream;
                    instream: InStream;
                    tempblob: Codeunit "Temp Blob";
                    filename: Text;
                    msg: Text;
                begin
                    tempblob.CreateOutStream(outstream);
                    Xmlport.Export(50051, outstream, Rec);
                    tempblob.CreateInStream(instream);
                    filename := 'xmlfile.xml';
                    instream.ReadText(msg);
                    Message(msg);
                    DownloadFromStream(instream, '', '', '', filename);
                end;
            }
            action(exportResponse)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    outstream: OutStream;
                    instream: InStream;
                    tempblob: Codeunit "Temp Blob";
                    filename: Text;
                    msg: Text;
                begin
                    tempblob.CreateOutStream(outstream);
                    Xmlport.Export(50052, outstream);
                    tempblob.CreateInStream(instream);
                    filename := 'xmlfile.xml';
                    instream.ReadText(msg);
                    Message(msg);
                    DownloadFromStream(instream, '', '', '', filename);

                end;
            }
            action(importResponse)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    strinf: Text;
                    outstream: OutStream;
                    instream: InStream;
                    tempblob: Codeunit "Temp Blob";
                begin
                    strinf := '<?xml version="1.0" encoding="UTF-8"?><SOAP-ENV:Envelope xmlns:SOAP-ENV="http://www.w3.org/2003/05/soap-envelope">	<SOAP-ENV:Body><ns0:Payment xmlns:ns0="http://www.kotak.com/schemas/CMS_Generic/Payment_Response.xsd"><ns0:AckHeader><ns0:MessageId>TEJA07062022001</ns0:MessageId>	<ns0:StatusCd>000</ns0:StatusCd><ns0:StatusRem>All Instruments accepted Successfully.</ns0:StatusRem></ns0:AckHeader></ns0:Payment>	</SOAP-ENV:Body></SOAP-ENV:Envelope>';
                    tempblob.CreateOutStream(outstream);
                    outstream.WriteText(strinf);
                    tempblob.CreateInStream(instream);
                    Xmlport.Import(50052, instream);
                end;
            }
            action("Send Data to Bank")
            {
                ApplicationArea = All;
                Image = SendElectronicDocument;

                trigger OnAction()
                var
                    CD: Codeunit "Kotak Bank Integration";
                begin
                    CD.SendBankPayment(Rec);
                end;
            }
        }
    }

}




