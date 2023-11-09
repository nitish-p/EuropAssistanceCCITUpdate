XmlPort 50046 "GL Entry Data"
{
    Direction = Export;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Integer;Integer)
            {
                XmlName = 'Integer';
                SourceTableView = sorting(Number) where(Number=const(1));
                textelement(a)
                {

                    trigger OnBeforePassVariable()
                    begin
                        a := 'Entry No.';
                    end;
                }
                textelement(b)
                {

                    trigger OnBeforePassVariable()
                    begin
                        b := 'Posting Date'
                    end;
                }
                textelement(c)
                {

                    trigger OnBeforePassVariable()
                    begin
                        c := 'Document Type';
                    end;
                }
                textelement(d)
                {

                    trigger OnBeforePassVariable()
                    begin
                        d := 'Transaction No.';
                    end;
                }
                textelement(e)
                {

                    trigger OnBeforePassVariable()
                    begin
                        e :='Document No.'
                    end;
                }
                textelement(f)
                {

                    trigger OnBeforePassVariable()
                    begin
                        f := 'G/L Account No.'
                    end;
                }
                textelement(g)
                {

                    trigger OnBeforePassVariable()
                    begin
                        g := 'Narration'
                    end;
                }
                textelement(h)
                {

                    trigger OnBeforePassVariable()
                    begin
                        h := 'External Document No.'
                    end;
                }
                textelement(i)
                {

                    trigger OnBeforePassVariable()
                    begin
                        i := 'G/L Account Name'
                    end;
                }
                textelement(j)
                {

                    trigger OnBeforePassVariable()
                    begin
                        j := 'Amount'
                    end;
                }
                textelement(k)
                {

                    trigger OnBeforePassVariable()
                    begin
                        k := 'Gen. Posting Type';
                    end;
                }
                textelement(l)
                {

                    trigger OnBeforePassVariable()
                    begin
                        l := 'Gen. Prod. Posting Group';
                    end;
                }
                textelement(m)
                {

                    trigger OnBeforePassVariable()
                    begin
                        m := 'Gen. Bus. Posting Group';
                    end;
                }
                textelement(n)
                {

                    trigger OnBeforePassVariable()
                    begin
                        n := 'Source No.';
                    end;
                }
                textelement(o)
                {

                    trigger OnBeforePassVariable()
                    begin
                        o := 'SourceNoDescription'
                    end;
                }
                textelement(p)
                {

                    trigger OnBeforePassVariable()
                    begin
                        p := 'Bal. Account Type'
                    end;
                }
                textelement(q)
                {

                    trigger OnBeforePassVariable()
                    begin
                        q := 'Bal. Account No.';
                    end;
                }
                textelement(r)
                {

                    trigger OnBeforePassVariable()
                    begin
                        r := 'Journal Batch Name';
                    end;
                }
                textelement(s)
                {

                    trigger OnBeforePassVariable()
                    begin
                        s := 'Document Date';
                    end;
                }
                textelement(t)
                {

                    trigger OnBeforePassVariable()
                    begin
                        t := 'Invoice Date';
                    end;
                }
                textelement(u)
                {

                    trigger OnBeforePassVariable()
                    begin
                        u := 'Reversed';
                    end;
                }
                textelement(v)
                {

                    trigger OnBeforePassVariable()
                    begin
                        v := 'Reversed by Entry No.';
                    end;
                }
                textelement(w)
                {

                    trigger OnBeforePassVariable()
                    begin
                        w := 'Reversed Entry No.';
                    end;
                }
                textelement(x)
                {

                    trigger OnBeforePassVariable()
                    begin
                        x := 'User ID';
                    end;
                }
                textelement(y)
                {

                    trigger OnBeforePassVariable()
                    begin
                        y := 'FA Entry Type';
                    end;
                }
                textelement(z)
                {

                    trigger OnBeforePassVariable()
                    begin
                        z := 'FA Entry No.';
                    end;
                }
                textelement(aa)
                {

                    trigger OnBeforePassVariable()
                    begin
                        aa := 'Case No.';
                    end;
                }
                textelement(bb)
                {

                    trigger OnBeforePassVariable()
                    begin
                        bb := 'Client Level Dimension'
                    end;
                }
                textelement(cc)
                {

                    trigger OnBeforePassVariable()
                    begin
                        cc := 'Department Code';
                    end;
                }
                textelement(dd)
                {

                    trigger OnBeforePassVariable()
                    begin
                        dd := 'Business line';
                    end;
                }
                textelement(ee)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ee := 'Income/BS';
                    end;
                }
                textelement(ff)
                {

                    trigger OnBeforePassVariable()
                    begin
                          ff := 'NTO';
                    end;
                }
                textelement(gg)
                {

                    trigger OnBeforePassVariable()
                    begin
                        gg := 'EC'
                    end;
                }
                textelement(hh)
                {

                    trigger OnBeforePassVariable()
                    begin
                        hh := 'Salary'
                    end;
                }
                textelement(ii)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ii := 'BL'
                    end;
                }
            }
            tableelement("G/L Entry";"G/L Entry")
            {
                RequestFilterFields = "G/L Account No.","Posting Date";
                XmlName = 'GLEntry';
                SourceTableView = sorting("No. Series") order(ascending);
                fieldelement(EntryNo;"G/L Entry"."Entry No.")
                {
                }
                textelement(PostingDate)
                {
                }
                fieldelement(DocumentType;"G/L Entry"."Document Type")
                {
                }
                fieldelement(TransactionNo;"G/L Entry"."Transaction No.")
                {
                }
                fieldelement(DocumentNo;"G/L Entry"."Document No.")
                {
                }
                fieldelement(GLAccountNo;"G/L Entry"."G/L Account No.")
                {
                }
                fieldelement(Narration;"G/L Entry".Narration)
                {
                }
                fieldelement(ExternalDocumentNo;"G/L Entry"."External Document No.")
                {
                }
                fieldelement(GLAccountName;"G/L Entry"."G/L Account Name")
                {
                }
                fieldelement(Amount;"G/L Entry".Amount)
                {
                }
                fieldelement(GenPostingType;"G/L Entry"."Gen. Posting Type")
                {
                }
                fieldelement(GenProdPostingGroup;"G/L Entry"."Gen. Prod. Posting Group")
                {
                }
                fieldelement(GenBusPostingGroup;"G/L Entry"."Gen. Bus. Posting Group")
                {
                }
                fieldelement(SourceNo;"G/L Entry"."Source No.")
                {
                }
                textelement(SourceNoDescription)
                {
                }
                fieldelement(BalAccountType;"G/L Entry"."Bal. Account Type")
                {
                }
                fieldelement(BalAccountNo;"G/L Entry"."Bal. Account No.")
                {
                }
                fieldelement(JournalBatchName;"G/L Entry"."Reason Code")
                {
                }
                textelement(DocumentDate)
                {
                }
                textelement(InvoiceDate)
                {
                }
                fieldelement(Reversed;"G/L Entry".Reversed)
                {
                }
                fieldelement(ReversedbyEntryNo;"G/L Entry"."Reversed by Entry No.")
                {
                }
                fieldelement(ReversedEntryNo;"G/L Entry"."Reversed Entry No.")
                {
                }
                fieldelement(UserID;"G/L Entry"."User ID")
                {
                }
                fieldelement(FAEntryType;"G/L Entry"."FA Entry Type")
                {
                }
                fieldelement(FAEntryNo;"G/L Entry"."FA Entry No.")
                {
                }
                fieldelement(CaseNo;"G/L Entry"."Case No.")
                {
                }
                fieldelement(ClientLevelDimension;"G/L Entry"."Client Level Dimension")
                {
                }
                fieldelement(DepartmentCode;"G/L Entry"."Department Code")
                {
                }
                fieldelement(Businessline;"G/L Entry"."Global Dimension 1 Code")
                {
                }
                textelement(IncomeBS)
                {
                }
                textelement(NTO)
                {
                }
                textelement(EC)
                {
                }
                textelement(Salary)
                {
                }
                textelement(BL)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PostingDate:=Format(Date2dmy("G/L Entry"."Posting Date",3))+'-'
                    +PadStr('',2 - StrLen(Format(Date2dmy("G/L Entry"."Posting Date",2))),'0')
                    +Format(Date2dmy("G/L Entry"."Posting Date",2))
                    +'-'+PadStr('',2 - StrLen(Format(Date2dmy("G/L Entry"."Posting Date",1))),'0')+Format(Date2dmy("G/L Entry"."Posting Date",1));
                    DocumentDate:=Format(Date2dmy("G/L Entry"."Document Date",3))+'-'+PadStr('',2 - StrLen(Format(Date2dmy("G/L Entry"."Document Date",2))),'0')
                    +Format(Date2dmy("G/L Entry"."Document Date",2))+'-'+PadStr('',2 - StrLen(Format(Date2dmy("G/L Entry"."Document Date",1))),'0')+
                    Format(Date2dmy("G/L Entry"."Document Date",1));
                    if "G/L Entry"."Invoice Date"<>0D then
                    InvoiceDate:=Format(Date2dmy("G/L Entry"."Invoice Date",3))+'-'+PadStr('',2 - StrLen(Format(Date2dmy("G/L Entry"."Invoice Date",2))),'0')+Format(Date2dmy("G/L Entry"."Invoice Date",2))+'-'+
                    PadStr('',2 - StrLen(Format(Date2dmy("G/L Entry"."Invoice Date",1))),'0')+Format(Date2dmy("G/L Entry"."Invoice Date",1));
                    if "G/L Entry"."Source Code" <> '' then begin

                      if "G/L Entry"."Source No." <> '' then begin

                      if "G/L Entry"."Source Type" = 1 then begin
                        Cust.Get("G/L Entry"."Source No.");
                        SourceNoDescription:=Cust.Name;
                      end;

                      if"G/L Entry"."Source Type" = 2 then begin
                        Vend.Get("G/L Entry"."Source No.");
                        SourceNoDescription:=Vend.Name;
                      end;

                      if "G/L Entry"."Source Type" = 3 then begin
                        BankAcc.Get("G/L Entry"."Source No.");
                        SourceNoDescription:=BankAcc.Name;
                      end;

                      if "G/L Entry"."Source Type" = 4 then begin
                        FA.Get("G/L Entry"."Source No.");
                        SourceNoDescription:=FA.Description;
                      end;

                    end;
                    end;
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

    var
        PostedNarration: Record "Posted Narration";
        DimensionSetEntry: Record "Dimension Set Entry";
        GLRel: Record "G/L - Item Ledger Relation";
        pi: Record "Purch. Inv. Line";
        si: Record "Sales Invoice Line";
        ve: Record "Value Entry";
        PPI: Record "Purch. Inv. Header";
        NARRPPI: Text;
        DimensionValue: Record "Dimension Value";
        Cust: Record Customer;
        Vend: Record Vendor;
        BankAcc: Record "Bank Account";
        FA: Record "Fixed Asset";
}

