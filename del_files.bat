@echo off

::Variavies de Data

::pasta a ser analisada
set pasta=D:\TESTE\

::pasta de logs
set logs=D:\TESTE\LOGS

::extensão dos arquivos a serem apagados
set ext=PDF

::quantidade de dias a serem mantidos
set dias=20


::make var nowDay
FOR /F "TOKENS=1* DELIMS=/" %%A IN ('date/t') DO SET nowDay=%%A

::Lista em log os arquivos encontrados
FORFILES /S /p %pasta% /d -%dias% /M *.%ext% /c "CMD /C echo @FILE @FDATE" > %logs%\%nowDay%.log

::Remove os arquivos encontrados
FORFILES /S /p %pasta% /d -%dias% /M *.%ext% /c "CMD /C DEL @FILE /Q"