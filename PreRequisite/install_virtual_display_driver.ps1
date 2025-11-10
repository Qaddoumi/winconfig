# Run this script in a powershell with administrator rights (run as administrator)
[CmdletBinding()]
param(
    # Path to the driver folder (relative or absolute)
    [Parameter(Mandatory=$false)]
    [string]$DriverPath = ""
);

# Set default path if not provided
if ([string]::IsNullOrEmpty($DriverPath)) {
    $DriverPath = Join-Path $PSScriptRoot "Signed-Driver-v24.12.24-x64";
}

# Verify driver path exists
if (-not (Test-Path $DriverPath)) {
    Write-Error "Driver path not found: $DriverPath";
    exit 1;
}

# Verify required files exist
$catFile = Join-Path $DriverPath "mttvdd.cat";
$infFile = Join-Path $DriverPath "MttVDD.inf";

if (-not (Test-Path $catFile)) {
    Write-Error "Certificate file not found: $catFile";
    exit 1;
}

if (-not (Test-Path $infFile)) {
    Write-Error "Driver INF file not found: $infFile";
    exit 1;
}

# Verify nefconw is available
if (-not (Get-Command nefconw -ErrorAction SilentlyContinue)) {
    Write-Error "nefconw not found in PATH. Please install nefarius.nefcon via winget.";
    exit 1;
}

# Create temp directory for certificates
$tempDir = Join-Path $env:TEMP "VDDInstall";
$certsFolder = Join-Path $tempDir "ExportedCerts";
New-Item -ItemType Directory -Path $certsFolder -Force | Out-Null;

try {
    # Extract the SignPath certificates
    Write-Host "Extracting SignPath certificates..." -ForegroundColor Cyan;
    $catBytes = [System.IO.File]::ReadAllBytes($catFile);
    $certificates = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection;
    $certificates.Import($catBytes);

    # Write and store the driver certificates on local machine
    Write-Host "Installing driver certificates on local machine..." -ForegroundColor Cyan;
    foreach ($cert in $certificates) {
        $certFilePath = Join-Path -Path $certsFolder -ChildPath "$($cert.Thumbprint).cer";
        $certBytes = $cert.Export([System.Security.Cryptography.X509Certificates.X509ContentType]::Cert);
        [System.IO.File]::WriteAllBytes($certFilePath, $certBytes);
    
        # Skip Root store for non-root certs, only add to TrustedPublisher
        $output = & certutil -enterprise -addstore TrustedPublisher $certFilePath 2>&1;
        if ($LASTEXITCODE -ne 0) {
            Write-Warning "Certificate import warning for $($cert.Subject): $output";
        }
    }

    # Install VDD
    Write-Host "Installing Virtual Display Driver..." -ForegroundColor Cyan;
    Write-Host "Running: nefconw install `"$infFile`" `"Root\MttVDD`"" -ForegroundColor Gray;
    
    $output = & C:\Users\admin\AppData\Local\Microsoft\WinGet\Packages\Nefarius.nefcon_Microsoft.Winget.Source_8wekyb3d8bbwe\x64\nefconw.exe install $infFile "Root\MttVDD" 2>&1;
    # $output = & nefconw install $infFile "Root\MttVDD" 2>&1;
    $exitCode = $LASTEXITCODE;
    
    # Display the output from nefconw
    if ($output) {
        Write-Host "nefconw output:" -ForegroundColor Yellow;
        $output | ForEach-Object { Write-Host $_ };
    }
    
    if ($exitCode -ne 0) {
        throw "Driver installation failed with exit code: $exitCode";
    }

    Write-Host "Driver installation completed successfully!" -ForegroundColor Green;
}
catch {
    Write-Error "Installation failed: $_";
    Write-Host "`nTroubleshooting tips:" -ForegroundColor Yellow;
    Write-Host "1. Ensure you're running PowerShell as Administrator" -ForegroundColor Yellow;
    Write-Host "2. Check if the driver is already installed (run: nefconw list)" -ForegroundColor Yellow;
    Write-Host "3. Try uninstalling first (run: nefconw remove Root\MttVDD)" -ForegroundColor Yellow;
    Write-Host "4. Check Windows Event Viewer for driver installation errors" -ForegroundColor Yellow;
    exit 1;
}
finally {
    # Cleanup
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue;
}
