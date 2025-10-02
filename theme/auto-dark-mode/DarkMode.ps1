# Check if PSGallery is registered and trusted
$repo = Get-PSRepository -Name "PSGallery" -ErrorAction SilentlyContinue

if (-not $repo -or $repo.InstallationPolicy -ne 'Trusted') {
    Write-Host "Configuring PSGallery repository for faster installs..."
    Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
}

# Install VirtualDesktop module if not already installed
if (-not (Get-Module -ListAvailable -Name VirtualDesktop)) {
    Write-Host "Installing VirtualDesktop module..."
    Install-Module VirtualDesktop -Scope CurrentUser -Force
}

# Set wallpaper across all desktops
$wallpaperPath = "C:\Users\gpall\Projects\dotfiles\theme\Fluid-d.png"
Write-Host "Setting wallpaper on all desktops..."
Set-AllDesktopWallpapers -Path $wallpaperPath