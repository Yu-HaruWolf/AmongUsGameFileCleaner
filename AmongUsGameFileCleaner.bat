@echo off
setlocal enabledelayedexpansion
for /f "tokens=* usebackq" %%a in (`"@powershell(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 945360').InstallLocation"`) do set REG_RESULT=%%a
if "%REG_RESULT%" == "" (
    echo Among Us��������܂���BSteam����C���X�g�[�������Ă��������B
    echo;
    pause
    exit /b
)
cd /d "%REG_RESULT%"
if !ERRORLEVEL! == 1 (
    echo Among Us���C���X�g�[������Ă���t�H���_��������܂���BSteam�ł̕��������݂܂��B
    echo;
    echo 1��ڂ�Steam���s
    start steam://run/945360
    timeout 2 > nul
    echo 2��ڂ�Steam���s
    start steam://run/945360
    timeout 2 > nul
    echo;
    echo =====================
    echo Among Us�̃t�H���_���J���Ă��܂�...
    echo MOD�t�@�C�������̃t�H���_�ɃR�s�[���Ă��������B
    echo =====================
    timeout 2 > nul
    explorer "%REG_RESULT%"
    pause
    exit /b
)
set /p user_input="%REG_RESULT%���̃t�@�C����S�Ĉړ����܂��B��낵���ł����H[Y/n] "
if "%user_input%" == "Y" (
    cd ..
    echo Among Us���̃t�@�C�����ړ���...
    for /f "tokens=* usebackq" %%a in (`"@powershell (Get-Date).ToString('yyyyMMddHHmm')"`) do set BACKUP_TIME=%%a
    set FOLDER_NAME="Among Us_"!BACKUP_TIME!
    MOVE "Among Us" !FOLDER_NAME!
    mkdir "Among Us"
    echo;
    echo 1��ڂ�Steam���s
    start steam://run/945360
    timeout 2 > nul
    echo 2��ڂ�Steam���s
    start steam://run/945360
    timeout 2 > nul
    cd "Among Us"
    echo;
    echo =====================
    echo Among Us�̃t�H���_���J���Ă��܂�...
    echo MOD�t�@�C�������̃t�H���_�ɃR�s�[���Ă��������B
    echo =====================
    timeout 2 > nul
    explorer .
) else (
    echo �������L�����Z�����܂����B
)
endlocal
pause
exit /b