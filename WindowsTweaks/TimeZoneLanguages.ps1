# to check run Get-InstalledLanguage
Install-Language -Language en-US
Install-Language -Language ar-SA

# # Download and install Arabic language pack and basic typing features
# $LanguagePacks = Get-WindowsCapability -Online | Where-Object Name -like "*Language*Arab*"

# Add-WindowsCapability -Online -Name Language.Basic~~~ar-SA~0.0.1.0
# Add-WindowsCapability -Online -Name Language.Handwriting~~~ar-SA~0.0.1.0
# Add-WindowsCapability -Online -Name Language.OCR~~~ar-SA~0.0.1.0
# Add-WindowsCapability -Online -Name Language.Speech~~~ar-SA~0.0.1.0
# Add-WindowsCapability -Online -Name Language.TextToSpeech~~~ar-SA~0.0.1.0

# Set timezone
Get-TimeZone -ListAvailable | Where-Object { $_.DisplayName -like "*Amman*" } | Set-TimeZone

# Set system language
Set-WinSystemLocale "en-US"
Set-SystemPreferredUILanguage -Language en-US
# Set keyboard languages
Set-WinUserLanguageList "en-us", "ar-SA" -force -wa Continue
# Set home location of the current user account ( 244 ==> US )
Set-WinHomeLocation 244

# Copies the current user's international settings (Windows Display language, Input language, Regional Format/locale, and Location/GeoID) both of the following:
# Welcome screen and system accounts
# New user accounts
Copy-UserInternationalSettingsToSystem -WelcomeScreen $True -NewUser $True

# Set time and date format
# this line does not work in build in powershell
#Get-Culture -ListAvailable | Where-Object { $_.DisplayName -like "*English*Canada*" } | Set-Culture
Set-Culture en-CA