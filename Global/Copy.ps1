function Copy-FileOrFolder {
    <#
    .EXAMPLE
    Copy-FileOrFolder -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents" -Overwrite $false
    Copy-FileOrFolder -sourcePath ".\ProcessMonitor(procmon)\Filter(SetReg).PMF" -destinationPath "$Env:USERPROFILE\Documents\Filter(SetReg).PMF"
    #>
    param (
        [string]$sourcePath,
        [string]$destinationPath,
        [bool]$Overwrite = $true
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

            # Copy the folder recursively with consideration for the overwrite option
            $sourceItems = Get-ChildItem -Path $sourcePath -Recurse
            foreach ($sourceItem in $sourceItems) {
                $relativePath = $sourceItem.FullName.Substring($sourcePath.Length).TrimStart('\')
                $destItemPath = Join-Path -Path $destinationPath -ChildPath $relativePath

                if ($sourceItem.PSIsContainer) {
                    # Create the folder if it does not exist
                    if (-not (Test-Path -Path $destItemPath)) {
                        New-Item -ItemType Directory -Path $destItemPath
                    }
                }
                else {
                    # Check if the file already exists at the destination
                    if ($Overwrite -or -not (Test-Path -Path $destItemPath)) {
                        Copy-Item -Path $sourceItem.FullName -Destination $destItemPath -Force
                        Write-Output "File copied: $destItemPath"
                    }
                    else {
                        Write-Output "File exists and was not copied: $destItemPath"
                    }
                }
            }
            Write-Output "Folder copied successfully from $sourcePath to $destinationPath."
        }
        else {
            # It's a file, create the destination folder if it does not exist
            $destinationFolder = Split-Path -Parent $destinationPath
            if (-not (Test-Path -Path $destinationFolder)) {
                New-Item -ItemType Directory -Path $destinationFolder
            }
            # Copy the file
            if ($Overwrite -or -not (Test-Path -Path $destinationPath)) {
                Copy-Item -Path $sourcePath -Destination $destinationPath -Force
                Write-Output "File copied successfully from $sourcePath to $destinationPath."
            }
            else {
                Write-Output "File at $destinationPath already exists and will not be overwritten."
            }
        }
    }
    else {
        Write-Output "Source path $sourcePath does not exist."
    }
}