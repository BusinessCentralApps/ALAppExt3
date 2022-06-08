Param(
    [Hashtable]$parameters
)

$parameters.appfile | Out-Host

$systemAppFile = $parameters.appfile | Where-Object { [System.IO.Path]::GetFileName($_) -like "Microsoft_System Application_*.*.*.*.app" }
$ModulesTestApps = $parameters.appfile | Where-Object { [System.IO.Path]::GetFileName($_) -like "Modules-main-TestApps-*.*.*.*.zip" }
if ($systemAppFile) {
    $includeOnlyAppIds = $parameters.includeOnlyAppIds
    $remainingAppFiles = $parameters.appfile | Where-Object { $_ -ne $systemAppFile }
    $parameters.AppFile = $systemAppFile
    $parameters.includeOnlyAppIds = @()

    Publish-BcContainerApp @parameters

    Copy-Item -Path $systemAppFile -Destination (Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my")

    Write-Host "Publishing Base Application"
    $parameters.appFile = Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my\Microsoft_Base Application.app"
    Publish-BcContainerApp @parameters

    Write-Host "Publishing Application"
    $parameters.appFile = Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my\Microsoft_Application.app"
    Publish-BcContainerApp @parameters

    if ($remainingAppFiles) {
        $parameters.AppFile = $remainingAppFiles
        $parameters.includeOnlyAppIds = $includeOnlyAppIds
        Publish-BcContainerApp @parameters
    }
}
elseif ($ModulesTestApps) {
    $includeOnlyAppIds = $parameters.includeOnlyAppIds
    $parameters.includeOnlyAppIds = @()
    Publish-BcContainerApp @parameters

    Write-Host "Publishing Tests-TestLibraries"
    $parameters.includeOnlyAppIds = $includeOnlyAppIds
    $parameters.appFile = Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my\Microsoft_Tests-TestLibraries.app"
    Publish-BcContainerApp @parameters
}
else {
    Publish-BcContainerApp @parameters
}
