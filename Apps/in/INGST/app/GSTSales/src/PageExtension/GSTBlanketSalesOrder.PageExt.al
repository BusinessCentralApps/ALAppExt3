pageextension 18159 "GST Blanket Sales Order" extends "Blanket Sales Order"
{
    layout
    {
        addafter("Foreign Trade")
        {
            group("Tax Information")
            {
                field("GST Customer Type"; Rec."GST Customer Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of the customer. For example, Registered/Unregistered/Export etc..';
                }
                field("GST Bill-to State Code"; Rec."GST Bill-to State Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the bill-to state code of the customer on the sales document.';
                }
                field("GST Ship-to State Code"; Rec."GST Ship-to State Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the ship-to state code of the customer on the sales document.';
                }
                field("Location State Code"; Rec."Location State Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sate code mentioned of the location used in the transaction.';
                }
                field("Nature of Supply"; Rec."Nature of Supply")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the nature of GST transaction. For example, B2B/B2C.';
                }

                field("GST Without Payment of Duty"; Rec."GST Without Payment of Duty")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the invoice is a GST invoice with or without payment of duty.';
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the Invoice type as GST Laws.';
                }
            }
        }
    }
}