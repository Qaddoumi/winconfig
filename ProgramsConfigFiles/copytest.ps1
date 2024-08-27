Write-Output "`n================================================================"

Write-Output "`nCoping Settings Files : `n"

. "..\Global\Copy.ps1"

Copy-FileOrFolder -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents"
Copy-FileOrFolder -sourcePath ".\WindowsTerminal\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-FileOrFolder -sourcePath ".\VSCode\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Roaming\Code\User\settings.json"
$items = Get-ChildItem -Path ".\Shell" | ForEach-Object { $PSItem.Name.Trim() }
foreach ($item in $items) {
    if ($item.Contains(".nss")) { Copy-FileOrFolder -sourcePath ".\Shell\$item" -destinationPath "$Env:ProgramFiles\Nilesoft Shell\$item" }
    else { Copy-FileOrFolder -sourcePath ".\Shell\$item" -destinationPath "$Env:ProgramFiles\Nilesoft Shell" }
}
Copy-FileOrFolder -sourcePath ".\ProcessMonitor(procmon)\Filter(SetReg).PMF" -destinationPath "$Env:USERPROFILE\Documents\Filter(SetReg).PMF"
