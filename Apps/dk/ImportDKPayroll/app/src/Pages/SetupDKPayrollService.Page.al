// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

page 13640 "Setup DK Payroll Service"
{
    PageType = Card;
    SourceTable = "General Ledger Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = true;
    LinksAllowed = false;
    Editable = true;
    PromotedActionCategories = 'New,Process,Report,General,Posting,VAT,Bank,Journal Templates';
    Caption = 'Setup Payroll Data Import Definitions (DK)';

    layout
    {
        area(content)
        {
            group("Payroll Transaction Import")
            {
                Editable = true;
                Enabled = true;
                field("Payroll Trans. Import Format"; "Payroll Trans. Import Format")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the format of the payroll transaction file that can be imported into the General Journal window.';
                }
            }
        }
    }

    trigger OnOpenPage();
    var
        ImportPayrollDataExchDef: Codeunit ImportPayrollDataExchDef;
    begin
        Reset();
        if not get() then begin
            Init();
            Insert();
        end;
        ImportPayrollDataExchDef.Run();
    end;
}