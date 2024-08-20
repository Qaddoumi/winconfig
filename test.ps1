# Define the app name to unpin
$appName = "Microsoft Edge"

# Get the shell object
$shell = New-Object -ComObject Shell.Application

# Get the Start menu folder
$startFolder = $shell.NameSpace('Shell:StartMenu')

# Iterate over the items in the Start menu
foreach ($item in $startFolder.Items()) {
    if ($item.Name -eq $appName) {
        # Invoke the unpin action
        $verb = $item.Verbs() | Where-Object { $_.Name -eq 'Unpin from Start' }
        if ($verb) {
            $verb.DoIt()
            Write-Host "$appName has been unpinned from the Start menu."
        }
        else {
            Write-Host "$appName is not pinned to the Start menu."
        }
    }
}

function New-ShortCut {
    [cmdletbinding()]
    Param
    (
        [parameter(Mandatory)]
        [ValidateScript({ Test-Path -path $_ })]
        [string] $sourceExe,

        [string]$Arguments,

        [ValidateScript({ (Test-Path -path $) -and ( (Get-Item -path $).PSIsContainer ) })]
        [string]$WorkingDirectory,

        [string] $DestinationLinkName = "{0}\temp.lnk" -f [environment]::GetFolderPath(“desktop”),

        [ValidateSet("Default", "Maximized", "Minimized")]
        [string]$WindowStyle = "Default",

        [ValidateScript({ Test-Path -path $_ })]
        [string]$IconPath,

        [ValidateScript({ $null -ne $IconPath })]
        [int]$IconIndexNumber,

        [string]$HotKeyString
    )

    $wshShell = New-Object -ComObject WScript.Shell

    $WindowStyles = @{
        Default   = 1
        Maximized = 3
        Minimized = 7
    }

    $shortcut = $wshShell.CreateShortcut( $DestinationLinkName )
    $shortcut.TargetPath = $sourceExe

    if ($arguments) { $shortcut.Arguments = $Arguments }
    if ($WorkingDirectory) { $shortcut.WorkingDirectory = $WorkingDirectory }
    if ($WindowStyle) { $shortcut.WindowStyle = $WindowStyles.$WindowStyle }
    if ($HotKeyString) { $shortcut.Hotkey = $HotKeyString }
    if ($IconPath) {
        if ($IconIndexNumber) {
            $shortcut.IconLocation = "{0},{1}" -f $IconPath, $IconIndexNumber
        }
        else {
            $shortcut.IconLocation = $IconPath
        }
    }

    try {
        $shortcut.Save()
    }
    catch {
        $_.Exception.Message
    }

    $null = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($wshShell)
}

.\New-ShortCut -sourceExe "c:\windows\System32\mmc.exe" -arguments "compmgmt.msc" -DestinationLinkName $env:userprofile\desktop\ComputerManagement.lnk
.\New-Shortcut -sourceExe "c:\windows\system32\windowspowershell\v1.0\powershell.exe" -DestinationLinkName $env:userprofile\desktop\powershell.lnk
