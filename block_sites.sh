#!/bin/bash
# OS: Linux/macOS
if [ "$(uname)" != "MINGW"* ] && [ "$(uname)" != "CYGWIN"* ]; then
    OS="Linux"
    HOST="127.0.0.1"
    HOSTS_PATH="/etc/hosts"

    echo "Block Thousands of Popular P*rn Sites from your device with just one click."
    read -p "Are you sure you want to proceed?? - [Y/n]" confirm

    if [ "$confirm" != "Y" ]; then
        exit
    else
        echo "Note: You'll never be able to unblock these sites from this device unless you're a nerd."
        read -p "Hit ENTER "
    fi

    if [ ! -f "list.txt" ]; then
        echo "Error: list.txt not found!"
        exit 1
    fi

    haram_list=$(cat list.txt)

    sudo bash -c "for i in $haram_list; do
        echo \"Blocking $i\"
        echo \"$HOST \$i\" >> $HOSTS_PATH
        echo \"Done!\"
    done"

    echo "Successfully Blocked $(echo $haram_list | wc -w) site(s)!"
    exit
fi

# OS: Windows
# : begins the Batch script part
goto windows

# Prevents bash from interpreting anything below this point in Linux
: <<'END'
@end
# Batch script
:windows
@echo off
set "HOST=127.0.0.1"
set "HOSTS_PATH=C:\Windows\System32\drivers\etc\hosts"

echo Block Thousands of Popular P*rn Sites from your device with just one click.
set /p confirm="Are you sure you want to proceed?? - [Y/n]"

if /i not "%confirm%"=="Y" (
    exit /b
)

echo Note: You'll never be able to unblock these sites from this device unless you're a nerd.
pause

if not exist list.txt (
    echo Error: list.txt not found!
    exit /b
)

for /f %%i in (list.txt) do (
    echo Blocking %%i
    echo %HOST% %%i >> %HOSTS_PATH%
    echo Done!
)

for /f %%A in ('findstr /R "^" list.txt ^| find /c /v ""') do (
    echo Successfully Blocked %%A site(s)!
)

pause
exit /b
END
