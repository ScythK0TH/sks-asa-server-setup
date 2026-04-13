@echo off
setlocal enabledelayedexpansion

echo Vanilla Or Modded?
echo 1: Vanilla
echo 2: Modded

choice /c 12 /n /m "Select option"
if errorlevel 2 goto Modded
goto Vanilla

:Vanilla
echo Creating start_vanilla.bat...
(
    echo @echo off
    echo start D:\Servers\ASAServer\ServerDirectory\ShooterGame\Binaries\Win64\ArkAscendedServer.exe Ragnarok_WP?SessionName=SKS_ASA_Server?ServerPassword=blank1234?Port=7777?QueryPort=27015?MaxPlayers=20?ServerAdminPassword=qwer1234_?RCONEnabled=True?RCONPort=27020? -NoBattlEye
) > start_vanilla.bat
goto End

:Modded
echo Creating start_modded.bat...
(
    echo @echo off
    echo start D:\Servers\ASAServer\ServerDirectory\ShooterGame\Binaries\Win64\ArkAscendedServer.exe Ragnarok_WP?SessionName=SKS_ASA_Server?ServerPassword=blank1234?Port=7777?QueryPort=27015?MaxPlayers=20?ServerAdminPassword=qwer1234_?RCONEnabled=True?RCONPort=27020? -NoBattlEye -mods="940975,929489,976972,949521,935408,947033,928597,939055,950914,930404,928539,930684,929110,953154"
) > start_modded.bat
goto End

:End
endlocal
