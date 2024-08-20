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

