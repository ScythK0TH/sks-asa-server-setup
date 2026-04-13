@echo off
setlocal enabledelayedexpansion

echo Select Map:
echo 1: TheIsland_WP
echo 2: TheCenter_WP
echo 3: ScorchedEarth_WP
echo 4: Ragnarok_WP
echo 5: Aberration_WP
echo 6: Extinction_WP
echo 7: Valguero_WP
echo 8: Astraeos_WP
echo 9: LostColony_WP

choice /c 123456789 /n /m "Select map"
set "selectedMap=%errorlevel%"
for /f "tokens=%selectedMap% delims=;" %%A in ("TheIsland_WP;TheCenter_WP;ScorchedEarth_WP;Ragnarok_WP;Aberration_WP;Extinction_WP;Valguero_WP;Astraeos_WP;LostColony_WP") do set "MAP=%%A"

set "SESSIONNAME=SKS_ASA_Server"
set /p SESSIONNAME=Enter SessionName [SKS_ASA_Server]: 
if "%SESSIONNAME%"=="" set "SESSIONNAME=SKS_ASA_Server"

set "SERVERPASSWORD=blank1234"
set /p SERVERPASSWORD=Enter ServerPassword [blank1234]: 
if "%SERVERPASSWORD%"=="" set "SERVERPASSWORD=blank1234"

set "PORT=7777"
set /p PORT=Enter Port [7777]: 
if "%PORT%"=="" set "PORT=7777"

set "QUERYPORT=27015"
set /p QUERYPORT=Enter QueryPort [27015]: 
if "%QUERYPORT%"=="" set "QUERYPORT=27015"

set "MAXPLAYERS=20"
set /p MAXPLAYERS=Enter MaxPlayers [20]: 
if "%MAXPLAYERS%"=="" set "MAXPLAYERS=20"

set "ADMINPASSWORD=qwer1234_"
set /p ADMINPASSWORD=Enter ServerAdminPassword [qwer1234_]: 
if "%ADMINPASSWORD%"=="" set "ADMINPASSWORD=qwer1234_"

choice /c 12 /n /m "RCON Enabled? 1=Yes 2=No"
if errorlevel 2 (
    set "RCON_ENABLED=False"
) else (
    set "RCON_ENABLED=True"
)

set "RCONPORT=27020"
set /p RCONPORT=Enter RCONPort [27020]: 
if "%RCONPORT%"=="" set "RCONPORT=27020"

choice /c 12 /n /m "BattleEye? 1=Yes 2=No"
if errorlevel 2 (
    set "BATTLEYE_FLAG=-NoBattlEye"
) else (
    set "BATTLEYE_FLAG="
)

set "MODS="
set /p MODS=Enter Mods string (comma-separated, leave blank for none): 

echo.
echo 1: Create start_vanilla.bat
echo 2: Create start_modded.bat
choice /c 12 /n /m "Select option"
if errorlevel 2 goto Modded
goto Vanilla

:Vanilla
echo Creating start_vanilla.bat...
(
    echo @echo off
    echo start "" "D:\Servers\ASAServer\ServerDirectory\ShooterGame\Binaries\Win64\ArkAscendedServer.exe" %MAP%?SessionName=%SESSIONNAME%?ServerPassword=%SERVERPASSWORD%?Port=%PORT%?QueryPort=%QUERYPORT%?MaxPlayers=%MAXPLAYERS%?ServerAdminPassword=%ADMINPASSWORD%?RCONEnabled=%RCON_ENABLED%?RCONPort=%RCONPORT% %BATTLEYE_FLAG%
) > start_vanilla.bat
goto End

:Modded
if "%MODS%"=="" (
    set "MODS_FLAG="
) else (
    set "MODS_FLAG=-mods=\"%MODS%\""
)
echo Creating start_modded.bat...
(
    echo @echo off
    echo start "" "D:\Servers\ASAServer\ServerDirectory\ShooterGame\Binaries\Win64\ArkAscendedServer.exe" %MAP%?SessionName=%SESSIONNAME%?ServerPassword=%SERVERPASSWORD%?Port=%PORT%?QueryPort=%QUERYPORT%?MaxPlayers=%MAXPLAYERS%?ServerAdminPassword=%ADMINPASSWORD%?RCONEnabled=%RCON_ENABLED%?RCONPort=%RCONPORT% %BATTLEYE_FLAG% %MODS_FLAG%
) > start_modded.bat
goto End

:End
echo Done.
pause
endlocal
