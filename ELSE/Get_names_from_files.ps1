# Get file paths
$files = Get-ChildItem -Path "D:\Programs" -File

# Process file names and save to text file
$files | ForEach-Object {
    $_.BaseName.Trim()
} | Out-File -FilePath "output.txt"
