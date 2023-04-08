Write-Host
Write-Host -ForegroundColor Yellow "Importing dotfiles to ~/"

$wd = Split-Path $MyInvocation.MyCommand.Path
$src = Join-Path -Path $wd -ChildPath "..\..\common\dotfiles"

Copy-item -Force -Recurse -Verbose "$src\*" -Destination $HOME
