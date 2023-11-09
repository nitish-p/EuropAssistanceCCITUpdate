pageextension 50034 "Reverse Entries" extends "Reverse Entries" 
{

    //Unsupported feature: Property Insertion (Permissions) on ""Reverse Entries"(Page 179)".

    var
        // ReversalEntry1: Record "179";
        // GenLedEntry: Record "17";
        // GLE: Record "17";
        // CLE: Record "21";
        // VLE: Record "25";
        // VATEntry: Record "254";
        // BALE: Record "271";
        // FALedEntry: Record "5601";
        // MainLedEntry: Record "5625";
        // PLAEntry: Record "13723";
        // TDSEntry: Record "13729";
        // TCSEntry: Record "16514";
        // FBTEntry: Record "16541";
        // DetCLE: Record "379";
        // DetVLE: Record "380";
        // DetGstLEdEntry: Record "16419";


    //Unsupported feature: Code Insertion on "OnClosePage".

    //trigger OnClosePage()
    //begin
        /*
        // prdp 16092019 +++

        GenLedEntry.RESET;
        GenLedEntry.SETRANGE("Reverse Transaction",TRUE);
        IF GenLedEntry.FINDFIRST THEN BEGIN

          GLE.RESET;
          GLE.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF GLE.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              GLE."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            GLE.MODIFY;
          UNTIL GLE.NEXT = 0;

          CLE.RESET;
          CLE.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF CLE.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              CLE."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            CLE.MODIFY;
          UNTIL CLE.NEXT = 0;

          VLE.RESET;
          VLE.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF VLE.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              VLE."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            VLE.MODIFY;
          UNTIL VLE.NEXT = 0;

          VATEntry.RESET;
          VATEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF VATEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              VATEntry."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            VATEntry.MODIFY;
          UNTIL VATEntry.NEXT = 0;

          BALE.RESET;
          BALE.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF BALE.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              BALE."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            BALE.MODIFY;
          UNTIL BALE.NEXT = 0;

          FALedEntry.RESET;
          FALedEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF FALedEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              FALedEntry."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            FALedEntry.MODIFY;
          UNTIL FALedEntry.NEXT = 0;

          MainLedEntry.RESET;
          MainLedEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF MainLedEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              MainLedEntry."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            MainLedEntry.MODIFY;
          UNTIL MainLedEntry.NEXT = 0;

          PLAEntry.RESET;
          PLAEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF PLAEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              PLAEntry."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            PLAEntry.MODIFY;
          UNTIL PLAEntry.NEXT = 0;

          TDSEntry.RESET;
          TDSEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF TDSEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              TDSEntry."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            TDSEntry.MODIFY;
          UNTIL TDSEntry.NEXT = 0;

          TCSEntry.RESET;
          TCSEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF TCSEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              TCSEntry."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            TCSEntry.MODIFY;
          UNTIL TCSEntry.NEXT = 0;

          FBTEntry.RESET;
          FBTEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF FBTEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
              FBTEntry."Posting Date":= GenLedEntry."Original Posting Date";
            END;
            FBTEntry.MODIFY;
          UNTIL FBTEntry.NEXT = 0;

          DetCLE.RESET;
          DetCLE.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF DetCLE.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
                DetCLE."Posting Date":=GenLedEntry."Original Posting Date";
            END;
            DetCLE.MODIFY;
          UNTIL DetCLE.NEXT =0;

          DetVLE.RESET;
          DetVLE.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF DetVLE.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
                DetVLE."Posting Date":=GenLedEntry."Original Posting Date";
            END;
            DetVLE.MODIFY;
          UNTIL DetVLE.NEXT =0;

          DetGstLEdEntry.RESET;
          DetGstLEdEntry.SETRANGE("Transaction No.",GenLedEntry."Transaction No.");
          IF DetGstLEdEntry.FINDSET THEN REPEAT
            IF GenLedEntry."Original Posting Date" <> 0D THEN BEGIN
                DetGstLEdEntry."Posting Date":=GenLedEntry."Original Posting Date";
            END;
            DetGstLEdEntry.MODIFY;
          UNTIL DetGstLEdEntry.NEXT =0;

        END;

        GenLedEntry.RESET;
        GenLedEntry.SETRANGE("Reverse Transaction",TRUE);
        IF GenLedEntry.FINDSET THEN REPEAT
          GenLedEntry."Reverse Transaction":=FALSE;
          GenLedEntry.MODIFY;
        UNTIL GenLedEntry.NEXT = 0;

        // prdp 16092019 ---
        */
    //end;
}

