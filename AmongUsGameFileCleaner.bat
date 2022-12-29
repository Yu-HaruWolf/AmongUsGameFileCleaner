@echo off
setlocal enabledelayedexpansion
for /f "tokens=* usebackq" %%a in (`"@powershell(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 945360').InstallLocation"`) do set REG_RESULT=%%a
if "%REG_RESULT%" == "" (
    echo Among Usが見つかりません。Steamからインストールをしてください。
    echo;
    pause
    exit /b
)
cd /d "%REG_RESULT%"
if !ERRORLEVEL! == 1 (
    echo Among Usがインストールされているフォルダが見つかりません。Steamでの復元を試みます。
    echo;
    echo 1回目のSteam実行
    start steam://run/945360
    timeout 2 > nul
    echo 2回目のSteam実行
    start steam://run/945360
    timeout 2 > nul
    echo;
    echo =====================
    echo Among Usのフォルダを開いています...
    echo MODファイルをこのフォルダにコピーしてください。
    echo =====================
    timeout 2 > nul
    explorer "%REG_RESULT%"
    pause
    exit /b
)
set /p user_input="%REG_RESULT%内のファイルを全て移動します。よろしいですか？[Y/n] "
if "%user_input%" == "Y" (
    cd ..
    echo Among Us内のファイルを移動中...
    for /f "tokens=* usebackq" %%a in (`"@powershell (Get-Date).ToString('yyyyMMddHHmm')"`) do set BACKUP_TIME=%%a
    set FOLDER_NAME="Among Us_"!BACKUP_TIME!
    MOVE "Among Us" !FOLDER_NAME!
    mkdir "Among Us"
    echo;
    echo 1回目のSteam実行
    start steam://run/945360
    timeout 2 > nul
    echo 2回目のSteam実行
    start steam://run/945360
    timeout 2 > nul
    cd "Among Us"
    echo;
    echo =====================
    echo Among Usのフォルダを開いています...
    echo MODファイルをこのフォルダにコピーしてください。
    echo =====================
    timeout 2 > nul
    explorer .
) else (
    echo 処理をキャンセルしました。
)
endlocal
pause
exit /b