tableextension 31036 "Invt. Shipment Header CZL" extends "Invt. Shipment Header"
{
    fields
    {
        field(11700; "Invt. Movement Template CZL"; Code[10])
        {
            Caption = 'Inventory Movement Template';
            TableRelation = "Invt. Movement Template CZL" where("Entry Type" = const("Negative Adjmt."));
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    procedure GetRegisterUserIDCZL(): Code[50]
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.SetFilterFromInvtShipmentHeaderCZL(Rec);
        if ItemLedgerEntry.FindFirst() then
            exit(ItemLedgerEntry.GetRegisterUserIDCZL());
    end;
}