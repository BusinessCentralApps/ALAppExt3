query 18025 GSTR1ExpExemp
{
    QueryType = Normal;

    elements
    {
        dataitem(Detailed_GST_Ledger_Entry; "Detailed GST Ledger Entry")
        {
            DataItemTableFilter = "GST Exempted Goods" = const(false);
            filter(Document_Type; "Document Type")
            {
            }
            filter(Entry_Type; "Entry Type")
            {
                ColumnFilter = Entry_Type = filter(= "Initial Entry");
            }
            filter(Location__Reg__No_; "Location  Reg. No.")
            {
            }
            filter(Posting_Date; "Posting Date")
            {
            }
            filter(Transaction_Type; "Transaction Type")
            {
                ColumnFilter = Transaction_Type = const(Sales);
            }
            filter(GST_Exempted_Goods; "GST Exempted Goods")
            {
            }
            filter(GST_Without_Payment_of_Duty; "GST Without Payment of Duty")
            {
            }
            filter(GST_Customer_Type; "GST Customer Type")
            {
            }
            filter(GST_Component_Code; "GST Component Code")
            {
            }
            column(GST_Jurisdiction_Type; "GST Jurisdiction Type")
            {
            }
            column(Document_No_; "Document No.")
            {
            }
            column(GST__; "GST %")
            {
            }
            column(GST_Base_Amount; "GST Base Amount")
            {
                Method = Sum;
            }
        }
    }
}