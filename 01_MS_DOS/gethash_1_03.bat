@echo off

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
echo.
echo ################################################################
echo.
echo �n�b�V���l���W�o�b�`�ł��B���s���܂����H
echo ���~����ꍇ��Ctl+C
echo ���s����ꍇ��
pause

echo.
echo ���s���܂�
echo.
echo ################################################################
echo.

echo.
echo ************ �����J�n ************
echo.

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
rem ���Ԏ擾
set CDATE=%date:~-10,4%-%date:~-5,2%-%date:~-2,2%
set CTIME=%time: =0%
set CTIME=%CTIME:~0,2%-%CTIME:~3,2%-%CTIME:~6,2%

rem ���O�t�@�C���ݒ�
set CDIR=%~dp0
set LFILE=%CDIR%hashlist_%CDATE%_%CTIME%.txt

echo. >> %LFILE%
echo search : %CDIR% >> %LFILE%
echo start  : %DATE% %TIME% >> %LFILE%
echo ******************************************** >> %LFILE%

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
for /f "delims=;" %%i in ('dir /s /b /a-d') do (
  echo. >> %LFILE%
  certutil -hashfile "%%i" >> %LFILE%
  if ERRORLEVEL 0 (
    echo > nul
  ) else (
    echo err : %%i >> %LFILE%
  )
)

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
echo. >> %LFILE%
echo ******************************************** >> %LFILE%
echo end    : %DATE% %TIME% >> %LFILE%
echo by %0 >> %LFILE%

echo.
echo ************ �����I�� ************
echo.

echo 10�b��ɕ��܂�
ping 127.0.0.1 -n 10 2> nul 1>&2
exit
