Write-Host "Cleaning .g.dart build objects."
del lib\src\paperplane\**\*.g.dart
del lib\src\telegram\*.g.dart
del lib\src\tools\**\.g.dart
Write-Host "Remember to run at least once build.ps1."
