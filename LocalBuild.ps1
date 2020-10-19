# script runns a local version of the pipeline build yml

# Option to restore the nuget files before running the script
Param(
    # folderPath
    [Parameter()] [switch]
    $restoreNugetPackages
)

function Main()
{    
    # Optional - Restore nuget packges
    if($restoreNugetPackages)
    {
        Write-Host -ForegroundColor Cyan "Restoring nuget packges"
        RepoTemplate\build\cs\restore2019.cmd
        Write-Host "`n"
    }

    # Build
    Write-Host -ForegroundColor Cyan "Running Build"
    RepoTemplate\build\cs\build2019.cmd 'Any CPU'
    Write-Host "`n"

    # Build and Package App service
    Write-Host -ForegroundColor Cyan "Build and Package App service"
    RepoTemplate\build\cs\msbuild2019.cmd /t:Publish /p:Configuration=Release /p:CdpxPostSigning=true AppServicesPoc.sln
    Write-Host "`n"
}

try
{
    Main
    Write-Host -ForegroundColor Cyan "Script ended successfully at $(Get-Date)"
}
catch
{    
    Write-Warning "Script terminated unsuccessfully at $(Get-Date)"
}
