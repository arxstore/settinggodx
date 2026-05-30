@echo off
mode con: cols=90   lines=25
chcp 65001 >nul
setlocal EnableExtensions EnableDelayedExpansion
title Setting GodX - ARXSTORE

for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

:menu
cls
echo %ESC%[0m
echo %ESC%[0m
echo %ESC%[38;2;220;242;255m                            ╚██████╗  ██████╗ ██████╗ ██╗  ██╗
echo %ESC%[38;2;186;230;255m                           ╚██╔════╝ ██╔═══██╗██╔══██╗╚██╗██╔╝
echo %ESC%[38;2;135;211;255m                           ╚██║  ███╗██║   ██║██║  ██║ ╚███╔╝ 
echo %ESC%[38;2;84;192;255m                           ╚██║   ██║██║   ██║██║  ██║ ██╔██╗ 
echo %ESC%[38;2;40;148;228m                            ╚╚██████╔╝╚██████╔╝██████╔██╔╝ ██╗
echo %ESC%[38;2;0;100;190m                             ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝
echo %ESC%[0m
echo %ESC%[0m                         [+] SETTING GODX LNWZA BY ARX STORE [+]
echo %ESC%[0m                         [-------------------------------------]
echo %ESC%[0m
echo %ESC%[0m
echo !ESC![31m    [ 1 ]!ESC![0m Run Setting GodX
echo !ESC![32m    [ 2 ]!ESC![0m Run Winutill ( CTT )
echo !ESC![33m    [ 3 ]!ESC![0m Run Mouse and Keyboard
echo !ESC![34m    [ 4 ]!ESC![0m Run Low InpuLag
echo !ESC![35m    [ 5 ]!ESC![0m Run BoostFPS
echo !ESC![36m    [ 6 ]!ESC![0m Cleaner ( Cache , Temp )
echo !ESC![91m    [ 7 ]!ESC![0m Wait Update
echo !ESC![92m    [ 8 ]!ESC![0m Exit GodX
echo(
set /p "choice=    %ESC%[38;2;0;191;255m»%ESC%[0m   Select Option: "

if "%choice%"=="1" goto godx
if "%choice%"=="2" goto ctt
if "%choice%"=="3" goto mk
if "%choice%"=="4" goto lowinputlag
if "%choice%"=="5" goto boostfps
if "%choice%"=="6" goto cleaner
if "%choice%"=="7" goto 
if "%choice%"=="8" exit

:godx
cls

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 16396842 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_SZ /d 2710 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDelay /t REG_DWORD /d 20 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDdiDelay /t REG_DWORD /d 20 /f >nul

bcdedit /deletevalue useplatformclock >nul 2>&1

netsh interface ipv4 set subinterface "Ethernet" mtu=3000 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mss=1460 store=persistent
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global initialrto=3000
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=cubic
netsh int tcp set global timestamps=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global pacingprofile=off

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MTU" /t REG_DWORD /d "4190" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MSS" /t REG_DWORD /d "4150"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "2576980377"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "174" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "343932926" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "UDPAckFrequency" /t REG_DWORD /d "2576980377"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "UDPNoDelay" /t REG_DWORD /d "2576980377"  /f

set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v TcpDelAckTicks /t REG_DWORD /d 174 /f
reg add "%KEY%" /v TCPNoDelay /t REG_DWORD /d 343932926 /f
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 4130 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 4170 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d 1100 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d 327683 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d 327683 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "EnableDynamicBacklog" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MinimumDynamicBacklog" /t REG_DWORD /d 48 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaximumDynamicBacklog" /t REG_DWORD /d 1024 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "UdpMaxConnections" /t REG_DWORD /d 65534 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableUDPChecksum" /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 16396842 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 16396842 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul

set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 1060 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f

set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 3540 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 3590 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f

set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 4150 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 4190 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f

reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverHeight /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverWidth /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseTrails /t REG_SZ /d 0 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 4211081216 /f >nul

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_SZ /d 2710 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDelay /t REG_DWORD /d 20 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDdiDelay /t REG_DWORD /d 20 /f >nul

bcdedit /deletevalue useplatformclock >nul 2>&1

netsh interface ipv4 set subinterface "Ethernet" mtu=1400 store=persistent
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global initialrto=3000
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=cubic
netsh int tcp set global timestamps=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global pacingprofile=off

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MTU" /t REG_DWORD /d "1400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MSS" /t REG_DWORD /d "1360"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "343932926"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "343932926" /f

set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v TcpDelAckTicks /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TCPNoDelay /t REG_DWORD /d 343932926 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 343932926 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 1360 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 1400 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d 819 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d 7040032 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d 7040032 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "EnableDynamicBacklog" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MinimumDynamicBacklog" /t REG_DWORD /d 150 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaximumDynamicBacklog" /t REG_DWORD /d 2184 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 10 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "UdpMaxConnections" /t REG_DWORD /d 65534 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableUDPChecksum" /t REG_DWORD /d 1 /f >nul

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MTU" /t REG_DWORD /d "1400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MSS" /t REG_DWORD /d "1460 "  /f

netsh interface ipv4 set subinterface "Ethernet" mtu=1400 store=persistent
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global initialrto=1400

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MaxFrameLatency" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "MaxFrameLatency" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "MaxQueuedFrames" /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x2A /f

gpupdate /force

goto menu

:ctt
cls

powershell -Command "irm christitus.com/win | iex"

cls
goto menu

:mk
cls

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnablePreemption /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PlatformSupportMiracast /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DpiMapIommuContiguous /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v EnablePreemption /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v VsyncIdleTimeout /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v MaxGpuPreemptionTimeout /t REG_DWORD /d 100 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v MaxTextureDimension /t REG_DWORD /d 16384 /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v D3D12_ALLOW_TEARING /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v ShaderCacheMaxSize /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v D3D11_MULTITHREADED /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t REG_DWORD /d 256 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 2147483649 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f

reg add "HKCU\Software\Microsoft\GameBar" /v GamePanelStartupNotificationOff /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f

reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f

reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisableThumbnailCache /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global" /v SendTelemetryData /t REG_DWORD /d 0 /f

cls
goto menu

:lowinputlag
cls

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f

reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f

reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f

bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d 1 /f

cls
goto menu

:boostfps
cls

reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d 2 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 9012038010000000 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d 0 /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f

reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d 2 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2189_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2545_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2612_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2699_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2802_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2944_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b3095_GTAProcess.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f

reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePreemption" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "VsyncIdleTimeout" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "MaxGpuPreemptionTimeout" /t REG_DWORD /d 0x64 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 0x2710 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x26 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "MaxTextureDimension" /t REG_DWORD /d 0x4000 /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ALLOW_TEARING" /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "ShaderCacheMaxSize" /t REG_DWORD /d 0xffffffff /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "D3D11_MULTITHREADED" /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d 0x100 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 0x80000001 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d 1 /f

reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f

reg add "HKCU\Software\Microsoft\GameBar" /v "GamePanelStartupNotificationOff" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f

reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d 00000000000000000000000000000000000000000000000000000000000000000000000000000000 /f
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d 00000000000000000000000000000000000000000000000000000000000000000000000000000000 /f

reg add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 0x10 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 0x10 /f

reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d 1 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f

reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global" /v "SendTelemetryData" /t REG_DWORD /d 0 /f

for /f "tokens=4" %%i in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do powercfg /setactive %%i >nul 2>&1
powercfg /hibernate off >nul 2>&1

cls
goto menu

:cleaner
cls

del /s /f /q "%temp%\*.*" 2>nul
for /d %%i in ("%temp%\*") do rmdir /s /q "%%i" 2>nul

del /s /f /q "C:\Windows\Temp\*.*" 2>nul
for /d %%i in ("C:\Windows\Temp\*") do rmdir /s /q "%%i" 2>nul

del /s /f /q "C:\Windows\Prefetch\*.*" 2>nul
for /d %%i in ("C:\Windows\Prefetch\*") do rmdir /s /q "%%i" 2>nul

if exist "%localappdata%\FiveM\FiveM.app\data" (
    rmdir /s /q "%localappdata%\FiveM\FiveM.app\data\cache" 2>nul
    rmdir /s /q "%localappdata%\FiveM\FiveM.app\data\server-cache" 2>nul
    rmdir /s /q "%localappdata%\FiveM\FiveM.app\data\server-cache-priv" 2>nul
)

cls
goto menu