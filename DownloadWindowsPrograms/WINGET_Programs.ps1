# $WINGET_PROGRAMS_ID = [System.Collections.ArrayList]@()
$WINGET_PROGRAMS_ID = @(
    "Microsoft.Sysinternals.ProcessMonitor" # log real-time file system, registry, and process/thread activity
    # TODO: Add VisualStudio tools like Microsoft.VisualStudio.2022.BuildTools,
    #         Microsoft.DotNet.AspNetCore.8, Microsoft.DotNet.DesktopRuntime.8,
    #         Microsoft.DotNet.Runtime.8, Microsoft.DotNet.SDK.8,
    #         Microsoft.VCRedist.2015+.x64, Microsoft.VCRedist.2015+.x86
    #       Use winget search Visual
    # "Microsoft.VisualStudio.2022.Community"
    # "Microsoft.RemoteDesktopClient"
    # "Google.ChromeRemoteDesktopHost"
    # "Canonical.Ubuntu"
    # "sylikc.JPEGView"
    # "File-New-Project.EarTrumpet"
    # "infinitepower18.WSASystemControl"
    # "PDFLabs.PDFtk.Free" # PDF merge
    "OpenJS.NodeJS"  # NodeJS
    # "Google.GoogleDrive"
    # "Avidemux.Avidemux" # fast video split,cut ..
    # "Mega.MEGASync"
    # "Gyan.FFmpeg"
    "Mozilla.Firefox"
    "Brave.Brave"
    # "calibre.calibre" # open book files like epub ..
    # "HandBrake.HandBrake" # Video conversion
    # "KDE.Kdenlive" # Video editor,production ..
    # "ONLYOFFICE.DesktopEditors" # PDF Editor
    # "TheDocumentFoundation.LibreOffice" # For Documents
    # "Cyanfish.NAPS2" # OCR and merge for pdf
    # "OBSProject.OBSStudio" # video stream and record
    # "Oracle.VirtualBox" # don't forgt to install VB Extenctions
    # "Postman.Postman" # for backend request tests
    "Python.Python.3.13"  #TODO: Python change the version in the future
    "RevoUninstaller.RevoUninstaller" # fully uninstall windows programs
    # "Telegram.TelegramDesktop"
    # "CodeSector.TeraCopy" # file copy,paste
    # "TorProject.TorBrowser"
    # "qBittorrent.qBittorrent"
    # "VideoLAN.VLC"
    # "Nvidia.GeForceNow"
    # "Zoom.Zoom"
)

$PROGRAMS_COLLECTION = @(
    @{ Name         = "Process Monitor (procmon)"
        Source      = "winget"
        Id          = "Microsoft.Sysinternals.ProcessMonitor"
        Installer   = "winget"
        Description = "Log real-time file system, registry, and process/thread activity"
    }
    # @{ Name = "Visual Studio 2022 Community"
    #     Source = "winget"
    #     Id = "Microsoft.VisualStudio.2022.Community"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = "Visual Studio 2022 Build Tools"
    #     Source = "winget"
    #     Id = "Microsoft.VisualStudio.2022.BuildTools"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = ".NET AspNetCore 8"
    #     Source = "winget"
    #     Id = "Microsoft.DotNet.AspNetCore.8"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = ".NET Desktop Runtime 8"
    #     Source = "winget"
    #     Id = "Microsoft.DotNet.DesktopRuntime.8"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = ".NET Runtime 8"
    #     Source = "winget"
    #     Id = "Microsoft.DotNet.Runtime.8"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = ".NET SDK 8"
    #     Source = "winget"
    #     Id = "Microsoft.DotNet.SDK.8"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = "Visual C++ Redistributable 2015+ x64"
    #     Source = "winget"
    #     Id = "Microsoft.VCRedist.2015+.x64"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = "Visual C++ Redistributable 2015+ x86"
    #     Source = "winget"
    #     Id = "Microsoft.VCRedist.2015+.x86"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name         = "Remote Desktop Client"
    #     Source      = "winget"
    #     Id          = "Microsoft.RemoteDesktopClient"
    #     Installer   = "winget"
    #     Description = ""
    # }
    # @{ Name         = "Chrome Remote Desktop Host"
    #     Source      = "winget"
    #     Id          = "Google.ChromeRemoteDesktopHost"
    #     Installer   = "winget"
    #     Description = ""
    # }
    # @{ Name         = "Ubuntu"
    #     Source      = "winget"
    #     Id          = "Canonical.Ubuntu"
    #     Installer   = "winget"
    #     Description = ""
    # }
    # @{ Name         = "JPEGView"
    #     Source      = "winget"
    #     Id          = "sylikc.JPEGView"
    #     Installer   = "winget"
    #     Description = ""
    # }
    # @{ Name         = "EarTrumpet"
    #     Source      = "winget"
    #     Id          = "File-New-Project.EarTrumpet"
    #     Installer   = "winget"
    #     Description = ""
    # }
    # @{ Name         = "WSA System Control"
    #     Source      = "winget"
    #     Id          = "infinitepower18.WSASystemControl"
    #     Installer   = "winget"
    #     Description = ""
    # }
    @{ Name         = "PDFtk Free"
        Source      = "winget"
        Id          = "PDFLabs.PDFtk.Free"
        Installer   = "winget"
        Description = "PDF merge"
    }
    @{ Name         = "Node.js"
        Source      = "winget"
        Id          = "OpenJS.NodeJS"
        Installer   = "winget"
        Description = "NodeJS"
    }
    # @{ Name = "Google Drive"
    #     Source = "winget"
    #     Id = "Google.GoogleDrive"
    #     Installer = "winget"
    #     Description = ""
    # }
    @{ Name         = "Avidemux"
        Source      = "winget"
        Id          = "Avidemux.Avidemux"
        Installer   = "winget"
        Description = "Fast video split, cut, etc."
    }
    # @{ Name = "MEGAsync"
    #     Source = "winget"
    #     Id = "Mega.MEGASync"
    #     Installer = "winget"
    #     Description = ""
    # }
    @{ Name         = "FFmpeg"
        Source      = "winget"
        Id          = "Gyan.FFmpeg"
        Installer   = "winget"
        Description = ""
    }
    @{ Name         = "Firefox"
        Source      = "winget"
        Id          = "Mozilla.Firefox"
        Installer   = "winget"
        Description = ""
    }
    @{ Name         = "Brave"
        Source      = "winget"
        Id          = "Brave.Brave"
        Installer   = "winget"
        Description = ""
    }
    # @{ Name = "Calibre"
    #     Source = "winget"
    #     Id = "calibre.calibre"
    #     Installer = "winget"
    #     Description = "Open book files like epub"
    # }
    # @{ Name = "HandBrake"
    #     Source = "winget"
    #     Id = "HandBrake.HandBrake"
    #     Installer = "winget"
    #     Description = "Video conversion"
    # }
    # @{ Name = "Kdenlive"
    #     Source = "winget"
    #     Id = "KDE.Kdenlive"
    #     Installer = "winget"
    #     Description = "Video editor, production"
    # }
    # @{ Name = "ONLYOFFICE Desktop Editors"
    #     Source = "winget"
    #     Id = "ONLYOFFICE.DesktopEditors"
    #     Installer = "winget"
    #     Description = "PDF Editor"
    # }
    # @{ Name = "LibreOffice"
    #     Source = "winget"
    #     Id = "TheDocumentFoundation.LibreOffice"
    #     Installer = "winget"
    #     Description = "For Documents"
    # }
    # @{ Name = "NAPS2"
    #     Source = "winget"
    #     Id = "Cyanfish.NAPS2"
    #     Installer = "winget"
    #     Description = "OCR and merge for pdf"
    # }
    # @{ Name = "OBS Studio"
    #     Source = "winget"
    #     Id = "OBSProject.OBSStudio"
    #     Installer = "winget"
    #     Description = "Video stream and record"
    # }
    # @{ Name = "VirtualBox"
    #     Source = "winget"
    #     Id = "Oracle.VirtualBox"
    #     Installer = "winget"
    #     Description = "Don't forget to install VB Extensions"
    # }
    # @{ Name = "Postman"
    #     Source = "winget"
    #     Id = "Postman.Postman"
    #     Installer = "winget"
    #     Description = "For backend request tests"
    # }
    @{ Name         = "Python 3.13"
        Source      = "winget"
        Id          = "Python.Python.3.13"
        Installer   = "winget"
        Description = "Python 3.13 (change the version in the future)"
    }
    # @{ Name = "Telegram Desktop"
    #     Source = "winget"
    #     Id = "Telegram.TelegramDesktop"
    #     Installer = "winget"
    #     Description = ""
    # }
    @{ Name         = "TeraCopy"
        Source      = "winget"
        Id          = "CodeSector.TeraCopy"
        Installer   = "winget"
        Description = "File copy, paste"
    }
    # @{ Name = "Tor Browser"
    #     Source = "winget"
    #     Id = "TorProject.TorBrowser"
    #     Installer = "winget"
    #     Description = ""
    # }
    @{ Name         = "Revo Uninstaller"
        Source      = "winget"
        Id          = "RevoUninstaller.RevoUninstaller"
        Installer   = "winget"
        Description = "Fully uninstall Windows programs"
    }
    # @{ Name = "qBittorrent"
    #     Source = "winget"
    #     Id = "qBittorrent.qBittorrent"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = "VLC"
    #     Source = "winget"
    #     Id = "VideoLAN.VLC"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = "GeForce Now"
    #     Source = "winget"
    #     Id = "Nvidia.GeForceNow"
    #     Installer = "winget"
    #     Description = ""
    # }
    # @{ Name = "Zoom"
    #     Source = "winget"
    #     Id = "Zoom.Zoom"
    #     Installer = "winget"
    #     Description = ""
    # }
)