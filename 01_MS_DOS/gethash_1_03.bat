@echo off

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
echo.
echo ################################################################
echo.
echo ハッシュ値収集バッチです。実行しますか？
echo 中止する場合はCtl+C
echo 実行する場合は
pause

echo.
echo 実行します
echo.
echo ################################################################
echo.

echo.
echo ************ 処理開始 ************
echo.

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
rem 時間取得
set CDATE=%date:~-10,4%-%date:~-5,2%-%date:~-2,2%
set CTIME=%time: =0%
set CTIME=%CTIME:~0,2%-%CTIME:~3,2%-%CTIME:~6,2%

rem ログファイル設定
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
echo ************ 処理終了 ************
echo.

echo 10秒後に閉じます
ping 127.0.0.1 -n 10 2> nul 1>&2
exit
