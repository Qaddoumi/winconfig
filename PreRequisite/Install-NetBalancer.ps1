function Install-NetBalancer {
    Write-Host "Installing NetBalancer" -ForegroundColor Green
    $url = "https://netbalancer.com/downloads/NetBalancerSetup.exe"
    $downloadPath = "$env:TEMP\NetBalancerSetup.exe"

    try {
        # Download the setup file
        Write-Host "Downloading NetBalancer setup..."
        Invoke-WebRequest -Uri $url -OutFile $downloadPath

        # Install NetBalancer silently with additional options
        Write-Host "Installing NetBalancer..."
        Start-Process -FilePath $downloadPath -ArgumentList "/SILENT", "/SUPPRESSMSGBOXES", "/SP-", "/NORESTART", "/NOCANCEL", "/CLOSEAPPLICATIONS", "/LANG=en" -Wait

        # Confirm installation
        Write-Host "NetBalancer installation completed."

        # Clean up the setup file
        Remove-Item -Path $downloadPath -Force

    }
    catch {
        Write-Error "Failed to install NetBalancer: $_"
    }
}

Install-NetBalancer