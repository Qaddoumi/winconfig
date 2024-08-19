try {
    # Get the current process ID
    $currentProcessId = $PID

    # Get the parent process ID using WMI
    $parentProcess = Get-WmiObject Win32_Process | Where-Object { $_.ProcessId -eq $currentProcessId }

    if ($parentProcess.ParentProcessId) {
        # Get the parent process name using the parent process ID
        $parentProcessName = (Get-Process -Id $parentProcess.ParentProcessId -ErrorAction Stop).Name

        if ($parentProcessName -eq "WindowsTerminal") {
            "Running inside Windows Terminal"
        }
        else {
            "Not running inside Windows Terminal"
        }
    }
    else {
        "Unable to determine parent process."
    }
}
catch {
    "Unable to determine parent process or process not found."
}
