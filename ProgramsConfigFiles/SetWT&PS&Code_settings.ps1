Write-Output "`nInstalling required fonts :`n"
& .\InstallFonts.ps1

Write-Output "`n================================================================"

Write-Output "`nChange Default Terminal To Windows Terminal`n"
& .\ChangeDefaultTerminal.ps1

Write-Output "`n================================================================"

# Installing NuGet in using BuildIn powershell
& .\InstallNuGet.ps1

Write-Output "`n================================================================"

Write-Output "`nInstalling PowerShell Modules :"

Write-Output "`nInstalling Terminal-Icons Module"
Install-Module -Name Terminal-Icons -AllowClobber -Force -Repository PSGallery
Write-Output "Installing PSReadLine Module"
Install-Module -Name PSReadLine -AllowClobber -Force -Repository PSGallery
Write-Output "Installing z Module"
Install-Module -Name z -AllowClobber -Force -Repository PSGallery

Write-Output "`nInstalling Modules Finished"

Write-Output "`n================================================================"
# Run to get the extension:
# code --list-extensions > vscode-extensions.txt
Write-Host "Installing VSCode Extension`n" -ForegroundColor Green
. ".\vscode-extensions.ps1"
foreach ($extension in $VSCode_Extensions) {
    try{
        $process = Start-Process code -ArgumentList "--install-extension $extension --force" -Wait -NoNewWindow -PassThru
        if($process.ExitCode -eq 0){
            Write-Host "Installing $extension done successfully, ExitCode : $($process.ExitCode)" -ForegroundColor Cyan
        }
        else{
            Write-Host "Failed installing $extension : ExitCode $($process.ExitCode)" -ForegroundColor Yellow
        }
    }catch{
        Write-Warning "installing error Message : $PSItem"
    }
    Write-Host ""
}

Write-Output "`n================================================================"

Write-Output "`nCoping Settings Files : `n"

function Copy-ItemWithCheck {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )

    # Check if the source path exists
    if (Test-Path -Path $sourcePath) {
        # Determine if the source path is a file or a folder
        $item = Get-Item -Path $sourcePath
        if ($item.PSIsContainer) {
            # It's a folder, create the destination folder if it does not exist
            if (-not (Test-Path -Path $destinationPath)) {
                New-Item -ItemType Directory -Path $destinationPath
            }
            # Copy the folder recursively
            Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
            Write-Output "Folder copied successfully from $sourcePath to $destinationPath."
        } else {
            # It's a file, create the destination folder if it does not exist
            $destinationFolder = Split-Path -Parent $destinationPath
            if (-not (Test-Path -Path $destinationFolder)) {
                New-Item -ItemType Directory -Path $destinationFolder
            }
            # Copy the file
            Copy-Item -Path $sourcePath -Destination $destinationPath -Force
            Write-Output "File copied successfully from $sourcePath to $destinationPath."
        }
    } else {
        Write-Output "Source path $sourcePath does not exist."
    }
}

Copy-ItemWithCheck -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents"
Copy-ItemWithCheck -sourcePath ".\WindowsTerminal\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-ItemWithCheck -sourcePath ".\VSCode\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Roaming\Code\User\settings.json"
$items = Get-ChildItem -Path ".\ProgramsConfigFiles\Shell" | ForEach-Object { $PSItem.Name.Trim() }
foreach ($item in $items) {
    Copy-ItemWithCheck -sourcePath ".\Shell\$item" -destinationPath "$Env:ProgramFiles\Nilesoft Shell\$item"
}
# TODO: copy procmon to Documents