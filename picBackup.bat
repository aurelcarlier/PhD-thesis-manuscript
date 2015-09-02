:: creation du nouveau dossier de sauvegarde
for /f "tokens=1,2,3 delims=/ " %%a in ('date /t') do set theDate=%%a%%b%%c
for /f "tokens=1,2,3 delims=:" %%a in ('time /t') do set theHour=%%a%%b
SET dirBak="H:\PROJET SDS - MIC\04-Theses-Stages\Aurelien_Carlier\05_Backups\figsTheseBak\%theDate% - %theHour%"
MKDIR %dirBak%

:: copie des fichiers dans le répertoire cible
for /r %%f in (*.png *.jpg) do (copy "%%f" %dirBak%)