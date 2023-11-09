// page 50011 RoleCenterXmlport
// {
//     PageType = RoleCenter;
//     ApplicationArea = all;
//     UsageCategory = Lists;

//     layout
//     {
//         area(RoleCenter)
//         {

//         }
//     }

//     actions
//     {
//         area(Creation)
//         {
//             action("Customer Ledger Entries")
//             {
//                 RunObject = Page "Customer Ledger Entries";
//                 image = LedgerBook;
//                 ApplicationArea = all;

//             }
//             action("Upload Customer")
//             {
//                 ApplicationArea = All;
//                 RunObject = xmlport 50022;

//             }

//         }
//         area(Sections)
//         {
//             group(SectionsGroupName)
//             {
//                 action("Customer Ledger Entries2")
//                 {
//                     RunObject = Page "Customer Ledger Entries";
//                     image = LedgerBook;
//                     ApplicationArea = all;
//                 }
//             }
//         }
//         area(Embedding)
//         {
//             action("Customer Ledger Entries3")
//             {
//                 RunObject = Page "Customer Ledger Entries";
//                 image = LedgerBook;
//                 ApplicationArea = all;
//             }

//         }
//     }
// }

page 50011 RoleCenterXmlport
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;

    layout
    {

    }

    actions
    {
        area(Processing)
        {
            action("Import IRN Details")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50039, false, true);
                end;
            }
            action("Rejected Sales Data Export")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50001, true, false);
                end;
            }
            action("Raw Sales Credit Memo Import")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50002, false, true);
                end;
            }
            action("Raw Purchase Data Import")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50003, false, true);
                end;
            }
            action("Rejected Purchase Data Export")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50004, true, false);
                end;
            }
            action("XMLport_Purch_Invoice _Import")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50006, false, true);
                end;
            }
            action("Rate Matrix Upload")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50008, false, true);
                end;
            }
            action(XMLTest)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50009, true, true);
                end;
            }
            action("Raw Purchase import")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50010, false, true);
                end;
            }
            action("Purchase Cr Memo Import")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50025, false, true);
                end;
            }
            action("Customer application")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50045, false, true);
                end;
            }
            action("Upload Customer")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50022, false, true);
                end;
            }
            action("Gen. Journal Line Upload")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50005, true, true);
                end;
            }
            action("AR Policy Upload")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50030);
                end;
            }
            action("Attach File")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50012, false, true);
                end;
            }
            action("Auto Knock Off VEL")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50040);
                end;
            }
            action("Customer app")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50044, false, true);
                end;
            }
            action("Export Error Log Ez Auto PI")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50037, true, false);
                end;
            }
            action("Export ICICI Payment File")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50035);
                end;
            }
            action("Export ICICI Refund File")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50038);
                end;
            }
            action("Export Input File")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50018, true, false);
                end;
            }
            action("FA Uploader Import")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50043, false, true);
                end;
            }
            action("file attachment")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50042, false, true);
                end;
            }
            action("GL Entry Data")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50046, true, false);
                end;
            }
            action("ICICI UTR Upld")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50032, false, true);
                end;
            }
            action("ICICI UTR Upload")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50031, true, false);
                end;
            }
            action("Import Audit File")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50020, false, true);
                end;
            }
            action("Import Rollup File")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50019, false, true);
                end;
            }
            action("Import Rollup File2")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50029, false, true);
                end;
            }
            action("IMPS Error log")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50017, true, false);
                end;
            }
            action("Input FIle Export")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50021, true, false);
                end;
            }
            action("Sales Cr Memo Error Export")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50024, true, false);
                end;
            }
            action("Sales Invoice Export New")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50026, true, false);
                end;
            }
            action("TESt new")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50013);
                end;
            }
            action("Upload Ez Auto Purch Invoice")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50036, false, true);
                end;
            }
            action("Vend Bank Det. Import/Export")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50033, true, true);
                end;
            }
            action("Vendor Uploader")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50041, false, true);
                end;
            }
            action("Raw Sales Data Import")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(50050, false, true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}