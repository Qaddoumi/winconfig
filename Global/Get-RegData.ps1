function Get-RegData{
    <#
    .EXAMPLE
    Get-RegData -Path ".\Windhawk\Windhawk.reg"
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
        )

        $replacementMap = @{
            "HKEY_LOCAL_MACHINE" = "HKLM:"
            "HKEY_CURRENT_USER"  = "HKCU:"
            "HKEY_USERS"         = "HKU:"
            "HKEY_CLASSES_ROOT"  = "HKCR:"
        }
        $data = @()
        $currentPath = ""
        $currentEntry = $null
        $regFileContent = Get-Content -Path "$Path"
        foreach ($line in $regFileContent) {
            # Skip empty lines or lines that start with "Windows Registry Editor"
            if ($line -match '^\s*$' -or $line -match '^Windows Registry Editor') {
                continue
            }
            # Detect registry key path
            if ($line -match '^\[([^\]]+)\]$') {
                $currentPath = $matches[1]
                foreach ($key in $replacementMap.Keys) {
                    $currentPath = $currentPath -replace [regex]::Escape($key), $replacementMap[$key]
                }
                continue
            }
            # Detect registry value entries
            if ($line -match '^\s*"([^"]+)"\s*=\s*(.*)$') {
                $name = $matches[1]
                $value = $matches[2]

                # Determine the type and value
                #TODO: Add support for other data types
                if ($value -match '^dword:(.+)$') {
                    $valueType = "DWord"
                    $valueData = $matches[1]
                }
                else {
                    $valueType = "String"
                    $valueData = $value.Trim('"')
                }

                $currentEntry = @{
                    Name  = $name
                    Type  = $valueType
                    Path  = $($currentPath.Replace("HKEY_LOCAL_MACHINE","HKLM:"))
                    Value = if($valueType -eq "DWord"){"0x$($valueData.TrimStart("0"))"} else {$valueData}
                }
                $data += $currentEntry
            }
        }
        return $data
}