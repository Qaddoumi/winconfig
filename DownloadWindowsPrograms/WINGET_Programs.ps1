# $WINGET_PROGRAMS_ID = [System.Collections.ArrayList]@()
$WINGET_PROGRAMS_ID = @(
    "Microsoft.Sysinternals.ProcessMonitor" # log real-time file system, registry, and process/thread activity
    # TODO: Add VisualStudio tools like Microsoft.VisualStudio.2022.BuildTools,
    #         Microsoft.DotNet.AspNetCore.8, Microsoft.DotNet.DesktopRuntime.8,
    #         Microsoft.DotNet.Runtime.8, Microsoft.DotNet.SDK.8,
    #         Microsoft.VCRedist.2015+.x64, Microsoft.VCRedist.2015+.x86
    #       Use winget search Visual
    # "Microsoft.VisualStudio.2022.Community"
    "Microsoft.RemoteDesktopClient"
    "Google.ChromeRemoteDesktopHost"
    "Canonical.Ubuntu"
    "sylikc.JPEGView"
    "File-New-Project.EarTrumpet"
    "infinitepower18.WSASystemControl"
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