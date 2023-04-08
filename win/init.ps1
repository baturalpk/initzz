#Requires -RunAsAdministrator

# Invocation order policy: FIFO
$scripts = @("env", "wsl", "choco", "winget", "win-terminal")

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
