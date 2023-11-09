xmlport 50039 "IRN QR Code-Upload"
{
    // Rohit 05-01-2020
    // 1.Developed upload utility for IRN and QR code upload for sales invoice and credit memos.

    Direction = Import;
    FileName = 'IRNLedEntryUpld.csv';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("E-Invoice Ledger Entries"; "E-Invoice Ledger Entries")
            {
                XmlName = 'IRNLedgerEntry';
                fieldelement(DocNo; "E-Invoice Ledger Entries"."Document No.")
                {
                }
                fieldelement(IRNACKNO; "E-Invoice Ledger Entries"."IRN Ack No")
                {
                }
                fieldelement(IRNACKDate; "E-Invoice Ledger Entries"."IRN Ack Date")
                {
                }
                fieldelement(Status; "E-Invoice Ledger Entries".Status)
                {
                }
                fieldelement(IRN; "E-Invoice Ledger Entries".IRN)
                {
                    FieldValidate = Yes;
                }
                textelement(signedqr)
                {
                    XmlName = 'SignedQR';
                }

                trigger OnAfterInsertRecord()
                begin
                    SalesInvHdr.RESET;
                    SalesInvHdr.SETRANGE("No.", "E-Invoice Ledger Entries"."Document No.");
                    IF SalesInvHdr.FINDFIRST THEN BEGIN
                        //MESSAGE(SalesInvHdr."No.");
                        //MESSAGE(QrCode);
                        QRMgmt.InitializeSignedQRCode(SalesInvHdr, SignedQR);
                    END;

                    SalCrMemoHdr.RESET;
                    SalCrMemoHdr.SETRANGE(SalCrMemoHdr."No.", "E-Invoice Ledger Entries"."Document No.");
                    IF SalCrMemoHdr.FINDFIRST THEN BEGIN
                        QRMgmt.InitializeSignedQRCodeCreditMemo(SalCrMemoHdr, SignedQR);
                    END;
                end;

                trigger OnBeforeInsertRecord()
                begin

                    EInvLedEntry.RESET;
                    EInvLedEntry.SETFILTER("Entry No.", '<>%1', 0);
                    IF EInvLedEntry.FINDLAST THEN BEGIN
                        "E-Invoice Ledger Entries"."Entry No." := EInvLedEntry."Entry No." + 1;

                    END ELSE BEGIN
                        "E-Invoice Ledger Entries"."Entry No." := 1;

                    END;

                    EInvLedEntry1.RESET;
                    EInvLedEntry1.SETRANGE("Document No.", "E-Invoice Ledger Entries"."Document No.");
                    //EInvLedEntry1.SETRANGE("IRN Ack No","E-Invoice Ledger Entries"."IRN Ack No");
                    EInvLedEntry1.SETRANGE(Status, "E-Invoice Ledger Entries".Status);
                    EInvLedEntry1.SETFILTER("Entry No.", '<>%1', "E-Invoice Ledger Entries"."Entry No.");
                    IF EInvLedEntry1.FINDFIRST THEN
                        currXMLport.SKIP;

                    //"EInvoice Ledger Entries".INSERT(TRUE);
                end;
            }
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

    trigger OnPostXmlPort()
    begin
        MESSAGE('Data Uploaded Successfully!!!!');
    end;

    var
        QRMgmt: Codeunit "eInvoice_QRCode Mgmt.";
        SalesInvHdr: Record "Sales Invoice Header";
        EInvLedEntry: Record "E-Invoice Ledger Entries";
        SalCrMemoHdr: Record "Sales Cr.Memo Header";
        EInvLedEntry1: Record "E-Invoice Ledger Entries";
}

