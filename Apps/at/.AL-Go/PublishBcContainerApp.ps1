Param(
    [Hashtable]$parameters
)

$parameters.appfile | Out-Host
#
#$systemAppFile = $parameters.appfile | Where-Object { [System.IO.Path]::GetFileName($_) -like "Microsoft_System Application_*.*.*.*.app" }
#if ($systemAppFile) {
#    if (!$parameters.ContainsKey('includeOnlyAppIds')) {
#        $parameters.includeOnlyAppIds = @()
#    }
#    if (!$parameters.ContainsKey('SkipVerification')) {
#        $parameters.SkipVerification = $false
#    }
#    $includeOnlyAppIds = $parameters.includeOnlyAppIds
#    $skipVerification = $parameters.SkipVerification
#    $remainingAppFiles = $parameters.appfile | Where-Object { $_ -ne $systemAppFile }
#    $parameters.AppFile = $systemAppFile
#    $parameters.includeOnlyAppIds = @()
#
#    Publish-BcContainerApp @parameters
#
#    Copy-Item -Path $systemAppFile -Destination (Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my")
#
#    Write-Host "Publishing Base Application"
#    $parameters.SkipVerification = $true
#    $parameters.appFile = Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my\Microsoft_Base Application.app"
#    Publish-BcContainerApp @parameters
#
#    Write-Host "Publishing Application"
#    $parameters.appFile = Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my\Microsoft_Application.app"
#    Publish-BcContainerApp @parameters
#
#    if ($remainingAppFiles) {
#        $parameters.AppFile = $remainingAppFiles
#        $parameters.includeOnlyAppIds = $includeOnlyAppIds
#        $parameters.SkipVerification = $skipVerification
#        Publish-BcContainerApp @parameters
#    }
#}
#else {
    Publish-BcContainerApp @parameters
#}
