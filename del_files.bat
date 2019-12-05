@echo off

::Variavies de Data

::pasta a ser analisada
set pasta=D:\Backup_Banco\Archive

::pasta de logs
set logs=D:\Backup_Banco\logs

::extensão dos arquivos a serem apagados
set ext=BAK

::quantidade de dias a serem mantidos
set dias=30


::make var nowDay for log
setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=/-. " %%i in ('date /t') do (
        set v1=%%i& set v2=%%j& set v3=%%k
        if "%%i:~0,1%%" gtr "9" (set v1=%%j& set v2=%%k& set v3=%%l)

        for /f "skip=1 tokens=2-4 delims=(-)" %%m in ('echo.^|date') do (
            set %%m=!v1!& set %%n=!v2!& set %%o=!v3!
    )
)
set nowDay=%dd%
set year=%yy%%aa%
set month=%mm%

::Lista em log os arquivos encontrados
FORFILES /S /p %pasta% /d -%dias% /M *.%ext% /c "CMD /C echo @FILE @FDATE" > %logs%\%year%%month%%nowDay%.log

::Remove os arquivos encontrados
FORFILES /S /p %pasta% /d -%dias% /M *.%ext% /c "CMD /C DEL @FILE /Q"