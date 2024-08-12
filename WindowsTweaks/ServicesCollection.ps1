$ServicesCollection = @{ Description = "Set Services to Manual `nTurns a bunch of system services to manual that don&#39;t need to be running all the time. This is pretty harmless as if the service is needed, it will simply start on demand."
        service = @(
            @{
                Name = "AJRouter"
                StartupType = "Disabled"
                OriginalType = "Manual"
            }
            @{
                Name = "ALG"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "AppIDSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "AppMgmt"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "AppReadiness"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "AppVClient"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "AppXSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Appinfo"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "AssignedAccessManagerSvc"
                StartupType = "Disabled"
                OriginalType = "Manual"
            }
            @{
                Name = "AudioEndpointBuilder"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "AudioSrv"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "Audiosrv"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "AxInstSV"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "BDESVC"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "BFE"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "BITS"
                StartupType = "AutomaticDelayedStart"
                OriginalType = "Automatic"
            }
            @{
                Name = "BTAGService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "BcastDVRUserService_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "BluetoothUserService_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "BrokerInfrastructure"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "Browser"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "BthAvctpSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "BthHFSrv"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "CDPSvc"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "CDPUserSvc_*"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "COMSysApp"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "CaptureService_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "CertPropSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "ClipSVC"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "ConsentUxUserSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "CoreMessagingRegistrar"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "CredentialEnrollmentManagerUserSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "CryptSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "CscService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DPS"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "DcomLaunch"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "DcpSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DevQueryBroker"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DeviceAssociationBrokerSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DeviceAssociationService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DeviceInstall"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DevicePickerUserSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DevicesFlowUserSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Dhcp"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "DiagTrack"
                StartupType = "Disabled"
                OriginalType = "Automatic"
            }
            @{
                Name = "DialogBlockingService"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "DispBrokerDesktopSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "DisplayEnhancementService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DmEnrollmentSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Dnscache"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "DoSvc"
                StartupType = "AutomaticDelayedStart"
                OriginalType = "Automatic"
            }
            @{
                Name = "DsSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DsmSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "DusmSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "EFS"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "EapHost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "EntAppSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "EventLog"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "EventSystem"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "FDResPub"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Fax"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "FontCache"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "FrameServer"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "FrameServerMonitor"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "GraphicsPerfSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "HomeGroupListener" # Disables HomeGroup - HomeGroup is a password-protected home networking service that lets you share your stuff with other PCs that are currently running and connected to your network
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "HomeGroupProvider"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "HvHost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "IEEtwCollectorService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "IKEEXT"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "InstallService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "InventorySvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "IpxlatCfgSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "KeyIso"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "KtmRm"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "LSM"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "LanmanServer"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "LanmanWorkstation"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "LicenseManager"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "LxpSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "MSDTC"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "MSiSCSI"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "MapsBroker"
                StartupType = "AutomaticDelayedStart"
                OriginalType = "Automatic"
            }
            @{
                Name = "McpManagementService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "MessagingService_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "MicrosoftEdgeElevationService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "MixedRealityOpenXRSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "MpsSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "MsKeyboardFilter"
                StartupType = "Manual"
                OriginalType = "Disabled"
            }
            @{
                Name = "NPSMSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NaturalAuthentication"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NcaSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NcbService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NcdAutoSetup"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NetSetupSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NetTcpPortSharing"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "Netlogon"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "Netman"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NgcCtnrSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NgcSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "NlaSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "OneSyncSvc_*"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "P9RdrService_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PNRPAutoReg"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PNRPsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PcaSvc"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "PeerDistSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PenService_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PerfHost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PhoneSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PimIndexMaintenanceSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PlugPlay"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PolicyAgent"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Power"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "PrintNotify"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "PrintWorkflowUserSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "ProfSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "PushToInstall"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "QWAVE"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "RasAuto"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "RasMan"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "RemoteAccess"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "RemoteRegistry"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "RetailDemo"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "RmSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "RpcEptMapper"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "RpcLocator"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "RpcSs"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "SCPolicySvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SCardSvr"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SDRSVC"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SEMgrSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SENS"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "SNMPTRAP"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SNMPTrap"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SSDPSRV"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SamSs"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "ScDeviceEnum"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Schedule"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "SecurityHealthService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Sense"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SensorDataService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SensorService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SensrSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SessionEnv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SgrmBroker"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "SharedAccess"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "SharedRealitySvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "ShellHWDetection"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "SmsRouter"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Spooler"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "SstpSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "StateRepository"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "StiSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "StorSvc"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "SysMain"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "SystemEventsBroker"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "TabletInputService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "TapiSrv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "TermService"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "TextInputManagementService"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "Themes"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "TieringEngineService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "TimeBroker"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "TimeBrokerSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "TokenBroker"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "TrkWks"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "TroubleshootingSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "TrustedInstaller"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "UI0Detect"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "UdkUserSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "UevAgentService"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "UmRdpService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "UnistoreSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "UserDataSvc_*"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "UserManager"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "UsoSvc"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "VGAuthService"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "VMTools"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "VSS"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "VacSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "VaultSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "W32Time"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WEPHOSTSVC"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WFDSConMgrSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WMPNetworkSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WManSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WPDBusEnum"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WSService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WSearch"
                StartupType = "AutomaticDelayedStart"
                OriginalType = "Automatic"
            }
            @{
                Name = "WaaSMedicSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WalletService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WarpJITSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WbioSrvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Wcmsvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "WcsPlugInService"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WdNisSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WdiServiceHost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WdiSystemHost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WebClient"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Wecsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WerSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WiaRpc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WinDefend"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "WinHttpAutoProxySvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WinRM"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "Winmgmt"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "WlanSvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "WpcMonSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "WpnService"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "WpnUserService_*"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "XblAuthManager"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "XblGameSave"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "XboxGipSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "XboxNetApiSvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "autotimesvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "bthserv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "camsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "cbdhsvc_*"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "cloudidsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "dcsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "defragsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "diagnosticshub.standardcollector.service"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "diagsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "dmwappushservice"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "dot3svc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "edgeupdate"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "edgeupdatem"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "embeddedmode"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "fdPHost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "fhsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "gpsvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "hidserv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "icssvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "iphlpsvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "lfsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "lltdsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "lmhosts"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "mpssvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "msiserver"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "netprofm"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "nsi"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "p2pimsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "p2psvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "perceptionsimulation"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "pla"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "seclogon"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "shpamsvc"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "smphost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "spectrum"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "sppsvc"
                StartupType = "AutomaticDelayedStart"
                OriginalType = "Automatic"
            }
            @{
                Name = "ssh-agent"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "svsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "swprv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "tiledatamodelsvc"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "tzautoupdate"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "uhssvc"
                StartupType = "Disabled"
                OriginalType = "Disabled"
            }
            @{
                Name = "upnphost"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vds"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vm3dservice"
                StartupType = "Manual"
                OriginalType = "Automatic"
            }
            @{
                Name = "vmicguestinterface"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmicheartbeat"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmickvpexchange"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmicrdv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmicshutdown"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmictimesync"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmicvmsession"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmicvss"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "vmvss"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wbengine"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wcncsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "webthreatdefsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "webthreatdefusersvc_*"
                StartupType = "Automatic"
                OriginalType = "Automatic"
            }
            @{
                Name = "wercplsupport"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wisvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wlidsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wlpasvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wmiApSrv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "workfolderssvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wscsvc"
                StartupType = "AutomaticDelayedStart"
                OriginalType = "Automatic"
            }
            @{
                Name = "wuauserv"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
            @{
                Name = "wudfsvc"
                StartupType = "Manual"
                OriginalType = "Manual"
            }
        )
}