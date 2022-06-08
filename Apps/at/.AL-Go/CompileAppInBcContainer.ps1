Param(
    [Hashtable] $parameters
)

$appFile = Compile-AppInBcContainer @parameters

if ($appFile) {
    $filename = [System.IO.Path]::GetFileName($appFile)
    if ($filename -like "Microsoft_System Application_*.*.*.*.app") {
        # System application compiled - add BaseApp and Application app from container to output
        Invoke-ScriptInBcContainer -containerName $parameters.ContainerName -scriptblock { Param([string]$packagesFolder)
            $baseApp = "C:\Applications.*\Microsoft_Base Application_*.*.*.*.app"
            $applicationApp = "C:\Applications.*\Microsoft_Application_*.*.*.*.app"
            $testLibrariesApp = "C:\Applications.*\Microsoft_Tests-TestLibraries_*.*.*.*.app"
            if (-not (Test-Path $baseApp)) {
                $baseApp = "C:\Applications\BaseApp\Source\Microsoft_Base Application.app"
            }
            if (-not (Test-Path $applicationApp)) {
                $applicationApp = "C:\Applications\Application\Source\Microsoft_Application.app"
            }
            if (-not (Test-Path $testLibrariesApp)) {
                $testLibrariesApp = "C:\Applications\BaseApp\Source\Microsoft_Base Application.app"
            }
            Write-Host "Copying Base Application to packages path"
            Copy-Item -Path $baseApp -Destination (Join-Path $packagesFolder "Microsoft_Base Application.app")
            Copy-Item -Path $baseApp -Destination "c:\run\my\Microsoft_Base Application.app"
            
            Write-Host "Copying Application to packages path"
            Copy-Item -Path $applicationApp -Destination (Join-Path $packagesFolder "Microsoft_Application.app")
            Copy-Item -Path $applicationApp -Destination "c:\run\my\Microsoft_Application.app"

            Write-Host "Copying Tests-TestLibraries to packages path"
            Copy-Item -Path $testLibrariesApp -Destination (Join-Path $packagesFolder "Microsoft_Tests-TestLibraries.app")
            Copy-Item -Path $testLibrariesApp -Destination "c:\run\my\Microsoft_Tests-TestLibraries.app"
        } -argumentList (Get-BcContainerPath -ContainerName $parameters.ContainerName -path $Parameters.appSymbolsFolder)
    }
}
$appFile
