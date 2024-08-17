Write-Host "Setting date, date format, timezone and location`n" -ForegroundColor Green
# to check run Get-InstalledLanguage
Write-Host "Installing the language pack for en-US" -ForegroundColor Cyan
Install-Language -Language en-US
Write-Host "`nInstalling the language pack for ar-SA" -ForegroundColor Cyan
Install-Language -Language ar-SA

# # Download and install Arabic language pack and basic typing features
# $LanguagePacks = Get-WindowsCapability -Online | Where-Object Name -like "*Language*Arab*"
Write-Host "`n adding Language.Basic~~~en-US~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.Basic~~~en-US~0.0.1.0
Write-Host " adding Language.Handwriting~~~en-US~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.Handwriting~~~en-US~0.0.1.0
Write-Host " adding Language.OCR~~~en-US~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.OCR~~~en-US~0.0.1.0
Write-Host " adding Language.Speech~~~en-US~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.Speech~~~en-US~0.0.1.0
Write-Host " adding Language.TextToSpeech~~~en-US~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.TextToSpeech~~~en-US~0.0.1.0

Write-Host "`n adding Language.Basic~~~ar-SA~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.Basic~~~ar-SA~0.0.1.0
Write-Host " adding Language.Handwriting~~~ar-SA~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.Handwriting~~~ar-SA~0.0.1.0
Write-Host " adding Language.OCR~~~ar-SA~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.OCR~~~ar-SA~0.0.1.0
Write-Host " adding Language.Speech~~~ar-SA~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.Speech~~~ar-SA~0.0.1.0
Write-Host " adding Language.TextToSpeech~~~ar-SA~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.TextToSpeech~~~ar-SA~0.0.1.0
Write-Host " adding Language.Fonts.Arab~~~und-ARAB~0.0.1.0 " -ForegroundColor Cyan
Add-WindowsCapability -Online -Name Language.Fonts.Arab~~~und-ARAB~0.0.1.0


# Set timezone
Write-Host "Setting timezone to Jordan Standard Time (UTC+03:00)" -ForegroundColor Cyan
Get-TimeZone -ListAvailable | Where-Object { $_.DisplayName -like "*Amman*" } | Set-TimeZone

# Set system language
Write-Host "Setting the system locale to en-US" -ForegroundColor Cyan
Set-WinSystemLocale "en-US"
Write-Host "Setting the system-preferred UI language to en-US" -ForegroundColor Cyan
Set-SystemPreferredUILanguage -Language en-US
# Set keyboard languages
Write-Host "Setting the user language list, en-US and ar-SA" -ForegroundColor Cyan
Set-WinUserLanguageList "en-US", "ar-SA" -force -wa Continue
# Set home location of the current user account ( 244 ==> US )
Write-Host "Setting the home location for the current user account to 244 ==> US" -ForegroundColor Cyan
Set-WinHomeLocation 244

# Copies the current user's international settings (Windows Display language, Input language, Regional Format/locale, and Location/GeoID) both of the following:
# Welcome screen and system accounts
# New user accounts
Write-Host "Copying user international settings to system and new user accounts..." -ForegroundColor Cyan
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True

# Set time and date format
# this line does not work in build in powershell
#Get-Culture -ListAvailable | Where-Object { $_.DisplayName -like "*English*Canada*" } | Set-Culture
Write-Host "Setting the culture (time and date format) for the system to en-CA" -ForegroundColor Cyan
Set-Culture en-CA

Write-Host "`nSet Time to UTC (Dual Boot)" -ForegroundColor Cyan
$RegistrySettings = @{
    Name  = "RealTimeIsUniversal"
    Type  = "DWord"
    Path  = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    Value = "1"
}
. "..\Global\Set-Registry.ps1"
Set-Registry -Name $RegistrySettings.Name -Path $RegistrySettings.Path -Type $RegistrySettings.Type -Value $RegistrySettings.Value
