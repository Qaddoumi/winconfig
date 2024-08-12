Write-Host ""

# Initial output
Write-Host "This is the first line."
Write-Host "This is the second line."
Write-Host "This is the third line."
Start-Sleep -Seconds 2  # Pause for demonstration

# Move the cursor up two lines
Write-Host "`e[2A" -NoNewline
Start-Sleep -Seconds 2  # Pause for demonstration

# Move the cursor to the end of the current line
#Write-Host "`e[99C" -NoNewline  # Move the cursor to the right (end of the line)
#Start-Sleep -Seconds 2  # Pause for demonstration

# Move the cursor down one line
Write-Host "`e[B" -NoNewline
Start-Sleep -Seconds 2  # Pause for demonstration

# Clear the bottom line
Write-Host "`e[K" -NoNewline  # Clear the current line from cursor to end of line
Start-Sleep -Seconds 2  # Pause for demonstration

# Optionally, add new text to the cleared line
Write-Host "This is a new third line."
