page 31247 "Classification Codes CZF"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Classification Codes';
    PageType = List;
    SourceTable = "Classification Code CZF";
    SourceTableView = sorting("Classification Type", Code);
    UsageCategory = Administration;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the classification code for fixed asset.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies description for classification groups.';
                }
                field("Classification Type"; Rec."Classification Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the classification code. You can insert code with classification type CZ-CC, CZ-CPA or DNM.';
                }
                field("Depreciation Group"; Rec."Depreciation Group")
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies the depreciation group for classification groups.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }
}
