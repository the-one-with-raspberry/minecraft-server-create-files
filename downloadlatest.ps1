curl.exe -O https://raw.githubusercontent.com/the-one-with-raspberry/minecraft-server-create-files/main/mods.zip
if (-Not (Test-Path -Path "$($Env:APPDATA)\.minecraft\mods")) {
    Read-Host -Prompt "The script isn't working properly. Press enter to exit. (devcode mc_modfolder_missing)"
    exit
}
if (-Not (Test-Path -Path ".\mods.zip")) {
    Read-Host -Prompt "The script isn't working properly. Press enter to exit. (devcode archive_dl_incorrectly)"
    exit
}
Move-Item -Path .\mods.zip -Destination "$($Env:APPDATA)\.minecraft\mods"
Set-Location -Path "$($Env:APPDATA)\.minecraft\mods"
Expand-Archive .\mods.zip -DestinationPath .
Set-Location .\mods
Move-Item * ..
Set-Location ..
Remove-Item .\mods.zip
Remove-Item .\mods