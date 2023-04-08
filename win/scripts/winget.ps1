$packages = @(
    "Microsoft.VCRedist.2015+.x64"

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
    "BurntSushi.ripgrep.MSVC"
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
    "Restore KeePass configurations"
    "Restore AutoDarkMode preferences"
    "Modify Greenshot output directory options"
    "Update OBS preferences"
    "Update Zoom settings"
)

function install_packages {
    md .\logs -Force | Out-Null
    $logfile = ".\logs\winget.log"
    Out-File -FilePath $logfile -InputObject "[Failing Installations]"

    foreach ($pkg in $packages) {
        Clear-Host
        winget install -e --accept-source-agreements --accept-package-agreements --id $pkg

        if ($LASTEXITCODE -ne 0) {
            Add-Content $logfile "`t$pkg"
        }
    }
}

install_packages

# Upgrade all remaining packages to the latest available version
winget upgrade --all

# Print post-installation instructions
Write-Host -ForegroundColor Red -BackgroundColor White " 📌 POST INSTALLATION NOTES: "
foreach ($note in $notes) {
    Write-Host -ForegroundColor Yellow "> $note"
}
