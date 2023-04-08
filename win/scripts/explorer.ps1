Write-Host
Write-Host -ForegroundColor Yellow "FileExplorer: Set 'show hidden files and extensions'"

$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1

Write-Host -ForegroundColor Green "Restarting 'explorer.exe'"
Stop-Process -Force -Name explorer
