# Define the path to the mods folder
$modsPath = ".\mods"

# Check if the script was launched with the "revert" argument
$revertOperation = $args[0] -eq "revert"

# Extract file patterns from the script arguments, skipping the first one if it's "revert"
$startIndex = 0
if ($revertOperation) { $startIndex = 1 }
$filePatterns = $args | Select-Object -Skip $startIndex

# Function to write colored log
function Write-ColoredLog {
    param(
        [String]$Message,
        [ConsoleColor]$Color = 'White'
    )
    $previousColor = $Host.UI.RawUI.ForegroundColor
    $Host.UI.RawUI.ForegroundColor = $Color
    Write-Host $Message
    $Host.UI.RawUI.ForegroundColor = $previousColor
}

# Check if file patterns are provided
if ($filePatterns.Count -eq 0) {
    Write-ColoredLog -Message "No file patterns provided. Please specify file patterns as arguments." -Color Red
    exit
}

# Iterate through each file pattern
foreach ($pattern in $filePatterns) {
    # Handle files starting with '!' differently
    if ($pattern.StartsWith('!')) {
        $files = Get-ChildItem -Path $modsPath | Where-Object { $_.Name -like $pattern }
    } else {
        $files = Get-ChildItem -Path $modsPath -Filter $pattern
    }

    foreach ($file in $files) {
        if ($revertOperation) {
            # Check if the file has the .disabled extension to remove it
            if ($file.Name.EndsWith('.disabled')) {
                $newFileName = $file.FullName.Replace('.disabled', '')

                # Rename the file to remove .disabled extension
                Rename-Item -Path $file.FullName -NewName $newFileName

                # Log the action
                Write-ColoredLog -Message "Reverted: $($file.Name) -> $(Split-Path -Leaf $newFileName)" -Color Magenta
            }
            else {
                # Log that the file does not have .disabled extension
                Write-ColoredLog -Message "No revert needed: $($file.Name)" -Color Yellow
            }
        }
        else {
            # Check if the file does not already have the .disabled extension to add it
            if (-not $file.Name.EndsWith('.disabled')) {
                $newFileName = "$($file.FullName).disabled"

                # Rename the file to add .disabled extension
                Rename-Item -Path $file.FullName -NewName $newFileName

                # Log the action
                Write-ColoredLog -Message "Renamed: $($file.Name) -> $($file.Name).disabled" -Color Green
            }
            else {
                # Log that the file is already renamed
                Write-ColoredLog -Message "Already renamed: $($file.Name)" -Color Yellow
            }
        }
    }
}

if ($revertOperation) {
    Write-ColoredLog -Message "Revert operation completed." -Color Cyan
}
else {
    Write-ColoredLog -Message "Rename operation completed." -Color Cyan
}
