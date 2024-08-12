$command = "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine"

Start-Process powershell -Verb RunAs -WindowStyle Hidden -Wait -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"$command`""

$pwshPath = Get-Command pwsh -ErrorAction SilentlyContinue
if($pwshPath){
    Start-Process pwsh -Verb RunAs -WindowStyle Hidden -Wait -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"$command`""
}