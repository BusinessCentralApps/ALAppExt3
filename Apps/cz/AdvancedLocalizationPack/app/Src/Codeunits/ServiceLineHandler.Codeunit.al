codeunit 31257 "Service Line Handler CZA"
{
    [EventSubscriber(ObjectType::Table, Database::"Service Line", 'OnAfterAssignItemValues', '', false, false)]
    local procedure SetGPPGfromSKUOnAfterAssignItemValues(var ServiceLine: Record "Service Line")
    begin
        ServiceLine.SetGPPGfromSKUCZA();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Line", 'OnBeforeValidateEvent', 'Variant Code', false, false)]
    local procedure SetGPPGfromSKUOnBeforeValidateEventVariantCode(var Rec: Record "Service Line")
    begin
        Rec.SetGPPGfromSKUCZA();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Service Line", 'OnAfterValidateEvent', 'Location Code', false, false)]
    local procedure SetGPPGfromSKUOnAfterValidateEventLocationCode(var Rec: Record "Service Line")
    begin
        Rec.SetGPPGfromSKUCZA();
    end;
}