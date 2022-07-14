Param(
    [Hashtable] $parameters
)

$appFile = Compile-AppInBcContainer @parameters

if ($appFile) {
    $filename = [System.IO.Path]::GetFileName($appFile)
    if ($filename -like "Microsoft_System Application_*.*.*.*.app") {
        # System application compiled - add BaseApp and Application app from container to output
        Invoke-ScriptInBcContainer -containerName $parameters.ContainerName -scriptblock { Param([string]$packagesFolder)
            function CopyApp {
                Param(
                    [string] $localAppPath,
                    [string] $w1AppPath
                )

                $name = [System.IO.Path]::GetFileName($w1AppPath)
                Write-Host "Copying $name to packages path"
                if (Test-Path $localAppPath) {
                    $appPath = $localAppPath
                }
                else {
                    $appPath = $w1AppPath
                }
                Copy-Item -Path $appPath -Destination (Join-Path $packagesFolder $name)
                Copy-Item -Path $appPath -Destination (Join-Path "c:\run\my" $name)
            }

            CopyApp -localAppPath "C:\Applications.*\Microsoft_Base Application_*.*.*.*.app"    -w1AppPath "C:\Applications\BaseApp\Source\Microsoft_Base Application.app"
            CopyApp -localAppPath "C:\Applications.*\Microsoft_Application_*.*.*.*.app"         -w1AppPath "C:\Applications\Application\Source\Microsoft_Application.app" 
            CopyApp -localAppPath "C:\Applications.*\Microsoft_Tests-TestLibraries_*.*.*.*.app" -w1AppPath "C:\Applications\BaseApp\Test\Microsoft_Tests-TestLibraries.app"
            CopyApp -localAppPath "C:\Applications.*\Microsoft_Tests-SMB_*.*.*.*.app"           -w1AppPath "C:\Applications\BaseApp\Test\Microsoft_Tests-SMB.app"
            CopyApp -localAppPath "C:\Applications.*\Microsoft_Tests-Misc_*.*.*.*.app"          -w1AppPath "C:\Applications\BaseApp\Test\Microsoft_Tests-Misc.app"
        } -argumentList (Get-BcContainerPath -ContainerName $parameters.ContainerName -path $Parameters.appSymbolsFolder)
    }
    if ($filename -like "Microsoft_Any.app" -or $filename -like "Microsoft_Any_*.*.*.*.app" -or
            $filename -like "Microsoft_System Application.app" -or $filename -like "Microsoft_System Application_*.*.*.*.app" -or
            $filename -like "Microsoft_Library Assert.app" -or $filename -like "Microsoft_Library Assert_*.*.*.*.app" -or
            $filename -like "Microsoft_Permissions Mock.app" -or $filename -like "Microsoft_Permissions Mock_*.*.*.*.app" -or
            $filename -like "Microsoft_Library Variable Storage.app" -or $filename -like "Microsoft_Library Variable Storage_*.*.*.*.app" -or
            $filename -like "Microsoft_System Application Test Library.app" -or $filename -like "Microsoft_System Application Test Library_*.*.*.*.app" -or
            $filename -like "Microsoft_Test Runner.app" -or $filename -like "Microsoft_Test Runner_*.*.*.*.app") {
        Write-Host "Copying $appFile to my folder"
        Copy-Item -Path $appfile -Destination (Join-Path $bcContainerHelperConfig.hostHelperFolder "Extensions\$($parameters.ContainerName)\my") -Force
    }
}

$appFile
