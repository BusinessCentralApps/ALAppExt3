Param(
    [Hashtable]$parameters
)

$parameters.appfile | Out-Host
$parameters.syncMode = "ForceSync"

$systemAppFile = $parameters.appfile | Where-Object { [System.IO.Path]::GetFileName($_) -like "Microsoft_System Application_*.*.*.*.app" }
if ($systemAppFile) {
    if (!$parameters.ContainsKey('includeOnlyAppIds')) {
        $parameters.includeOnlyAppIds = @()
    }
    if (!$parameters.ContainsKey('SkipVerification')) {
        $parameters.SkipVerification = $false
    }
    $includeOnlyAppIds = $parameters.includeOnlyAppIds
    $skipVerification = $parameters.SkipVerification
    $remainingAppFiles = $parameters.appfile | Where-Object { $_ -ne $systemAppFile }
    $parameters.AppFile = $systemAppFile
    $parameters.SkipVerification = $true
    $parameters.includeOnlyAppIds = @()

    $parameters.AppFile = Get-ChildItem -Path (Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my") -Filter "*.app" | ForEach-Object { $_.FullName }
    Publish-BcContainerApp @parameters

    if ($remainingAppFiles) {
        $parameters.AppFile = $remainingAppFiles
        $parameters.includeOnlyAppIds = $includeOnlyAppIds
        $parameters.SkipVerification = $skipVerification
        Publish-BcContainerApp @parameters
    }
}
else {
    Publish-BcContainerApp @parameters
}
