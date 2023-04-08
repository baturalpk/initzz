Write-Host -ForegroundColor Yellow "Setting up font face for WindowsTerminal..."

Write-Host "Installing CaskaydiaCove Nerd Font"
choco install -y cascadia-code-nerd-font
Pause

Write-Host "Updating the Windows Registry for Console\TrueTypeFont"
$font_key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont'
Set-ItemProperty -Path $font_key -Name '000' -Value 'CaskaydiaCove Nerd Font'
Pause

Write-Host "Applying 'CaskaydiaCove Nerd Font' to settings.json (WindowsTerminal)"
$font = @"
{
    "face": "CaskaydiaCove Nerd Font",
    "weight": "normal"
}
"@
$settings_json_file = (($env:LOCALAPPDATA) + "\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json")
$settings_json = Get-Content $settings_json_file -Raw | ConvertFrom-Json
$settings_json.profiles.defaults | Add-Member -Name "font" -Value (ConvertFrom-Json $font) -MemberType NoteProperty
$settings_json | ConvertTo-Json -Depth 64 | Set-Content $settings_json_file
