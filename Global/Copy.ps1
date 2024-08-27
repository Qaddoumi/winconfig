function Copy-FileOrFolder {
    <#
    .EXAMPLE
    Copy-FileOrFolder -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents" -Overwrite $false
    Copy-FileOrFolder -sourcePath ".\ProcessMonitor(procmon)\Filter(SetReg).PMF" -destinationPath "$Env:USERPROFILE\Documents\Filter(SetReg).PMF"
    #>
    param (
        [Parameter(Mandatory = $true)]
        [string]$sourcePath,
        [Parameter(Mandatory = $true)]
        [string]$destinationPath,
        [bool]$Overwrite = $true
    )

    # Resolve relative paths to absolute paths
    $sourcePath = (Resolve-Path -Path $sourcePath).Path
    $destinationPath = (Resolve-Path -Path $destinationPath).Path

    # Check if the source path exists
    if (Test-Path -Path $sourcePath) {
        # Determine if the source path is a file or a folder
        $item = Get-Item -Path $sourcePath
        if ($item.PSIsContainer) {
            # Create the destination folder with the source folder name inside
            $finalDestinationPath = Join-Path -Path $destinationPath -ChildPath (Split-Path -Leaf $sourcePath)
            if (-not (Test-Path -Path $finalDestinationPath)) {
                New-Item -ItemType Directory -Path $finalDestinationPath
            }

            # Copy the folder recursively with consideration for the overwrite option
            $sourceItems = Get-ChildItem -Path $sourcePath -Recurse
            foreach ($sourceItem in $sourceItems) {
                $relativePath = $sourceItem.FullName.Substring($sourcePath.Length).TrimStart('\\')
                $destItemPath = Join-Path -Path $finalDestinationPath -ChildPath $relativePath

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
            Write-Output "Folder copied successfully from $sourcePath to $finalDestinationPath."
        }
        else {
            # It's a file, create the destination folder if it does not exist
            $destinationFolder = Split-Path -Parent $destinationPath
            if (-not (Test-Path -Path $destinationFolder)) {
                New-Item -ItemType Directory -Path $destinationFolder
            }
            # Copy the file with or without overwrite option
            if ($Overwrite) {
                Copy-Item -Path $sourcePath -Destination $destinationPath -Force
                Write-Output "File copied successfully from $sourcePath to $destinationPath."
            }
            elseif (-not (Test-Path -Path $destinationPath)) {
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