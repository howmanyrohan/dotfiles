# Windows
$ErrorActionPreference = "Stop"
$Dir = $PSScriptRoot

# VS Code settings
$User = "$env:APPDATA\Code\User"
New-Item -ItemType Directory -Force $User | Out-Null
New-Item -ItemType SymbolicLink -Force -Path "$User\settings.json" -Target "$Dir\vscode\settings.json" | Out-Null

# VS Code extensions
Get-Content "$Dir\vscode\extensions.txt" | Where-Object { $_ } | ForEach-Object { code --install-extension $_ }

Write-Host "Done."
