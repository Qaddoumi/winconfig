#TODO: add to main downloads
$PROGRAMS_ID = @(
    "Microsoft.PowerShell" # powershell 7
    "Microsoft.WindowsTerminal"
    "Git.Git"
    "JanDeDobbeleer.OhMyPosh" # powershell prompt
    "Microsoft.VisualStudioCode"
    "Nilesoft.Shell" #Powerfull context menu manager
    "RamenSoftware.Windhawk"
    "samlab-ws.SnappyDriverInstaller"
    "RevoUninstaller.RevoUninstaller"
    "Microsoft.Sysinternals.ProcessMonitor"
)

foreach($program in $PROGRAMS_ID){
    $installArgs = "install --exact --id $program  --source winget --accept-package-agreements --accept-source-agreements --scope Machine"
    $process = Start-Process -FilePath "winget" -ArgumentList $installArgs -NoNewWindow -PassThru
    $process.WaitForExit()
}

& .\Install-NetBalancer.ps1

Write-Output "`n================================================================"
Write-Output "`n   === Refresh Environment Variabels : ===`n"
& ..\Global\RefreshEnvironmentVariabels.ps1
