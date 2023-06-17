Write-Host
Write-Host -ForegroundColor Green "Setting up 'WSL'..."
wsl --set-default-version 2
wsl --install -d Ubuntu; sleep 5;
Write-Host -ForegroundColor Blue "Waiting for exiting the Ubuntu setup..."
Wait-Process -Name ubuntu
wsl --setdefault Ubuntu

Write-Host -ForegroundColor Green "Customizing your WSL distro..."

wsl -u baturalp bash -c 'sudo apt -y update && sudo apt -y full-upgrade'

wsl -u baturalp bash -c 'sudo apt-add-repository ppa:fish-shell/release-3 && sudo apt update && sudo apt install fish'
wsl -u baturalp bash -c 'chsh -s /usr/bin/fish'
wsl -u root bash -c 'chsh -s /bin/fish'

wsl -u baturalp fish -c 'sudo apt -y install build-essential'
wsl -u baturalp fish -c '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
wsl -u baturalp fish -c 'eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)'
wsl -u baturalp fish -c 'echo 'eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.config/fish/config.fish'
wsl -u baturalp fish -c 'brew install gcc starship bat git-delta jq ripgrep tealdeer'
wsl -u baturalp fish -c 'echo "starship init fish | source" >> ~/.config/fish/config.fish'
