@echo off
chcp 65001
set command=!whois
set commandfile=!whois.module
if exist %commandfile% echo FILE CANNOT BE CREATED. THIS CONFIGURATION HAS ALREADY BEEN SETUP. PLEASE REMOVE THIS CONFIG AND TRY AGAIN
:main
cls
echo ╦ ╦╦ ╦╔═╗  ╦╔═╗  ┌┬┐┌─┐┌┬┐┬ ┬┬  ┌─┐
echo ║║║╠═╣║ ║  ║╚═╗  ││││ │ │││ ││  ├┤ 
echo ╚╩╝╩ ╩╚═╝  ╩╚═╝  ┴ ┴└─┘─┴┘└─┘┴─┘└─┘
echo Author: @sjapanwala
echo - - - - - - - - - - - - - - - - - - - - 
echo welcome to the whois module,
echo - find out all the security information for the set ip
echo PREREQS,
echo - Cannot have a "!whois" file created in the past
echo - root file must be named "flame.cmd"
echo - root file must be in the same directory
set /p choice=download module? (y/n):
:choice 
if %choice%==y goto download
if %choice%==Y goto download
if %choice%==n goto exit 
if %choice%==N goto exit
:download
echo :!whois>>flame.cmd
echo echo.>>flame.cmd
echo echo [Created by [40;32m@sjapanwala[40;37m]>>flame.cmd
echo set /p targetip=Please Enter The Target IP: >>flame.cmd
echo echo [0000000000]>>flame.cmd
echo echo [1000000000]>>flame.cmd
echo echo [1200000000]>>flame.cmd
echo echo [1230000000]>>flame.cmd
echo echo [1234000000]>>flame.cmd
echo echo [1234500000]>>flame.cmd
echo echo [1234560000]>>flame.cmd
echo echo [1234567000]>>flame.cmd
echo echo [1234567800]>>flame.cmd
echo echo [[40;32m1234567890[40;37m]>>flame.cmd
echo echo DONE!>>flame.cmd
echo echo.>>flame.cmd
echo echo.>>flame.cmd
echo curl https://api.ipapi.is/?whois=%targetip%>>flame.cmd
echo goto commandline>>flame.cmd
echo COMMANDFILE>%commandfile%
echo :!whoishelp>>flame.cmd
echo echo.>>flame.cmd
echo echo WHOIS is a api root that searches security and orginization>>flame.cmd
echo echo information that is allocated to IP addresses an such>>flame.cmd
echo echo.>>flame.cmd
echo echo !whois - shows the command>>flame.cmd
echo echo !whoishelp - shows the commands help center>>flame.cmd
echo echo [Created by [40;32m@sjapanwala[40;37m]>>flame.cmd
echo echo 1/18/2024>>flame.cmd
echo echo COMPATIBLE WITH [[[40;31mflame[40;37m]→→]>>flame.cmd
echo echo.>>flame.cmd
echo goto commandline>>flame.cmd
echo COMMANDFILE>!whoishelp.module