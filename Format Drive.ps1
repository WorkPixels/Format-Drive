# Get a list of all volumes under 500 GB
$volumes = Get-Volume | Where-Object { $_.Size -lt 500GB }

# Display the list of volumes to the user and prompt them to select one
Write-Host -ForegroundColor Green "Select a volume to format:"
foreach ($volume in $volumes) {
    Write-Host "$($volume.DriveLetter): $($volume.Size) $($volume.FileSystemLabel)"
}

# Prompt the user to enter the drive letter of the volume to format
$driveLetter = Read-Host -Prompt "Enter the drive letter of the volume to format:"

# Get the selected volume
$selectedVolume = Get-Volume -DriveLetter $driveLetter

# Display the list of file system types to the user and prompt them to select one
$fileSystemTypes = @("NTFS", "FAT32", "exFAT")
Write-Host -ForegroundColor Green "Select a file system type:"
foreach ($fileSystemType in $fileSystemTypes) {
    Write-Host "$fileSystemType"
}

# Prompt the user to enter the name of the file system type
$fileSystemType = Read-Host -Prompt "Enter the name of the file system type:"


# Format the selected volume with the selected file system type
Format-Volume -DriveLetter $selectedVolume.DriveLetter -FileSystem $fileSystemType -Force
