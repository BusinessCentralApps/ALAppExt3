Param(
    [Hashtable]$parameters
)

$parameters.appfile | Out-Host
$parameters.syncMode = "ForceSync"

Publish-BcContainerApp @parameters
