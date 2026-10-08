Write-Information "Cleaning .g.dart build objects."
Get-ChildItem -Path lib -Filter *.g.dart -Recurse | Remove-Item -Force
Write-Information "Remember to run at least once build.ps1."
