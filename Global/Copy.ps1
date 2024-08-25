function Copy-FileOrFolder {
    <#
    .EXAMPLE
    Copy-FileOrFolder -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents"
    Copy-FileOrFolder -sourcePath ".\ProcessMonitor(procmon)\Filter(SetReg).PMF" -destinationPath "$Env:USERPROFILE\Documents\Filter(SetReg).PMF"
    #>
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
        }
        else {
            # It's a file, create the destination folder if it does not exist
            $destinationFolder = Split-Path -Parent $destinationPath
            if (-not (Test-Path -Path $destinationFolder)) {
                New-Item -ItemType Directory -Path $destinationFolder
            }
            # Copy the file
            Copy-Item -Path $sourcePath -Destination $destinationPath -Force
            Write-Output "File copied successfully from $sourcePath to $destinationPath."
        }
    }
    else {
        Write-Output "Source path $sourcePath does not exist."
    }
}