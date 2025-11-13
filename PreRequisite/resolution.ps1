# Define C# code for ChangeDisplaySettings and EnumDisplaySettings APIs
$code = @"
using System;
using System.Runtime.InteropServices;

public class DisplaySettings
{
    // Constants from winuser.h
    public const int DM_PELSWIDTH = 0x00080000;
    public const int DM_PELSHEIGHT = 0x00100000;
    public const int DM_BITSPERPEL = 0x00040000;
    public const int DM_DISPLAYFREQUENCY = 0x00400000;
    public const int CDS_UPDATEREGISTRY = 0x00000001;
    public const int CDS_GLOBAL = 0x00000008;
    public const int DISP_CHANGE_SUCCESSFUL = 0;
    public const int DISP_CHANGE_BADMODE = -2;
    public const int ENUM_CURRENT_SETTINGS = -1;

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
    public struct DEVMODE
    {
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string dmDeviceName;
        public short dmSpecVersion;
        public short dmDriverVersion;
        public short dmSize;
        public short dmDriverExtra;
        public int dmFields;
        public int dmPositionX;
        public int dmPositionY;
        public int dmDisplayOrientation;
        public int dmDisplayFixedOutput;
        public short dmColor;
        public short dmDuplex;
        public short dmYResolution;
        public short dmTTOption;
        public short dmCollate;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string dmFormName;
        public short dmLogPixels;
        public int dmBitsPerPel;
        public int dmPelsWidth;
        public int dmPelsHeight;
        public int dmDisplayFlags;
        public int dmDisplayFrequency;
        public int dmICMMethod;
        public int dmICMIntent;
        public int dmMediaType;
        public int dmDitherType;
        public int dmReserved1;
        public int dmReserved2;
        public int dmPanningWidth;
        public int dmPanningHeight;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
    public struct DISPLAY_DEVICE
    {
        public int cb;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string DeviceName;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 128)]
        public string DeviceString;
        public int StateFlags;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 128)]
        public string DeviceID;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 128)]
        public string DeviceKey;
    }

    public const int DISPLAY_DEVICE_ATTACHED_TO_DESKTOP = 0x00000001;
    public const int DISPLAY_DEVICE_PRIMARY_DEVICE = 0x00000004;

    [DllImport("user32.dll")]
    public static extern int ChangeDisplaySettingsEx(string lpszDeviceName, ref DEVMODE lpDevMode, IntPtr hwnd, int dwflags, IntPtr lParam);

    [DllImport("user32.dll")]
    public static extern int ChangeDisplaySettings(ref DEVMODE devMode, int flags);

    [DllImport("user32.dll")]
    public static extern bool EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE devMode);

    [DllImport("user32.dll")]
    public static extern bool EnumDisplayDevices(string lpDevice, int iDevNum, ref DISPLAY_DEVICE lpDisplayDevice, int dwFlags);

    // Get all active display devices
    public static DISPLAY_DEVICE[] GetDisplayDevices()
    {
        var devices = new System.Collections.Generic.List<DISPLAY_DEVICE>();
        DISPLAY_DEVICE d = new DISPLAY_DEVICE();
        d.cb = Marshal.SizeOf(d);
        
        for (int i = 0; EnumDisplayDevices(null, i, ref d, 0); i++)
        {
            if ((d.StateFlags & DISPLAY_DEVICE_ATTACHED_TO_DESKTOP) != 0)
            {
                devices.Add(d);
            }
            d.cb = Marshal.SizeOf(d);
        }
        
        return devices.ToArray();
    }

    // Set resolution for a specific device
    public static int SetResolution(string deviceName, int width, int height)
    {
        DEVMODE devMode = new DEVMODE();
        devMode.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));

        // Get current settings for this device
        if (!EnumDisplaySettings(deviceName, ENUM_CURRENT_SETTINGS, ref devMode))
        {
            return DISP_CHANGE_BADMODE;
        }

        // Check if the resolution is supported
        bool modeFound = false;
        int modeIndex = 0;
        DEVMODE testMode = new DEVMODE();
        testMode.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));
        
        while (EnumDisplaySettings(deviceName, modeIndex, ref testMode))
        {
            if (testMode.dmPelsWidth == width && testMode.dmPelsHeight == height)
            {
                modeFound = true;
                break;
            }
            modeIndex++;
        }

        if (!modeFound)
        {
            return DISP_CHANGE_BADMODE; // Mode not supported
        }

        // Apply resolution
        devMode.dmFields = DM_PELSWIDTH | DM_PELSHEIGHT;
        devMode.dmPelsWidth = width;
        devMode.dmPelsHeight = height;

        return ChangeDisplaySettingsEx(deviceName, ref devMode, IntPtr.Zero, CDS_UPDATEREGISTRY | CDS_GLOBAL, IntPtr.Zero);
    }

    // Set refresh rate for a specific device
    public static int SetRefreshRate(string deviceName, int refreshRate)
    {
        DEVMODE devMode = new DEVMODE();
        devMode.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));

        // Get current settings
        if (!EnumDisplaySettings(deviceName, ENUM_CURRENT_SETTINGS, ref devMode))
        {
            return DISP_CHANGE_BADMODE;
        }

        // Check if the refresh rate is supported
        bool modeFound = false;
        int modeIndex = 0;
        DEVMODE testMode = new DEVMODE();
        testMode.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));
        
        while (EnumDisplaySettings(deviceName, modeIndex, ref testMode))
        {
            if (testMode.dmDisplayFrequency == refreshRate && 
                testMode.dmPelsWidth == devMode.dmPelsWidth && 
                testMode.dmPelsHeight == devMode.dmPelsHeight)
            {
                modeFound = true;
                break;
            }
            modeIndex++;
        }

        if (!modeFound)
        {
            return DISP_CHANGE_BADMODE; // Mode not supported
        }

        // Apply refresh rate
        devMode.dmFields = DM_DISPLAYFREQUENCY;
        devMode.dmDisplayFrequency = refreshRate;

        return ChangeDisplaySettingsEx(deviceName, ref devMode, IntPtr.Zero, CDS_UPDATEREGISTRY | CDS_GLOBAL, IntPtr.Zero);
    }

    // Set color depth for a specific device
    public static int SetColorDepth(string deviceName, int bitsPerPixel)
    {
        DEVMODE devMode = new DEVMODE();
        devMode.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));

        // Get current settings
        if (!EnumDisplaySettings(deviceName, ENUM_CURRENT_SETTINGS, ref devMode))
        {
            return DISP_CHANGE_BADMODE;
        }

        // Check if the color depth is supported
        bool modeFound = false;
        int modeIndex = 0;
        DEVMODE testMode = new DEVMODE();
        testMode.dmSize = (short)Marshal.SizeOf(typeof(DEVMODE));
        
        while (EnumDisplaySettings(deviceName, modeIndex, ref testMode))
        {
            if (testMode.dmBitsPerPel == bitsPerPixel)
            {
                modeFound = true;
                break;
            }
            modeIndex++;
        }

        if (!modeFound)
        {
            return DISP_CHANGE_BADMODE; // Mode not supported
        }

        // Apply color depth
        devMode.dmFields = DM_BITSPERPEL;
        devMode.dmBitsPerPel = bitsPerPixel;

        return ChangeDisplaySettingsEx(deviceName, ref devMode, IntPtr.Zero, CDS_UPDATEREGISTRY | CDS_GLOBAL, IntPtr.Zero);
    }
}
"@

# Add the C# code to PowerShell
try {
    Write-Host "Compiling C# code for display settings..."
    Add-Type -TypeDefinition $code -Language CSharp -ErrorAction Stop
}
catch {
    Write-Host "Failed to compile C# code. Error: $($_.Exception.Message)"
    exit 1
}

# Get all display devices
Write-Host "`nDetecting display devices..."
$devices = [DisplaySettings]::GetDisplayDevices()

if ($devices.Count -eq 0) {
    Write-Host "No display devices found!"
    exit 1
}

Write-Host "Found $($devices.Count) display device(s):`n"
foreach ($device in $devices) {
    $isPrimary = ($device.StateFlags -band [DisplaySettings]::DISPLAY_DEVICE_PRIMARY_DEVICE) -ne 0
    $primaryText = if ($isPrimary) { " (PRIMARY)" } else { "" }
    Write-Host "  - $($device.DeviceName): $($device.DeviceString)$primaryText"
}

# Apply settings to all monitors
Write-Host "`n=== Applying Settings to All Monitors ===`n"

foreach ($device in $devices) {
    Write-Host "Configuring: $($device.DeviceName) - $($device.DeviceString)"
    Write-Host "--------------------------------------------"

    # Set resolution to 1920x1080
    Write-Host "  Setting resolution to 1920x1080..."
    try {
        $result = [DisplaySettings]::SetResolution($device.DeviceName, 1920, 1080)
        if ($result -eq 0) {
            Write-Host "  ✓ Successfully set resolution to 1920x1080." -ForegroundColor Green
        }
        else {
            Write-Host "  ✗ Failed to set resolution. Error code: $result" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "  ✗ Exception setting resolution: $($_.Exception.Message)" -ForegroundColor Red
    }

    # Set refresh rate to 144Hz
    Write-Host "  Setting refresh rate to 144Hz..."
    try {
        $result = [DisplaySettings]::SetRefreshRate($device.DeviceName, 144)
        if ($result -eq 0) {
            Write-Host "  ✓ Successfully set refresh rate to 144Hz." -ForegroundColor Green
        }
        else {
            Write-Host "  ✗ Failed to set refresh rate. Error code: $result (May not be supported)" -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "  ✗ Exception setting refresh rate: $($_.Exception.Message)" -ForegroundColor Yellow
    }

    # Set color depth to 32-bit
    Write-Host "  Setting color depth to 32-bit..."
    try {
        $result = [DisplaySettings]::SetColorDepth($device.DeviceName, 32)
        if ($result -eq 0) {
            Write-Host "  ✓ Successfully set color depth to 32-bit." -ForegroundColor Green
        }
        else {
            Write-Host "  ✗ Failed to set color depth. Error code: $result" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "  ✗ Exception setting color depth: $($_.Exception.Message)" -ForegroundColor Red
    }

    Write-Host ""
}

Write-Host "=== Configuration Complete ===" -ForegroundColor Cyan