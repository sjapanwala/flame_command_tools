@echo off
chcp 65001
cls
:: developer variables.
:: >CAUTION!! 
:: >Changing these variables can result in the program behaving differently
:: >Changing without precaution can cause the device to malfunction
rem start vars
set terminalmsg=[[40;31mflame[40;37m]→
:: %terminalmsg%
set localcomputername=[[40;32m%computername%[40;37m]
:: %computername%
set localusername=[[40;32m%username%[40;37m]
:: %localusername%
set active=[[40;32mACTIVE[40;37m]
set inactive=[[40;31mINACTIVE[40;37m]
set commandsrc=flame
if exist windowscommand.flm set commandsrc=windows
if exist modulecommandset.flm set commandsrc=module
set customtitle=FLAMETERMINAL

:: msgbox---------------------------------------------------------------------------------
::echo x=msgbox("Your Text Here" ,0, "Your Title Here") >> msgbox.vbs
::start msgbox.vbs
::timeout 3 >nul
::del msgbox.vbs
::----------------------------------------------------------------------------------------
::choice----------------------------------------------------------------------------------
:::choice
::set /p choice=[Y/N]
::if %choice%==y goto 
::if %choice%==Y goto 
::if %choice%==n goto
::if %choice%==N goto 
::goto choice
::---------------------------------------------------------------------------------------
:softreset
cls
if exist launch.flm set commandsrc=flame
if exist launch.win set commandsrc=windows
if exist launch.mod set commandsrc=module
:mainscreen
cls
echo [40;36m   __ _                     ____  
echo [40;36m  / _│ │ __ _ _ __ ___   ___\ \ \ 
echo [40;34m │ │_│ │/ _` │ '_ ` _ \ / _ \\ \ \
echo [40;34m │  _│ │ (_│ │ │ │ │ │ │  __// / /
echo [40;35m │_│ │_│\__,_│_│ │_│ │_│\___/_/_/ 
echo [40;37m-------------------------------------------
echo [40;32m"termhelp"[40;37mfor help.
if %commandsrc%==module echo prefix for modular commands "[40;32m![40;37m"(commandname)
echo.
:commandline
title %customtitle%
if %customtitle%==burn set customtitle=FLAMETERMINAL && goto easteregg
if %commandsrc%==flame goto flamecommandline
if %commandsrc%==windows goto windowscommandline
if %commandsrc%==module goto module
:flamecommandline
echo [40;37m╔═([[40;31mFLAME[40;37m)
set /p command=[40;37m╚═($[40;35m%username%@flamenet)[40;37m→ 
echo.
::flame command source
if %command%==commandsource goto commandsource
if %command%==cs-win set commandsrc=windows && goto softreset
if %command%==cs-mod set commandsrc=module && goto softreset
if %command%==cls goto mainscreen
if %command%==search goto search
if %command%==searchurl goto searchurl
if %command%==youtube goto youtube
if %command%==watch goto youtube
if %command%==amazon goto amazon
if %command%==buy goto amazon
if %command%==start goto start
if %command%==changetitle goto changetitle
if %command%==ipinfo goto ipinfo
if %command%==searchip goto searchip
if %command%==map goto showmap
if %command%==help goto flmhelp
if %command%==termhelp goto termhelp
if %command%==whoami goto whoami
if %command%==connect goto ping
if %command%==setlaunchterm goto setlaunchterm

goto invalidcommand

:windowscommandline
echo [40;37m╔═([[40;36mWINDOWS[40;37m)
set /p wincommand=[40;37m╚═($[40;35m%username%@flamenet)[40;37m→ 
echo.
::windows command source
if %wincommand%==commandsource goto commandsource
if %wincommand%==cs-flm set commandsrc=flame && goto softreset
if %wincommand%==cs-mod set commandsrc=module && goto softreset
if %wincommand%==cls goto mainscreen
if %wincommand%==termhelp goto termhelp
if %wincommand%==setlaunchterm goto setlaunchterm
goto windowscommandexec

:module
echo [40;37m╔═([[40;33mMODULE[40;37m)
set /p modcommand=[40;37m╚═($[40;35m%username%@flamenet)[40;37m→ 
echo.
::module command source
if %modcommand%==commandsource goto commandsource
if %modcommand%==cs-win set commandsrc=windows && goto softreset
if %modcommand%==cs-flm set commandsrc=flame && goto softreset
if %modcommand%==cls goto mainscreen
if %modcommand%==termhelp goto termhelp
if %modcommand%==help goto devhelp
if %modcommand%==setlaunchterm goto setlaunchterm
if exist %modcommand%.module goto %modcommand%
goto invalidcommandmod


:invalidcommand
echo [40;31mCommand Does Not Exist.[40;37m
echo [Make Sure The Command Entered Matches The Commandline Structure]
echo.
goto commandline

:invalidcommandmod
echo [40;31mCommand Does Not Exist.[40;37m
echo [Make Sure The Command Entered Matches The Commandline Structure]
echo.
echo - Check Command Prefix
echo - Check Download Status
echo - Check if Command File Exists ("!command".mod)
echo - Check Error Bin
echo.
goto commandline

:commandsource
echo Alternate Between CommandSources
echo.
echo [40;31m1[40;37m) [40;31mFlame [40;37mCommands Source
echo [40;31m2[40;37m) [40;36mWindows [40;37mCommand Source
echo [40;31m3[40;37m) [40;33mModular [40;37mCommand Source
set /p choice=→ 
if %choice%==1 set commandsrc=flame && goto softreset
if %choice%==2 set commandsrc=windows && goto softreset
if %choice%==3 set commandsrc=module && goto softreset
goto errorcommandsrc
:errorcommandsrc
echo.
echo [40;31mUnable To Switch Commands
echo Please Try Again Later[40;37m
goto commandline

:windowscommandexec
%wincommand%
goto commandline

:termhelp
echo TERMINAL HELP / General Help
echo -----------------------------------------
echo For Seperate Terminal Help, Please Type
echo "help" When In Said Terminal
echo -----------------------------------------
echo cs-win - accesses windows command terminal
echo cs-mod - acesses modular command terminal
echo cs-flm - accesses flame command terminal
echo commandsource - a more user-friendly interface to swap terminals
echo setlaunchterm - starts a specific terminal on launch
echo. 
goto commandline

:setlaunchterm
if %commandsrc%==flame echo Current Launch Terminal ([[40;31mFLAME[40;37m)
if %commandsrc%==windows echo Current Launch Terminal ([[40;36mWINDOWS[40;37m)
if %commandsrc%==mod echo Current Launch Terminal ([[40;33mMODULE[40;37m)
echo.
echo Possible Terminals,
echo [40;31mflame [40;37m
echo [40;36mwindows[40;37m
echo [40;33mmodule[40;37m
echo.
set /p changelaunchterm=Enter Launch Terminal→ 
if %changelaunchterm%==flame goto retribute
if %changelaunchterm%==windows goto retribute
if %changelaunchterm%==module goto retribute
goto errorcommandsrc
:retribute
if %changelaunchterm%==flame if exist launch.win del launch.win && if exist launch.mod del launch.mod
if %changelaunchterm%==windows if exist launch.flm del launch.flm && if exist launch.mod del launch.mod
if %changelaunchterm%==module if exist launch.win del launch.win && if exist launch.flm del launch.flm
if %changelanchterm%==flame echo LAUNCH >> launch.flm && goto softreset
if %changelanchterm%==windows echo LAUNCH >> launch.win && goto softreset
if %changelanchterm%==module echo LAUNCH >> launch.mod && goto softreset

::    ________    ___    __  _________   __________  __  _____  ______    _   ______  _____
::   / ____/ /   /   │  /  │/  / ____/  / ____/ __ \/  │/  /  │/  /   │  / │ / / __ \/ ___/
::  / /_  / /   / /│ │ / /│_/ / __/    / /   / / / / /│_/ / /│_/ / /│ │ /  │/ / / / /\__ \ 
:: / __/ / /___/ ___ │/ /  / / /___   / /___/ /_/ / /  / / /  / / ___ │/ /│  / /_/ /___/ / 
::/_/   /_____/_/  │_/_/  /_/_____/   \____/\____/_/  /_/_/  /_/_/  │_/_/ │_/_____//____/  
                                                                                       

:flmhelp
echo Welcome To Flame Help
echo - Help Screen For *FLAME COMMANDS ONLY*
echo -----------------------------------------
echo 1) search - Searches The Web (variations can be added after search ["searchedge", "searchurl", etc.])
echo 2) youtube - Searches YouTube (can also be accessed using "watch")
echo 3) start - starts either an entered file, or windows command prompt
echo 4) changetitle - changes the window title (easter egg??)
echo 5) ipinfo - shows %localcomputername%'s IP Information
echo 6) searchip - shows a targets IP Information
echo 7) map - shows a map
echo 8) connects - connects your PC to another PC (allows communication between servers)
echo.
goto commandline

:search
echo Substitue Spaces for '+'
set search=
set /p search=[[40;34mG[40;31mo[40;33mo[40;34mg[40;32ml[40;31me[40;37m]Enter Search Keyword:[40;33m
if %search%==halt goto commandline
if %search%==home start www.google.com && goto commandline
goto searchg
:searchg
start https://www.google.com/search?q=%search% 
echo [%search%] Searched With [Google]>> searchhistory.txt
goto commandline

:searchurl
set searchurl=
set /p searchurl=[[40;34mG[40;31mo[40;33mo[40;34mg[40;32ml[40;31me[40;37m]Enter Search Keyword:[40;33m
if %searchurl%==halt goto commandline
goto searchu
:searchu
start https://%searchurl% 
echo [%searchurl%] Searched With [Google]>> searchhistory.txt
goto commandline

:searchedge
echo Substitue Spaces for '+'
set searchedge=
set /p searchedge=[[40;34mEdge[40;37m]Enter Search Keyword:[40;33m
if %searchedge%==home start www.bing.com && goto commandline
start https://www.bing.com/search?q=%searchedge%
echo [%searchedge%] Searched With [MicroSoft Edge]>> searchhistory.txt
goto commandline

:youtube
echo Substitue Spaces for '+'
set ytsearch=
set /p ytsearch=[40;37m[You[40;31mTube[40;37m]Search Youtube:[40;33m
if %ytsearch%==halt goto commandline
if %ytsearch%==home start www.youtube.com && goto commandline
start https://www.youtube.com/results?search_query=%ytsearch%
echo [%ytsearch%] Watched With [Youtube]>> watchhistory.txt
goto commandline

:amazon
echo Substitue Spaces for '+'
set amazon=
set /p amazon=[40;37m[[40;33mAmazon[40;37m]Search A Product Name:
if %amazon%==home start https://www.amazon.ca/ref=nav_logo && goto commandline
start https://www.amazon.ca/s?k=%amazon%
echo [%amazon%] Searches With [Amazon]>> searchhistory.txt
goto commandline

:start
echo Leave Blank For 'CMD'
set start=
set /p start=Choose A File To Start!: 
start %start%
echo.
goto commandline

:changetitle
set customtitle=
set /p customtitle=Choose New Title!: 
goto commandline

:ipinfo
echo.
echo [NOTE: YOUR IP IS DEFINED AS "Query"]
curl http://ip-api.com/?fields=status,message,continent,continentCode,country,countryCode,region,regionName,city,district,zip,lat,lon,timezone,offset,currency,isp,org,as,asname,mobile,proxy,hosting,query
echo.
goto commandline

:searchip
echo [40;37mFor More IP Tools, Please Visit " [40;32mhttps://shorturl.at/brAHM [40;37m"
echo.
set /p ip=Please Enter TargetIP→ 
curl https://ipapi.co/%ip%/json/
echo.
goto commandline

:ping
echo [NOTE: YOU ARE SENDING A REQUEST TO CONNECT TO ANOTHER NETWORK]
set pingip=
set /p pingip=[40;37mConnection IP:[40;37m
echo Ctrl + C to Eliminate
timeout 2 >nul
goto STARTPING
:STARTPING
title Pinging [ %pingip% ]   [ Status: Loading... ]
:MAIN
set connectionlevel=OK
PING -n 1 %pingip% | FIND "TTL=">nul && echo [40;31m-$-[40;37mREPLY FROM [[40;32m%pingip%[40;37m] │ Connection [[40;33m%connectionlevel%[40;37m] │ Packet Loss: [40;32mNONE[40;37m │ Sending Signals: [40;32mTRUE[40;37m │ Recieving Signal: [40;32mTRUE[40;37m && set connectdata=CONNECTED, DATA SENT:%pingip%
IF ERRORLEVEL 1 (SET in=0b & echo [40;31mConnection Dead.) && echo Connection Lost or Terminated. && goto commandline
title Pinging [ %pingip% ]   [ Status: Connection Successful ]
ping -t 2 0 10 127.0.0.1 >nul 
goto MAIN
pause

:showmap
echo.
echo.
echo              [40;31m        ○○○○z○ ○○○○○○   [40;33m                                  
echo              [40;31m     ○○○○○○○○○○○○○○○○○○ [40;33m  ○○○○          [40;35m○○○               
echo              [40;31m   ○○○○○○○○○○○○○○○○○○○  [40;33m   ○     [40;35m○○o○○○○○○○○○  ○○○       
echo         [40;31m○○○○○[40;31m○○○○○○○○○○○○○○ ○○○○○○   [40;33m   ○○ooo[40;35m○○○○○○○○○○○○○○○○○○○○○○○○○ 
echo         [40;31m○○○○○[40;31m○○○○○○○○○○○○○○○○○○○ ○○  [40;33m ○○oooo[40;35m○○○○○○○○○○○○○○○○○○○○○○○○○○○
echo          [40;31m○○○○[40;31m○○○○○○○○○○○○○○○        [40;33m○○○oooo[40;35m○○○○○○○○○○○○○○○○○○○○○○○     
echo                  [40;31m○○○○○○○○○○○○○       [40;33m○○○○○oooo[40;35m○○○○○○○○○○○○○○○○○○ ○     
echo                  [40;31m○○○○○○○○○○○         [40;33m○○○○○○oooo[40;35m○○○○○○○○○○○○○○○○○        
echo                   [40;31m○○○○○○           [40;33m○○○○○○○○oooo[40;35m○○○○○○○○○○○○○○○         
echo                   [40;32m○○○○○○○○○       [40;34m○○○○○○○○○[40;35m○○○○○○○○○○○○○○○○            
echo                       [40;32m○○○○       [40;34m○○○○○○○○○○○[40;35m○○   ○○  ○○○○○○           
echo                           [40;32m○○○○○○○       [40;34m○○○○○ [40;36m○○○        ○○○○○○○○○○      
echo                         [40;32m○○○○○○○○       [40;34m○○○○○○○○         [40;36m○○○○○○○○○○     
echo                          [40;32m○○○○○        [40;34m○○○○○○○○          [40;36m○○○○○○○ ○○ ○  
echo                          [40;32m○○○○○          [40;34m○○○○             [40;36m○○○○○○○  ○   
echo                         [40;32m○○○○                                  [40;36m○○  ○○○  
echo                         [40;32m○○○○                                      [40;36m○○   
echo                          [40;32m○○    
echo.
echo [Missing: Alaska, Islands Of Hawaii, North/South Pole]
echo.
goto commandline

:easteregg                                                                         
echo                      ████                                      
echo                      ██▓▓██                                    
echo                      ▓▓▓▓▓▓██                                  
echo                        ██▓▓▓▓██                              __________  __________  _______________  
echo                        ██▒▒░░▓▓██                           / ____/ __ \/ ____/ __ \/  _/_  __/ ___/   
echo                        ██▒▒░░▓▓▓▓▓▓                        / /   / /_/ / __/ / / / // /  / /  \__ \     
echo                      ██▓▓▒▒░░▒▒▓▓▓▓                       / /___/ _, _/ /___/ /_/ // /  / /  ___/ /    
echo                      ██▓▓▒▒░░░░▒▒▓▓██                     \____/_/ │_/_____/_____/___/ /_/  /____/     
echo                    ██▓▓▒▒░░  ░░▒▒▓▓██                          
echo                    ██▓▓▒▒░░  ░░▒▒▓▓██                      - NulBerry Enterprise  
echo                  ██▓▓▒▒░░    ░░▒▒▓▓██                      - YourMOM 
echo                ██▓▓▒▒░░      ░░▒▒▓▓██                      - Joe Mama      
echo              ▓▓▓▓▒▒░░      ░░▒▒▓▓██░░                          
echo            ██▓▓▒▒░░        ░░▒▒▓▓██                            
echo          ██▓▓▒▒░░        ░░▒▒▓▓██      ██                      
echo        ██▓▓▒▒░░░░      ░░▒▒▓▓██        ████                    
echo        ██▓▓▒▒░░      ░░▒▒▓▓██        ██▓▓██                    
echo      ██▓▓▒▒░░      ░░▒▒▓▓██        ██▓▓▒▒▓▓██                  
echo      ██▓▓▒▒░░    ░░▒▒▓▓██        ██▓▓▒▒  ▓▓██                  
echo    ██▓▓▒▒░░      ░░▒▒▓▓██      ██▓▓▒▒░░▒▒▓▓██                  
echo    ██▓▓▒▒░░    ░░▒▒▓▓██      ██▓▓▒▒░░▒▒▓▓██░░                  
echo    ██▓▓▒▒░░░░  ░░▒▒▓▓██      ██▓▓▒▒░░▒▒▓▓██                    
echo      ██▓▓▒▒░░░░▒▒▓▓██      ██▓▓▒▒  ▒▒▓▓██                      
echo      ██▓▓▒▒░░░░▒▒▓▓██      ██▓▓▒▒  ▒▒▓▓██                      
echo        ██▓▓▒▒░░▒▒▓▓██        ██▓▓▒▒▓▓██                        
echo        ░░▓▓▓▓▒▒▒▒▒▒▓▓▓▓      ▓▓▓▓▒▒▓▓▓▓                        
echo          ░░██▓▓▓▓▒▒▒▒▓▓██    ░░██▓▓██░░                        
echo              ████▓▓▓▓▓▓▓▓██      ████                          
echo                  ████▓▓▓▓▓▓██      ██                          
echo                      ██████▓▓██                                
echo                      ▒▒▒▒▒▒▒▒▒▒                               
goto commandline
::
::    __  _______  ____  __  ____    ___    ____ 
::   /   │/  / __ \/ __ \/ / / / /   /    │  / __ \
::  / / │_/ / / / / / / / / / / /   / / │  │ / /_/ /
:: / /  / / /_/ / /_/ / /_/ / /___/ ___  │/ _, _/ 
::/_/  /_/\____/_____/\____/_____/_/   │_/_/  │_ │  

:devhelp
echo Welcome To Modular Help.
echo -------------------------
echo Unfortunately, you would have
echo to replace this section using an IDE.
echo Most developers will provide help files
echo in their module setup.
goto commandline
                                                                          
                                                                              

