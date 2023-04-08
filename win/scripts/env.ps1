$user = [Environment]::UserName

Write-Host
Write-Host -ForegroundColor Yellow "Updating environment paths for user '$user'..."
$paths = @(
    # My OneDrive-backed binary(s)
    "C:\Users\$user\OneDrive\Programs\bin\"

    # My Pocketbase data and script(s)
    "C:\Users\$user\OneDrive\Programs\pocketbase\"
)

$path_current = [Environment]::GetEnvironmentVariable("Path")
$path_new = $path_current + ";" + ($paths -join ";")

[Environment]::SetEnvironmentVariable("Path", "$path_new", "User")
