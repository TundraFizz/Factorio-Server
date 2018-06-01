curl -L https://github.com/TundraFizz/Factorio-Server/raw/master/all-mods.zip -o all-mods.zip
mkdir "%AppData%/Factorio/mods"
unzip all-mods -d "%AppData%/Factorio/mods"
rm all-mods.zip
echo "All done"
pause
