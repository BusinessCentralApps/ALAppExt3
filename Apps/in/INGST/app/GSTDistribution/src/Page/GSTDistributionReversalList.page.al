page 18207 "GST Distribution Reversal List"
{
    Caption = 'GST Distribution Reversal List';
    CardPageID = "GST Distribution Reversal";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = Basic, Suite;
    SourceTable = "GST Distribution Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("From GSTIN No."; Rec."From GSTIN No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specified the GSTIN no. of company or location.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the entry''s posting date.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number series as document/posting number.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies when the entries in the register were created.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the user who is responsible the document.';
                }
                field("Dist. Document Type"; Rec."Dist. Document Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the document type as an identifier for distribution.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange(Reversal, true);
    end;
}

