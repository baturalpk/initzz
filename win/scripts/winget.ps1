$packages = @(
    "Microsoft.PowerShell" # PowerShell 7+ 
    "Starship.Starship"
    "Microsoft.WindowsTerminal"
    "Microsoft.PowerToys"
    "Armin2208.WindowsAutoNightMode"
    
    "KeePassXCTeam.KeePassXC"
    "Mozilla.Firefox"
    "Cloudflare.Warp"
    "ProtonTechnologies.ProtonVPN"

    "BlenderFoundation.Blender"
    "Docker.DockerDesktop"
    "KDE.Krita"
    "KDE.KritaShellExtension"
    "Inkscape.Inkscape"
    "JetBrains.Toolbox"
    "Unity.UnityHub"
    "Postman.Postman"
    "Microsoft.VisualStudioCode"
    "Microsoft.VisualStudio.2022.Community"
    
    "Git.Git"
    "OliverBetz.ExifTool"
    "sharkdp.bat"
    "dandavison.delta"
    "stedolan.jq"
    "EclipseAdoptium.Temurin.17.JDK"

    "Discord.Discord"
    "ElectronicArts.EADesktop"
    "EpicGames.EpicGamesLauncher"
    "Spotify.Spotify"
    "Ubisoft.Connect"
    "Valve.Steam"

    "7zip.7zip"
    "CPUID.CPU-Z"
    "CPUID.HWMonitor"
    "Greenshot.Greenshot"
    "JAMSoftware.TreeSize.Free"
    "Microsoft.Office"
    "MiniTool.PartitionWizard.Free"
    "OBSProject.OBSStudio"
    "Zoom.Zoom"
)

$notes = @(
    "Change WindowsTerminal default profile to PowerShell 7+"
    "Restore KeePass configurations"
    "Restore WindowsAutoNightMode preferences"
    "Modify Greenshot output directory options"
    "Install select VS2022 components"
    "Update OBS preferences"
    "Update Zoom settings"
)

function install_packages {
    foreach ($pkg in $packages) {
        Clear-Host
        winget install -e --accept-source-agreements --accept-package-agreements --id $pkg

        if ($LASTEXITCODE -eq 0) {
            Write-Host -ForegroundColor Green "Installation successful: $pkg"
        }
        else {
            Write-Host -ForegroundColor Red "Already installed/up-to-date or an unknown error has occured: $pkg"
        }
        Pause
    }
}

install_packages

Write-Host "Updating font face for WindowsTerminal: Cascadia Code"
%LOCALAPPDATA%\Packages\Microsoft. WindowsTerminal_8wekyb3d8bbwe\LocalState\

Write-Host -ForegroundColor Red -BackgroundColor White " 📌 POST INSTALLATION NOTES: "
foreach ($note in $notes) {
    Write-Host -ForegroundColor Yellow "> $note"
}
