$RegistrySettings  = @(
    @{ Message = "Display full path in the title bar"
        Data = @(
            @{
                Name = "FullPath"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState"
                Value = "1"
            }
        )
    }
    @{ Message = "Show Drives With No Media"
        Data = @(
            @{
                Name = "HideDrivesWithNoMedia"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "1"
            }
        )
    }
    @{ Message = "Show protected operating system files"
        Data = @(
            @{
                Name = "ShowSuperHidden"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "1"
            }
        )
    }
    @{ Message = "Use check box to select items"
        Data = @(
            @{
                Name = "AutoCheckSelect"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "1"
            }
        )
    }
    @{ Message = "Show pin menu icon when pen in use"
        Data = @(
            @{
                Name = "PenWorkspaceButtonDesiredVisibility"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\PenWorkspace"
                Value = "1"
            }
        )
    }
    @{ Message = "Show touch keyboard icon"
        Data = @(
            @{
                Name = "TipbandDesiredVisibility"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\TabletTip\1.7"
                Value = "1"
            }
        )
    }
    @{ Message = "Set Start Layout to More pin"
        Data = @(
            @{
                Name = "Start_Layout"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "1"
            }
        )
    }
    @{ Message = "Show most used Apps"
        Data = @(
            @{
                Name = "ShowFrequentList"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Start"
                Value = "1"
            }
        )
    }
    @{ Message = "Show settings, Downloads, Pictures ... icon start menu"
        Data = @(
            @{
                Name = "VisiblePlaces"
                Type = "Binary"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Start"
                Value = [byte[]]@(0xbc ,0x24 ,0x8a ,0x14 ,0x0c ,0xd6 ,0x89 ,0x42 ,0xa0 ,0x80 ,0x6e ,0xd9 ,0xbb ,0xa2 ,0x48 ,0x82 ,0xce ,0xd5 ,0x34 ,0x2d ,0x5a ,0xfa ,0x43 ,0x45 ,0x82 ,0xf2 ,0x22 ,0xe6 ,0xea ,0xf7 ,0x77 ,0x3c ,0x2f ,0xb3 ,0x67 ,0xe3 ,0xde ,0x89 ,0x55 ,0x43 ,0xbf ,0xce ,0x61 ,0xf3 ,0x7b ,0x18 ,0xa9 ,0x37 ,0xa0 ,0x07 ,0x3f ,0x38 ,0x0a ,0xe8 ,0x80 ,0x4c ,0xb0 ,0x5a ,0x86 ,0xdb ,0x84 ,0x5d ,0xbc ,0x4d ,0xc5 ,0xa5 ,0xb3 ,0x42 ,0x86 ,0x7d ,0xf4 ,0x42 ,0x80 ,0xa4 ,0x93 ,0xfa ,0xca ,0x7a ,0x88 ,0xb5 ,0x86 ,0x08 ,0x73 ,0x52 ,0xaa ,0x51 ,0x43 ,0x42 ,0x9f ,0x7b ,0x27 ,0x76 ,0x58 ,0x46 ,0x59 ,0xd4 ,0x44 ,0x81 ,0x75 ,0xfe ,0x0d ,0x08 ,0xae ,0x42 ,0x8b ,0xda ,0x34 ,0xed ,0x97 ,0xb6 ,0x63 ,0x94)
            }
        )
    }
    @{ Message = "Disable Activity History" # This erases recent docs, clipboard, and run history
        Data = @(
            @{
                Name = "EnableActivityFeed"
                Type = "DWord"
                Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
                Value = "0"
            }
            @{
                Name = "PublishUserActivities"
                Type = "DWord"
                Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
                Value = "0"
            }
            @{
                Name = "UploadUserActivities"
                Type = "DWord"
                Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
                Value = "0"
            }
        )
    }
    @{ Message = "Enable Clipboard History 🪟+v"
        Data = @(
            @{
                Name = "EnableClipboardHistory"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Clipboard"
                Value = "1"
            }
        )
    }
    @{ Message = "Set autoplay to take no action"
        Data = @(
            @{
                Name = "(Default)"
                Type = "String"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\StorageOnArrival"
                Value = "MSTakeNoAction"
            }
            @{
                Name = "(Default)"
                Type = "String"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\StorageOnArrival"
                Value = "MSTakeNoAction"
            }
            @{
                Name = "(Default)"
                Type = "String"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\CameraAlternate\ShowPicturesOnArrival"
                Value = "MSTakeNoAction"
            }
            @{
                Name = "(Default)"
                Type = "String"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\CameraAlternate\ShowPicturesOnArrival"
                Value = "MSTakeNoAction"
            }
        )
    }
    @{ Message = "Setting Theme to Dart Mode"
        Data = @(
            @{
                Name = "AppsUseLightTheme"
                Type = "DWord"
                Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
                Value = 0
            }
            @{
                Name = "SystemUsesLightTheme"
                Type = "DWord"
                Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
                Value = 0
            }
            @{
                Name = "Wallpaper"
                Type = "String"
                Path = "HKCU:\Control Panel\Desktop"
                Value = "C:\Windows\web\wallpaper\Windows\img19.jpg"
            }
        )
    }
    @{ Message = "Disable Bing Search in start menu"
        Data = @(
            @{
                Name = "BingSearchEnabled"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
                Value = "0"
                OriginalValue = "1"
            }
        )
    }
    @{ Message = "Disabling Search Box TaskBar"
        Data = @(
            @{
                Name = "SearchboxTaskbarMode"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
                Value = "0"
            }
        )
    }
    @{ Message = "Show Hidden Files"
        Data = @(
            @{
                Name = "Hidden"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "1"
            }
        )
    }
    @{ Message = "Show Files Extention"
        Data = @(
            @{
                Name = "HideFileExt"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "0"
            }
        )
    }
    @{ Message = "Making Taskbar Alignment to the Left"
        Data = @(
            @{
                Name = "TaskbarAl"
                Type = "DWord"
                Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "0"
            }
        )
    }
    @{ Message = "Disable Taskbar Widgets"
        Data = @(
            @{
                Name = "TaskbarDa"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "0"
            }
            @{
                Name  = "AllowNewsAndInterests"
                Type = "DWord"
                Path  = "HKLM:\Software\Policies\Microsoft\Dsh"
                Value = "0"
            }
        )
    }
    @{ Message = "Enabling Task View"
        Data = @(
            @{
                Name = "ShowTaskViewButton"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "1"
            }
        )
    }
    @{ Message = "Disable Delivery Optimization"
        Data = @(
            @{
                Name = "DODownloadMode"
                Value = 1
                Type = "DWord"
                Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"
            }
            # @{
            #     Name = "RequestInfoType"
            #     Value = 0
            #     Type = "DWord"
            #     Path = "HKU:\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization"
            # }
            @{
                Name = "DownloadMode"
                Value = 0
                Type = "DWord"
                Path = "HKU:\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings"
            }
            @{
                Name = "DownloadModeProvider"
                Value = 0x8
                Type = "DWord"
                Path = "HKU:\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings"
            }
        )
    }
    @{ Message = "Set Taskbar Icons To None"
        Data = @(
            # @{ # Use if there is a pinned item
            #     Name = "FavoritesResolve"
            #     Value = [byte[]]@(0x33, 0x03, 0x00, 0x00, 0x4c, 0x00, 0x00, 0x00, 0x01, 0x14, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x83, 0x00, 0x80, 0x00, 0x20, 0x00, 0x00, 0x00, 0x18, 0x57, 0x24, 0xa2, 0x55, 0xd4, 0xda, 0x01, 0x59, 0xe0, 0x2d, 0xa2, 0x55, 0xd4, 0xda, 0x01, 0x5c, 0xf4, 0xe1, 0xfb, 0xd1, 0x61, 0xd8, 0x01, 0x97, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa0, 0x01, 0x3a, 0x00, 0x1f, 0x80, 0xc8, 0x27, 0x34, 0x1f, 0x10, 0x5c, 0x10, 0x42, 0xaa, 0x03, 0x2e, 0xe4, 0x52, 0x87, 0xd6, 0x68, 0x26, 0x00, 0x01, 0x00, 0x26, 0x00, 0xef, 0xbe, 0x12, 0x00, 0x00, 0x00, 0x6e, 0xbb, 0x31, 0x6c, 0x55, 0xd4, 0xda, 0x01, 0x78, 0x92, 0x1f, 0xa2, 0x55, 0xd4, 0xda, 0x01, 0xb8, 0x1b, 0x29, 0xa2, 0x55, 0xd4, 0xda, 0x01, 0x14, 0x00, 0x56, 0x00, 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0xec, 0x58, 0x55, 0x62, 0x11, 0x00, 0x54, 0x61, 0x73, 0x6b, 0x42, 0x61, 0x72, 0x00, 0x40, 0x00, 0x09, 0x00, 0x04, 0x00, 0xef, 0xbe, 0xec, 0x58, 0x55, 0x62, 0xec, 0x58, 0x55, 0x62, 0x2e, 0x00, 0x00, 0x00, 0x41, 0xb5, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0xe1, 0x12, 0x00, 0x54, 0x00, 0x61, 0x00, 0x73, 0x00, 0x6b, 0x00, 0x42, 0x00, 0x61, 0x00, 0x72, 0x00, 0x00, 0x00, 0x16, 0x00, 0x0e, 0x01, 0x32, 0x00, 0x97, 0x01, 0x00, 0x00, 0xa7, 0x54, 0x66, 0x2a, 0x20, 0x00, 0x46, 0x49, 0x4c, 0x45, 0x45, 0x58, 0x7e, 0x31, 0x2e, 0x4c, 0x4e, 0x4b, 0x00, 0x00, 0x7c, 0x00, 0x09, 0x00, 0x04, 0x00, 0xef, 0xbe, 0xec, 0x58, 0x55, 0x62, 0xec, 0x58, 0x55, 0x62, 0x2e, 0x00, 0x00, 0x00, 0x8f, 0xb8, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa4, 0x13, 0xa2, 0x00, 0x46, 0x00, 0x69, 0x00, 0x6c, 0x00, 0x65, 0x00, 0x20, 0x00, 0x45, 0x00, 0x78, 0x00, 0x70, 0x00, 0x6c, 0x00, 0x6f, 0x00, 0x72, 0x00, 0x65, 0x00, 0x72, 0x00, 0x2e, 0x00, 0x6c, 0x00, 0x6e, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x40, 0x00, 0x73, 0x00, 0x68, 0x00, 0x65, 0x00, 0x6c, 0x00, 0x6c, 0x00, 0x33, 0x00, 0x32, 0x00, 0x2e, 0x00, 0x64, 0x00, 0x6c, 0x00, 0x6c, 0x00, 0x2c, 0x00, 0x2d, 0x00, 0x32, 0x00, 0x32, 0x00, 0x30, 0x00, 0x36, 0x00, 0x37, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x22, 0x00, 0x00, 0x00, 0x1e, 0x00, 0xef, 0xbe, 0x02, 0x00, 0x55, 0x00, 0x73, 0x00, 0x65, 0x00, 0x72, 0x00, 0x50, 0x00, 0x69, 0x00, 0x6e, 0x00, 0x6e, 0x00, 0x65, 0x00, 0x64, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x12, 0x00, 0x00, 0x00, 0x2b, 0x00, 0xef, 0xbe, 0x06, 0x7e, 0x2b, 0xa2, 0x55, 0xd4, 0xda, 0x01, 0x1c, 0x00, 0x42, 0x00, 0x00, 0x00, 0x1d, 0x00, 0xef, 0xbe, 0x02, 0x00, 0x4d, 0x00, 0x69, 0x00, 0x63, 0x00, 0x72, 0x00, 0x6f, 0x00, 0x73, 0x00, 0x6f, 0x00, 0x66, 0x00, 0x74, 0x00, 0x2e, 0x00, 0x57, 0x00, 0x69, 0x00, 0x6e, 0x00, 0x64, 0x00, 0x6f, 0x00, 0x77, 0x00, 0x73, 0x00, 0x2e, 0x00, 0x45, 0x00, 0x78, 0x00, 0x70, 0x00, 0x6c, 0x00, 0x6f, 0x00, 0x72, 0x00, 0x65, 0x00, 0x72, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x9c, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x2d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9b, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xcc, 0xc6, 0x67, 0x2e, 0x10, 0x00, 0x00, 0x00, 0x00, 0x43, 0x3a, 0x5c, 0x55, 0x73, 0x65, 0x72, 0x73, 0x5c, 0x6d, 0x71, 0x61, 0x64, 0x64, 0x5c, 0x41, 0x70, 0x70, 0x44, 0x61, 0x74, 0x61, 0x5c, 0x52, 0x6f, 0x61, 0x6d, 0x69, 0x6e, 0x67, 0x5c, 0x4d, 0x69, 0x63, 0x72, 0x6f, 0x73, 0x6f, 0x66, 0x74, 0x5c, 0x49, 0x6e, 0x74, 0x65, 0x72, 0x6e, 0x65, 0x74, 0x20, 0x45, 0x78, 0x70, 0x6c, 0x6f, 0x72, 0x65, 0x72, 0x5c, 0x51, 0x75, 0x69, 0x63, 0x6b, 0x20, 0x4c, 0x61, 0x75, 0x6e, 0x63, 0x68, 0x5c, 0x55, 0x73, 0x65, 0x72, 0x20, 0x50, 0x69, 0x6e, 0x6e, 0x65, 0x64, 0x5c, 0x54, 0x61, 0x73, 0x6b, 0x42, 0x61, 0x72, 0x5c, 0x46, 0x69, 0x6c, 0x65, 0x20, 0x45, 0x78, 0x70, 0x6c, 0x6f, 0x72, 0x65, 0x72, 0x2e, 0x6c, 0x6e, 0x6b, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0xa0, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6d, 0x6b, 0x6f, 0x68, 0x61, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x8a, 0x66, 0xdf, 0x53, 0xed, 0xfe, 0x4d, 0x94, 0xc2, 0x54, 0xa6, 0x7e, 0xf5, 0x91, 0x6f, 0x81, 0xa1, 0xe8, 0x74, 0x48, 0x40, 0xef, 0x11, 0xb4, 0x18, 0xf8, 0xca, 0xb8, 0x09, 0xae, 0xa5, 0x30, 0x8a, 0x66, 0xdf, 0x53, 0xed, 0xfe, 0x4d, 0x94, 0xc2, 0x54, 0xa6, 0x7e, 0xf5, 0x91, 0x6f, 0x81, 0xa1, 0xe8, 0x74, 0x48, 0x40, 0xef, 0x11, 0xb4, 0x18, 0xf8, 0xca, 0xb8, 0x09, 0xae, 0xa5, 0x45, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0xa0, 0x39, 0x00, 0x00, 0x00, 0x31, 0x53, 0x50, 0x53, 0xb1, 0x16, 0x6d, 0x44, 0xad, 0x8d, 0x70, 0x48, 0xa7, 0x48, 0x40, 0x2e, 0xa4, 0x3d, 0x78, 0x8c, 0x1d, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x7f, 0x26, 0x1b, 0x1c, 0xcb, 0x09, 0xb9, 0x43, 0x86, 0x43, 0x2e, 0x11, 0x5b, 0xbb, 0x0d, 0xf5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
            #     Type = "Binary"
            #     Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"
            # }
            @{
                Name = "Favorites"
                Value = [byte[]]@(0xff)
                Type = "Binary"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"
            }
            @{
                Name = "FavoritesChanges"
                Value = 0x0d
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"
            }
            @{
                Name = "FavoritesVersion"
                Value = 0x03
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"
            }
            @{
                Name = "MailPin"
                Value = 0x01
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins"
            }
            @{
                Name = "TFLPin"
                Value = 0x01
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\AuxilliaryPins"
            }
        )
    }
    @{ Message = "Enable EndTask Taskbar"
        Data = @(
            @{
                Name = "TaskbarEndTask"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
                Value = "1"
            }
        )
    }
    # @{ Message = "Regional format set to English (Canada) 'yyyy-MM-dd'"
    #     Data = @(
    #         #For user
    #         @{
    #             Name = "LocaleName"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "en-CA"
    #         }
    #         @{
    #             Name = "Locale" # English (Canada) Locale ID
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "00001009"
    #         }
    #         @{
    #             Name = "sLanguage"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "ENU"
    #         }
    #         @{
    #             Name = "sCountry"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "Canada"
    #         }
    #         @{
    #             Name = "sShortDate"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "yyyy-MM-dd"
    #         }
    #         @{
    #             Name = "sLongDate"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "dddd, MMMM dd, yyyy"
    #         }
    #         @{
    #             Name = "sTimeFormat"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "HH:mm:ss"
    #         }
    #         @{
    #             Name = "iCountry"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "1"
    #         }
    #         @{
    #             Name = "iDate"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "2"
    #         }
    #         @{
    #             Name = "iTime"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "24"
    #         }
    #         @{
    #             Name = "sCurrency"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "`$"
    #         }
    #         @{
    #             Name = "sMonDecimalSep"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "."
    #         }
    #         @{
    #             Name = "sMonGrouping"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "3;0"
    #         }
    #         @{
    #             Name = "sMonThousandSep"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = ","
    #         }
    #         @{
    #             Name = "iMeasure"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "0"
    #         }
    #         @{
    #             Name = "sDecimal"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "."
    #         }
    #         @{
    #             Name = "sGrouping"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "3;0"
    #         }
    #         @{
    #             Name = "sThousand"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = ","
    #         }
    #         @{
    #             Name = "iNegNumber"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "1"
    #         }
    #         @{
    #             Name = "iCurrDigits"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "2"
    #         }
    #         @{
    #             Name = "iCurrency"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "0"
    #         }
    #         @{
    #             Name = "iLZero"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "1"
    #         }
    #         @{
    #             Name = "iDigits"
    #             Type = "String"
    #             Path = "HKCU:\Control Panel\International"
    #             Value = "2"
    #         }
    #         #For system
    #         @{
    #             Name = "LocaleName"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "en-CA"
    #         }
    #         @{
    #             Name = "Locale" # English (Canada) Locale ID
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "00001009"
    #         }
    #         @{
    #             Name = "sLanguage"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "ENU"
    #         }
    #         @{
    #             Name = "sCountry"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "Canada"
    #         }
    #         @{
    #             Name = "sShortDate"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "yyyy-MM-dd"
    #         }
    #         @{
    #             Name = "sLongDate"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "dddd, MMMM dd, yyyy"
    #         }
    #         @{
    #             Name = "sTimeFormat"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "HH:mm:ss"
    #         }
    #         @{
    #             Name = "iCountry"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "1"
    #         }
    #         @{
    #             Name = "iDate"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "2"
    #         }
    #         @{
    #             Name = "iTime"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "24"
    #         }
    #         @{
    #             Name = "sCurrency"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "`$"
    #         }
    #         @{
    #             Name = "sMonDecimalSep"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "."
    #         }
    #         @{
    #             Name = "sMonGrouping"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "3;0"
    #         }
    #         @{
    #             Name = "sMonThousandSep"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = ","
    #         }
    #         @{
    #             Name = "iMeasure"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "0"
    #         }
    #         @{
    #             Name = "sDecimal"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "."
    #         }
    #         @{
    #             Name = "sGrouping"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "3;0"
    #         }
    #         @{
    #             Name = "sThousand"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = ","
    #         }
    #         @{
    #             Name = "iNegNumber"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "1"
    #         }
    #         @{
    #             Name = "iCurrDigits"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "2"
    #         }
    #         @{
    #             Name = "iCurrency"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "0"
    #         }
    #         @{
    #             Name = "iLZero"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "1"
    #         }
    #         @{
    #             Name = "iDigits"
    #             Type = "String"
    #             Path = "HKU:\.DEFAULT\Control Panel\International"
    #             Value = "2"
    #         }
    #     )
    # }
    # @{ Message = "Set Time to UTC (Dual Boot)"
    #     Data = @(
    #         @{
    #             Name = "RealTimeIsUniversal"
    #             Type = "DWord"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #             Value = "1"
    #         }
    #     )
    # }
    # @{ Message = "Set Time Zone To Amman Jordan"
    #     Data = @(
    #         @{
    #             Name = "Bias"
    #             Value = 0xffffff4c
    #             Type = "DWord"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "DaylightBias"
    #             Value = 0xffffffc4
    #             Type = "DWord"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "DaylightStart"
    #             Value = [byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)
    #             Type = "Binary"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "StandardStart"
    #             Value = [byte[]]@(0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00)
    #             Type = "Binary"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "StandardBias"
    #             Value = 0x00000000
    #             Type = "DWord"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "DynamicDaylightTimeDisabled"
    #             Value = 0x00000000
    #             Type = "DWord"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "ActiveTimeBias"
    #             Value = 0xffffff4c
    #             Type = "DWord"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "RealTimeIsUniversal"
    #             Value = 0x00000001
    #             Type = "DWord"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "DaylightName"
    #             Value = "@tzres.dll,-334"
    #             Type = "String"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "StandardName"
    #             Value = "@tzres.dll,-335"
    #             Type = "String"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #         @{
    #             Name = "TimeZoneKeyName"
    #             Value = "Jordan Standard Time"
    #             Type = "String"
    #             Path = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
    #         }
    #     )
    # }
    @{ Message = "Disable Wifi-Sense"
        Data = @(
            @{
                Name = "Value"
                Type = "DWord"
                Path = "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting"
                Value = "0"
            }
            @{
                Name = "Value"
                Type = "DWord"
                Path = "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots"
                Value = "0"
            }
        )
    }
    @{ Message = "Disable ConsumerFeatures"
        Data = @(
            @{
                Name = "DisableWindowsConsumerFeatures"
                Type = "DWord"
                Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
                Value = "1"
            }
        )
    }
    @{ Message = "Disable Location Tracking"
        Data = @(
            @{
                Name = "Value"
                Type = "String"
                Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location"
                Value = "Deny"
            }
            @{
                Name = "SensorPermissionState"
                Type = "DWord"
                Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
                Value = "0"
            }
            @{
                Name = "Status"
                Type = "DWord"
                Path = "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
                Value = "0"
            }
            @{
                Name = "AutoUpdateEnabled"
                Type = "DWord"
                Path = "HKLM:\SYSTEM\Maps"
                Value = "0"
            }
        )
    }
    @{ Message = "Disable GameDVR" #GameDVR is a Windows App that is a dependency for some Store Games. I&#39;ve never met someone that likes it, but it&#39;s there for the XBOX crowd
        Data = @(
            @{
                Name = "GameDVR_FSEBehavior"
                Type = "DWord"
                Path = "HKCU:\System\GameConfigStore"
                Value = "2"
            }
            @{
                Name = "GameDVR_Enabled"
                Type = "DWord"
                Path = "HKCU:\System\GameConfigStore"
                Value = "0"
            }
            @{
                Name = "GameDVR_HonorUserFSEBehaviorMode"
                Type = "DWord"
                Path = "HKCU:\System\GameConfigStore"
                Value = "1"
            }
            @{
                Name = "GameDVR_EFSEFeatureFlags"
                Type = "DWord"
                Path = "HKCU:\System\GameConfigStore"
                Value = "0"
            }
            @{
                Name = "AllowGameDVR0"
                Type = "DWord"
                Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR"
                Value = ""
            }
        )
    }
    @{ Message = "Disable Storage Sense" # Storage Sense deletes temp files automatically
        Data = @(
            @{
                Name = "01"
                Type = "Dword"
                Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy"
                Value = "0"
            }
        )
    }
    @{ Message = "Show All Icons in control panel"
        Data = @(
            @{
                Name = "AllItemsIconView"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel"
                Value = "0"
            }
            @{
                Name = "StartupPage"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel"
                Value = "1"
            }
        )
    }
    @{ Message = "Show task bar on all monitor"
        Data = @(
            @{
                Name= "TaskbarMn"
                Type= "DWord"
                Path= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value= "0" # 1 for main monitor
            }
        )
    }
    @{ Message = "Set Display for Performance" # Sets the system preferences to performance. You can do this manually with sysdm.cpl as well
        Data = @(
            @{
                Name = "UserPreferencesMask"
                Type = "Binary"
                Path = "HKCU:\Control Panel\Desktop"
                Value = [byte[]]@(90,12,03,80,10,00,00,00)
            }
            @{
                Name= "MinAnimate"
                Type= "String"
                Path= "HKCU:\Control Panel\Desktop\WindowMetrics"
                Value= "0"
            }
            @{
                Name= "TaskbarAnimations"
                Type= "DWord"
                Path= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value= "0"
            }
            @{
                Name= "EnableAeroPeek"
                Type= "DWord"
                Path= "HKCU:\Software\Microsoft\Windows\DWM"
                Value= "0"
            }
            @{
                Name= "AlwaysHibernateThumbnails"
                Type= "DWord"
                Path= "HKCU:\Software\Microsoft\Windows\DWM"
                Value= "0"
            }
            @{
                Name= "DragFullWindows"
                Type= "String"
                Path= "HKCU:\Control Panel\Desktop"
                Value= "0"
            }
            @{
                Name= "ListviewShadow"
                Type= "DWord"
                Path= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value= "0"
            }
            @{
                Name= "VisualFXSetting"
                Type= "DWord"
                Path= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
                Value= "3"
            }
            @{
                Name= "MenuShowDelay"
                Type= "String"
                Path= "HKCU:\Control Panel\Desktop"
                Value= "200"
            }
            @{
                Name= "KeyboardDelay"
                Type= "DWord"
                Path= "HKCU:\Control Panel\Keyboard"
                Value= "0"
            }
            @{
                Name= "ListviewAlphaSelect"
                Type= "DWord"
                Path= "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value= "0"
            }
            @{
                _Comment      = "waits before registering a mouse hover event,affects how quickly tooltip pop-ups and other hover-based events are triggered"
                Name          = "MouseHoverTime"
                Type          = "String"
                Path          = "HKCU:\Control Panel\Mouse"
                Value         = "400"
                OriginalValue = "400"
            }
        )
    }
    @{ Message = "Smooth edges of screen fonts" # needs restart
        Data = @(
            @{
                Name  = "FontSmoothing"
                Type  = "String"
                Path  = "HKCU:\Control Panel\Desktop"
                Value = "2" # value 2 (for ClearType) or 1 (for standard smoothing).
            }
            @{
                Name  = "FontSmoothingType"
                Type  = "DWord"
                Path  = "HKCU:\Control Panel\Desktop"
                Value = "2" # value 2 (for ClearType) or 1 (for standard smoothing).
            }
            @{
                Name  = "FontSmoothingOrientation"
                Type  = "DWord"
                Path  = "HKCU:\Control Panel\Desktop"
                Value = "1" # value 1 for horizontal RGB stripes, or 2 for BGR(rotated portrait mode display).
            }
        )
    }
    @{ Message = "Show thumbnails instead of icons"
        Data = @(
            @{
                Name = "IconsOnly"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value = "0"
            }
        )
    }
    @{ Message = "Display Detailed BSoD `"blue screen of death`"" # Display the Stop error information
        Data = @(
            @{
                Name = "DisplayParameters"
                Type = "DWord"
                Path = "HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl"
                Value = "1"
            }
        )
    }
    @{ Message = "Enable Search Box Web Suggestions in Registry"# Needs explorer restart
        Data = @(
            @{
                Name = "DisableSearchBoxSuggestions"
                Type = "DWord"
                Path = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
                Value = "0"
            }
        )
    }
    # @{ Message = "Unsupported Hardware Notification Cache" # Controls the display of notifications informing users about unsupported hardware
    #     Data = @(
    #         @{
    #             Name = "UnsupportedHardwareNotificationCache"
    #             Type = "DWord"
    #             Path = "HKCU:\Control Panel"
    #             Value = "0"
    #         }
    #     )
    # }
    @{ Message = "Disable Background Apps" # Disables all Microsoft Store apps from running in the background, which has to be done individually since Win11
        Data = @(
            @{
                Name = "GlobalUserDisabled"
                Type = "DWord"
                Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"
                Value = "1"
                OriginalValue = "0"
            }
        )
    }
    @{ Message = "Disable Fullscreen Optimizations" # Disables FSO in all applications. NOTE: This will disable Color Management in Exclusive Fullscreen
        Data = @(
            @{
                Name = "GameDVR_DXGIHonorFSEWindowsCompatible"
                Type = "DWord"
                Path = "HKCU:\System\GameConfigStore"
                Value = "1"
                OriginalValue = "0"
            }
        )
    }
    @{ Message = "Sets This PC as default"
        Data = @(
            @{
                Name          = "LaunchTo"
                Type          = "DWord"
                Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
                Value         = "1" # This PC
                OriginalValue = "0" # Quick Access
            }
        )
    }
    @{ Message = "Add `"Run with graphics processor`" to context menu(For NVIDIA)" # For NVIDIA
        Data   = @(
            @{
                Name  = "ShowContextMenu"
                Type  = "DWord"
                Path  = "HKCU:\Software\NVIDIA Corporation\Global\CoProcManager"
                Value = "1"
            }
        )
    }
    @{ Message = "Automatically end any tasks or applications when they are not responding during shutdown or logoff."
        Data   = @(
            @{
                Name  = "AutoEndTasks"
                Type  = "DWord"
                Path  = "HKCU:\Control Panel\Desktop"
                Value = "1"
            }
        )
    }
    @{ Message = "Clears the page file (also known as the virtual memory file) when the system shuts down(For Security)"
        Data   = @(
            @{
                Name          = "ClearPageFileAtShutdown"
                Type          = "DWord"
                Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
                Value         = "1"
                OriginalValue = "0"
            }
        )
    }
    @{ Message = "Controls the startup behavior of the Network Data Usage Monitoring Driver(tracking data usage across different network)"
        Data   = @(
            @{
                _Comment      = "0 BootStart,1 SystemStart,2 Automatic,3 Manual,4 Disabled"
                Name          = "Start"
                Type          = "DWord"
                Path          = "HKLM:\SYSTEM\ControlSet001\Services\Ndu"
                Value         = "2"
                OriginalValue = "1"
            }
        )
    }
)