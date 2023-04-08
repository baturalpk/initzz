Write-Host
Write-Host -ForegroundColor Green "Setting up 'WSL'..."
wsl --install -d Debian; sleep 5;
Write-Host -ForegroundColor Blue "Waiting for exiting the Debian setup..."
Wait-Process -Name debian
wsl --set-default-version 2
wsl --setdefault Debian

# Set up Nix for WSL
Write-Host -ForegroundColor Green "Installing 'nix' into WSL..."
wsl -u root sh -c 'apt -y update && apt -y full-upgrade'
wsl -u root sh -c 'apt install -y curl xz-utils'
wsl sh -c 'curl -L https://nixos.org/nix/install | sh -s -- --no-daemon'
