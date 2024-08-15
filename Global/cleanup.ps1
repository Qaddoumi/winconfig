# TODO: Implement this
function Cleanup {
    <#
        .SYNOPSIS
            Deletes a file or directory specified without prompting for confirmation or displaying errors.

        .DESCRIPTION
            This function takes a path to a file or directory and deletes it without prompting for confirmation or displaying errors.
            If the path is a directory, the function will delete the directory and all its contents.

        .PARAMETER Path
            The path of the file or directory to be deleted.

        .PARAMETER Recurse
            If the path is a directory, this switch specifies whether to delete the directory and all its contents.

        .EXAMPLE
            Cleanup -Path "C:\Temp"
            This example deletes the directory "C:\Temp" and all its contents.

        .EXAMPLE
            Cleanup -Path "C:\Temp" -Recurse
            This example deletes the directory "C:\Temp" and all its contents.

        .EXAMPLE
            Cleanup -Path "C:\Temp\file.txt"
            This example deletes the file "C:\Temp\file.txt".
    #>
    param (
        [string]$Path,
        [switch]$Recurse
    )

    try {
        if (Test-Path -Path $Path) {
            if ($Recurse -and (Get-Item -Path $Path) -is [System.IO.DirectoryInfo]) {
                Get-ChildItem -Path $Path -Recurse | Remove-Item -Force -Recurse
                Remove-Item -Path $Path -Force -Recurse
            } else {
                Remove-Item -Path $Path -Force
            }
        }
        if ($DebugMode) {
            Write-Output "Deleted: $Path"
        }
    } catch {
        Write-Warning $PSItem.PSMessageDetails
    }
}