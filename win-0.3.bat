@echo off

(

echo $version = $PSVersionTable.PSVersion.Major
echo echo "Powershell Version: $version"

echo if($version -eq 1^){

  echo echo "Not supported, get a better computer"

echo }elseif($version -eq 2^){

  echo echo "Running low-tech setup"

  echo $source = "https://github.com/TundraFizz/Factorio-Server/raw/master/all-mods.zip"
  echo $output = "C:\Users\leif.coleman\Desktop\all-mods.zip"

  echo echo "Downloading mods"
  echo bitsadmin.exe /transfer "JobName" $source $output

  echo $modsDirectory = "$env:APPDATA/Factorio/mods"

  echo if((Test-Path $modsDirectory^) -eq 0^){
    echo echo "Creating mods directory in Factorio"
    echo mkdir $modsDirectory;
  echo }else{
    echo echo "Mods directory in Factorio already exists"
  echo }

  echo $shell_app = new-object -com shell.application
  echo $zip_file = $args[0] + "\all-mods.zip"
  echo $zip_file = $shell_app.namespace($zip_file^)
  echo $destination = $env:APPDATA + "\Factorio\mods"
  echo $destination = $shell_app.namespace($destination^)

  echo echo "Extracting mods to directory"
  echo $destination.Copyhere($zip_file.items(^)^)

  echo echo "Done!"

echo }elseif($version -ge 3^){

  echo echo "Running high-tech setup"

  echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  echo Invoke-WebRequest -Uri https://github.com/TundraFizz/Factorio-Server/raw/master/all-mods.zip -OutFile all-mods.zip

echo }else{

  echo echo "Unknown error"

echo }

) > "temp.ps1"

Powershell.exe -executionpolicy remotesigned -File temp.ps1 %cd%
del temp.ps1
del all-mods.zip
pause
