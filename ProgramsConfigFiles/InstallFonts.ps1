# Function to get the latest release URL for MesloLGS Nerd Font from GitHub
function Get-LatestMesloLGSFontUrl {
    $apiUrl = "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest"
    $releaseInfo = Invoke-RestMethod -Uri $apiUrl -Headers @{"User-Agent" = "PowerShell"}
    $asset = $releaseInfo.assets | Where-Object { $_.name -eq "Meslo.zip" }
    return $asset.browser_download_url
}

# Function to check if the font is already installed
function Test-FontInstalled {
    $fontFiles = @("MesloLGLNerdFont-Regular.ttf", "MesloLGLNerdFont-Bold.ttf", "MesloLGLNerdFont-Italic.ttf", "MesloLGLNerdFont-BoldItalic.ttf")
    $fontsFolder = "$env:SystemRoot\\Fonts"
    
    foreach ($fontFile in $fontFiles) {
        if (-not (Test-Path -Path (Join-Path -Path $fontsFolder -ChildPath $fontFile))) {
            return $false
        }
    }
    return $true
}

function CheckIfTheUserWantToContinue {
    $Prompt = " Do you want to reinstall it`? ``(y/N``) :"
    $TimeoutSeconds = 7
    $DefaultValue  = "N"
    $userInput = $DefaultValue
    $OutputFile = "$env:TEMP\userinput.txt"

    # Create a job for the timeout
    $timeoutJob = Start-Job -ScriptBlock {
        param ($timeout, $defaultValue)
        Start-Sleep -Seconds $timeout
        return $defaultValue
    } -ArgumentList $TimeoutSeconds, $DefaultValue

    $command = "Write-Host `"$Prompt `" -NoNewline;`$UserInput = (Read-Host).Trim();if ([string]::IsNullOrWhiteSpace(`$UserInput)) {`$UserInput = `"$DefaultValue`"}`$UserInput = `$UserInput.ToLower();`$UserInput | Out-File -FilePath `"$OutputFile`" -NoNewline"

    # Start the process with the command
    $process = Start-Process pwsh -NoNewWindow -PassThru -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"$command`""

    while ($true) {
        if($process.HasExited){
            if (Test-Path $OutputFile) {
                $userInput = Get-Content $OutputFile -Raw
            }
            Write-Host "Choosing : $userInput"
            break
        }
        if (Get-Job -Id $timeoutJob.Id | Where-Object { $_.State -eq 'Completed' }) {
            Stop-Process -Id $process.Id  -PassThru -Force
            $userInput = $DefaultValue
            Write-Host "`nTimed out. Using default value: $userInput"
            break
        }
        Start-Sleep -Milliseconds 100
    }

    Stop-Job -Id $timeoutJob.Id | Out-Null
    Remove-Job -Id $timeoutJob.Id | Out-Null

    # Clean up the temporary file
    if (Test-Path $OutputFile) {
        Remove-Item $OutputFile -Force
    }

    Start-Sleep -Seconds 2
    return $userInput.ToLower()
}

# Check if the font is already installed
if (Test-FontInstalled) {
    Write-Host "The Meslo LG Nerd Font is already installed." -NoNewline
    . "..\Global\TimeoutInput.ps1"

    $userInput = TimeoutInput -Prompt " Do you want to reinstall it? ``(y/N``) :" -TimeoutSeconds 5 -DefaultValue "N"

    if ($userInput -ne "y") {
        Write-Output "Installation aborted."
        exit
    }
}

# Get the latest MesloLGS Nerd Font URL
$fontUrl = Get-LatestMesloLGSFontUrl
if (-not $fontUrl) {
    Write-Output "Could not retrieve the latest MesloLGS Nerd Font URL."
    exit
}

# Define the destination path for the downloaded zip file
$zipFilePath = "$env:TEMP\\Meslo.zip"
# Define the extraction path
$extractPath = "$env:TEMP\\MesloNerdFont"

# Download the font zip file
Invoke-WebRequest -Uri $fontUrl -OutFile $zipFilePath

# Create the extraction directory if it does not exist
if (-not (Test-Path -Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath
}

# Extract the zip file
Expand-Archive -Path $zipFilePath -DestinationPath $extractPath -Force

# Get the list of font files
$fontFiles = Get-ChildItem -Path $extractPath -Filter "*.ttf"

# Define the system fonts directory
$fontsFolder = "$env:SystemRoot\\Fonts"

# Copy the font files to the system fonts directory
foreach ($fontFile in $fontFiles) {
    $fontFilePath = $fontFile.FullName
    $fontFileName = $fontFile.Name
    $destinationPath = Join-Path -Path $fontsFolder -ChildPath $fontFileName
    Copy-Item -Path $fontFilePath -Destination $destinationPath -Force

    # Register the font in the system
    $fontRegKey = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts"
    $fontRegName = $fontFileName
    New-ItemProperty -Path $fontRegKey -Name $fontRegName -Value $fontFileName -PropertyType String -Force
    $fontRegKey = "HKCU:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts"
    New-ItemProperty -Path $fontRegKey -Name $fontRegName -Value $fontFileName -PropertyType String -Force
}

# Clean up
Remove-Item -Path $zipFilePath -Force
Remove-Item -Path $extractPath -Recurse -Force

Write-Output "Meslo LG Nerd Font installed successfully."
