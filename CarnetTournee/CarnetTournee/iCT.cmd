echo off

REM ATTENTION : ce script est normalement appelé par un autre qui fournira les paramètres nécessaires ET sans doute 
REM             installera le runtime PB (qui doit être présent quand on lance le présent script)/
REM             S'il n'est pas appelé par un autre, utilisation de paramètres par défaut OU fournir les paramètres
REM             à la ligne de commande.
REM 4 arguments possibles
REM argument %1 = le dossier où il faut installer les fichiers (défaut=D:\CarnetTournee)
REM argument %2 = le dossier où se trouvent la version officielle des fichiers sur le serveur (source de la synchronization) (défaut=O:\CarnetTournee)
REM argument %3 = le dossier où est installé le runtime PB (défaut=D:\PBRTS)
REM argument %4 = le dossier où se trouvent la version officielle du runtime PB sur le serveur (source de la synchronization) (défaut=O:\PBRTS)

REM exemple 1 : o:\Carnet\install_CT c:\CarnetTournee o:\CarnetTournee
REM exemple 2 : o:\Carnet\install_CT
REM exemple 3 : o:\Carnet\install_CT c:\CarnetTournee o:\CarnetTournee c:\pbrts o:\pbrts

echo .
echo debut installation CarnetTournee

setlocal

REM substitution des paramètres de commandes : remplacer les noms longs par des noms courts
REM pour + d'info : taper help call dans une fenêtre DOS

set DEST=%~s1
if not defined DEST set DEST=d:\CarnetTournee

set ORG=%~s2
if not defined ORG set ORG=o:\CarnetTournee

set DEFDESTPB=d:\pbrts
set DESTPB=%~s3
if not defined DESTPB set DESTPB=%DEFDESTPB%
if not %DESTPB%==%DEFDESTPB% set SHORTCUTDESTPB=%DESTPB%

set ORGPB=%~s4
if not defined ORGPB set ORGPB=o:\pbrts

if not exist %ORG%\nul goto erreurORG
if not exist %DESTPB%\nul goto erreurPB

REM si dossier destination n'existe pas le créer

if exist %DEST%\nul goto DESTEXIST
mkdir %DEST%
if errorlevel 1 goto erreurDEST

:DESTEXIST
copy "%ORG%\CarnetTournee.cmd" %DEST%
copy "%ORG%\CarnetTournee.exe" %DEST%
copy "%ORG%\*.pbd" %DEST%
xcopy /Y /i %ORG%\Exchange %DEST%\Exchange

REM création du raccourci (c'est ici que le runtime PB est déjà nécessaire)
set PATH=%PATH%;%DESTPB%
%ORG%\createshortcut.exe Shortcut=Carnet Tournee; target=%DEST%\CarnetTournee.cmd; WorkingDir=%DEST%; Arguments=%ORG% %ORGPB% %SHORTCUTDESTPB%; SpecialFolder=Desktop, Programs; Icon=%DEST%\CarnetTournee.exe

goto fin_ok

:erreurDEST
cls
echo .
echo Creation du dossier %DEST% impossible - Installation abandonnee
echo .
goto fin_err

:erreurORG
cls
echo .
echo Le dossier source %ORG% n'existe pas - Installation abandonnee
echo .
goto fin_err

:erreurPB
cls
echo .
echo Le dossier runtime PB %DESTPB% n'existe pas - Installation abandonnee
echo .
goto fin_err

:fin_err
echo .
echo Erreur lors de l'installation de CarnetTournee !
pause
REM astuce pour provoquer un errorlevel > 0
dddd 2>nul
goto fin

goto fin

:fin_ok
echo .
echo Installation de l'application CarnetTournee terminee !
goto fin

:fin
endlocal