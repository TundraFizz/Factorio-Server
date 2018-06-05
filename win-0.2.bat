@echo off

(

echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
echo Invoke-WebRequest -Uri https://github.com/TundraFizz/Factorio-Server/raw/master/all-mods.zip -OutFile all-mods.zip
echo mkdir $env:APPDATA/Factorio/mods

echo $shell_app = new-object -com shell.application

echo $zip_file = $args[0] + "\all-mods.zip"
echo $zip_file = $shell_app.namespace($zip_file^)

echo $destination = $env:APPDATA + "\Factorio\mods"
echo $destination = $shell_app.namespace($destination^)
echo $destination.Copyhere($zip_file.items(^)^)

) > "temp.ps1"

Powershell.exe -executionpolicy remotesigned -File temp.ps1 %cd%
del temp.ps1
del all-mods.zip
pause
