REM installation PBRTS et CarnetTournee
REM Substitution des parametres de commandes : pour + d'info, taper help call dans une fen�tre DOS.
REM Argument necessaire :
REM    %1 = dossier d'un disque local o� on installe les applications et le runtime PB. 
REM    Exemple : "D:\Program Files"
REM    Par d�faut : D:\DnfAPPL
REM    Destination = disque D de pr�f�rence, disque C selectionne automatiquement si pas de D.

echo off
cls
setlocal

REM Le dossier d'o� on lance l'installation est le dossier contenant l'application. Il est suppos� se trouver
REM sur le m�me niveau hi�rarchique que le runtime PB. On d�duit le dossier contenant CARNET et PBRTS
REM du dossier d'o� on lance l'installation.
for %%i in ("%cd%") do set ORGPATH=%%~dpi

set DESTDISK=%~d1
if not defined DESTDISK set DESTDISK=D:
if not exist %DESTDISK%\nul set DESTDISK=C:

REM le format %~pn1 produit le path complet (jusqu'au nom de fichier) sans la lettre du disque
set DESTPATH=%~pn1
if not defined DESTPATH set DESTPATH=\DnfAPPL

echo ORGPATH=%ORGPATH% 
echo DESTDISK=%DESTDISK% 
echo DESTPATH=%DESTPATH%

set STEP=check DESTINATION
set DESTPATH=%DESTDISK%\%DESTPATH%

if exist "%DESTPATH%" goto checkORGDISK
md "%DESTPATH%"
if errorlevel 1 goto erreurDESTINATION

REM verifier que le dossier source est correct (on v�rifie qu'il contient au moins le dossier pbrts)
:checkORGDISK
set STEP=check ORIGINE
if exist "%ORGPATH%\pbrts" goto PBRTS
goto erreurORGPATH

:PBRTS
set STEP=PBRTS
call "%ORGPATH%\pbrts\install_RTS" "%DESTPATH%\pbrts" "%ORGPATH%\pbrts"
if errorlevel 1 goto fin_err

set STEP=CarnetTournee
call "%ORGPATH%\CarnetTournee\iCT" "%DESTPATH%\CarnetTournee" "%ORGPATH%\CarnetTournee" "%DESTPATH%\pbrts" "%ORGPATH%\pbrts"
if errorlevel 1 goto fin_err

goto fin

:erreurDESTINATION
echo .
echo Le dossier %DESTPATH% n'existe pas et il est impossible de le creer
echo .
goto fin_err

:erreurORGPATH
echo .
echo Le dossier %ORGPATH% ne semble pas contenir l'application et/ou PBRTS
echo .
goto fin_err

:fin_err
echo .
echo Installation incomplete (%STEP%) !
echo .
pause
goto fin

:fin
endlocal