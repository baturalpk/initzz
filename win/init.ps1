#Requires -RunAsAdministrator

$wg = [bool](Get-Command -Name winget -ErrorAction SilentlyContinue)
if ($wg -eq $False)
{
    Write-Host -ForegroundColor Red "Unable to find 'winget' executable."
    Write-Host -ForegroundColor Blue "Get 'winget' from https://www.microsoft.com/store/productId/9NBLGGH4NNS1"
    exit 1
}

# Invocation order policy: FIFO
$scripts = @("explorer", "choco", "wsl", "winget", "win-terminal", "env", "dotfiles")

$workingDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$scriptsDir = Join-Path -Path $workingDir -ChildPath .\scripts

function invoke_scripts {
    foreach ($script in $scripts) {
        Clear-Host
        & "$scriptsDir\$script"
        Pause
    }
}

invoke_scripts
