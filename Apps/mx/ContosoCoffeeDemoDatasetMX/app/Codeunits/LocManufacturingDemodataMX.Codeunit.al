codeunit 14099 "Loc. Manufacturing Demodata-MX"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Mfg Demo Accounts", 'OnAfterCreateDemoAccounts', '', false, false)]
    local procedure AddAndModifyManufacturingDemoAccounts()
    begin
        ManufacturingDemoAccount.ReturnAccountKey(true);

        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.CapOverheadVariance(), '2423');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.CapacityVariance(), '2421');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.DirectCostAppliedCap(), '2500');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.DirectCostAppliedRawMat(), '6120');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.DirectCostAppliedRetail(), '6130');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.FinishedGoods(), '6120');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.RawMaterials(), '6130');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.InventoryAdjRawMat(), '2170');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.InventoryAdjRetail(), '2170');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.MaterialVariance(), '2420');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.MfgOverheadVariance(), '2424');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.OverheadAppliedCap(), '2500');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.OverheadAppliedRawMat(), '2110');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.OverheadAppliedRetail(), '2110');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.PurchRawMatDom(), '2110');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.PurchaseVarianceCap(), '2410');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.PurchaseVarianceRawMat(), '2410');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.PurchaseVarianceRetail(), '2410');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.SubcontractedVariance(), '2422');
        ManufacturingDemoAccounts.AddAccount(ManufacturingDemoAccount.WIPAccountFinishedgoods(), '6150');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Manufacturing Demo Data Setup", 'OnBeforeInsertEvent', '', false, false)]
    local procedure ModifySeriesCode(var Rec: Record "Manufacturing Demo Data Setup")
    begin
        Rec."Price Factor" := 20;
        Rec."Base VAT Code" := 'NO IVA';
    end;

    var
        ManufacturingDemoAccount: Record "Manufacturing Demo Account";
        ManufacturingDemoAccounts: Codeunit "Manufacturing Demo Accounts";
}