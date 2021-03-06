codeunit 11304 "Move ISO Code BE"
{
    ObsoleteState = Pending;
    ObsoleteReason = 'This functionality will be replaced by invoking the actual upgrade from each of the apps';
    ObsoleteTag = '17.0';

    trigger OnRun()
    begin
        // This code is based on app upgrade logic for BE.
        // Matching file: .\App\Layers\BE\BaseApp\Upgrade\ISOCodeUPGBE.Codeunit.al
        // Based on commit: d4aef6b7b9
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"W1 Company Handler", 'OnUpgradePerCompanyDataForVersion', '', false, false)]
    local procedure OnCompanyMigrationUpgrade(TargetVersion: Decimal)
    begin
        if TargetVersion <> 15.0 then
            exit;

        MoveCurrencyISOCode();
        UpdateCountryISOCode();
    end;

    local procedure MoveCurrencyISOCode()
    var
        Currency: Record "Currency";
        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradeTagDefinitions: Codeunit "Upgrade Tag Definitions";
    begin
        if UpgradeTag.HasUpgradeTag(UpgradeTagDefinitions.GetMoveCurrencyISOCodeTag()) then
            exit;

        with Currency do begin
            SetFilter("ISO Currency Code", '<>%1', '');
            if FindSet() then
                repeat
                    "ISO Code" := "ISO Currency Code";
                    "ISO Currency Code" := '';
                    Modify();
                until Next() = 0;
        end;

        UpgradeTag.SetUpgradeTag(UpgradeTagDefinitions.GetMoveCurrencyISOCodeTag());
    end;

    local procedure UpdateCountryISOCode()
    var
        CountryRegion: Record "Country/Region";
        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradeTagDefCountry: Codeunit "Upgrade Tag Def - Country";
    begin
        if UpgradeTag.HasUpgradeTag(UpgradeTagDefCountry.GetUpdateCountyNameTag()) then
            exit;

        with CountryRegion do begin
            SetFilter("ISO Country/Region Code", '<>%1', '');
            if FindSet() then
                repeat
                    "ISO Code" := "ISO Country/Region Code";
                    "ISO Country/Region Code" := '';
                    Modify();
                until Next() = 0;
        end;

        UpgradeTag.SetUpgradeTag(UpgradeTagDefCountry.GetUpdateCountyNameTag());
    end;
}

