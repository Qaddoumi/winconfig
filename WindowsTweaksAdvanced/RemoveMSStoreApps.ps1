Write-Host "Remove ALL MS Store Apps - NOT RECOMMENDED" -ForegroundColor Green
Write-Host "USE WITH CAUTION!!!!! This will remove ALL Microsoft store apps other than the essentials to make winget work. Games installed by MS Store ARE INCLUDED!" -ForegroundColor DarkYellow
## Run to get all packages
# Get-AppxPackage | Select {$_.Name}
# Get-AppxProvisionedPackage -Online | Select { $_.DisplayName }
$Appx = @(
    "Microsoft.Microsoft3DViewer"
    "Microsoft.AppConnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.BingSearch"
    # "Microsoft.WindowsCamera"
    "Microsoft.549981C3F5F10" # Cortana
    "Clipchamp.Clipchamp"
    "Microsoft.DevHome"
    "Microsoft.MinecraftUWP"
    "Microsoft.GamingServices"
    "Microsoft.GamingApp"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.News"
    "Microsoft.Office.Lens"
    "Microsoft.Office.Sway"
    "Microsoft.Office.OneNote"
    "Microsoft.OutlookForWindows"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Todos"
    "Microsoft.Wallet"
    #"Microsoft.Whiteboard"
    #"Microsoft.WindowsAlarms" # Windows Clock
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    #"Microsoft.YourPhone"
    #"Microsoft.WindowsSoundRecorder"
    "Microsoft.XboxApp"
    "Microsoft.ConnectivityStore"
    #"Microsoft.ScreenSketch" # Snipping Tool
    # "Microsoft.MicrosoftStickyNotes"
    "Microsoft.Xbox.TCUI"
    #"Microsoft.XboxGameOverlay"
    #"Microsoft.XboxGamingOverlay"
    "Microsoft.XboxGameCallableUI"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.PowerAutomateDesktop"
    "MicrosoftCorporationII.QuickAssist"
    "Microsoft.MixedReality.Portal"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.Getstarted"
    "Microsoft.MicrosoftOfficeHub"
    "EclipseManager"
    "ActiproSoftwareLLC"
    "AdobeSystemsIncorporated.AdobePhotoshopExpress"
    "Duolingo-LearnLanguagesforFree"
    "PandoraMediaInc"
    "CandyCrush"
    "BubbleWitch3Saga"
    "Wunderlist"
    "Flipboard"
    "Twitter"
    "Facebook"
    "Royal Revolt"
    "Sway"
    "Speed Test"
    "Dolby"
    "Viber"
    "ACGMediaPlayer"
    "Netflix"
    "OneCalendar"
    "LinkedInforWindows"
    "Spotify"
    "Linkedin"
    "HiddenCityMysteryofShadows"
    "Hulu"
    "HiddenCity"
    "AdobePhotoshopExpress"
    "HotspotShieldFreeVPN"
    "Microsoft.Advertising.Xaml"
)
# Create a new PowerShell session in Windows PowerShell
$session = New-PSSession -UseWindowsPowerShell

foreach ($appx_item in $Appx) {
    # Run the Appx removal code in this session
    Invoke-Command -Session $session -ArgumentList $appx_item -ScriptBlock {
        param ($AppxName)
        function Remove-APPX {
            <#
            .SYNOPSIS
                Removes all APPX packages that match the given name
            .PARAMETER Name
                The name of the APPX package to remove
            .EXAMPLE
                Remove-APPX -Name "Microsoft.Microsoft3DViewer"
            #>
            param (
                [Parameter(Mandatory = $true)]
                [string]$Name
            )
            Try {
                Write-Host "Checking if '*$Name*' is installed" -ForegroundColor Cyan
                
                $appxPackage = Get-AppxPackage "*$Name*" -allusers
                if ($appxPackage) {
                    Write-Host "Removing '*$Name*'" -ForegroundColor Cyan
                    Write-Host "AppxPackage Name : $($appxPackage.Name)" -ForegroundColor Cyan
                    $appxPackage | Remove-AppxPackage -allusers -ErrorAction SilentlyContinue
                }

                $provisionedPackage = Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$Name*"
                if ($provisionedPackage) {
                    Write-Host "Removing '*$Name*'" -ForegroundColor Cyan
                    Write-Host "AppxProvisionedPackage DisplayName : $($provisionedPackage.DisplayName)" -ForegroundColor Cyan
                    $provisionedPackage | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
                }

                if($null -eq $appxPackage -and $null -eq $provisionedPackage){
                    Write-Host "$Name not found." -ForegroundColor Yellow
                }
            }
            Catch {
                Write-Host "Failed to remove $Name" -ForegroundColor Red
            }
        }
        # Call the function with the package name
        Remove-APPX -Name $AppxName
    }
}
# Remove the session
$session | Remove-PSSession
