page 18145 "Sales Cr Memo Dialog"
{
    Caption = 'Sales Credit Memo Dialog';
    PageType = StandardDialog;
    DataCaptionExpression = '';
    PopulateAllFields = true;
    SourceTable = "Sales Cr.Memo Header";
    Permissions = tabledata "Sales Cr.Memo Header" = rm;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("E-Way Bill No."; Rec."E-Way Bill No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the E-way bill number on the sale document.';
                }
                field("Acknowledgement No."; Rec."Acknowledgement No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = MakeFieldUneditable;
                    ToolTip = 'Specifies a unique number assigned by e-invoice portal.';
                }
                field("Acknowledgement Date"; Rec."Acknowledgement Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = MakeFieldUneditable;
                    ToolTip = 'Specifies the date of acknowledgement.';
                }
                field("IRN Hash"; Rec."IRN Hash")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = MakeFieldUneditable;
                    ToolTip = 'Specifies a unique number of 64 character generated by system.';
                }
                field("E-Inv. Cancelled Date"; Rec."E-Inv. Cancelled Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies e-invoice cancellation date.';
                }
                field("Cancel Reason"; Rec."Cancel Reason")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the cancellation reason.';
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        MakeFieldUneditable := not Rec.IsJSONImported;
    end;

    var
        MakeFieldUneditable: Boolean;
}