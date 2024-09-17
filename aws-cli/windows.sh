# PowerShell script to install AWS CLI v2 on Windows

# Download the latest AWS CLI v2 installer for Windows (64-bit)
$downloadUrl = "https://awscli.amazonaws.com/AWSCLIV2.msi"
$outputPath = "$env:TEMP\AWSCLIV2.msi"

# Download the AWS CLI MSI installer
Write-Host "Downloading AWS CLI installer..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $outputPath

# Install the AWS CLI
Write-Host "Installing AWS CLI..."
Start-Process msiexec.exe -ArgumentList "/i", $outputPath, "/quiet", "/norestart" -NoNewWindow -Wait

# Verify the installation
Write-Host "Verifying AWS CLI installation..."
$awsVersion = aws --version
if ($awsVersion) {
    Write-Host "AWS CLI installed successfully! Version: $awsVersion"
} else {
    Write-Host "AWS CLI installation failed!"
}

# Clean up the installer file
Write-Host "Cleaning up..."
Remove-Item -Path $outputPath -Force

Write-Host "AWS CLI installation script completed."
