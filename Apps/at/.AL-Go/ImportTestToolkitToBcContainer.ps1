Param(
    [hashtable] $parameters
)

$testToolkitApps = Get-ChildItem -Path (Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my\testtoolkit") -Filter "*.app" | ForEach-Object { $_.FullName }
Publish-BcContainerApp -ContainerName $parameters.containerName -tenant default -credential $parameters.credential -appfile $testToolkitApps -sync -install -skipverification
