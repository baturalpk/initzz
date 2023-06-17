Write-Host
Write-Host -ForegroundColor Yellow "Importing dotfiles to ~/ and wsl:~/"

$wdroot = pwd
$wd = Split-Path $MyInvocation.MyCommand.Path
$src = Join-Path -Path $wd -ChildPath "../../common/dotfiles"

Set-Location $src

Copy-item -Force -Recurse -Verbose ".\*" -Destination $HOME
wsl sh -c 'cp -r . ~/'

Set-Location $wdroot
