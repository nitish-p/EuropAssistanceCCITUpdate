Report 50008 "Bank Reco"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Reco.rdl';
    UsageCategory = Lists;
    ApplicationArea = all;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_4558; 4558)
            {
            }
            column(Bank_Account__No__; "No.")
            {
            }
            column(Bank_Account_Name; Name)
            {
            }
            column(Bank_Account__Bank_Account_No__; "Bank Account No.")
            {
            }
            column(TillDate; Format(TillDate))
            {
            }
            column(Tel__No________CompInfo__Phone_No____________Fax_No________CompInfo__Fax_No__; 'Tel. No. - ' + CompInfo."Phone No." + ' ' + 'Fax No. - ' + CompInfo."Fax No.")
            {
            }
            column(CompInfo_City___________CompInfo__Post_Code_; CompInfo.City + ' - ' + CompInfo."Post Code")
            {
            }
            column(CompInfo_Address_________CompInfo__Address_2_; CompInfo.Address + ' ' + CompInfo."Address 2")
            {
            }
            column(CompCIN; CompInfo."CIN No.")
            {
            }
            column(CompInfoPicture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(Bank_Account__Balance_Last_Statement_; "Balance Last Statement")
            {
            }
            column(Bank_Account__No__Caption; FieldCaption("No."))
            {
            }
            column(Bank_Account_NameCaption; FieldCaption(Name))
            {
            }
            column(Bank_Account__Bank_Account_No__Caption; FieldCaption("Bank Account No."))
            {
            }
            column(TillDateCaption; TillDateCaptionLbl)
            {
            }
            column(BankAccountLedgerEntryC__Posting_Date_Caption; BankAccountLedgerEntryC.FieldCaption("Posting Date"))
            {
            }
            column(BankAccountLedgerEntryC__Document_No__Caption; BankAccountLedgerEntryC.FieldCaption("Document No."))
            {
            }
            column(Control1000000015Caption; Control1000000015CaptionLbl)
            {
            }
            column(BankAccountLedgerEntryC_AmountCaption; BankAccountLedgerEntryC.FieldCaption(Amount))
            {
            }
            column(BankAccountLedgerEntryC__Cheque_No__Caption; BankAccountLedgerEntryC.FieldCaption("Cheque No."))
            {
            }
            column(BankAccountLedgerEntryC__Cheque_Date_Caption; BankAccountLedgerEntryC.FieldCaption("Cheque Date"))
            {
            }
            column(TotalAmtCaption; TotalAmtCaptionLbl)
            {
            }
            column(Bank_Account__Balance_Last_Statement_Caption; Bank_Account__Balance_Last_Statement_CaptionLbl)
            {
            }
            column(Balance_Last_Statement____TotalAmtCaption; Balance_Last_Statement____TotalAmtCaptionLbl)
            {
            }
            dataitem(IntegerC; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(ReportForNavId_2652; 2652)
                {
                }
                column(CreditsCaption; CreditsCaptionLbl)
                {
                }
                column(IntegerC_Number; Number)
                {
                }
            }
            dataitem(BankAccountLedgerEntryC; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No.");
                DataItemTableView = sorting("Entry No.") where(Open = filter(true), Amount = filter(< 0));
                column(ReportForNavId_4242; 4242)
                {
                }
                column(BankAccountLedgerEntryC__Posting_Date_; Format("Posting Date"))
                {
                }
                column(DataItem1Visible; DataItem1Visible)
                {
                }
                column(BankAccountLedgerEntryC_Amount; ROUND(Amount, 0.01))
                {
                }
                column(BankAccountLedgerEntryC__Document_No__; "Document No.")
                {
                }
                column(BankAccountLedgerEntryC__Cheque_No__; "Cheque No.")
                {
                }
                column(BankAccountLedgerEntryC__Cheque_Date_; Format("Cheque Date"))
                {
                }
                column(BankAccountLedgerEntryC_Amount_Control1000000037; ROUND(Amount, 0.01))
                {
                }
                column(Total_CreditCaption; Total_CreditCaptionLbl)
                {
                }
                column(BankAccountLedgerEntryC_Entry_No_; "Entry No.")
                {
                }
                column(BankAccountLedgerEntryC_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(Description_BankAccountLedgerEntryC; BankAccountLedgerEntryC.Description)
                {
                }
                column(TotalAmtC; ROUND(TotalAmtC, 0.01))
                {
                }

                trigger OnAfterGetRecord()
                begin

                    TotalAmtC := TotalAmtC + BankAccountLedgerEntryC.Amount;
                    DataItem1Visible := true;
                    DataItem2Visible := false;
                end;

                trigger OnPreDataItem()
                begin

                    SetRange("Posting Date", 20900101D, TillDate);
                    TotalAmtC := 0;
                end;
            }
            dataitem(IntegerD; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(ReportForNavId_7561; 7561)
                {
                }
                column(DebitsCaption; DebitsCaptionLbl)
                {
                }
                column(IntegerD_Number; Number)
                {
                }
            }
            dataitem(BankAccountLedgerEntryD; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No.");
                DataItemTableView = sorting("Entry No.") where(Open = filter(true), Amount = filter(> 0));
                column(ReportForNavId_9151; 9151)
                {
                }
                column(BankAccountLedgerEntryD__Posting_Date_; Format("Posting Date"))
                {
                }
                column(DataItem2Visible; DataItem2Visible)
                {
                }
                column(BankAccountLedgerEntryD_Amount; ROUND(Amount, 0.01))
                {
                }
                column(BankAccountLedgerEntryD__Document_No__; "Document No.")
                {
                }
                column(BankAccountLedgerEntryD__Cheque_No__; "Cheque No.")
                {
                }
                column(BankAccountLedgerEntryD__Cheque_Date_; Format("Cheque Date"))
                {
                }
                column(BankAccountLedgerEntryD_Amount_Control1000000039; ROUND(Amount, 0.01))
                {
                }
                column(Total_DebitCaption; Total_DebitCaptionLbl)
                {
                }
                column(BankAccountLedgerEntryD_Entry_No_; "Entry No.")
                {
                }
                column(BankAccountLedgerEntryD_Bank_Account_No_; "Bank Account No.")
                {
                }
                column(TotalAmtD; ROUND(TotalAmtD, 0.01))
                {
                }
                column(Description_BankAccountLedgerEntryD; BankAccountLedgerEntryD.Description)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    TotalAmtD := TotalAmtD + BankAccountLedgerEntryD.Amount;
                    DataItem1Visible := false;
                    DataItem2Visible := true;
                end;

                trigger OnPreDataItem()
                begin

                    SetRange("Posting Date", 20900101D, TillDate);
                    TotalAmtD := 0;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(TillDate; TillDate)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin

        CompInfo.Get('');
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        TillDate: Date;
        TotalAmtC: Decimal;
        LastBankBal: Decimal;
        TotalBankBal: Decimal;
        CompInfo: Record "Company Information";
        TillDateCaptionLbl: label 'Till Date';
        Control1000000015CaptionLbl: label 'Label1000000015';
        TotalAmtCaptionLbl: label 'Total Unreconciled Amount';
        Bank_Account__Balance_Last_Statement_CaptionLbl: label 'Last Bank Balance';
        Balance_Last_Statement____TotalAmtCaptionLbl: label 'Total Bank Balance';
        CreditsCaptionLbl: label 'Credits';
        Total_CreditCaptionLbl: label 'Total Credit';
        DebitsCaptionLbl: label 'Debits';
        Total_DebitCaptionLbl: label 'Total Debit';
        DataItem1Visible: Boolean;
        DataItem2Visible: Boolean;
        TotalAmtD: Decimal;
}

